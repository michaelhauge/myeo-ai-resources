#Requires -Version 5.1
<#
.SYNOPSIS
    Security Remediation Script for Windows
.DESCRIPTION
    Automatically fix common security issues
.PARAMETER DryRun
    Show what would be changed without making changes
.EXAMPLE
    .\remediate.ps1 -DryRun
    .\remediate.ps1
#>

param(
    [switch]$DryRun
)

function Write-Header {
    param([string]$Title)
    Write-Host ""
    Write-Host "=== $Title ===" -ForegroundColor Cyan
    Write-Host ""
}

function Invoke-Action {
    param(
        [string]$Description,
        [scriptblock]$Action
    )

    if ($DryRun) {
        Write-Host "[DRY-RUN] " -ForegroundColor Blue -NoNewline
        Write-Host "Would: $Description"
    } else {
        Write-Host "[RUNNING] " -ForegroundColor Green -NoNewline
        Write-Host $Description
        try {
            & $Action
        } catch {
            Write-Host "[ERROR] " -ForegroundColor Red -NoNewline
            Write-Host $_.Exception.Message
        }
    }
}

$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

Write-Host "========================================"
Write-Host "      SECURITY REMEDIATION"
Write-Host "========================================"
Write-Host "Date: $(Get-Date)"
Write-Host "Mode: $(if ($DryRun) { 'DRY RUN (no changes)' } else { 'LIVE' })"
Write-Host "Admin: $isAdmin"
Write-Host ""

if (-not $DryRun) {
    Write-Host "WARNING: This script will make changes to your system." -ForegroundColor Yellow
    Write-Host "Press Ctrl+C within 5 seconds to cancel..."
    Start-Sleep -Seconds 5
    Write-Host ""
}

#
# FIX CREDENTIAL FILE PERMISSIONS
#
Write-Header "FIXING CREDENTIAL FILE PERMISSIONS"

# Function to restrict file permissions
function Set-RestrictedPermissions {
    param([string]$Path)

    if (Test-Path $Path) {
        $currentUser = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name

        if ($DryRun) {
            Write-Host "[DRY-RUN] Would restrict permissions on: $Path" -ForegroundColor Blue
        } else {
            try {
                # Disable inheritance and remove all existing rules
                $acl = Get-Acl $Path
                $acl.SetAccessRuleProtection($true, $false)

                # Clear existing rules
                $acl.Access | ForEach-Object { $acl.RemoveAccessRule($_) | Out-Null }

                # Add rule for current user only
                $rule = New-Object System.Security.AccessControl.FileSystemAccessRule(
                    $currentUser,
                    "FullControl",
                    "Allow"
                )
                $acl.AddAccessRule($rule)

                # Add SYSTEM access
                $systemRule = New-Object System.Security.AccessControl.FileSystemAccessRule(
                    "SYSTEM",
                    "FullControl",
                    "Allow"
                )
                $acl.AddAccessRule($systemRule)

                Set-Acl -Path $Path -AclObject $acl
                Write-Host "[OK] Restricted permissions: $Path" -ForegroundColor Green
            } catch {
                Write-Host "[ERROR] Failed to fix: $Path - $($_.Exception.Message)" -ForegroundColor Red
            }
        }
    }
}

# SSH Keys
$sshDir = "$env:USERPROFILE\.ssh"
if (Test-Path $sshDir) {
    Get-ChildItem $sshDir -Filter "id_*" -ErrorAction SilentlyContinue |
        Where-Object { $_.Name -notmatch "\.pub$" } |
        ForEach-Object {
            Set-RestrictedPermissions -Path $_.FullName
        }

    # Fix SSH directory itself
    if (-not $DryRun) {
        Set-RestrictedPermissions -Path $sshDir
    }
}

# AWS Credentials
$awsCreds = "$env:USERPROFILE\.aws\credentials"
Set-RestrictedPermissions -Path $awsCreds

# Kubernetes config
$kubeConfig = "$env:USERPROFILE\.kube\config"
Set-RestrictedPermissions -Path $kubeConfig

