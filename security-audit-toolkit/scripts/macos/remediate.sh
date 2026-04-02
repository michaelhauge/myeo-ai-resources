#!/bin/bash
#
# Security Remediation Script for macOS
# Automatically fix common security issues
#
# Usage: ./remediate.sh [--dry-run]
#
# Options:
#   --dry-run    Show what would be changed without making changes
#
# WARNING: This script makes changes to your system.
# Review the script before running and ensure you have backups.
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

INSECURE_ENV=$(find ~/development ~/projects 2>/dev/null -name ".env*" -type f -perm 644 2>/dev/null)

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
    CURRENT_SSH_DIR_PERMS=$(stat -f %Lp ~/.ssh 2>/dev/null)
    if [ "$CURRENT_SSH_DIR_PERMS" != "700" ]; then
        run_cmd "chmod 700 ~/.ssh"
    fi

    # Fix private key permissions
    for keyfile in ~/.ssh/id_rsa ~/.ssh/id_ed25519 ~/.ssh/id_ecdsa ~/.ssh/id_dsa; do
        if [ -f "$keyfile" ]; then
            CURRENT_PERMS=$(stat -f %Lp "$keyfile" 2>/dev/null)
            if [ "$CURRENT_PERMS" != "600" ]; then
                run_cmd "chmod 600 '$keyfile'"
            fi
        fi
    done

    # Fix authorized_keys permissions
    if [ -f ~/.ssh/authorized_keys ]; then
        CURRENT_PERMS=$(stat -f %Lp ~/.ssh/authorized_keys 2>/dev/null)
        if [ "$CURRENT_PERMS" != "600" ]; then
            run_cmd "chmod 600 ~/.ssh/authorized_keys"
        fi
    fi

    echo -e "${GREEN}[OK]${NC} SSH directory and keys secured"
else
    echo -e "${GREEN}[OK]${NC} No SSH directory found"
fi

#
# FIX AWS CREDENTIALS PERMISSIONS
#
echo ""
echo -e "${BLUE}=== FIXING CLOUD CREDENTIAL PERMISSIONS ===${NC}"
echo ""

if [ -f ~/.aws/credentials ]; then
    CURRENT_PERMS=$(stat -f %Lp ~/.aws/credentials 2>/dev/null)
    if [ "$CURRENT_PERMS" != "600" ]; then
        run_cmd "chmod 600 ~/.aws/credentials"
    fi
    echo -e "${GREEN}[OK]${NC} AWS credentials secured"
fi

if [ -f ~/.aws/config ]; then
    CURRENT_PERMS=$(stat -f %Lp ~/.aws/config 2>/dev/null)
    if [ "$CURRENT_PERMS" != "600" ]; then
        run_cmd "chmod 600 ~/.aws/config"
    fi
fi

if [ -d ~/.config/gcloud ]; then
    run_cmd "chmod 700 ~/.config/gcloud"
    run_cmd "chmod 600 ~/.config/gcloud/*.json 2>/dev/null || true"
    echo -e "${GREEN}[OK]${NC} GCP credentials secured"
fi

#
# FIX COMMON CREDENTIAL DIRECTORIES
#
echo ""
echo -e "${BLUE}=== FIXING CREDENTIAL DIRECTORIES ===${NC}"
echo ""

CRED_DIRS=(
    ~/.config
    ~/.local
)

for dir in "${CRED_DIRS[@]}"; do
    if [ -d "$dir" ]; then
        CURRENT_PERMS=$(stat -f %Lp "$dir" 2>/dev/null)
        if [ "$CURRENT_PERMS" = "755" ] || [ "$CURRENT_PERMS" = "775" ]; then
            run_cmd "chmod 700 '$dir'"
        fi
    fi
done

echo -e "${GREEN}[OK]${NC} Credential directories secured"

#
# CREATE GIT PRE-COMMIT HOOK
#
echo ""
echo -e "${BLUE}=== GIT PRE-COMMIT HOOK ===${NC}"
echo ""

echo "Would you like to install a pre-commit hook for secret detection?"
echo "This will be installed in ~/development/.git-templates/"
echo ""

if [ "$DRY_RUN" = true ]; then
    echo -e "${BLUE}[DRY-RUN]${NC} Would create git pre-commit hook template"
else
    read -p "Install pre-commit hook? (y/N) " -n 1 -r
    echo ""
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        mkdir -p ~/development/.git-templates/hooks
        cat > ~/development/.git-templates/hooks/pre-commit << 'HOOK'
#!/bin/bash
# Pre-commit hook for secret detection

# Patterns to detect
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
        echo ""
        echo "Please remove the secret before committing."
        echo "If this is a false positive, use: git commit --no-verify"
        exit 1
    fi
done

exit 0
HOOK
        chmod +x ~/development/.git-templates/hooks/pre-commit
        git config --global init.templateDir ~/development/.git-templates
        echo -e "${GREEN}[OK]${NC} Pre-commit hook template installed"
        echo "     New repositories will automatically have secret detection."
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
    echo "  1. Enable firewall: System Settings > Network > Firewall"
    echo "  2. Disable unnecessary sharing: System Settings > General > Sharing"
    echo "  3. Enable FileVault: System Settings > Privacy & Security > FileVault"
    echo "  4. Rotate any exposed API keys"
fi
