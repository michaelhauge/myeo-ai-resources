#!/bin/bash
#
# AI Tools Permissions Audit Script
# ----------------------------------
# Audits what AI tools can access on your system.
# Helps identify security risks and data exposure.
#
# Usage:
#   ./permissions-audit.sh
#   ./permissions-audit.sh --quick     # Skip some checks for faster results
#   ./permissions-audit.sh --verbose   # Show detailed output
#
# Output:
#   - Sensitive files AI tools can access
#   - Directory exposure analysis
#   - Risk recommendations
#
# Exit codes:
#   0 = Audit completed successfully
#   1 = Errors during audit

set -euo pipefail

# Colors for output
RED='\033[0;31m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
BOLD='\033[1m'
RESET='\033[0m'

# Flags
QUICK_MODE=false
VERBOSE=false

# Parse arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        --quick)
            QUICK_MODE=true
            shift
            ;;
        --verbose|-v)
            VERBOSE=true
            shift
            ;;
        --help|-h)
            echo "Usage: $0 [--quick] [--verbose]"
            echo ""
            echo "Options:"
            echo "  --quick     Skip intensive checks for faster results"
            echo "  --verbose   Show detailed output"
            echo "  --help      Show this help message"
            exit 0
            ;;
        *)
            echo "Unknown option: $1"
            echo "Use --help for usage information"
            exit 1
            ;;
    esac
done

# Helper functions
print_header() {
    echo -e "\n${BLUE}${BOLD}$1${RESET}"
    echo -e "${BLUE}$(printf '=%.0s' {1..70})${RESET}"
}

print_subheader() {
    echo -e "\n${BOLD}$1${RESET}"
    echo -e "$(printf '-%.0s' {1..70})"
}

print_risk() {
    local level=$1
    local message=$2
    case $level in
        CRITICAL)
            echo -e "${RED}🚨 CRITICAL: ${message}${RESET}"
            ;;
        HIGH)
            echo -e "${RED}❌ HIGH: ${message}${RESET}"
            ;;
        MEDIUM)
            echo -e "${YELLOW}⚠️  MEDIUM: ${message}${RESET}"
            ;;
        LOW)
            echo -e "${GREEN}ℹ️  LOW: ${message}${RESET}"
            ;;
        OK)
            echo -e "${GREEN}✅ ${message}${RESET}"
            ;;
    esac
}

# Initialize counters
CRITICAL_ISSUES=0
HIGH_ISSUES=0
MEDIUM_ISSUES=0

print_header "AI Tools Permissions Audit"
echo "Scanning system for data exposure to AI tools..."
echo "Date: $(date '+%Y-%m-%d %H:%M:%S')"
echo ""

# Section 1: Environment Files (.env)
print_subheader "1. Environment Files (.env)"

ENV_FILES=$(find ~ -name ".env*" -type f 2>/dev/null | head -n 50 || true)

if [ -z "$ENV_FILES" ]; then
    print_risk OK "No .env files found"
else
    echo "$ENV_FILES" | while read -r file; do
        # Check if file contains sensitive keywords
        SENSITIVE_FOUND=false

        if grep -qi "api.*key\|secret\|password\|token" "$file" 2>/dev/null; then
            SENSITIVE_FOUND=true
        fi

        if [ "$SENSITIVE_FOUND" = true ]; then
            print_risk HIGH "Credentials found: $file"
            ((HIGH_ISSUES++)) || true

            # Show working directory context
            DIR=$(dirname "$file")
            if [[ "$DIR" == *"/development/"* ]] || [[ "$DIR" == *"/projects/"* ]]; then
                echo "   ⚠️  Located in development directory - AI tools may access"
            fi
        else
            if [ "$VERBOSE" = true ]; then
                print_risk LOW "Found: $file (no obvious credentials)"
            fi
        fi
    done

    echo ""
    echo "💡 Recommendation: Keep production .env files outside development directories"
    echo "   Example: Store in ~/secure/ instead of ~/development/"
fi

# Section 2: Cloud Provider Credentials
print_subheader "2. Cloud Provider Credentials"

# AWS credentials
if [ -f ~/.aws/credentials ]; then
    print_risk CRITICAL "AWS credentials found: ~/.aws/credentials"
    ((CRITICAL_ISSUES++))

    # Count profiles
    PROFILE_COUNT=$(grep -c "^\[" ~/.aws/credentials 2>/dev/null || echo "0")
    echo "   Profiles found: $PROFILE_COUNT"

    if grep -qi "prod\|production" ~/.aws/credentials 2>/dev/null; then
        print_risk CRITICAL "   Production AWS credentials detected!"
        echo "   ⚠️  AI tools can read these credentials"
    fi
else
    print_risk OK "No AWS credentials file found"
fi

