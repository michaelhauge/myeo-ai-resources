#!/bin/bash
#
# Security Remediation Script for Linux
# Automatically fix common security issues
#
# Usage: ./remediate.sh [--dry-run]
#
# Options:
#   --dry-run    Show what would be changed without making changes
#

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

DRY_RUN=false
[ "$1" = "--dry-run" ] && DRY_RUN=true

echo "========================================"
echo "      SECURITY REMEDIATION"
echo "========================================"
echo "Date: $(date)"
echo "Mode: $([ "$DRY_RUN" = true ] && echo "DRY RUN (no changes)" || echo "LIVE")"
echo ""

if [ "$DRY_RUN" = false ]; then
    echo -e "${YELLOW}WARNING: This script will make changes to your system.${NC}"
    echo "Press Ctrl+C within 5 seconds to cancel..."
    sleep 5
    echo ""
fi

run_cmd() {
    if [ "$DRY_RUN" = true ]; then
        echo -e "${BLUE}[DRY-RUN]${NC} Would run: $*"
    else
        echo -e "${GREEN}[RUNNING]${NC} $*"
        eval "$@"
    fi
}

#
# FIX .ENV FILE PERMISSIONS
#
echo -e "${BLUE}=== FIXING .ENV FILE PERMISSIONS ===${NC}"
echo ""

INSECURE_ENV=$(find ~/development ~/projects ~/ -maxdepth 4 -name ".env*" -type f -perm /044 2>/dev/null)

if [ -z "$INSECURE_ENV" ]; then
    echo -e "${GREEN}[OK]${NC} All .env files already have secure permissions"
else
    echo "Found insecure .env files:"
    echo "$INSECURE_ENV" | while read f; do
        echo "  - $f"
        run_cmd "chmod 600 '$f'"
    done
fi

#
# FIX SSH KEY PERMISSIONS
#
echo ""
echo -e "${BLUE}=== FIXING SSH KEY PERMISSIONS ===${NC}"
echo ""

if [ -d ~/.ssh ]; then
    # Fix directory permissions
    CURRENT_SSH_DIR_PERMS=$(stat -c %a ~/.ssh 2>/dev/null)
    if [ "$CURRENT_SSH_DIR_PERMS" != "700" ]; then
        run_cmd "chmod 700 ~/.ssh"
    fi

    # Fix private key permissions
    for keyfile in ~/.ssh/id_rsa ~/.ssh/id_ed25519 ~/.ssh/id_ecdsa ~/.ssh/id_dsa; do
        if [ -f "$keyfile" ]; then
            CURRENT_PERMS=$(stat -c %a "$keyfile" 2>/dev/null)
            if [ "$CURRENT_PERMS" != "600" ]; then
                run_cmd "chmod 600 '$keyfile'"
            fi
        fi
    done

    # Fix authorized_keys permissions
    if [ -f ~/.ssh/authorized_keys ]; then
        CURRENT_PERMS=$(stat -c %a ~/.ssh/authorized_keys 2>/dev/null)
        if [ "$CURRENT_PERMS" != "600" ]; then
            run_cmd "chmod 600 ~/.ssh/authorized_keys"
        fi
    fi

    # Fix known_hosts permissions
    if [ -f ~/.ssh/known_hosts ]; then
        CURRENT_PERMS=$(stat -c %a ~/.ssh/known_hosts 2>/dev/null)
        if [ "$CURRENT_PERMS" != "644" ] && [ "$CURRENT_PERMS" != "600" ]; then
            run_cmd "chmod 644 ~/.ssh/known_hosts"
        fi
    fi

    echo -e "${GREEN}[OK]${NC} SSH directory and keys secured"
else
    echo -e "${GREEN}[OK]${NC} No SSH directory found"
fi

#
# FIX CLOUD CREDENTIALS PERMISSIONS
#
echo ""
echo -e "${BLUE}=== FIXING CLOUD CREDENTIAL PERMISSIONS ===${NC}"
echo ""

# AWS
if [ -f ~/.aws/credentials ]; then
    CURRENT_PERMS=$(stat -c %a ~/.aws/credentials 2>/dev/null)
    if [ "$CURRENT_PERMS" != "600" ]; then
        run_cmd "chmod 600 ~/.aws/credentials"
    fi
    echo -e "${GREEN}[OK]${NC} AWS credentials secured"
