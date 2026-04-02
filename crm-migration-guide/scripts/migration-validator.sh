#!/bin/bash

#############################################
# CRM Migration Validator
# Verify migration success before canceling old CRM
#############################################

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m'

# Banner
echo ""
echo "╔════════════════════════════════════════╗"
echo "║  CRM Migration Validator               ║"
echo "║  Verify data migration success         ║"
echo "╚════════════════════════════════════════╝"
echo ""

# Get record counts from old CRM
echo -e "${BLUE}Step 1: Old CRM Record Counts${NC}"
echo ""
read -p "Number of Contacts in OLD CRM: " OLD_CONTACTS
read -p "Number of Companies in OLD CRM: " OLD_COMPANIES
read -p "Number of Deals in OLD CRM: " OLD_DEALS
read -p "Number of Activities (tasks, notes, emails) in OLD CRM: " OLD_ACTIVITIES

echo ""
echo -e "${BLUE}Step 2: New CRM Record Counts${NC}"
echo ""
echo "Go to your NEW CRM and check record counts in each module."
echo ""
read -p "Number of Contacts in NEW CRM: " NEW_CONTACTS
read -p "Number of Companies in NEW CRM: " NEW_COMPANIES
read -p "Number of Deals in NEW CRM: " NEW_DEALS
read -p "Number of Activities in NEW CRM: " NEW_ACTIVITIES

# Calculate differences
CONTACTS_DIFF=$((NEW_CONTACTS - OLD_CONTACTS))
COMPANIES_DIFF=$((NEW_COMPANIES - OLD_COMPANIES))
DEALS_DIFF=$((NEW_DEALS - OLD_DEALS))
ACTIVITIES_DIFF=$((NEW_ACTIVITIES - OLD_ACTIVITIES))

# Display results
echo ""
echo "╔════════════════════════════════════════╗"
echo "║  Validation Results                    ║"
echo "╚════════════════════════════════════════╝"
echo ""

# Function to display comparison
compare_counts() {
    local module=$1
    local old_count=$2
    local new_count=$3
    local diff=$4

    echo -e "${BLUE}$module:${NC}"
    printf "  Old CRM: %10d\n" "$old_count"
    printf "  New CRM: %10d\n" "$new_count"

    if [ $diff -eq 0 ]; then
        echo -e "  Status: ${GREEN}✓ PERFECT MATCH${NC}"
    elif [ $diff -gt 0 ] && [ $diff -le 5 ]; then
        echo -e "  Status: ${YELLOW}⚠ +$diff records (acceptable - might be test data)${NC}"
    elif [ $diff -lt 0 ] && [ $diff -ge -5 ]; then
        echo -e "  Status: ${YELLOW}⚠ $diff records (check for missing data)${NC}"
    elif [ $diff -lt -5 ]; then
        echo -e "  Status: ${RED}✗ $diff records MISSING (investigate!)${NC}"
    else
        echo -e "  Status: ${YELLOW}⚠ +$diff records (review for duplicates)${NC}"
    fi
    echo ""
}

compare_counts "Contacts" "$OLD_CONTACTS" "$NEW_CONTACTS" "$CONTACTS_DIFF"
compare_counts "Companies" "$OLD_COMPANIES" "$NEW_COMPANIES" "$COMPANIES_DIFF"
compare_counts "Deals" "$OLD_DEALS" "$NEW_DEALS" "$DEALS_DIFF"
compare_counts "Activities" "$OLD_ACTIVITIES" "$NEW_ACTIVITIES" "$ACTIVITIES_DIFF"

# Overall status
echo "╔════════════════════════════════════════╗"
echo "║  Overall Status                        ║"
echo "╚════════════════════════════════════════╝"
echo ""

# Count critical mismatches (>5 records missing)
CRITICAL_ISSUES=0
if [ $CONTACTS_DIFF -lt -5 ]; then CRITICAL_ISSUES=$((CRITICAL_ISSUES + 1)); fi
if [ $COMPANIES_DIFF -lt -5 ]; then CRITICAL_ISSUES=$((CRITICAL_ISSUES + 1)); fi
if [ $DEALS_DIFF -lt -5 ]; then CRITICAL_ISSUES=$((CRITICAL_ISSUES + 1)); fi

# Count warnings (-5 to +5 variance)
WARNING_ISSUES=0
if [ $CONTACTS_DIFF -ne 0 ] && [ $CONTACTS_DIFF -ge -5 ] && [ $CONTACTS_DIFF -le 5 ]; then
    WARNING_ISSUES=$((WARNING_ISSUES + 1))
fi
if [ $COMPANIES_DIFF -ne 0 ] && [ $COMPANIES_DIFF -ge -5 ] && [ $COMPANIES_DIFF -le 5 ]; then
    WARNING_ISSUES=$((WARNING_ISSUES + 1))