# Docker config
$dockerConfig = "$env:USERPROFILE\.docker\config.json"
Set-RestrictedPermissions -Path $dockerConfig

#
# ENABLE WINDOWS FIREWALL
#
Write-Header "WINDOWS FIREWALL"

if ($isAdmin) {
    try {
        $profiles = Get-NetFirewallProfile -ErrorAction Stop

        foreach ($profile in $profiles) {
            if (-not $profile.Enabled) {
                Invoke-Action -Description "Enable $($profile.Name) firewall profile" -Action {
                    Set-NetFirewallProfile -Name $profile.Name -Enabled True
                }
            } else {
                Write-Host "[OK] $($profile.Name) firewall already enabled" -ForegroundColor Green
            }
        }
    } catch {
        Write-Host "Could not check/modify firewall settings" -ForegroundColor Yellow
    }
} else {
    Write-Host "[SKIP] Firewall changes require admin privileges" -ForegroundColor Yellow
}

#
# WINDOWS DEFENDER
#
Write-Header "WINDOWS DEFENDER"

if ($isAdmin) {
    try {
        $defender = Get-MpComputerStatus -ErrorAction Stop

        if (-not $defender.RealTimeProtectionEnabled) {
            Invoke-Action -Description "Enable Windows Defender real-time protection" -Action {
                Set-MpPreference -DisableRealtimeMonitoring $false
            }
        } else {
            Write-Host "[OK] Real-time protection already enabled" -ForegroundColor Green
        }
    } catch {
        Write-Host "Could not check/modify Windows Defender settings" -ForegroundColor Yellow
    }
} else {
    Write-Host "[SKIP] Defender changes require admin privileges" -ForegroundColor Yellow
}

#
# GIT CREDENTIAL HELPER
#
Write-Header "GIT SECURITY"

$credHelper = git config --global credential.helper 2>$null
if ($credHelper -ne "manager" -and $credHelper -ne "manager-core") {
    Invoke-Action -Description "Configure Git to use Windows Credential Manager" -Action {
        git config --global credential.helper manager
    }
} else {
    Write-Host "[OK] Git already using secure credential helper" -ForegroundColor Green
}

# Check for plaintext credentials file
$gitCredsFile = "$env:USERPROFILE\.git-credentials"
if (Test-Path $gitCredsFile) {
    Write-Host "[WARN] Plaintext git credentials file exists at: $gitCredsFile" -ForegroundColor Yellow
    Write-Host "       Consider deleting it after migrating to Credential Manager"
}

#
# REMOTE DESKTOP
#
Write-Header "REMOTE DESKTOP"

if ($isAdmin) {
    try {
        $rdp = Get-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Terminal Server" -ErrorAction Stop

        if ($rdp.fDenyTSConnections -eq 0) {
            Write-Host "[WARN] Remote Desktop is enabled" -ForegroundColor Yellow

            if (-not $DryRun) {
                $response = Read-Host "Disable Remote Desktop? (y/N)"
                if ($response -eq 'y' -or $response -eq 'Y') {
                    Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Terminal Server" -Name "fDenyTSConnections" -Value 1
                    Write-Host "[OK] Remote Desktop disabled" -ForegroundColor Green
                }
            } else {
                Write-Host "[DRY-RUN] Would prompt to disable Remote Desktop" -ForegroundColor Blue
            }
        } else {
            Write-Host "[OK] Remote Desktop already disabled" -ForegroundColor Green
        }
    } catch {
        Write-Host "Could not check Remote Desktop settings" -ForegroundColor Yellow
    }
} else {
    Write-Host "[SKIP] Remote Desktop changes require admin privileges" -ForegroundColor Yellow
}

#
# UAC SETTINGS
#
Write-Header "USER ACCOUNT CONTROL"

if ($isAdmin) {
    try {
        $uac = Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -ErrorAction Stop

        if ($uac.EnableLUA -ne 1) {
            Invoke-Action -Description "Enable User Account Control (UAC)" -Action {
                Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "EnableLUA" -Value 1
                Write-Host "[NOTE] Restart required for UAC change to take effect" -ForegroundColor Yellow
            }
        } else {
            Write-Host "[OK] UAC already enabled" -ForegroundColor Green
        }
    } catch {
        Write-Host "Could not check UAC settings" -ForegroundColor Yellow
    }
} else {
    Write-Host "[SKIP] UAC changes require admin privileges" -ForegroundColor Yellow
}