fi

if [ -f ~/.aws/config ]; then
    CURRENT_PERMS=$(stat -c %a ~/.aws/config 2>/dev/null)
    if [ "$CURRENT_PERMS" != "600" ]; then
        run_cmd "chmod 600 ~/.aws/config"
    fi
fi

# GCP
if [ -d ~/.config/gcloud ]; then
    run_cmd "chmod 700 ~/.config/gcloud"
    if ls ~/.config/gcloud/*.json 1> /dev/null 2>&1; then
        run_cmd "chmod 600 ~/.config/gcloud/*.json"
    fi
    echo -e "${GREEN}[OK]${NC} GCP credentials secured"
fi

# Kubernetes
if [ -f ~/.kube/config ]; then
    CURRENT_PERMS=$(stat -c %a ~/.kube/config 2>/dev/null)
    if [ "$CURRENT_PERMS" != "600" ]; then
        run_cmd "chmod 600 ~/.kube/config"
    fi
    echo -e "${GREEN}[OK]${NC} Kubernetes config secured"
fi

# Docker
if [ -f ~/.docker/config.json ]; then
    CURRENT_PERMS=$(stat -c %a ~/.docker/config.json 2>/dev/null)
    if [ "$CURRENT_PERMS" != "600" ]; then
        run_cmd "chmod 600 ~/.docker/config.json"
    fi
    echo -e "${GREEN}[OK]${NC} Docker config secured"
fi

#
# FIX GNUPG PERMISSIONS
#
echo ""
echo -e "${BLUE}=== FIXING GPG PERMISSIONS ===${NC}"
echo ""

GNUPGHOME=${GNUPGHOME:-~/.gnupg}
if [ -d "$GNUPGHOME" ]; then
    CURRENT_PERMS=$(stat -c %a "$GNUPGHOME" 2>/dev/null)
    if [ "$CURRENT_PERMS" != "700" ]; then
        run_cmd "chmod 700 '$GNUPGHOME'"
    fi
    # Fix files inside
    run_cmd "find '$GNUPGHOME' -type f -exec chmod 600 {} \; 2>/dev/null || true"
    run_cmd "find '$GNUPGHOME' -type d -exec chmod 700 {} \; 2>/dev/null || true"
    echo -e "${GREEN}[OK]${NC} GPG directory secured"
fi

#
# ENABLE FIREWALL (if available)
#
echo ""
echo -e "${BLUE}=== FIREWALL ===${NC}"
echo ""

if command -v ufw &> /dev/null; then
    UFW_STATUS=$(sudo ufw status 2>/dev/null | head -1)
    if ! echo "$UFW_STATUS" | grep -q "active"; then
        echo "UFW firewall is not active."
        if [ "$DRY_RUN" = true ]; then
            echo -e "${BLUE}[DRY-RUN]${NC} Would enable UFW with default rules"
        else
            read -p "Enable UFW firewall with default rules? (y/N) " -n 1 -r
            echo ""
            if [[ $REPLY =~ ^[Yy]$ ]]; then
                sudo ufw default deny incoming
                sudo ufw default allow outgoing
                sudo ufw allow ssh
                sudo ufw --force enable
                echo -e "${GREEN}[OK]${NC} UFW enabled with SSH allowed"
            fi
        fi
    else
        echo -e "${GREEN}[OK]${NC} UFW is already active"
    fi
elif command -v firewall-cmd &> /dev/null; then
    if ! systemctl is-active --quiet firewalld; then
        echo "firewalld is not active."
        if [ "$DRY_RUN" = true ]; then
            echo -e "${BLUE}[DRY-RUN]${NC} Would enable firewalld"
        else
            read -p "Enable firewalld? (y/N) " -n 1 -r
            echo ""
            if [[ $REPLY =~ ^[Yy]$ ]]; then
                sudo systemctl enable --now firewalld
                echo -e "${GREEN}[OK]${NC} firewalld enabled"
            fi
        fi
    else
        echo -e "${GREEN}[OK]${NC} firewalld is already active"
    fi
else
    echo -e "${YELLOW}[!]${NC} No supported firewall found (ufw or firewalld)"
fi

#
# HARDEN SSH CONFIG
#
echo ""
echo -e "${BLUE}=== SSH HARDENING ===${NC}"
echo ""

if [ -f /etc/ssh/sshd_config ]; then
    ROOT_LOGIN=$(grep -E "^PermitRootLogin" /etc/ssh/sshd_config 2>/dev/null | awk '{print $2}')
    if [ "$ROOT_LOGIN" = "yes" ]; then
        echo -e "${YELLOW}[!]${NC} SSH root login is enabled"
        if [ "$DRY_RUN" = true ]; then
            echo -e "${BLUE}[DRY-RUN]${NC} Would disable root login in sshd_config"
        else
            read -p "Disable SSH root login? (y/N) " -n 1 -r
            echo ""
            if [[ $REPLY =~ ^[Yy]$ ]]; then
                sudo sed -i 's/^PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config
                sudo systemctl reload sshd 2>/dev/null || sudo service ssh reload 2>/dev/null
                echo -e "${GREEN}[OK]${NC} SSH root login disabled"
            fi
        fi
    else
        echo -e "${GREEN}[OK]${NC} SSH root login is already disabled or set to prohibit-password"
    fi
else
    echo "SSH server config not found"
fi

#
# INSTALL fail2ban
#
echo ""
echo -e "${BLUE}=== FAIL2BAN ===${NC}"
echo ""

if ! command -v fail2ban-client &> /dev/null; then
    echo "fail2ban is not installed"
    if [ "$DRY_RUN" = true ]; then
        echo -e "${BLUE}[DRY-RUN]${NC} Would suggest installing fail2ban"
    else
        echo "Consider installing fail2ban for SSH brute-force protection:"
        echo "  Ubuntu/Debian: sudo apt install fail2ban"
        echo "  CentOS/RHEL:   sudo yum install fail2ban"
        echo "  Fedora:        sudo dnf install fail2ban"
    fi
elif ! systemctl is-active --quiet fail2ban 2>/dev/null; then
    echo "fail2ban is installed but not running"
    if [ "$DRY_RUN" = false ]; then
        read -p "Enable fail2ban? (y/N) " -n 1 -r
        echo ""
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            sudo systemctl enable --now fail2ban
            echo -e "${GREEN}[OK]${NC} fail2ban enabled"
        fi
    fi
else
    echo -e "${GREEN}[OK]${NC} fail2ban is active"
fi

#
# CREATE GIT PRE-COMMIT HOOK
#
echo ""
echo -e "${BLUE}=== GIT PRE-COMMIT HOOK ===${NC}"
echo ""

if [ "$DRY_RUN" = true ]; then
    echo -e "${BLUE}[DRY-RUN]${NC} Would create git pre-commit hook template"
else
    read -p "Install git pre-commit hook for secret detection? (y/N) " -n 1 -r
    echo ""
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        mkdir -p ~/.git-templates/hooks
        cat > ~/.git-templates/hooks/pre-commit << 'HOOK'
#!/bin/bash
# Pre-commit hook for secret detection

PATTERNS=(
    'sk-[a-zA-Z0-9]{20,}'
    'AKIA[A-Z0-9]{16}'
    'ghp_[a-zA-Z0-9]{36}'
    'password\s*=\s*["\x27][^"\x27]+'
)

for pattern in "${PATTERNS[@]}"; do
    if git diff --cached | grep -qE "$pattern"; then
        echo "ERROR: Potential secret detected in staged changes!"
        echo "Pattern matched: $pattern"
        exit 1
    fi
done
exit 0
HOOK
        chmod +x ~/.git-templates/hooks/pre-commit
        git config --global init.templateDir ~/.git-templates
        echo -e "${GREEN}[OK]${NC} Pre-commit hook template installed"
    fi
fi

#
# SUMMARY
#
echo ""
echo -e "${BLUE}=== REMEDIATION COMPLETE ===${NC}"
echo ""

if [ "$DRY_RUN" = true ]; then
    echo "This was a dry run. No changes were made."
    echo "Run without --dry-run to apply changes."
else
    echo -e "${GREEN}Remediation complete.${NC}"
    echo ""
    echo "Manual steps you may still need to take:"
    echo "  1. Review /etc/ssh/sshd_config for additional hardening"
    echo "  2. Set up automatic security updates"
    echo "  3. Configure disk encryption if not already enabled"
    echo "  4. Rotate any exposed API keys"
fi
