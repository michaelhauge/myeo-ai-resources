#!/bin/bash
#
# Full Security Audit for Linux
# Run all security checks and generate a report
#
# Usage: ./full-audit.sh [--fix]
#
# Options:
#   --fix     Automatically fix issues where possible
#

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Counters
PASS=0
WARN=0
FAIL=0

# Parse arguments
AUTO_FIX=false
for arg in "$@"; do
    case $arg in
        --fix) AUTO_FIX=true ;;
    esac
done

# Helper functions
log_pass() {
    ((PASS++))
    echo -e "${GREEN}[PASS]${NC} $1"
}

log_warn() {
    ((WARN++))
    echo -e "${YELLOW}[WARN]${NC} $1"
}

log_fail() {
    ((FAIL++))
    echo -e "${RED}[FAIL]${NC} $1"
}

log_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

header() {
    echo ""
    echo -e "${BLUE}=== $1 ===${NC}"
    echo ""
}

# Detect distro
get_distro() {
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        echo "$NAME $VERSION_ID"
    elif [ -f /etc/redhat-release ]; then
        cat /etc/redhat-release
    else
        echo "Unknown Linux"
    fi
}

# Start audit
echo "========================================"
echo "       SECURITY AUDIT REPORT"
echo "========================================"
echo "Date: $(date)"
echo "System: $(get_distro)"
echo "Kernel: $(uname -r)"
echo "Host: $(hostname)"
echo "User: $(whoami)"
echo "========================================"

#
# SECTION 1: FIREWALL
#
header "FIREWALL STATUS"

# Check UFW (Ubuntu/Debian)
if command -v ufw &> /dev/null; then
    UFW_STATUS=$(sudo ufw status 2>/dev/null | head -1)
    if echo "$UFW_STATUS" | grep -q "active"; then
        log_pass "UFW firewall is active"
    else
        log_fail "UFW firewall is inactive"
        if [ "$AUTO_FIX" = true ]; then
            log_info "Attempting to enable UFW..."
            sudo ufw --force enable && log_pass "UFW enabled" || log_warn "Could not enable UFW"
        fi
    fi
# Check firewalld (RHEL/CentOS/Fedora)
elif command -v firewall-cmd &> /dev/null; then
    if systemctl is-active --quiet firewalld; then
        log_pass "firewalld is active"
    else
        log_fail "firewalld is inactive"
    fi
# Check iptables
elif command -v iptables &> /dev/null; then
    IPTABLES_RULES=$(sudo iptables -L -n 2>/dev/null | grep -c "^Chain" || echo "0")
    if [ "$IPTABLES_RULES" -gt 0 ]; then
        log_warn "iptables is present but status unclear - verify rules manually"
    else
        log_fail "No firewall detected"
    fi
else
    log_fail "No firewall detected (ufw, firewalld, or iptables)"
fi

#
# SECTION 2: NETWORK EXPOSURE
#
header "NETWORK EXPOSURE"

log_info "Checking for services exposed to network..."

# SSH
if ss -tlnp 2>/dev/null | grep -q ":22 .*0\.0\.0\.0"; then
    log_warn "SSH (port 22) is exposed on all interfaces"
elif ss -tlnp 2>/dev/null | grep -q ":22 "; then
    log_pass "SSH is running (check binding)"
else
    log_pass "SSH is not listening or is localhost-only"
fi

# Common database ports
for port_info in "3306:MySQL" "5432:PostgreSQL" "27017:MongoDB" "6379:Redis"; do
    port="${port_info%%:*}"
    name="${port_info##*:}"
    if ss -tlnp 2>/dev/null | grep -q ":$port .*0\.0\.0\.0"; then
        log_fail "$name (port $port) is exposed on all interfaces"
    elif ss -tlnp 2>/dev/null | grep -q ":$port "; then
        log_pass "$name is running on localhost only"
    fi
done

# Samba/SMB
if ss -tlnp 2>/dev/null | grep -q ":445 "; then
    log_warn "SMB (port 445) is listening - verify access controls"
fi

# HTTP/HTTPS
if ss -tlnp 2>/dev/null | grep -q ":80 .*0\.0\.0\.0"; then
    log_info "HTTP (port 80) is exposed - expected for web servers"
fi
if ss -tlnp 2>/dev/null | grep -q ":443 .*0\.0\.0\.0"; then
    log_info "HTTPS (port 443) is exposed - expected for web servers"
fi

#
# SECTION 3: FILE PERMISSIONS
#
header "FILE PERMISSIONS"

# Check .env files
log_info "Checking .env file permissions..."
INSECURE_ENV=$(find ~/development ~/projects ~/ -maxdepth 4 -name ".env*" -type f -perm /044 2>/dev/null | wc -l)
if [ "$INSECURE_ENV" -gt 0 ]; then
    log_fail "$INSECURE_ENV .env file(s) have world/group-readable permissions"
    if [ "$AUTO_FIX" = true ]; then
        find ~/development ~/projects ~/ -maxdepth 4 -name ".env*" -type f -perm /044 -exec chmod 600 {} \; 2>/dev/null
        log_pass "Fixed .env file permissions to 600"
    fi
else
    log_pass "All .env files have secure permissions"
fi

# Check SSH key permissions
log_info "Checking SSH key permissions..."
SSH_KEY_ISSUES=0
for keyfile in ~/.ssh/id_rsa ~/.ssh/id_ed25519 ~/.ssh/id_ecdsa ~/.ssh/id_dsa; do
    if [ -f "$keyfile" ]; then
        PERMS=$(stat -c %a "$keyfile" 2>/dev/null)
        if [ "$PERMS" != "600" ]; then
            log_fail "SSH private key $keyfile has insecure permissions ($PERMS)"
            SSH_KEY_ISSUES=$((SSH_KEY_ISSUES + 1))
            if [ "$AUTO_FIX" = true ]; then
                chmod 600 "$keyfile"
            fi
        fi
    fi
