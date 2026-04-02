#Requires -Version 5.1
<#
.SYNOPSIS
    Credential Security Audit for Windows
.DESCRIPTION
    Find and check security of credential files
.PARAMETER Deep
    Extended search (slower, more thorough)
.EXAMPLE
    .\credential-audit.ps1
    .\credential-audit.ps1 -Deep
#>

param(
    [switch]$Deep
)

function Write-Header {
    param([string]$Title)
    Write-Host ""
    Write-Host "=== $Title ===" -ForegroundColor Cyan
    Write-Host ""
}

function Write-Secure {
    param([string]$Message)
    Write-Host "[SECURE]   " -ForegroundColor Green -NoNewline
    Write-Host $Message
}

function Write-Insecure {
    param([string]$Message)
    Write-Host "[INSECURE] " -ForegroundColor Red -NoNewline
    Write-Host $Message
}

function Write-Check {
    param([string]$Message)
    Write-Host "[CHECK]    " -ForegroundColor Yellow -NoNewline
    Write-Host $Message
}

Write-Host "========================================"
Write-Host "      CREDENTIAL SECURITY AUDIT"
Write-Host "========================================"
Write-Host "Date: $(Get-Date)"
Write-Host "Mode: $(if ($Deep) { 'Deep scan' } else { 'Standard' })"
Write-Host ""

#
# .ENV FILES
#
Write-Header ".ENV FILES"

Write-Host "Searching for .env files..."
$searchPaths = @(
    "$env:USERPROFILE\development",
    "$env:USERPROFILE\projects",
    "$env:USERPROFILE\source",
    "$env:USERPROFILE\repos",
    "$env:USERPROFILE\Documents"
)

$envFiles = @()
foreach ($path in $searchPaths) {
    if (Test-Path $path) {
        $found = Get-ChildItem -Path $path -Filter ".env*" -Recurse -Depth 4 -ErrorAction SilentlyContinue
        $envFiles += $found
    }
}

if ($envFiles.Count -eq 0) {
    Write-Host "No .env files found in common locations"
} else {
    Write-Host "Found .env files:"
    Write-Host ""
    foreach ($f in $envFiles) {
        # Check if file is readable by other users
        try {
            $acl = Get-Acl $f.FullName -ErrorAction Stop
            $otherAccess = $acl.Access | Where-Object {
                $_.IdentityReference -match "Everyone|Users|Authenticated Users" -and
                $_.FileSystemRights -match "Read"
            }
            if ($otherAccess) {
                Write-Insecure "$($f.FullName)"
            } else {
                Write-Secure "$($f.FullName)"
            }
        } catch {
            Write-Check "$($f.FullName)"
        }
    }
}

#
# SSH KEYS
#
Write-Header "SSH KEYS"

$sshDir = "$env:USERPROFILE\.ssh"
if (Test-Path $sshDir) {
    Write-Host "SSH directory contents:"
    Write-Host ""

    Get-ChildItem $sshDir -ErrorAction SilentlyContinue | ForEach-Object {
        $isPrivateKey = $_.Name -match "^id_" -and $_.Name -notmatch "\.pub$"

        if ($isPrivateKey) {
            try {
                $acl = Get-Acl $_.FullName
                # Check for overly permissive access
                $badAccess = $acl.Access | Where-Object {
                    $_.IdentityReference -notmatch "SYSTEM|Administrators|$env:USERNAME" -and
                    $_.FileSystemRights -match "Read|FullControl"
                }
                if ($badAccess) {
                    Write-Insecure "$($_.Name)"
                } else {
                    Write-Secure "$($_.Name)"
                }
            } catch {
                Write-Check "$($_.Name)"
            }
        } else {
            Write-Host "           $($_.Name)"
        }
    }
} else {
    Write-Host "No .ssh directory found"
}

#
# CLOUD CREDENTIALS
#
Write-Header "CLOUD CREDENTIALS"

