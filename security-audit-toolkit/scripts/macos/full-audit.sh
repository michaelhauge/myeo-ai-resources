#!/bin/bash
#
# Full Security Audit for macOS
# Run all security checks and generate a report
#
# Usage: ./full-audit.sh [--json] [--fix]
#
# Options:
#   --json    Output results in JSON format
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
JSON_OUTPUT=false
AUTO_FIX=false
for arg in "$@"; do
    case $arg in
        --json) JSON_OUTPUT=true ;;
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

# Start audit
echo "========================================"
echo "       SECURITY AUDIT REPORT"
echo "========================================"
echo "Date: $(date)"
echo "System: $(sw_vers -productName) $(sw_vers -productVersion)"
echo "Host: $(hostname)"
echo "User: $(whoami)"
echo "========================================"

#
# SECTION 1: FIREWALL
#
header "FIREWALL STATUS"

# Check if firewall is enabled
FIREWALL_STATE=$(/usr/libexec/ApplicationFirewall/socketfilterfw --getglobalstate 2>/dev/null | grep -o "enabled\|disabled")
if [ "$FIREWALL_STATE" = "enabled" ]; then
    log_pass "Firewall is enabled"
else
    log_fail "Firewall is DISABLED"
    if [ "$AUTO_FIX" = true ]; then
        log_info "Attempting to enable firewall (requires admin)..."
        sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on 2>/dev/null && log_pass "Firewall enabled" || log_warn "Could not enable firewall (need sudo)"
    fi
fi

# Check stealth mode
STEALTH_MODE=$(/usr/libexec/ApplicationFirewall/socketfilterfw --getstealthmode 2>/dev/null | grep -o "enabled\|disabled")
if [ "$STEALTH_MODE" = "enabled" ]; then
    log_pass "Stealth mode is enabled"
else
    log_warn "Stealth mode is disabled (system responds to pings)"
fi

#
# SECTION 2: NETWORK EXPOSURE
#
header "NETWORK EXPOSURE"

# Check for services listening on all interfaces
log_info "Checking for services exposed to network..."

# SSH
if netstat -an 2>/dev/null | grep -q "LISTEN.*\*\.22\|LISTEN.*0\.0\.0\.0\.22"; then
    log_warn "SSH (port 22) is exposed on all interfaces"
else
    log_pass "SSH is not exposed or is localhost-only"
fi

# SMB/File Sharing
if netstat -an 2>/dev/null | grep -q "LISTEN.*\*\.445\|LISTEN.*0\.0\.0\.0\.445"; then
    # Check guest access
    GUEST_ACCESS=$(sharing -l 2>/dev/null | grep "guest access" | head -1 | grep -o "[0-9]")
    if [ "$GUEST_ACCESS" = "1" ]; then
        log_fail "SMB (port 445) exposed with GUEST ACCESS enabled"
    else
        log_warn "SMB (port 445) is exposed on all interfaces"
    fi
else
    log_pass "SMB/File Sharing is not exposed"
fi

# VNC/Screen Sharing
if netstat -an 2>/dev/null | grep -q "LISTEN.*\*\.5900\|LISTEN.*0\.0\.0\.0\.5900"; then
    log_warn "VNC/Screen Sharing (port 5900) is exposed on all interfaces"
else
    log_pass "VNC/Screen Sharing is not exposed"
fi

# Apple Remote Desktop
if netstat -an 2>/dev/null | grep -q "LISTEN.*\*\.3283\|LISTEN.*0\.0\.0\.0\.3283"; then
    log_warn "Apple Remote Desktop (port 3283) is exposed"
else
    log_pass "Apple Remote Desktop is not exposed"
fi

# Remote Apple Events
if netstat -an 2>/dev/null | grep -q "LISTEN.*\*\.3031\|LISTEN.*0\.0\.0\.0\.3031"; then
    log_warn "Remote Apple Events (port 3031) is exposed"
else
    log_pass "Remote Apple Events is not exposed"
fi

#
# SECTION 3: FILE PERMISSIONS
#
header "FILE PERMISSIONS"

# Check .env files
log_info "Checking .env file permissions..."
INSECURE_ENV=$(find ~/development -name ".env*" -type f -perm 644 2>/dev/null | wc -l | tr -d ' ')
if [ "$INSECURE_ENV" -gt 0 ]; then
    log_fail "$INSECURE_ENV .env file(s) have world-readable permissions (644)"
    if [ "$AUTO_FIX" = true ]; then
        find ~/development -name ".env*" -type f -perm 644 -exec chmod 600 {} \; 2>/dev/null
        log_pass "Fixed .env file permissions to 600"
    fi
else
    log_pass "All .env files have secure permissions"
fi

# Check SSH key permissions
log_info "Checking SSH key permissions..."
if [ -f ~/.ssh/id_rsa ] && [ "$(stat -f %Lp ~/.ssh/id_rsa 2>/dev/null)" != "600" ]; then
    log_fail "SSH private key (~/.ssh/id_rsa) has insecure permissions"
elif [ -f ~/.ssh/id_ed25519 ] && [ "$(stat -f %Lp ~/.ssh/id_ed25519 2>/dev/null)" != "600" ]; then
    log_fail "SSH private key (~/.ssh/id_ed25519) has insecure permissions"
else
    log_pass "SSH private keys have secure permissions"
fi

# Check for credential files with wrong permissions
log_info "Checking credential file permissions..."
INSECURE_CREDS=$(find ~/.*/ -maxdepth 2 -name "*.json" -type f -perm 644 2>/dev/null | grep -iE "(cred|token|key|secret|auth)" | wc -l | tr -d ' ')
if [ "$INSECURE_CREDS" -gt 0 ]; then
    log_warn "$INSECURE_CREDS credential file(s) may have insecure permissions"
else
    log_pass "No obvious credential files with insecure permissions"
fi

#
# SECTION 4: SECRETS IN COMMON LOCATIONS
#
header "SECRET DETECTION"

# Check for secrets in shell history
log_info "Checking shell history for potential secrets..."
if grep -qE "(sk-[a-zA-Z0-9]{20,}|AKIA[A-Z0-9]{16}|ghp_[a-zA-Z0-9]{36})" ~/.zsh_history ~/.bash_history 2>/dev/null; then
    log_warn "Potential API keys found in shell history"
else
    log_pass "No obvious API keys in shell history"
fi

# Check for AWS credentials
if [ -f ~/.aws/credentials ]; then
    if [ "$(stat -f %Lp ~/.aws/credentials 2>/dev/null)" != "600" ]; then
        log_fail "AWS credentials file has insecure permissions"
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

# Check FileVault
FILEVAULT_STATUS=$(fdesetup status 2>/dev/null | grep -o "On\|Off")
if [ "$FILEVAULT_STATUS" = "On" ]; then
    log_pass "FileVault disk encryption is enabled"
else
    log_fail "FileVault disk encryption is DISABLED"
fi

# Check SIP (System Integrity Protection)
SIP_STATUS=$(csrutil status 2>/dev/null | grep -o "enabled\|disabled")
if [ "$SIP_STATUS" = "enabled" ]; then
    log_pass "System Integrity Protection (SIP) is enabled"
else
    log_fail "System Integrity Protection (SIP) is DISABLED"
fi

# Check Gatekeeper
GATEKEEPER_STATUS=$(spctl --status 2>/dev/null | grep -o "enabled\|disabled")
if [ "$GATEKEEPER_STATUS" = "enabled" ]; then
    log_pass "Gatekeeper is enabled"
else
    log_warn "Gatekeeper is disabled"
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