done
if [ $SSH_KEY_ISSUES -eq 0 ]; then
    log_pass "SSH private keys have secure permissions"
fi

# Check .ssh directory
if [ -d ~/.ssh ]; then
    SSH_DIR_PERMS=$(stat -c %a ~/.ssh 2>/dev/null)
    if [ "$SSH_DIR_PERMS" != "700" ]; then
        log_warn "~/.ssh directory has permissions $SSH_DIR_PERMS (should be 700)"
        if [ "$AUTO_FIX" = true ]; then
            chmod 700 ~/.ssh
            log_pass "Fixed ~/.ssh permissions"
        fi
    else
        log_pass "~/.ssh directory has correct permissions"
    fi
fi

#
# SECTION 4: SECRETS IN COMMON LOCATIONS
#
header "SECRET DETECTION"

# Check for secrets in shell history
log_info "Checking shell history for potential secrets..."
PATTERNS="sk-[a-zA-Z0-9]{20,}|AKIA[A-Z0-9]{16}|ghp_[a-zA-Z0-9]{36}"

HISTORY_HITS=0
for histfile in ~/.bash_history ~/.zsh_history; do
    if [ -f "$histfile" ]; then
        HITS=$(grep -cE "$PATTERNS" "$histfile" 2>/dev/null || echo "0")
        if [ "$HITS" -gt 0 ]; then
            log_warn "Found $HITS potential secret(s) in $histfile"
            HISTORY_HITS=$((HISTORY_HITS + HITS))
        fi
    fi
done

if [ $HISTORY_HITS -eq 0 ]; then
    log_pass "No obvious secrets found in shell history"
fi

# Check for AWS credentials
if [ -f ~/.aws/credentials ]; then
    PERMS=$(stat -c %a ~/.aws/credentials 2>/dev/null)
    if [ "$PERMS" != "600" ]; then
        log_fail "AWS credentials file has insecure permissions ($PERMS)"
        if [ "$AUTO_FIX" = true ]; then
            chmod 600 ~/.aws/credentials
            log_pass "Fixed AWS credentials permissions"
        fi
    else
        log_pass "AWS credentials file has secure permissions"
    fi
else
    log_info "No AWS credentials file found"
fi

#
# SECTION 5: SYSTEM SECURITY
#
header "SYSTEM SECURITY"

# Check disk encryption (LUKS)
if command -v lsblk &> /dev/null; then
    ENCRYPTED_DISKS=$(lsblk -o NAME,TYPE,FSTYPE 2>/dev/null | grep -c "crypt" || echo "0")
    if [ "$ENCRYPTED_DISKS" -gt 0 ]; then
        log_pass "Disk encryption (LUKS) detected"
    else
        log_warn "No disk encryption detected - consider enabling LUKS"
    fi
fi

# Check for unattended upgrades (Debian/Ubuntu)
if [ -f /etc/apt/apt.conf.d/20auto-upgrades ]; then
    if grep -q 'APT::Periodic::Unattended-Upgrade "1"' /etc/apt/apt.conf.d/20auto-upgrades 2>/dev/null; then
        log_pass "Automatic security updates are enabled"
    else
        log_warn "Automatic security updates may not be enabled"
    fi
elif command -v dnf &> /dev/null; then
    if systemctl is-enabled --quiet dnf-automatic.timer 2>/dev/null; then
        log_pass "Automatic updates (dnf-automatic) are enabled"
    else
        log_warn "Automatic updates may not be enabled"
    fi
fi

# Check if root login is disabled for SSH
if [ -f /etc/ssh/sshd_config ]; then
    ROOT_LOGIN=$(grep -E "^PermitRootLogin" /etc/ssh/sshd_config 2>/dev/null | awk '{print $2}')
    if [ "$ROOT_LOGIN" = "no" ]; then
        log_pass "SSH root login is disabled"
    elif [ "$ROOT_LOGIN" = "yes" ]; then
        log_fail "SSH root login is ENABLED"
    else
        log_warn "SSH root login status unclear (may default to yes)"
    fi
fi

# Check for password authentication in SSH
if [ -f /etc/ssh/sshd_config ]; then
    PASS_AUTH=$(grep -E "^PasswordAuthentication" /etc/ssh/sshd_config 2>/dev/null | awk '{print $2}')
    if [ "$PASS_AUTH" = "no" ]; then
        log_pass "SSH password authentication is disabled (key-only)"
    elif [ "$PASS_AUTH" = "yes" ]; then
        log_warn "SSH password authentication is enabled"
    fi
fi

# Check fail2ban
if command -v fail2ban-client &> /dev/null; then
    if systemctl is-active --quiet fail2ban 2>/dev/null; then
        log_pass "fail2ban is active"
    else
        log_warn "fail2ban is installed but not active"
    fi
else
    log_info "fail2ban is not installed (recommended for SSH protection)"
fi

#
# SUMMARY
#
header "SUMMARY"
echo ""
echo -e "Results: ${GREEN}$PASS PASS${NC} | ${YELLOW}$WARN WARN${NC} | ${RED}$FAIL FAIL${NC}"
echo ""

if [ $FAIL -gt 0 ]; then
    echo -e "${RED}ACTION REQUIRED: $FAIL critical issue(s) found${NC}"
    exit 1
elif [ $WARN -gt 0 ]; then
    echo -e "${YELLOW}REVIEW RECOMMENDED: $WARN warning(s) found${NC}"
    exit 0
else
    echo -e "${GREEN}ALL CHECKS PASSED${NC}"
    exit 0
fi