# AWS
$awsDir = "$env:USERPROFILE\.aws"
if (Test-Path $awsDir) {
    Write-Host "AWS credentials found:" -ForegroundColor Yellow
    Get-ChildItem $awsDir -ErrorAction SilentlyContinue | Format-Table Name, LastWriteTime -AutoSize

    $awsCreds = "$awsDir\credentials"
    if (Test-Path $awsCreds) {
        try {
            $acl = Get-Acl $awsCreds
            $publicAccess = $acl.Access | Where-Object {
                $_.IdentityReference -match "Everyone|Users"
            }
            if ($publicAccess) {
                Write-Insecure "AWS credentials file has broad permissions"
            } else {
                Write-Secure "AWS credentials file has restricted permissions"
            }
        } catch {
            Write-Check "Could not check AWS credentials permissions"
        }
    }
} else {
    Write-Secure "No AWS credentials directory"
}

# Azure
$azureDir = "$env:USERPROFILE\.azure"
if (Test-Path $azureDir) {
    Write-Host ""
    Write-Host "Azure credentials found:" -ForegroundColor Yellow
    Get-ChildItem $azureDir -ErrorAction SilentlyContinue | Select-Object -First 5 | Format-Table Name -AutoSize
} else {
    Write-Secure "No Azure credentials directory"
}

# GCP
$gcpDir = "$env:APPDATA\gcloud"
if (Test-Path $gcpDir) {
    Write-Host ""
    Write-Host "GCP credentials found:" -ForegroundColor Yellow
    Get-ChildItem $gcpDir -Filter "*.json" -ErrorAction SilentlyContinue |
        Select-Object -First 5 |
        Format-Table Name -AutoSize
} else {
    Write-Secure "No GCP credentials directory"
}

# DigitalOcean
$doctlConfig = "$env:APPDATA\doctl\config.yaml"
if (Test-Path $doctlConfig) {
    Write-Host ""
    Write-Check "DigitalOcean (doctl) config found"
}

#
# DOCKER CREDENTIALS
#
Write-Header "DOCKER CREDENTIALS"

$dockerConfig = "$env:USERPROFILE\.docker\config.json"
if (Test-Path $dockerConfig) {
    Write-Host "Docker config found:"
    $content = Get-Content $dockerConfig -Raw -ErrorAction SilentlyContinue
    if ($content -match '"auth"') {
        Write-Check "Docker config contains authentication credentials"
    } else {
        Write-Secure "Docker config does not contain stored credentials"
    }
} else {
    Write-Secure "No Docker config found"
}

#
# KUBERNETES CREDENTIALS
#
Write-Header "KUBERNETES CREDENTIALS"

$kubeConfig = "$env:USERPROFILE\.kube\config"
if (Test-Path $kubeConfig) {
    Write-Host "Kubernetes config found:"

    try {
        $acl = Get-Acl $kubeConfig
        $publicAccess = $acl.Access | Where-Object {
            $_.IdentityReference -match "Everyone|Users"
        }
        if ($publicAccess) {
            Write-Insecure "Kubernetes config has broad permissions"
        } else {
            Write-Secure "Kubernetes config has restricted permissions"
        }
    } catch {
        Write-Check "Could not check permissions"
    }

    # Count contexts
    $content = Get-Content $kubeConfig -Raw -ErrorAction SilentlyContinue
    $contextCount = ([regex]::Matches($content, "- name:")).Count
    Write-Host "  Contains approximately $contextCount context(s)"
} else {
    Write-Secure "No Kubernetes config found"
}

#
# GIT CREDENTIALS
#
Write-Header "GIT CREDENTIALS"

# Plaintext credentials file
$gitCreds = "$env:USERPROFILE\.git-credentials"
if (Test-Path $gitCreds) {
    Write-Insecure "Plaintext git credentials file found at $gitCreds"
    Write-Host "  Consider using Git Credential Manager instead"
} else {
    Write-Secure "No plaintext git credentials file"
}

# Check credential helper
$credHelper = git config --global credential.helper 2>$null
if ($credHelper -match "manager|wincred") {
    Write-Secure "Git using secure credential helper: $credHelper"
} elseif ($credHelper -eq "store") {
    Write-Check "Git using 'store' helper (plaintext file)"
} else {
    Write-Host "Git credential helper: $credHelper"
}

#
# NPM CREDENTIALS
#
Write-Header "NPM CREDENTIALS"

$npmrc = "$env:USERPROFILE\.npmrc"
if (Test-Path $npmrc) {
    $content = Get-Content $npmrc -ErrorAction SilentlyContinue
    if ($content -match "_authToken|_password|//.*:_auth") {
        Write-Check "NPM config contains authentication tokens"
    } else {
        Write-Secure "NPM config does not contain credentials"
    }
} else {
    Write-Secure "No .npmrc file found"
}

