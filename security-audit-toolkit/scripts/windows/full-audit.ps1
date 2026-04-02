#Requires -Version 5.1
<#
.SYNOPSIS
    Full Security Audit for Windows
.DESCRIPTION
    Run all security checks and generate a report
.PARAMETER Fix
    Automatically fix issues where possible
.EXAMPLE
    .\full-audit.ps1
    .\full-audit.ps1 -Fix
#>

param(
    [switch]$Fix
)

# Counters
$script:Pass = 0
$script:Warn = 0
$script:Fail = 0

# Helper functions
function Write-Pass {
    param([string]$Message)
    $script:Pass++
    Write-Host "[PASS] " -ForegroundColor Green -NoNewline
    Write-Host $Message
}

function Write-Warn {
    param([string]$Message)
    $script:Warn++
    Write-Host "[WARN] " -ForegroundColor Yellow -NoNewline
    Write-Host $Message
}

function Write-Fail {
    param([string]$Message)
    $script:Fail++
    Write-Host "[FAIL] " -ForegroundColor Red -NoNewline
    Write-Host $Message
}

function Write-Info {
    param([string]$Message)
    Write-Host "[INFO] " -ForegroundColor Cyan -NoNewline
    Write-Host $Message
}

function Write-Header {
    param([string]$Title)
    Write-Host ""
    Write-Host "=== $Title ===" -ForegroundColor Cyan
    Write-Host ""
}

# Check if running as admin
$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

# Start audit
Write-Host "========================================"
Write-Host "       SECURITY AUDIT REPORT"
Write-Host "========================================"
Write-Host "Date: $(Get-Date)"
Write-Host "Computer: $env:COMPUTERNAME"
Write-Host "User: $env:USERNAME"
Write-Host "Admin: $isAdmin"
Write-Host "OS: $((Get-CimInstance Win32_OperatingSystem).Caption)"
Write-Host "========================================"

#
# SECTION 1: WINDOWS FIREWALL
#
Write-Header "WINDOWS FIREWALL"

try {
    $firewallProfiles = Get-NetFirewallProfile -ErrorAction Stop
    foreach ($profile in $firewallProfiles) {
        if ($profile.Enabled) {
            Write-Pass "Firewall '$($profile.Name)' profile is enabled"
        } else {
            Write-Fail "Firewall '$($profile.Name)' profile is DISABLED"
            if ($Fix -and $isAdmin) {
                Set-NetFirewallProfile -Name $profile.Name -Enabled True
                Write-Pass "Enabled $($profile.Name) firewall profile"
            }
        }
    }
} catch {
    Write-Warn "Could not check firewall status (requires admin)"
}

#
# SECTION 2: WINDOWS DEFENDER
#
Write-Header "WINDOWS DEFENDER"

try {
    $defenderStatus = Get-MpComputerStatus -ErrorAction Stop

    if ($defenderStatus.AntivirusEnabled) {
        Write-Pass "Windows Defender antivirus is enabled"
    } else {
        Write-Fail "Windows Defender antivirus is DISABLED"
    }

    if ($defenderStatus.RealTimeProtectionEnabled) {
        Write-Pass "Real-time protection is enabled"
    } else {
        Write-Fail "Real-time protection is DISABLED"
    }

    if ($defenderStatus.AntivirusSignatureAge -le 7) {
        Write-Pass "Antivirus signatures are up to date (age: $($defenderStatus.AntivirusSignatureAge) days)"
    } else {
        Write-Warn "Antivirus signatures are $($defenderStatus.AntivirusSignatureAge) days old"
    }
} catch {
    Write-Info "Could not check Windows Defender status"
}

#
# SECTION 3: NETWORK EXPOSURE
#
Write-Header "NETWORK EXPOSURE"

Write-Info "Checking for services exposed to network..."