# GCP credentials
if [ -d ~/.config/gcloud ]; then
    print_risk HIGH "GCP credentials directory found: ~/.config/gcloud"
    ((HIGH_ISSUES++))

    if ls ~/.config/gcloud/*.json >/dev/null 2>&1; then
        CRED_COUNT=$(ls ~/.config/gcloud/*.json 2>/dev/null | wc -l)
        echo "   Credential files: $CRED_COUNT"
    fi
else
    print_risk OK "No GCP credentials found"
fi

# Azure credentials
if [ -d ~/.azure ]; then
    print_risk HIGH "Azure credentials directory found: ~/.azure"
    ((HIGH_ISSUES++))
else
    if [ "$VERBOSE" = true ]; then
        print_risk OK "No Azure credentials found"
    fi
fi

echo ""
echo "💡 Recommendation: Move cloud credentials to secure CI/CD, not laptops"

# Section 3: SSH Keys
print_subheader "3. SSH Keys"

if [ -d ~/.ssh ]; then
    PRIVATE_KEYS=$(find ~/.ssh -name "id_*" ! -name "*.pub" -type f 2>/dev/null || true)

    if [ -z "$PRIVATE_KEYS" ]; then
        print_risk OK "No SSH private keys found"
    else
        KEY_COUNT=$(echo "$PRIVATE_KEYS" | wc -l)
        print_risk MEDIUM "SSH private keys found: $KEY_COUNT keys"
        ((MEDIUM_ISSUES++))

        if [ "$VERBOSE" = true ]; then
            echo "$PRIVATE_KEYS" | while read -r key; do
                echo "   - $(basename "$key")"
            done
        fi

        echo ""
        echo "💡 SSH keys can be stolen by malicious AI tools"
        echo "   Consider using SSH agent with passphrase"
    fi
else
    print_risk OK "No ~/.ssh directory found"
fi

# Section 4: Git Repositories
print_subheader "4. Git Repositories with Potential Secrets"

if [ "$QUICK_MODE" = false ]; then
    echo "Searching for .git directories (this may take a moment)..."

    GIT_REPOS=$(find ~/development ~/projects ~ -maxdepth 3 -name ".git" -type d 2>/dev/null | head -n 20 || true)

    if [ -z "$GIT_REPOS" ]; then
        print_risk OK "No git repositories found in common locations"
    else
        REPO_COUNT=$(echo "$GIT_REPOS" | wc -l)
        echo "Found $REPO_COUNT git repositories"

        echo "$GIT_REPOS" | while read -r git_dir; do
            REPO_DIR=$(dirname "$git_dir")

            # Check for .env in repo
            if [ -f "$REPO_DIR/.env" ]; then
                print_risk MEDIUM "Repository has .env file: $REPO_DIR"

                # Check if .env is gitignored
                if [ -f "$REPO_DIR/.gitignore" ] && grep -q "^\.env" "$REPO_DIR/.gitignore" 2>/dev/null; then
                    echo "   ✅ .env is in .gitignore"
                else
                    print_risk HIGH "   ⚠️  .env is NOT in .gitignore (risk of commit)"
                    ((HIGH_ISSUES++))
                fi
            fi
        done
    fi
else
    echo "⏩ Skipped (use without --quick for full scan)"
fi

# Section 5: Database Dumps
print_subheader "5. Database Dumps & Sensitive Data Files"

if [ "$QUICK_MODE" = false ]; then
    echo "Searching for database dumps..."

    DB_FILES=$(find ~/Downloads ~/Desktop ~/Documents ~/development -type f \( -name "*.sql" -o -name "*.dump" -o -name "*backup*" \) 2>/dev/null | head -n 20 || true)

    if [ -z "$DB_FILES" ]; then
        print_risk OK "No database dump files found"
    else
        FILE_COUNT=$(echo "$DB_FILES" | wc -l)
        print_risk MEDIUM "Database dump files found: $FILE_COUNT files"
        ((MEDIUM_ISSUES++))

        if [ "$VERBOSE" = true ]; then
            echo "$DB_FILES" | while read -r file; do
                SIZE=$(du -h "$file" 2>/dev/null | cut -f1)
                echo "   - $(basename "$file") ($SIZE)"
            done
        fi

        echo ""
        echo "💡 Database dumps may contain customer PII"
        echo "   Store in secure location outside development directories"
    fi

    # Check for CSV files (potential customer data)
    CSV_FILES=$(find ~/Downloads ~/Desktop -type f -name "*.csv" 2>/dev/null | head -n 10 || true)

    if [ -n "$CSV_FILES" ]; then
        CSV_COUNT=$(echo "$CSV_FILES" | wc -l | tr -d ' ')
        if [ "$CSV_COUNT" -gt 0 ]; then
            print_risk LOW "CSV files found in Downloads/Desktop: $CSV_COUNT files"
            echo "   ⚠️  Review if these contain customer data"
        fi
    fi
else
    echo "⏩ Skipped (use without --quick for full scan)"
fi

# Section 6: Current Working Directory Analysis
print_subheader "6. Current Working Directory"

CURRENT_DIR=$(pwd)
echo "Current directory: $CURRENT_DIR"

# Check what AI tools can access from current directory
if [ -f "$CURRENT_DIR/.env" ]; then
    print_risk HIGH ".env file accessible from current directory"
    ((HIGH_ISSUES++))
fi

if [ -d "$CURRENT_DIR/.git" ]; then
    print_risk LOW "Git repository accessible"

    # Check for sensitive files in repo
    if ls "$CURRENT_DIR"/*.pem "$CURRENT_DIR"/*.key >/dev/null 2>&1; then
        print_risk HIGH "   Certificate/key files in repository!"
        ((HIGH_ISSUES++))
    fi
fi

# Section 7: Claude Code Configuration
print_subheader "7. Claude Code / AI Tool Configuration"

if [ -d ~/.claude ]; then
    print_risk LOW "Claude Code directory found: ~/.claude"

    # Check for skills
    if [ -d ~/.claude/skills ]; then
        SKILL_COUNT=$(find ~/.claude/skills -mindepth 1 -maxdepth 1 -type d 2>/dev/null | wc -l | tr -d ' ')
        echo "   Installed skills: $SKILL_COUNT"

        if [ "$SKILL_COUNT" -gt 10 ]; then
            print_risk MEDIUM "   Many skills installed - review each for security"
        fi
    fi

    # Check for MCP config
    if [ -f ~/.claude.json ]; then
        print_risk LOW "Claude config found: ~/.claude.json"

        if grep -q "mcpServers" ~/.claude.json 2>/dev/null; then
            MCP_COUNT=$(grep -c "\"name\":" ~/.claude.json 2>/dev/null || echo "0")
            echo "   MCP servers configured: $MCP_COUNT"
        fi
    fi
else
    if [ "$VERBOSE" = true ]; then
        print_risk OK "No Claude Code configuration found"
    fi
fi

# Section 8: Browser Extensions (if Chrome installed)
print_subheader "8. Browser Extensions"

CHROME_EXTENSIONS_DIR=""

if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    CHROME_EXTENSIONS_DIR="$HOME/Library/Application Support/Google/Chrome/Default/Extensions"
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Linux
    CHROME_EXTENSIONS_DIR="$HOME/.config/google-chrome/Default/Extensions"
fi

if [ -d "$CHROME_EXTENSIONS_DIR" ]; then
    EXT_COUNT=$(find "$CHROME_EXTENSIONS_DIR" -mindepth 1 -maxdepth 1 -type d 2>/dev/null | wc -l | tr -d ' ')
    print_risk LOW "Chrome extensions found: $EXT_COUNT extensions"

    if [ "$EXT_COUNT" -gt 20 ]; then
        print_risk MEDIUM "   Many extensions - review each for AI features and permissions"
    fi

    echo "   💡 Review extension permissions in chrome://extensions"
else
    if [ "$VERBOSE" = true ]; then
        print_risk OK "Chrome extensions directory not found"
    fi
fi

# Summary
print_header "Summary"

echo -e "Issues found:"
echo -e "${RED}🚨 Critical: $CRITICAL_ISSUES${RESET}"
echo -e "${RED}❌ High:     $HIGH_ISSUES${RESET}"
echo -e "${YELLOW}⚠️  Medium:  $MEDIUM_ISSUES${RESET}"
echo ""

TOTAL_ISSUES=$((CRITICAL_ISSUES + HIGH_ISSUES + MEDIUM_ISSUES))

if [ "$TOTAL_ISSUES" -eq 0 ]; then
    print_risk OK "No major security issues found!"
    echo ""
    echo "Your system has a relatively safe configuration for AI tool use."
    echo "Continue following best practices:"
    echo "  • Keep production credentials off laptops"
    echo "  • Review AI tools before installation"
    echo "  • Monitor for unusual activity"
elif [ "$CRITICAL_ISSUES" -gt 0 ]; then
    echo -e "${RED}${BOLD}⚠️  IMMEDIATE ACTION REQUIRED${RESET}"
    echo ""
    echo "Critical issues detected. Recommendations:"
    echo "  1. Move production credentials to secure CI/CD (not laptop)"
    echo "  2. Separate dev and prod API keys"
    echo "  3. Review all AI tools installed on this system"
    echo "  4. Consider using separate user account for AI experiments"
elif [ "$HIGH_ISSUES" -gt 2 ]; then
    echo -e "${YELLOW}${BOLD}⚠️  ACTION RECOMMENDED${RESET}"
    echo ""
    echo "Multiple high-risk issues found. Recommendations:"
    echo "  1. Move sensitive files outside development directories"
    echo "  2. Review .env files for production credentials"
    echo "  3. Audit cloud provider credentials"
    echo "  4. See Data Protection Guide for mitigation steps"
else
    echo -e "${YELLOW}${BOLD}⚠️  MINOR ISSUES FOUND${RESET}"
    echo ""
    echo "Some risks detected. Recommendations:"
    echo "  1. Review findings above"
    echo "  2. Isolate sensitive data from AI tool access"
    echo "  3. Follow best practices in Data Protection Guide"
fi

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "📚 For detailed guidance, see:"
echo "   • Data Protection Guide: ../guides/06-data-protection.md"
echo "   • Assessment Guide: ../guides/01-assessment.md"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "Audit completed: $(date '+%Y-%m-%d %H:%M:%S')"

# Exit successfully
exit 0