#
# SHELL HISTORY
#
Write-Header "SHELL HISTORY"

Write-Host "Checking for potential secrets in shell history..."

$patterns = @(
    'sk-[a-zA-Z0-9]{20,}',           # OpenAI
    'sk-ant-[a-zA-Z0-9-]+',          # Anthropic
    'AKIA[A-Z0-9]{16}',              # AWS Access Key
    'ghp_[a-zA-Z0-9]{36}',           # GitHub PAT
    'gho_[a-zA-Z0-9]{36}',           # GitHub OAuth
    'glpat-[a-zA-Z0-9-]{20}',        # GitLab PAT
    'xox[baprs]-[a-zA-Z0-9-]+'       # Slack tokens
)

$historyHits = 0

# PowerShell history
$psHistory = (Get-PSReadLineOption).HistorySavePath
if (Test-Path $psHistory) {
    $content = Get-Content $psHistory -ErrorAction SilentlyContinue
    foreach ($pattern in $patterns) {
        $matches = $content | Select-String -Pattern $pattern -AllMatches
        $historyHits += $matches.Count
    }
    if ($historyHits -gt 0) {
        Write-Check "Found $historyHits potential secret(s) in PowerShell history"
    }
}

# CMD history (doskey)
$cmdHistory = "$env:USERPROFILE\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt"
if (Test-Path $cmdHistory) {
    # Already checked above via PSReadLine
}

if ($historyHits -eq 0) {
    Write-Secure "No obvious secrets found in shell history"
}

#
# WINDOWS CREDENTIAL MANAGER
#
Write-Header "WINDOWS CREDENTIAL MANAGER"

Write-Host "Stored credentials in Windows Credential Manager:"
try {
    $creds = cmdkey /list 2>&1
    $credCount = ($creds | Select-String "Target:").Count
    Write-Host "  Total stored credentials: $credCount"

    # Look for specific types
    $gitCreds = ($creds | Select-String "git").Count
    $azureCreds = ($creds | Select-String "azure|microsoft").Count

    if ($gitCreds -gt 0) { Write-Host "  - Git credentials: $gitCreds" }
    if ($azureCreds -gt 0) { Write-Host "  - Azure/Microsoft: $azureCreds" }
} catch {
    Write-Host "  Could not enumerate credentials"
}

#
# GIT REPOSITORIES (Deep Scan)
#
if ($Deep) {
    Write-Header "GIT REPOSITORIES (Deep Scan)"

    Write-Host "Checking for .env files tracked in git..."

    foreach ($path in $searchPaths) {
        if (Test-Path $path) {
            $gitDirs = Get-ChildItem -Path $path -Filter ".git" -Recurse -Directory -Depth 4 -Force -ErrorAction SilentlyContinue

            foreach ($gitDir in $gitDirs) {
                $repoPath = $gitDir.Parent.FullName
                Push-Location $repoPath

                $trackedEnv = git ls-files 2>$null | Select-String "^\.env"
                if ($trackedEnv) {
                    Write-Insecure "Tracked .env files in $repoPath"
                    $trackedEnv | ForEach-Object { Write-Host "    $_" }
                }

                Pop-Location
            }
        }
    }
}

#
# RECOMMENDATIONS
#
Write-Header "RECOMMENDATIONS"

Write-Host "To secure credential files on Windows:"
Write-Host ""
Write-Host "1. Remove 'Everyone' and 'Users' from sensitive file ACLs:"
Write-Host "   icacls `"file.txt`" /inheritance:r /grant:r `"$env:USERNAME:(R)`""
Write-Host ""
Write-Host "2. Use Windows Credential Manager for git:"
Write-Host "   git config --global credential.helper manager"
Write-Host ""
Write-Host "3. Use environment variables for secrets:"
Write-Host "   [Environment]::SetEnvironmentVariable('API_KEY', 'value', 'User')"
Write-Host ""
Write-Host "4. Encrypt sensitive files with EFS:"
Write-Host "   cipher /e /s:`"C:\path\to\folder`""
Write-Host ""

Write-Host "Audit complete."
