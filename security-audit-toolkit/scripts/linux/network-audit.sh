#!/bin/bash
#
# Network Security Audit for Linux
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

# UFW
if command -v ufw &> /dev/null; then
    echo "UFW Status:"
    sudo ufw status verbose 2>/dev/null || echo "  Could not get UFW status (need sudo)"
fi

# firewalld
if command -v firewall-cmd &> /dev/null; then
    echo ""
    echo "firewalld Status:"
    sudo firewall-cmd --state 2>/dev/null || echo "  firewalld not running"
    echo "Active zones:"
    sudo firewall-cmd --get-active-zones 2>/dev/null || true
fi

# iptables summary
if command -v iptables &> /dev/null; then
    echo ""
    echo "iptables summary:"
    sudo iptables -L -n --line-numbers 2>/dev/null | head -20 || echo "  Could not get iptables rules"
fi

#
# LISTENING SERVICES
#
echo ""
echo -e "${BLUE}=== LISTENING SERVICES ===${NC}"
echo ""

echo "Services exposed to ALL interfaces (0.0.0.0 or *):"
echo "---------------------------------------------------"
ss -tlnp 2>/dev/null | grep -E "0\.0\.0\.0:\*|LISTEN.*\*:" | while read line; do
    PORT=$(echo "$line" | awk '{print $4}' | sed 's/.*://')
    PROC=$(echo "$line" | awk '{print $NF}')
    case $PORT in
        22)    echo -e "${YELLOW}$line${NC}  <- SSH" ;;
        80)    echo -e "${BLUE}$line${NC}  <- HTTP" ;;
        443)   echo -e "${BLUE}$line${NC}  <- HTTPS" ;;
        445)   echo -e "${RED}$line${NC}  <- SMB" ;;
        3306)  echo -e "${RED}$line${NC}  <- MySQL" ;;
        5432)  echo -e "${RED}$line${NC}  <- PostgreSQL" ;;
        6379)  echo -e "${RED}$line${NC}  <- Redis" ;;
        27017) echo -e "${RED}$line${NC}  <- MongoDB" ;;
        *)     echo "$line" ;;
    esac
done

echo ""
echo "Services on LOCALHOST only (127.0.0.1):"
echo "---------------------------------------"
ss -tlnp 2>/dev/null | grep "127.0.0.1:" | head -10
echo "(showing first 10)"

#
# ACTIVE CONNECTIONS
#
echo ""
echo -e "${BLUE}=== ACTIVE CONNECTIONS ===${NC}"
echo ""

echo "Established connections (showing first 15):"
ss -tnp 2>/dev/null | grep ESTAB | head -15

#
# NETWORK INTERFACES
#
echo ""
echo -e "${BLUE}=== NETWORK INTERFACES ===${NC}"
echo ""

ip addr show 2>/dev/null | grep -E "^[0-9]+:|inet " | head -20

#
# VPN STATUS
#
echo ""
echo -e "${BLUE}=== VPN STATUS ===${NC}"
echo ""

# Tailscale
if command -v tailscale &> /dev/null; then
    echo "Tailscale status:"
    tailscale status 2>/dev/null || echo "  Tailscale not connected"
else
    echo "Tailscale: Not installed"
fi

# WireGuard
if command -v wg &> /dev/null; then
    echo ""
    echo "WireGuard interfaces:"
    sudo wg show 2>/dev/null | head -10 || echo "  No WireGuard interfaces"
fi

# OpenVPN
if ip link show 2>/dev/null | grep -q "tun0\|tap0"; then
    echo ""
    echo "OpenVPN tunnel detected (tun0/tap0)"
fi

#
# SSH CONFIGURATION
#
echo ""
echo -e "${BLUE}=== SSH CONFIGURATION ===${NC}"
echo ""

if [ -f /etc/ssh/sshd_config ]; then
    echo "Key SSH settings:"
    grep -E "^(PermitRootLogin|PasswordAuthentication|PubkeyAuthentication|Port|ListenAddress)" /etc/ssh/sshd_config 2>/dev/null || echo "  Using defaults"
else
    echo "SSH server config not found"
fi

#
# RECOMMENDATIONS
#
echo ""
echo -e "${BLUE}=== RECOMMENDATIONS ===${NC}"
echo ""

ISSUES=0

# Check for databases exposed
if ss -tlnp 2>/dev/null | grep -qE "0\.0\.0\.0:(3306|5432|27017|6379)"; then
    echo -e "${RED}[!] Database port(s) exposed to all interfaces - restrict to localhost${NC}"
    ((ISSUES++))
fi

# Check firewall
UFW_ACTIVE=$(sudo ufw status 2>/dev/null | grep -c "Status: active" || echo "0")
FIREWALLD_ACTIVE=$(systemctl is-active firewalld 2>/dev/null || echo "inactive")
if [ "$UFW_ACTIVE" = "0" ] && [ "$FIREWALLD_ACTIVE" != "active" ]; then
    echo -e "${RED}[!] No firewall appears to be active${NC}"
    ((ISSUES++))
fi

# Check SSH root login
if grep -q "^PermitRootLogin yes" /etc/ssh/sshd_config 2>/dev/null; then
    echo -e "${YELLOW}[!] SSH root login is enabled - consider disabling${NC}"
    ((ISSUES++))
fi

if [ $ISSUES -eq 0 ]; then
    echo -e "${GREEN}No critical network issues found${NC}"
fi

echo ""
echo "Audit complete."
