#!/bin/bash
#
# Network Security Audit for macOS
# Check for exposed services and network vulnerabilities
#
# Usage: ./network-audit.sh
#

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

echo "========================================"
echo "       NETWORK SECURITY AUDIT"
echo "========================================"
echo "Date: $(date)"
echo ""

#
# FIREWALL STATUS
#
echo -e "${BLUE}=== FIREWALL ===${NC}"
echo ""

echo "Global state:"
/usr/libexec/ApplicationFirewall/socketfilterfw --getglobalstate

echo ""
echo "Stealth mode:"
/usr/libexec/ApplicationFirewall/socketfilterfw --getstealthmode

echo ""
echo "Block all incoming:"
/usr/libexec/ApplicationFirewall/socketfilterfw --getblockall

#
# LISTENING SERVICES
#
echo ""
echo -e "${BLUE}=== LISTENING SERVICES ===${NC}"
echo ""

echo "Services exposed to ALL interfaces (potential risk):"
echo "-----------------------------------------------------"
netstat -an 2>/dev/null | grep LISTEN | grep -E '(\*\.|0\.0\.0\.0)' | while read line; do
    PORT=$(echo "$line" | awk '{print $4}' | sed 's/.*\.//')
    case $PORT in
        22)   echo -e "${YELLOW}$line${NC}  <- SSH" ;;
        80)   echo -e "${YELLOW}$line${NC}  <- HTTP" ;;
        443)  echo -e "${YELLOW}$line${NC}  <- HTTPS" ;;
        445)  echo -e "${RED}$line${NC}  <- SMB (File Sharing)" ;;
        548)  echo -e "${YELLOW}$line${NC}  <- AFP (Apple File Sharing)" ;;
        3283) echo -e "${RED}$line${NC}  <- Apple Remote Desktop" ;;
        3306) echo -e "${RED}$line${NC}  <- MySQL" ;;
        5432) echo -e "${RED}$line${NC}  <- PostgreSQL" ;;
        5900) echo -e "${RED}$line${NC}  <- VNC (Screen Sharing)" ;;
        6379) echo -e "${RED}$line${NC}  <- Redis" ;;
        27017) echo -e "${RED}$line${NC}  <- MongoDB" ;;
        *)    echo "$line" ;;
    esac
done

echo ""
echo "Services on LOCALHOST only (safe):"
echo "-----------------------------------"
netstat -an 2>/dev/null | grep LISTEN | grep -E '127\.0\.0\.1|::1' | head -10
echo "(showing first 10)"

#
# SHARING SERVICES
#
echo ""
echo -e "${BLUE}=== SHARING SERVICES ===${NC}"
echo ""

echo "Active shares:"
sharing -l 2>/dev/null || echo "No shares configured"

echo ""
echo "System-level SMB guest access setting:"
defaults read /Library/Preferences/SystemConfiguration/com.apple.smb.server AllowGuestAccess 2>/dev/null || echo "Not configured"

#
# ACTIVE CONNECTIONS
#
echo ""
echo -e "${BLUE}=== ACTIVE CONNECTIONS ===${NC}"
echo ""

echo "Established connections (showing first 15):"
netstat -an 2>/dev/null | grep ESTABLISHED | head -15

#
# VPN STATUS
#
echo ""
echo -e "${BLUE}=== VPN STATUS ===${NC}"
echo ""

# Check for Tailscale
if command -v tailscale &> /dev/null; then
    echo "Tailscale status:"
    tailscale status 2>/dev/null || echo "Tailscale not connected"
else
    echo "Tailscale: Not installed"
fi

# Check for other VPNs
echo ""
echo "Active VPN interfaces:"
ifconfig 2>/dev/null | grep -E "^(utun|ppp|tun)" | awk '{print $1}' | tr -d ':' || echo "None detected"

#
# RECOMMENDATIONS
#
echo ""
echo -e "${BLUE}=== RECOMMENDATIONS ===${NC}"
echo ""

# Check for critical issues
ISSUES=0

if netstat -an 2>/dev/null | grep -q "LISTEN.*\*\.445"; then
    echo -e "${RED}[!] SMB is exposed - consider disabling File Sharing or restricting access${NC}"
    ((ISSUES++))
fi

if netstat -an 2>/dev/null | grep -q "LISTEN.*\*\.5900"; then
    echo -e "${YELLOW}[!] VNC/Screen Sharing is exposed - use only over VPN${NC}"
    ((ISSUES++))
fi

if [ "$(/usr/libexec/ApplicationFirewall/socketfilterfw --getglobalstate 2>/dev/null | grep -c disabled)" -gt 0 ]; then
    echo -e "${RED}[!] Firewall is disabled - enable it in System Settings > Network > Firewall${NC}"
    ((ISSUES++))
fi

if [ $ISSUES -eq 0 ]; then
    echo -e "${GREEN}No critical network issues found${NC}"
fi

echo ""
echo "Audit complete."