# Get listening ports
try {
    $listeners = Get-NetTCPConnection -State Listen -ErrorAction Stop |
        Where-Object { $_.LocalAddress -eq "0.0.0.0" -or $_.LocalAddress -eq "::" }

    $riskyPorts = @{
        22 = "SSH"
        23 = "Telnet"
        135 = "RPC"
        139 = "NetBIOS"
        445 = "SMB"
        1433 = "SQL Server"
        3306 = "MySQL"
        3389 = "RDP"
        5432 = "PostgreSQL"
        5900 = "VNC"
        6379 = "Redis"
        27017 = "MongoDB"
    }

    foreach ($listener in $listeners) {
        $port = $listener.LocalPort
        if ($riskyPorts.ContainsKey($port)) {
            $serviceName = $riskyPorts[$port]
            if ($port -eq 3389) {
                Write-Warn "$serviceName (port $port) is exposed - verify this is intentional"
            } else {
                Write-Fail "$serviceName (port $port) is exposed on all interfaces"
            }
        }
    }

    # Count total exposed ports
    $exposedCount = ($listeners | Select-Object -Unique LocalPort).Count
    Write-Info "Total ports exposed on all interfaces: $exposedCount"

} catch {
    Write-Warn "Could not enumerate listening ports"
}

#
# SECTION 4: FILE PERMISSIONS
#
Write-Header "FILE PERMISSIONS"

# Check .env files in common locations
Write-Info "Checking .env files..."
$envLocations = @(
    "$env:USERPROFILE\development",
    "$env:USERPROFILE\projects",
    "$env:USERPROFILE\source",
    "$env:USERPROFILE\Documents"
)

$envFiles = @()
foreach ($loc in $envLocations) {
    if (Test-Path $loc) {
        $envFiles += Get-ChildItem -Path $loc -Filter ".env*" -Recurse -Depth 4 -ErrorAction SilentlyContinue
    }
}

if ($envFiles.Count -eq 0) {
    Write-Pass "No .env files found in common locations"
} else {
    Write-Info "Found $($envFiles.Count) .env file(s)"
    foreach ($file in $envFiles) {
        Write-Info "  - $($file.FullName)"
    }
}

# Check SSH keys
Write-Info "Checking SSH key permissions..."
$sshDir = "$env:USERPROFILE\.ssh"
if (Test-Path $sshDir) {
    $privateKeys = Get-ChildItem -Path $sshDir -Filter "id_*" -ErrorAction SilentlyContinue |
        Where-Object { $_.Name -notmatch "\.pub$" }

    foreach ($key in $privateKeys) {
        $acl = Get-Acl $key.FullName
        $accessRules = $acl.Access | Where-Object {
            $_.IdentityReference -notmatch "SYSTEM|Administrators|$env:USERNAME"
        }
        if ($accessRules) {
            Write-Fail "SSH key $($key.Name) has excessive permissions"
        } else {
            Write-Pass "SSH key $($key.Name) has appropriate permissions"
        }
    }
} else {
    Write-Info "No .ssh directory found"
}

#
# SECTION 5: CREDENTIAL FILES
#
Write-Header "CREDENTIAL FILES"

# AWS
$awsCredentials = "$env:USERPROFILE\.aws\credentials"
if (Test-Path $awsCredentials) {
    Write-Warn "AWS credentials file found at $awsCredentials"
} else {
    Write-Pass "No AWS credentials file found"
}

# Azure
$azureDir = "$env:USERPROFILE\.azure"
if (Test-Path $azureDir) {
    Write-Warn "Azure credentials directory found"
}

# GCP
$gcpDir = "$env:APPDATA\gcloud"
if (Test-Path $gcpDir) {
    Write-Warn "GCP credentials directory found"
}

# Docker
$dockerConfig = "$env:USERPROFILE\.docker\config.json"
if (Test-Path $dockerConfig) {
    $content = Get-Content $dockerConfig -Raw -ErrorAction SilentlyContinue
    if ($content -match '"auth"') {
        Write-Warn "Docker config contains authentication credentials"
    }
}

# Git credentials
$gitCredentials = "$env:USERPROFILE\.git-credentials"
if (Test-Path $gitCredentials) {
    Write-Warn "Git credentials file found (contains plaintext credentials)"
}

#
# SECTION 6: SYSTEM SECURITY
#
Write-Header "SYSTEM SECURITY"

