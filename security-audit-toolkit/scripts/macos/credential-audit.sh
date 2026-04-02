#!/bin/bash
#
# Credential Security Audit for macOS
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
ENV_FILES=$(find ~/development ~/projects ~/*.* 2>/dev/null -name ".env*" -type f 2>/dev/null | head -50)

if [ -z "$ENV_FILES" ]; then
    echo "No .env files found in common locations"
else
    echo "Found .env files:"
    echo ""
    echo "$ENV_FILES" | while read f; do
        if [ -f "$f" ]; then
            PERMS=$(stat -f %Lp "$f" 2>/dev/null)
            if [ "$PERMS" = "644" ] || [ "$PERMS" = "664" ]; then
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
        PERMS=$(stat -f %Lp ~/.aws/credentials 2>/dev/null)
        if [ "$PERMS" != "600" ]; then
            echo -e "${RED}[!] ~/.aws/credentials has insecure permissions ($PERMS)${NC}"
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

#
# COMMON CREDENTIAL FILES
#
echo ""
echo -e "${BLUE}=== OTHER CREDENTIAL FILES ===${NC}"
echo ""

echo "Checking common locations for credential files..."

# Check for files with sensitive names
CRED_PATTERNS="credentials|secrets|tokens|apikey|api_key|auth"

find ~/.*/ -maxdepth 2 -type f \( -name "*.json" -o -name "*.yaml" -o -name "*.yml" \) 2>/dev/null | \
    grep -iE "$CRED_PATTERNS" | head -20 | while read f; do
    PERMS=$(stat -f %Lp "$f" 2>/dev/null)
    if [ "$PERMS" = "644" ] || [ "$PERMS" = "664" ]; then
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

# Common API key patterns
PATTERNS=(
    "sk-[a-zA-Z0-9]{20,}"           # OpenAI
    "sk-ant-[a-zA-Z0-9-]+"          # Anthropic
    "AKIA[A-Z0-9]{16}"              # AWS Access Key
    "ghp_[a-zA-Z0-9]{36}"           # GitHub PAT
    "gho_[a-zA-Z0-9]{36}"           # GitHub OAuth
    "glpat-[a-zA-Z0-9-]{20}"        # GitLab PAT
    "xox[baprs]-[a-zA-Z0-9-]+"      # Slack tokens
    "ntn_[a-zA-Z0-9]+"              # Notion
    "re_[a-zA-Z0-9]+"               # Resend
)

PATTERN_REGEX=$(IFS="|"; echo "${PATTERNS[*]}")

HISTORY_HITS=0
for histfile in ~/.zsh_history ~/.bash_history; do
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
    find ~/development -name ".git" -type d 2>/dev/null | while read gitdir; do
        REPO=$(dirname "$gitdir")
        TRACKED_ENV=$(cd "$REPO" && git ls-files 2>/dev/null | grep -iE "^\.env" | head -5)
        if [ -n "$TRACKED_ENV" ]; then
            echo -e "${RED}[!] Tracked .env files in $REPO:${NC}"
            echo "$TRACKED_ENV" | sed 's/^/    /'
        fi
    done
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
echo "To clear secrets from shell history:"
echo "  # Edit history file manually, or:"
echo "  history -c  # Clear current session"
echo ""

echo "Audit complete."
