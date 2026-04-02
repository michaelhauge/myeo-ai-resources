#Requires -Version 5.1
<#
.SYNOPSIS
    Network Security Audit for Windows
.DESCRIPTION
    Check for exposed services and network vulnerabilities
.EXAMPLE
    .\network-audit.ps1
#>

function Write-Header {
    param([string]$Title)
    Write-Host ""
    Write-Host "=== $Title ===" -ForegroundColor Cyan
    Write-Host ""
}

$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

Write-Host "========================================"
Write-Host "       NETWORK SECURITY AUDIT"
Write-Host "========================================"
Write-Host "Date: $(Get-Date)"
Write-Host "Admin: $isAdmin"
Write-Host ""

#
# FIREWALL STATUS
#
Write-Header "WINDOWS FIREWALL"

try {
    $profiles = Get-NetFirewallProfile -ErrorAction Stop
    foreach ($p in $profiles) {
        $status = if ($p.Enabled) { "ENABLED" } else { "DISABLED" }
        $color = if ($p.Enabled) { "Green" } else { "Red" }
        Write-Host "$($p.Name): " -NoNewline
        Write-Host $status -ForegroundColor $color
        Write-Host "  Default Inbound: $($p.DefaultInboundAction)"
        Write-Host "  Default Outbound: $($p.DefaultOutboundAction)"
    }
} catch {
    Write-Host "Could not retrieve firewall status" -ForegroundColor Yellow
}

#
# LISTENING SERVICES
#
Write-Header "LISTENING SERVICES"

Write-Host "Services exposed to ALL interfaces (0.0.0.0 or ::):" -ForegroundColor Yellow
Write-Host "---------------------------------------------------"

try {
    $listeners = Get-NetTCPConnection -State Listen -ErrorAction Stop |
        Where-Object { $_.LocalAddress -eq "0.0.0.0" -or $_.LocalAddress -eq "::" } |
        Sort-Object LocalPort

    $riskyPorts = @{
        21 = @("FTP", "Red")
        22 = @("SSH", "Yellow")
        23 = @("Telnet", "Red")
        25 = @("SMTP", "Yellow")
        80 = @("HTTP", "Cyan")
        135 = @("RPC", "Red")
        139 = @("NetBIOS", "Red")
        443 = @("HTTPS", "Cyan")
        445 = @("SMB", "Red")
        1433 = @("SQL Server", "Red")
        1434 = @("SQL Browser", "Red")
        3306 = @("MySQL", "Red")
        3389 = @("RDP", "Yellow")
        5432 = @("PostgreSQL", "Red")
        5900 = @("VNC", "Red")
        5985 = @("WinRM HTTP", "Yellow")
        5986 = @("WinRM HTTPS", "Yellow")
        6379 = @("Redis", "Red")
        8080 = @("HTTP Alt", "Cyan")
        27017 = @("MongoDB", "Red")
    }

    foreach ($l in $listeners) {
        $port = $l.LocalPort
        $process = Get-Process -Id $l.OwningProcess -ErrorAction SilentlyContinue
        $procName = if ($process) { $process.Name } else { "Unknown" }

        if ($riskyPorts.ContainsKey($port)) {
            $info = $riskyPorts[$port]
            Write-Host "  Port $port " -NoNewline
            Write-Host "[$($info[0])]" -ForegroundColor $info[1] -NoNewline
            Write-Host " - $procName"
        } else {
            Write-Host "  Port $port - $procName"
        }
    }
} catch {
    Write-Host "Could not enumerate listening ports" -ForegroundColor Yellow
}

Write-Host ""
Write-Host "Services on LOCALHOST only:" -ForegroundColor Green
Write-Host "----------------------------"

try {
    $localhost = Get-NetTCPConnection -State Listen -ErrorAction Stop |
        Where-Object { $_.LocalAddress -eq "127.0.0.1" -or $_.LocalAddress -eq "::1" } |
        Sort-Object LocalPort |
        Select-Object -First 10

    foreach ($l in $localhost) {
        $process = Get-Process -Id $l.OwningProcess -ErrorAction SilentlyContinue
        $procName = if ($process) { $process.Name } else { "Unknown" }
        Write-Host "  Port $($l.LocalPort) - $procName"
    }
    Write-Host "(showing first 10)"
} catch {
    Write-Host "Could not enumerate localhost ports" -ForegroundColor Yellow
}

#
# ACTIVE CONNECTIONS
#
Write-Header "ACTIVE CONNECTIONS"

Write-Host "Established connections (showing first 15):"
try {
    Get-NetTCPConnection -State Established -ErrorAction Stop |
        Select-Object LocalAddress, LocalPort, RemoteAddress, RemotePort, OwningProcess |
        Select-Object -First 15 |
        Format-Table -AutoSize
} catch {
    Write-Host "Could not enumerate connections" -ForegroundColor Yellow
}