#
# GIT PRE-COMMIT HOOK
#
Write-Header "GIT PRE-COMMIT HOOK"

$gitTemplateDir = "$env:USERPROFILE\.git-templates\hooks"

if ($DryRun) {
    Write-Host "[DRY-RUN] Would create git pre-commit hook template" -ForegroundColor Blue
} else {
    $response = Read-Host "Install git pre-commit hook for secret detection? (y/N)"
    if ($response -eq 'y' -or $response -eq 'Y') {

        # Create directory
        New-Item -ItemType Directory -Path $gitTemplateDir -Force | Out-Null

        # Create pre-commit hook
        $hookContent = @'
#!/bin/sh
# Pre-commit hook for secret detection

# Patterns to check
PATTERNS="sk-[a-zA-Z0-9]{20,}|AKIA[A-Z0-9]{16}|ghp_[a-zA-Z0-9]{36}|password\s*=\s*[\"'][^\"']+"

# Check staged changes
if git diff --cached | grep -qE "$PATTERNS"; then
    echo "ERROR: Potential secret detected in staged changes!"
    echo "Review your changes with: git diff --cached"
    exit 1
fi

exit 0
'@

        $hookPath = Join-Path $gitTemplateDir "pre-commit"
        $hookContent | Out-File -FilePath $hookPath -Encoding utf8 -Force

        # Set git template directory
        git config --global init.templateDir "$env:USERPROFILE\.git-templates"

        Write-Host "[OK] Pre-commit hook template installed" -ForegroundColor Green
        Write-Host "     New repos will use this hook automatically"
        Write-Host "     For existing repos, run: git init (safe to run again)"
    }
}

#
# CLEAR SENSITIVE HISTORY
#
Write-Header "SHELL HISTORY"

$psHistory = (Get-PSReadLineOption).HistorySavePath

# Check for secrets in history
$patterns = @('sk-[a-zA-Z0-9]{20,}', 'AKIA[A-Z0-9]{16}', 'ghp_[a-zA-Z0-9]{36}')
$hasSecrets = $false

if (Test-Path $psHistory) {
    $content = Get-Content $psHistory -ErrorAction SilentlyContinue
    foreach ($pattern in $patterns) {
        if ($content | Select-String -Pattern $pattern -Quiet) {
            $hasSecrets = $true
            break
        }
    }
}

if ($hasSecrets) {
    Write-Host "[WARN] PowerShell history may contain secrets" -ForegroundColor Yellow

    if (-not $DryRun) {
        $response = Read-Host "Clear PowerShell history? (y/N)"
        if ($response -eq 'y' -or $response -eq 'Y') {
            Remove-Item $psHistory -Force -ErrorAction SilentlyContinue
            [Microsoft.PowerShell.PSConsoleReadLine]::ClearHistory()
            Write-Host "[OK] PowerShell history cleared" -ForegroundColor Green
        }
    } else {
        Write-Host "[DRY-RUN] Would prompt to clear history" -ForegroundColor Blue
    }
} else {
    Write-Host "[OK] No obvious secrets in PowerShell history" -ForegroundColor Green
}

#
# SUMMARY
#
Write-Header "REMEDIATION COMPLETE"

if ($DryRun) {
    Write-Host "This was a dry run. No changes were made."
    Write-Host "Run without -DryRun to apply changes."
} else {
    Write-Host "Remediation complete." -ForegroundColor Green
    Write-Host ""
    Write-Host "Manual steps you may still need to take:"
    Write-Host "  1. Enable BitLocker disk encryption"
    Write-Host "  2. Configure Windows Update for automatic updates"
    Write-Host "  3. Review Windows Firewall rules"
    Write-Host "  4. Rotate any exposed API keys"
    Write-Host "  5. Enable screen lock timeout"
}
