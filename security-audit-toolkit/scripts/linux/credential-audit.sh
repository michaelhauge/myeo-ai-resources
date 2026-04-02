#!/bin/bash
#
# Credential Security Audit for Linux
# Find and check security of credential files
#
# Usage: ./credential-audit.sh [--deep]
#
# Options:
#   --deep    Extended search (slower, more thorough)
#

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

DEEP_SCAN=false
[ "$1" = "--deep" ] && DEEP_SCAN=true

echo "========================================"
echo "      CREDENTIAL SECURITY AUDIT"
echo "========================================"
echo "Date: $(date)"
echo "Mode: $([ "$DEEP_SCAN" = true ] && echo "Deep scan" || echo "Standard")"
echo ""

#
# .ENV FILES
#
echo -e "${BLUE}=== .ENV FILES ===${NC}"
echo ""

echo "Searching for .env files..."
ENV_FILES=$(find ~/development ~/projects ~/ -maxdepth 4 -name ".env*" -type f 2>/dev/null | head -50)

if [ -z "$ENV_FILES" ]; then
    echo "No .env files found in common locations"
else
    echo "Found .env files:"
    echo ""
    echo "$ENV_FILES" | while read f; do
        if [ -f "$f" ]; then
            PERMS=$(stat -c %a "$f" 2>/dev/null)
            if [ "$PERMS" != "600" ]; then
                echo -e "${RED}[INSECURE]${NC} $f (permissions: $PERMS)"
            else
                echo -e "${GREEN}[SECURE]${NC}   $f (permissions: $PERMS)"
            fi
        fi
    done
fi

#
# SSH KEYS
#
echo ""
echo -e "${BLUE}=== SSH KEYS ===${NC}"
echo ""

if [ -d ~/.ssh ]; then
    echo "SSH directory contents:"
    ls -la ~/.ssh/ 2>/dev/null | while read line; do
        if echo "$line" | grep -qE "id_rsa$|id_ed25519$|id_ecdsa$|id_dsa$"; then
            PERMS=$(echo "$line" | awk '{print $1}')
            if echo "$PERMS" | grep -q "r..r"; then
                echo -e "${RED}[INSECURE]${NC} $line"
            else
                echo -e "${GREEN}[SECURE]${NC}   $line"
            fi
        else
            echo "           $line"
        fi
    done
else
    echo "No ~/.ssh directory found"
fi

#
# CLOUD CREDENTIALS
#
echo ""
echo -e "${BLUE}=== CLOUD CREDENTIALS ===${NC}"
echo ""

# AWS
if [ -d ~/.aws ]; then
    echo "AWS credentials found:"
    ls -la ~/.aws/ 2>/dev/null
    if [ -f ~/.aws/credentials ]; then
        PERMS=$(stat -c %a ~/.aws/credentials 2>/dev/null)
        if [ "$PERMS" != "600" ]; then
            echo -e "${RED}[!] ~/.aws/credentials has insecure permissions ($PERMS)${NC}"
        else
            echo -e "${GREEN}[OK]${NC} ~/.aws/credentials has secure permissions"
        fi
    fi
else
    echo -e "${GREEN}[OK]${NC} No AWS credentials directory"
fi

# GCP
if [ -d ~/.config/gcloud ]; then
    echo ""
    echo "GCP credentials found:"
    ls -la ~/.config/gcloud/*.json 2>/dev/null | head -5 || echo "  No JSON credential files"
else
    echo -e "${GREEN}[OK]${NC} No GCP credentials directory"
fi

# Azure
if [ -d ~/.azure ]; then
    echo ""
    echo "Azure credentials found:"
    ls -la ~/.azure/ 2>/dev/null | head -5
else
    echo -e "${GREEN}[OK]${NC} No Azure credentials directory"
fi

# DigitalOcean
if [ -f ~/.config/doctl/config.yaml ]; then
    echo ""
    echo "DigitalOcean (doctl) config found"
    PERMS=$(stat -c %a ~/.config/doctl/config.yaml 2>/dev/null)
    if [ "$PERMS" != "600" ]; then
        echo -e "${YELLOW}[!] doctl config has permissions $PERMS${NC}"
    fi
fi

#
# DOCKER CREDENTIALS
#
echo ""
echo -e "${BLUE}=== DOCKER CREDENTIALS ===${NC}"
echo ""

if [ -f ~/.docker/config.json ]; then
    echo "Docker config found:"
    PERMS=$(stat -c %a ~/.docker/config.json 2>/dev/null)
    echo "  Permissions: $PERMS"
    if grep -q "auth" ~/.docker/config.json 2>/dev/null; then
        echo -e "${YELLOW}[!] Docker config contains authentication data${NC}"
    fi
else
    echo -e "${GREEN}[OK]${NC} No Docker config found"
fi

#
# KUBERNETES CREDENTIALS
#
echo ""
echo -e "${BLUE}=== KUBERNETES CREDENTIALS ===${NC}"
echo ""

if [ -f ~/.kube/config ]; then
    echo "Kubernetes config found:"
    PERMS=$(stat -c %a ~/.kube/config 2>/dev/null)
    if [ "$PERMS" != "600" ]; then
        echo -e "${RED}[!] ~/.kube/config has insecure permissions ($PERMS)${NC}"
    else
        echo -e "${GREEN}[OK]${NC} ~/.kube/config has secure permissions"
    fi
    CONTEXTS=$(grep -c "name:" ~/.kube/config 2>/dev/null || echo "0")
    echo "  Contains $CONTEXTS context(s)"
else
    echo -e "${GREEN}[OK]${NC} No Kubernetes config found"
fi

#
# COMMON CREDENTIAL FILES
#
echo ""
echo -e "${BLUE}=== OTHER CREDENTIAL FILES ===${NC}"
echo ""

echo "Checking common locations for credential files..."

CRED_PATTERNS="credentials|secrets|tokens|apikey|api_key|auth"

find ~/.*/ -maxdepth 2 -type f \( -name "*.json" -o -name "*.yaml" -o -name "*.yml" \) 2>/dev/null | \
    grep -iE "$CRED_PATTERNS" | head -20 | while read f; do
    PERMS=$(stat -c %a "$f" 2>/dev/null)
    if [ "$PERMS" != "600" ]; then
        echo -e "${YELLOW}[CHECK]${NC} $f (permissions: $PERMS)"
    else
        echo -e "${GREEN}[OK]${NC}    $f (permissions: $PERMS)"
    fi