#
# NETWORK INTERFACES
#
Write-Header "NETWORK INTERFACES"

Get-NetIPAddress -AddressFamily IPv4 |
    Where-Object { $_.IPAddress -ne "127.0.0.1" } |
    Select-Object InterfaceAlias, IPAddress, PrefixLength |
    Format-Table -AutoSize

#
# NETWORK SHARES
#
Write-Header "NETWORK SHARES"

try {
    $shares = Get-SmbShare -ErrorAction Stop | Where-Object { $_.Name -notmatch '^\$' }
    if ($shares) {
        Write-Host "User-created shares:" -ForegroundColor Yellow
        $shares | Format-Table Name, Path, Description -AutoSize
    } else {
        Write-Host "No user-created shares (only system shares)" -ForegroundColor Green
    }

    # Check for guest access on shares
    foreach ($share in $shares) {
        $access = Get-SmbShareAccess -Name $share.Name -ErrorAction SilentlyContinue
        $guestAccess = $access | Where-Object { $_.AccountName -match "Everyone|Guest" }
        if ($guestAccess) {
            Write-Host "[!] Share '$($share.Name)' allows Everyone/Guest access" -ForegroundColor Red
        }
    }
} catch {
    Write-Host "Could not enumerate shares (may require admin)" -ForegroundColor Yellow
}

#
# REMOTE DESKTOP
#
Write-Header "REMOTE ACCESS"

# RDP
try {
    $rdp = Get-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Terminal Server" -ErrorAction Stop
    if ($rdp.fDenyTSConnections -eq 1) {
        Write-Host "Remote Desktop: " -NoNewline
        Write-Host "DISABLED" -ForegroundColor Green
    } else {
        Write-Host "Remote Desktop: " -NoNewline
        Write-Host "ENABLED" -ForegroundColor Yellow
    }
} catch {
    Write-Host "Could not check RDP status"
}

# WinRM
try {
    $winrm = Get-Service WinRM -ErrorAction Stop
    Write-Host "WinRM Service: $($winrm.Status)"
} catch {
    Write-Host "WinRM: Not installed"
}

# SSH Server
try {
    $sshd = Get-Service sshd -ErrorAction Stop
    Write-Host "OpenSSH Server: $($sshd.Status)"
} catch {
    Write-Host "OpenSSH Server: Not installed" -ForegroundColor Green
}

#
# VPN STATUS
#
Write-Header "VPN STATUS"

# Check for VPN adapters
$vpnAdapters = Get-NetAdapter | Where-Object {
    $_.InterfaceDescription -match "VPN|TAP|TUN|WireGuard|Tailscale|Cisco|Fortinet|Palo Alto"
}

if ($vpnAdapters) {
    Write-Host "VPN adapters detected:"
    $vpnAdapters | Format-Table Name, InterfaceDescription, Status -AutoSize
} else {
    Write-Host "No VPN adapters detected"
}

# Tailscale
$tailscale = Get-Command tailscale -ErrorAction SilentlyContinue
if ($tailscale) {
    Write-Host ""
    Write-Host "Tailscale status:"
    & tailscale status 2>&1 | Select-Object -First 10
}

#
# RECOMMENDATIONS
#
Write-Header "RECOMMENDATIONS"

$issues = 0

# Check for exposed databases
$dbPorts = @(1433, 3306, 5432, 6379, 27017)
$exposedDb = Get-NetTCPConnection -State Listen -ErrorAction SilentlyContinue |
    Where-Object { $_.LocalAddress -eq "0.0.0.0" -and $dbPorts -contains $_.LocalPort }

if ($exposedDb) {
    Write-Host "[!] Database port(s) exposed to all interfaces - restrict to localhost" -ForegroundColor Red
    $issues++
}

# Check SMB
$smb = Get-NetTCPConnection -State Listen -ErrorAction SilentlyContinue |
    Where-Object { $_.LocalAddress -eq "0.0.0.0" -and $_.LocalPort -eq 445 }

if ($smb) {
    Write-Host "[!] SMB (port 445) is exposed - verify file sharing settings" -ForegroundColor Yellow
    $issues++
}

# Check firewall
$disabledProfiles = Get-NetFirewallProfile -ErrorAction SilentlyContinue |
    Where-Object { -not $_.Enabled }

if ($disabledProfiles) {
    Write-Host "[!] One or more firewall profiles are disabled" -ForegroundColor Red
    $issues++
}

if ($issues -eq 0) {
    Write-Host "No critical network issues found" -ForegroundColor Green
}

Write-Host ""
Write-Host "Audit complete."