fi
if [ $DEALS_DIFF -ne 0 ] && [ $DEALS_DIFF -ge -5 ] && [ $DEALS_DIFF -le 5 ]; then
    WARNING_ISSUES=$((WARNING_ISSUES + 1))
fi

if [ $CRITICAL_ISSUES -eq 0 ] && [ $WARNING_ISSUES -eq 0 ]; then
    echo -e "${GREEN}✓ MIGRATION SUCCESSFUL${NC}"
    echo "  All record counts match perfectly."
    echo "  ✅ Safe to cancel old CRM."
elif [ $CRITICAL_ISSUES -eq 0 ] && [ $WARNING_ISSUES -gt 0 ]; then
    echo -e "${YELLOW}⚠ MIGRATION MOSTLY SUCCESSFUL${NC}"
    echo "  Minor discrepancies detected (${WARNING_ISSUES} warnings)."
    echo "  Review warnings above before canceling old CRM."
else
    echo -e "${RED}✗ MIGRATION HAS ISSUES${NC}"
    echo "  Critical data missing detected (${CRITICAL_ISSUES} critical issues)."
    echo "  ❌ DO NOT cancel old CRM yet!"
    echo "  Fix issues and re-run this validator."
fi

echo ""

# Additional checks
echo "╔════════════════════════════════════════╗"
echo "║  Additional Checks                     ║"
echo "╚════════════════════════════════════════╝"
echo ""

read -p "Are deals linked to correct contacts? (yes/no): " DEALS_LINKED
read -p "Are custom fields populated correctly? (yes/no): " CUSTOM_FIELDS
read -p "Are workflows recreated and tested? (yes/no): " WORKFLOWS
read -p "Are integrations working (email, calendar)? (yes/no): " INTEGRATIONS
read -p "Has team been trained on new CRM? (yes/no): " TRAINING

echo ""
echo "Additional Check Results:"

if [[ $DEALS_LINKED == "yes" ]]; then
    echo -e "  ${GREEN}✓${NC} Deals linked to contacts"
else
    echo -e "  ${RED}✗${NC} Deals not linked properly (fix relationships)"
fi

if [[ $CUSTOM_FIELDS == "yes" ]]; then
    echo -e "  ${GREEN}✓${NC} Custom fields populated"
else
    echo -e "  ${RED}✗${NC} Custom fields missing data"
fi

if [[ $WORKFLOWS == "yes" ]]; then
    echo -e "  ${GREEN}✓${NC} Workflows recreated"
else
    echo -e "  ${YELLOW}⚠${NC} Workflows not yet recreated"
fi

if [[ $INTEGRATIONS == "yes" ]]; then
    echo -e "  ${GREEN}✓${NC} Integrations working"
else
    echo -e "  ${YELLOW}⚠${NC} Integrations need setup"
fi

if [[ $TRAINING == "yes" ]]; then
    echo -e "  ${GREEN}✓${NC} Team trained"
else
    echo -e "  ${YELLOW}⚠${NC} Team training needed"
fi

echo ""

# Final recommendation
echo "╔════════════════════════════════════════╗"
echo "║  Recommendation                        ║"
echo "╚════════════════════════════════════════╝"
echo ""

if [ $CRITICAL_ISSUES -eq 0 ] && \
   [[ $DEALS_LINKED == "yes" ]] && \
   [[ $CUSTOM_FIELDS == "yes" ]] && \
   [[ $WORKFLOWS == "yes" ]] && \
   [[ $INTEGRATIONS == "yes" ]] && \
   [[ $TRAINING == "yes" ]]; then
    echo -e "${GREEN}✅ GO DECISION${NC}"
    echo "  Migration is complete and verified."
    echo "  You can cancel your old CRM subscription."
    echo ""
    echo "  Next steps:"
    echo "  1. Export final backup from old CRM"
    echo "  2. Cancel old CRM subscription"
    echo "  3. Keep backup for 90 days"
    echo ""
else
    echo -e "${YELLOW}⚠ WAIT DECISION${NC}"
    echo "  Migration needs more work before canceling old CRM."
    echo ""
    echo "  Remaining tasks:"
    if [ $CRITICAL_ISSUES -gt 0 ]; then
        echo "    - Fix critical data mismatches"
    fi
    if [[ $DEALS_LINKED != "yes" ]]; then
        echo "    - Fix deal-contact relationships"
    fi
    if [[ $CUSTOM_FIELDS != "yes" ]]; then
        echo "    - Populate custom fields"
    fi
    if [[ $WORKFLOWS != "yes" ]]; then
        echo "    - Recreate critical workflows"
    fi
    if [[ $INTEGRATIONS != "yes" ]]; then
        echo "    - Set up integrations"
    fi
    if [[ $TRAINING != "yes" ]]; then
        echo "    - Train team on new CRM"
    fi
    echo ""
    echo "  Re-run this validator after fixing issues."
fi

echo ""
echo "Validation complete!"
echo ""