done

#
# SECRETS IN SHELL HISTORY
#
echo ""
echo -e "${BLUE}=== SHELL HISTORY ===${NC}"
echo ""

echo "Checking for potential secrets in shell history..."

PATTERNS=(
    "sk-[a-zA-Z0-9]{20,}"           # OpenAI
    "sk-ant-[a-zA-Z0-9-]+"          # Anthropic
    "AKIA[A-Z0-9]{16}"              # AWS Access Key
    "ghp_[a-zA-Z0-9]{36}"           # GitHub PAT
    "gho_[a-zA-Z0-9]{36}"           # GitHub OAuth
    "glpat-[a-zA-Z0-9-]{20}"        # GitLab PAT
    "xox[baprs]-[a-zA-Z0-9-]+"      # Slack tokens
)

PATTERN_REGEX=$(IFS="|"; echo "${PATTERNS[*]}")

HISTORY_HITS=0
for histfile in ~/.bash_history ~/.zsh_history; do
    if [ -f "$histfile" ]; then
        HITS=$(grep -cE "$PATTERN_REGEX" "$histfile" 2>/dev/null || echo "0")
        if [ "$HITS" -gt 0 ]; then
            echo -e "${YELLOW}[!] Found $HITS potential secret(s) in $histfile${NC}"
            HISTORY_HITS=$((HISTORY_HITS + HITS))
        fi
    fi
done

if [ $HISTORY_HITS -eq 0 ]; then
    echo -e "${GREEN}[OK]${NC} No obvious secrets found in shell history"
fi

#
# GIT REPOSITORIES
#
if [ "$DEEP_SCAN" = true ]; then
    echo ""
    echo -e "${BLUE}=== GIT REPOSITORIES (Deep Scan) ===${NC}"
    echo ""

    echo "Checking for .env files tracked in git..."
    find ~/development ~/projects -name ".git" -type d 2>/dev/null | while read gitdir; do
        REPO=$(dirname "$gitdir")
        TRACKED_ENV=$(cd "$REPO" && git ls-files 2>/dev/null | grep -iE "^\.env" | head -5)
        if [ -n "$TRACKED_ENV" ]; then
            echo -e "${RED}[!] Tracked .env files in $REPO:${NC}"
            echo "$TRACKED_ENV" | sed 's/^/    /'
        fi
    done
fi

#
# GPG KEYS
#
echo ""
echo -e "${BLUE}=== GPG KEYS ===${NC}"
echo ""

if command -v gpg &> /dev/null; then
    GPG_KEYS=$(gpg --list-secret-keys 2>/dev/null | grep -c "sec" || echo "0")
    if [ "$GPG_KEYS" -gt 0 ]; then
        echo "Found $GPG_KEYS GPG secret key(s)"
        GNUPGHOME=${GNUPGHOME:-~/.gnupg}
        if [ -d "$GNUPGHOME" ]; then
            PERMS=$(stat -c %a "$GNUPGHOME" 2>/dev/null)
            if [ "$PERMS" != "700" ]; then
                echo -e "${YELLOW}[!] ~/.gnupg has permissions $PERMS (should be 700)${NC}"
            else
                echo -e "${GREEN}[OK]${NC} ~/.gnupg has correct permissions"
            fi
        fi
    else
        echo "No GPG secret keys found"
    fi
else
    echo "GPG not installed"
fi

#
# SUMMARY
#
echo ""
echo -e "${BLUE}=== RECOMMENDATIONS ===${NC}"
echo ""

echo "To fix insecure .env file permissions:"
echo "  chmod 600 <file>"
echo ""
echo "To fix insecure SSH key permissions:"
echo "  chmod 600 ~/.ssh/id_*"
echo "  chmod 700 ~/.ssh"
echo ""
echo "To secure cloud credentials:"
echo "  chmod 600 ~/.aws/credentials"
echo "  chmod 600 ~/.kube/config"
echo "  chmod 700 ~/.config/gcloud"
echo ""

echo "Audit complete."
