#!/bin/bash

# SMB Password Audit Tool
# Checks password strength for common patterns and weaknesses
#
# Usage:
#   ./password-audit.sh                    # Interactive mode
#   ./password-audit.sh --file passwords.txt  # Batch mode (one password per line)
#   echo "MyPassword123" | ./password-audit.sh --stdin  # Pipe mode
#
# Requirements:
#   - Bash 4.0+
#   - No external dependencies

# ANSI color codes
RED='\033[0;31m'
YELLOW='\033[0;33m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m' # No Color

# Score thresholds
EXCELLENT_SCORE=90
GOOD_SCORE=70
FAIR_SCORE=50

# Print header
print_header() {
    echo ""
    echo -e "${BOLD}${BLUE}=====================================================================${NC}"
    echo -e "${BOLD}${BLUE}$1${NC}"
    echo -e "${BOLD}${BLUE}=====================================================================${NC}"
    echo ""
}

# Print section
print_section() {
    echo ""
    echo -e "${BOLD}${CYAN}$1${NC}"
    echo ""
}

# Calculate password strength score
check_password_strength() {
    local password="$1"
    local length=${#password}
    local score=0
    local issues=()
    local strengths=()

    # Length scoring (0-40 points)
    if [ $length -ge 16 ]; then
        score=$((score + 40))
        strengths+=("Excellent length (16+ characters)")
    elif [ $length -ge 12 ]; then
        score=$((score + 30))
        strengths+=("Good length (12-15 characters)")
    elif [ $length -ge 8 ]; then
        score=$((score + 20))
        issues+=("Length should be 12+ characters (current: $length)")
    else
        score=$((score + 10))
        issues+=("Length is too short (current: $length, minimum: 8, recommended: 12+)")
    fi

    # Character variety (0-30 points)
    local has_lowercase=0
    local has_uppercase=0
    local has_numbers=0
    local has_special=0

    if [[ "$password" =~ [a-z] ]]; then
        has_lowercase=1
        score=$((score + 5))
    else
        issues+=("Missing lowercase letters")
    fi

    if [[ "$password" =~ [A-Z] ]]; then
        has_uppercase=1
        score=$((score + 10))
    else
        issues+=("Missing uppercase letters")
    fi

    if [[ "$password" =~ [0-9] ]]; then
        has_numbers=1
        score=$((score + 10))
    else
        issues+=("Missing numbers")
    fi

    if [[ "$password" =~ [^a-zA-Z0-9] ]]; then
        has_special=1
        score=$((score + 15))
        strengths+=("Contains special characters")
    else
        issues+=("Missing special characters (!@#\$%^&* etc.)")
    fi

    # Complexity bonus (0-10 points)
    local variety_count=$((has_lowercase + has_uppercase + has_numbers + has_special))
    if [ $variety_count -eq 4 ]; then
        score=$((score + 10))
        strengths+=("Good character variety (all types present)")
    elif [ $variety_count -eq 3 ]; then
        score=$((score + 5))
    fi

    # Common pattern detection (deduct points)
    # Sequential characters (abc, 123, etc.)
    if [[ "$password" =~ (abc|bcd|cde|def|efg|fgh|ghi|hij|ijk|jkl|klm|lmn|mno|nop|opq|pqr|qrs|rst|stu|tuv|uvw|vwx|wxy|xyz) ]] || \
       [[ "$password" =~ (ABC|BCD|CDE|DEF|EFG|FGH|GHI|HIJ|IJK|JKL|KLM|LMN|MNO|NOP|OPQ|PQR|QRS|RST|STU|TUV|UVW|VWX|WXY|XYZ) ]] || \
       [[ "$password" =~ (012|123|234|345|456|567|678|789) ]]; then
        score=$((score - 10))
        issues+=("Contains sequential characters (abc, 123, etc.)")
    fi

    # Repeated characters (aaa, 111, etc.)
    if [[ "$password" =~ (.)\1\1 ]]; then
        score=$((score - 10))
        issues+=("Contains repeated characters (aaa, 111, etc.)")
    fi

    # Common keyboard patterns
    if [[ "$password" =~ (qwerty|asdfgh|zxcvbn|qazwsx|QWERTY|ASDFGH|ZXCVBN) ]]; then
        score=$((score - 15))
        issues+=("Contains keyboard pattern (qwerty, asdfgh, etc.)")
    fi

    # Common date patterns (year, month/day)
    if [[ "$password" =~ (19[0-9]{2}|20[0-9]{2}) ]]; then
        score=$((score - 5))
        issues+=("Contains year (might be birth year or significant date)")
    fi

    if [[ "$password" =~ (0[1-9]|1[0-2])(0[1-9]|[12][0-9]|3[01]) ]]; then
        score=$((score - 5))
        issues+=("Contains date pattern (MMDD or similar)")
    fi

    # Common words (basic check for English common words)
    local password_lower=$(echo "$password" | tr '[:upper:]' '[:lower:]')
    local common_words=("password" "welcome" "admin" "user" "login" "letmein" "monkey" "dragon"
                       "master" "sunshine" "princess" "qwerty" "solo" "passw0rd" "abc123"
                       "password1" "password123" "12345" "123456" "1234567" "12345678"
                       "123456789" "1234567890" "admin123" "root" "toor" "pass" "test")

    for word in "${common_words[@]}"; do
        if [[ "$password_lower" == *"$word"* ]]; then
            score=$((score - 20))
            issues+=("Contains common word or pattern: '$word'")
            break
        fi
    done

    # Minimum score is 0
    if [ $score -lt 0 ]; then
        score=0
    fi

    # Maximum score is 100
    if [ $score -gt 100 ]; then
        score=100
    fi

    # Determine rating
    local rating
    local color
    if [ $score -ge $EXCELLENT_SCORE ]; then
        rating="EXCELLENT"
        color=$GREEN
    elif [ $score -ge $GOOD_SCORE ]; then
        rating="GOOD"
        color=$GREEN
    elif [ $score -ge $FAIR_SCORE ]; then
        rating="FAIR"
        color=$YELLOW
    else
        rating="WEAK"
        color=$RED
    fi

    # Print results
    echo -e "${BOLD}Password Strength Analysis${NC}"
    echo "----------------------------------------"
    echo -e "Score: ${color}${BOLD}$score/100${NC} (Rating: ${color}${BOLD}$rating${NC})"
    echo ""

    if [ ${#strengths[@]} -gt 0 ]; then
        echo -e "${GREEN}Strengths:${NC}"
        for strength in "${strengths[@]}"; do
            echo -e "  ${GREEN}✓${NC} $strength"
        done
        echo ""
    fi

    if [ ${#issues[@]} -gt 0 ]; then
        echo -e "${RED}Issues:${NC}"
        for issue in "${issues[@]}"; do
            echo -e "  ${RED}✗${NC} $issue"
        done
        echo ""
    fi

    # Recommendations
    echo "Recommendations:"
    if [ $score -ge $EXCELLENT_SCORE ]; then
        echo -e "  ${GREEN}✓${NC} This is a strong password!"
    elif [ $score -ge $GOOD_SCORE ]; then
        echo "  - Consider making it longer (16+ characters recommended)"
        echo "  - Add special characters if not present"
    elif [ $score -ge $FAIR_SCORE ]; then
        echo "  - IMPORTANT: Increase length to 12+ characters"
        echo "  - Add uppercase, numbers, and special characters"
        echo "  - Avoid common words and patterns"
    else
        echo -e "  ${RED}⚠${NC} This password is weak and should be changed immediately!"
        echo "  - Use a password manager to generate a strong password"
        echo "  - Minimum 12 characters, 16+ recommended"
        echo "  - Include uppercase, lowercase, numbers, and special characters"
        echo "  - Avoid dictionary words, names, dates, and patterns"
    fi

    echo ""

    # Return score (for batch mode)
    return $score
}

# Generate a strong password
generate_password() {
    local length=${1:-16}

    if [ $length -lt 12 ]; then
        echo -e "${YELLOW}Warning: Minimum recommended length is 12 characters. Using 12.${NC}"
        length=12
    fi

    # Use /dev/urandom to generate random password
    # Include uppercase, lowercase, numbers, and special characters
    local password=$(LC_ALL=C tr -dc 'A-Za-z0-9!@#$%^&*()_+=-' < /dev/urandom | head -c "$length")

    echo ""
    echo -e "${BOLD}Generated Password:${NC}"
    echo -e "${GREEN}$password${NC}"
    echo ""
    echo -e "${YELLOW}IMPORTANT: Save this password in your password manager immediately!${NC}"
    echo ""

    # Analyze the generated password
    check_password_strength "$password"
}

# Check password against common breach databases (basic check)
check_breached_password() {
    local password="$1"

    # List of known breached passwords (top 20 most common)
    local breached=(
        "123456" "password" "123456789" "12345678" "12345" "111111" "1234567"
        "sunshine" "qwerty" "iloveyou" "princess" "admin" "welcome" "666666"
        "abc123" "football" "123123" "monkey" "654321" "!@#$%^&*" "charlie"
        "aa123456" "donald" "password1" "qwerty123"
    )

    local password_lower=$(echo "$password" | tr '[:upper:]' '[:lower:]')

    for breached_pw in "${breached[@]}"; do
        if [ "$password_lower" == "$breached_pw" ]; then
            echo -e "${RED}${BOLD}⚠ WARNING: This password appears in breach databases!${NC}"
            echo -e "${RED}This password has been compromised and should NEVER be used.${NC}"
            echo ""
            return 1
        fi
    done

    echo -e "${GREEN}✓ This password does not appear in our basic breach database.${NC}"
    echo -e "${YELLOW}Note: For comprehensive checking, use haveibeenpwned.com${NC}"
    echo ""
    return 0
}

# Interactive mode
interactive_mode() {
    print_header "SMB PASSWORD AUDIT TOOL"

    echo "This tool analyzes password strength and provides recommendations."
    echo ""
    echo "Options:"
    echo "  1. Check password strength"
    echo "  2. Generate strong password"
    echo "  3. Exit"
    echo ""
    read -p "Select option (1-3): " option

    case $option in
        1)
            echo ""
            echo -e "${YELLOW}Note: Your password will not be saved or transmitted.${NC}"
            read -sp "Enter password to check: " password
            echo ""
            echo ""

            if [ -z "$password" ]; then
                echo -e "${RED}Error: Password cannot be empty${NC}"
                exit 1
            fi

            check_breached_password "$password"
            check_password_strength "$password"
            ;;
        2)
            echo ""
            read -p "Password length (default: 16, minimum: 12): " length
            if [ -z "$length" ]; then
                length=16
            fi
            generate_password "$length"
            ;;
        3)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo -e "${RED}Invalid option${NC}"
            exit 1
            ;;
    esac
}

# Batch mode (from file)
batch_mode() {
    local file="$1"

    if [ ! -f "$file" ]; then
        echo -e "${RED}Error: File '$file' not found${NC}"
        exit 1
    fi

    print_header "BATCH PASSWORD AUDIT"
    echo "Analyzing passwords from: $file"
    echo ""

    local total=0
    local weak=0
    local fair=0
    local good=0
    local excellent=0
    local line_num=0

    while IFS= read -r password; do
        line_num=$((line_num + 1))

        # Skip empty lines
        if [ -z "$password" ]; then
            continue
        fi

        total=$((total + 1))

        echo -e "${BOLD}Password #$line_num${NC}"
        echo "----------------------------------------"

        check_password_strength "$password" > /dev/null
        local score=$?

        if [ $score -ge $EXCELLENT_SCORE ]; then
            excellent=$((excellent + 1))
            echo -e "Score: ${GREEN}$score/100${NC} (EXCELLENT)"
        elif [ $score -ge $GOOD_SCORE ]; then
            good=$((good + 1))
            echo -e "Score: ${GREEN}$score/100${NC} (GOOD)"
        elif [ $score -ge $FAIR_SCORE ]; then
            fair=$((fair + 1))
            echo -e "Score: ${YELLOW}$score/100${NC} (FAIR)"
        else
            weak=$((weak + 1))
            echo -e "Score: ${RED}$score/100${NC} (WEAK)"
        fi

        echo ""
    done < "$file"

    # Summary
    print_section "SUMMARY"
    echo "Total passwords analyzed: $total"
    echo ""
    echo -e "${GREEN}Excellent (90-100):${NC} $excellent"
    echo -e "${GREEN}Good (70-89):${NC}      $good"
    echo -e "${YELLOW}Fair (50-69):${NC}      $fair"
    echo -e "${RED}Weak (0-49):${NC}       $weak"
    echo ""

    if [ $weak -gt 0 ]; then
        echo -e "${RED}${BOLD}⚠ $weak weak password(s) detected!${NC}"
        echo -e "${RED}These passwords should be changed immediately.${NC}"
    elif [ $fair -gt 0 ]; then
        echo -e "${YELLOW}⚠ $fair fair password(s) detected.${NC}"
        echo -e "${YELLOW}Consider strengthening these passwords.${NC}"
    else
        echo -e "${GREEN}✓ All passwords meet good or excellent standards!${NC}"
    fi
}

# Main function
main() {
    # Parse command line arguments
    if [ $# -eq 0 ]; then
        # Interactive mode
        interactive_mode
    elif [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
        # Help
        echo "SMB Password Audit Tool"
        echo ""
        echo "Usage:"
        echo "  ./password-audit.sh                         # Interactive mode"
        echo "  ./password-audit.sh --file passwords.txt    # Batch mode"
        echo "  echo 'password' | ./password-audit.sh --stdin  # Pipe mode"
        echo "  ./password-audit.sh --generate [length]     # Generate password"
        echo ""
        echo "Options:"
        echo "  -h, --help          Show this help message"
        echo "  -f, --file FILE     Check passwords from file (one per line)"
        echo "  --stdin             Read password from stdin"
        echo "  -g, --generate [N]  Generate strong password (length N, default 16)"
        echo ""
        echo "Examples:"
        echo "  ./password-audit.sh"
        echo "  ./password-audit.sh --file company-passwords.txt"
        echo "  echo 'MyPassword123' | ./password-audit.sh --stdin"
        echo "  ./password-audit.sh --generate 20"
    elif [ "$1" == "-f" ] || [ "$1" == "--file" ]; then
        # Batch mode
        if [ -z "$2" ]; then
            echo -e "${RED}Error: --file requires a filename${NC}"
            exit 1
        fi
        batch_mode "$2"
    elif [ "$1" == "--stdin" ]; then
        # Stdin mode
        read -r password
        if [ -z "$password" ]; then
            echo -e "${RED}Error: No password provided${NC}"
            exit 1
        fi
        check_breached_password "$password"
        check_password_strength "$password"
    elif [ "$1" == "-g" ] || [ "$1" == "--generate" ]; then
        # Generate mode
        length=${2:-16}
        generate_password "$length"
    else
        echo -e "${RED}Error: Unknown option '$1'${NC}"
        echo "Use --help for usage information"
        exit 1
    fi
}

# Run main function
main "$@"