# BitLocker
try {
    $bitlocker = Get-BitLockerVolume -MountPoint "C:" -ErrorAction Stop
    if ($bitlocker.ProtectionStatus -eq "On") {
        Write-Pass "BitLocker is enabled on C: drive"
    } else {
        Write-Warn "BitLocker is not enabled on C: drive"
    }
} catch {
    Write-Info "Could not check BitLocker status (requires admin)"
}

# Windows Update
try {
    $autoUpdate = (Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update" -ErrorAction Stop).AUOptions
    if ($autoUpdate -ge 3) {
        Write-Pass "Automatic Windows Updates are enabled"
    } else {
        Write-Warn "Automatic Windows Updates may be disabled"
    }
} catch {
    Write-Info "Could not check Windows Update settings"
}

# UAC
try {
    $uac = Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -ErrorAction Stop
    if ($uac.EnableLUA -eq 1) {
        Write-Pass "User Account Control (UAC) is enabled"
    } else {
        Write-Fail "User Account Control (UAC) is DISABLED"
    }
} catch {
    Write-Info "Could not check UAC status"
}

# Screen lock
try {
    $screenSaver = Get-ItemProperty -Path "HKCU:\Control Panel\Desktop" -ErrorAction Stop
    if ($screenSaver.ScreenSaveActive -eq "1" -and $screenSaver.ScreenSaverIsSecure -eq "1") {
        Write-Pass "Screen saver with password is enabled"
    } else {
        Write-Warn "Consider enabling screen saver with password protection"
    }
} catch {
    Write-Info "Could not check screen saver settings"
}

# Remote Desktop
try {
    $rdp = Get-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Terminal Server" -ErrorAction Stop
    if ($rdp.fDenyTSConnections -eq 1) {
        Write-Pass "Remote Desktop is disabled"
    } else {
        Write-Warn "Remote Desktop is enabled - verify this is intentional"
    }
} catch {
    Write-Info "Could not check Remote Desktop settings"
}

#
# SECTION 7: SECRETS IN HISTORY
#
Write-Header "SECRETS DETECTION"

Write-Info "Checking PowerShell history for potential secrets..."

$historyPath = (Get-PSReadLineOption).HistorySavePath
if (Test-Path $historyPath) {
    $patterns = @(
        'sk-[a-zA-Z0-9]{20,}',           # OpenAI
        'AKIA[A-Z0-9]{16}',              # AWS
        'ghp_[a-zA-Z0-9]{36}',           # GitHub PAT
        'password\s*=\s*[''"][^''"]+',   # Password assignments
        'api[_-]?key\s*=\s*[''"][^''"]+' # API keys
    )

    $historyContent = Get-Content $historyPath -ErrorAction SilentlyContinue
    $hits = 0
    foreach ($pattern in $patterns) {
        $matches = $historyContent | Select-String -Pattern $pattern -AllMatches
        $hits += $matches.Count
    }

    if ($hits -gt 0) {
        Write-Warn "Found $hits potential secret(s) in PowerShell history"
    } else {
        Write-Pass "No obvious secrets found in PowerShell history"
    }
}

#
# SUMMARY
#
Write-Header "SUMMARY"

Write-Host ""
Write-Host "Results: " -NoNewline
Write-Host "$script:Pass PASS" -ForegroundColor Green -NoNewline
Write-Host " | " -NoNewline
Write-Host "$script:Warn WARN" -ForegroundColor Yellow -NoNewline
Write-Host " | " -NoNewline
Write-Host "$script:Fail FAIL" -ForegroundColor Red
Write-Host ""

if ($script:Fail -gt 0) {
    Write-Host "ACTION REQUIRED: $script:Fail critical issue(s) found" -ForegroundColor Red
    exit 1
} elseif ($script:Warn -gt 0) {
    Write-Host "REVIEW RECOMMENDED: $script:Warn warning(s) found" -ForegroundColor Yellow
    exit 0
} else {
    Write-Host "ALL CHECKS PASSED" -ForegroundColor Green
    exit 0
}
