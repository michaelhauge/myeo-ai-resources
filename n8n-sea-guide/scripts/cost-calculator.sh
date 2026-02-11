#!/bin/bash

#############################################
# n8n vs Zapier Cost Calculator
# Compare costs for your workflow scenarios
#############################################

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
RED='\033[0;31m'
NC='\033[0m'

# Banner
echo ""
echo "╔════════════════════════════════════════╗"
echo "║  n8n vs Zapier Cost Calculator         ║"
echo "║  Southeast Asia Edition                ║"
echo "╚════════════════════════════════════════╝"
echo ""

# Workflow details
echo -e "${BLUE}Step 1: Describe your workflow${NC}"
echo ""
read -p "Number of workflows you plan to run: " NUM_WORKFLOWS
read -p "Average steps per workflow (e.g., 5, 10, 15): " STEPS_PER_WORKFLOW
read -p "Executions per month (how many times workflows run): " EXECUTIONS_PER_MONTH

# Calculate Zapier tasks
ZAPIER_TASKS=$((STEPS_PER_WORKFLOW * EXECUTIONS_PER_MONTH))

# Hosting choice for n8n
echo ""
echo -e "${BLUE}Step 2: Choose n8n hosting${NC}"
echo ""
echo "  1) Local Mac (free)"
echo "  2) Oracle Cloud Free (free)"
echo "  3) Contabo VPS (~\$5.50/month)"
echo "  4) DigitalOcean (\$24/month)"
echo "  5) n8n Cloud Starter (€24/month)"
echo ""
read -p "Enter choice [1-5]: " HOSTING_CHOICE

case $HOSTING_CHOICE in
    1) HOSTING_NAME="Local Mac"; HOSTING_COST=0 ;;
    2) HOSTING_NAME="Oracle Cloud Free"; HOSTING_COST=0 ;;
    3) HOSTING_NAME="Contabo VPS"; HOSTING_COST=5.50 ;;
    4) HOSTING_NAME="DigitalOcean"; HOSTING_COST=24 ;;
    5) HOSTING_NAME="n8n Cloud Starter"; HOSTING_COST=26 ;;
    *) echo "Invalid choice"; exit 1 ;;
esac

# Determine Zapier plan
if [ "$ZAPIER_TASKS" -le 100 ]; then
    ZAPIER_PLAN="Free"
    ZAPIER_COST=0
elif [ "$ZAPIER_TASKS" -le 750 ]; then
    ZAPIER_PLAN="Starter"
    ZAPIER_COST=30
elif [ "$ZAPIER_TASKS" -le 2000 ]; then
    ZAPIER_PLAN="Professional"
    ZAPIER_COST=75
elif [ "$ZAPIER_TASKS" -le 50000 ]; then
    ZAPIER_PLAN="Team"
    ZAPIER_COST=120
else
    ZAPIER_PLAN="Enterprise"
    ZAPIER_COST=1999
fi

# Determine n8n Cloud plan (if needed)
N8N_CLOUD_PLAN="N/A"
if [ "$HOSTING_CHOICE" -eq 5 ]; then
    if [ "$EXECUTIONS_PER_MONTH" -le 2500 ]; then
        N8N_CLOUD_PLAN="Starter (€24)"
    elif [ "$EXECUTIONS_PER_MONTH" -le 10000 ]; then
        N8N_CLOUD_PLAN="Pro (€60)"
        HOSTING_COST=65
    else
        N8N_CLOUD_PLAN="Business (€800)"
        HOSTING_COST=870
    fi
fi

# Calculate costs
N8N_MONTHLY=$HOSTING_COST
ZAPIER_MONTHLY=$ZAPIER_COST

SAVINGS_MONTHLY=$(echo "$ZAPIER_MONTHLY - $N8N_MONTHLY" | bc)
SAVINGS_ANNUAL=$(echo "$SAVINGS_MONTHLY * 12" | bc)

if [ "$ZAPIER_MONTHLY" -gt 0 ]; then
    SAVINGS_PCT=$(echo "scale=0; ($SAVINGS_MONTHLY / $ZAPIER_MONTHLY) * 100" | bc)
else
    SAVINGS_PCT=0
fi

# Display results
echo ""
echo "╔════════════════════════════════════════╗"
echo "║  Cost Comparison                       ║"
echo "╚════════════════════════════════════════╝"
echo ""

echo -e "${CYAN}Your Workflow:${NC}"
echo "  Workflows: $NUM_WORKFLOWS"
echo "  Steps per workflow: $STEPS_PER_WORKFLOW"
echo "  Executions per month: $EXECUTIONS_PER_MONTH"
echo "  Zapier tasks equivalent: $ZAPIER_TASKS"
echo ""

printf "%-30s %s\n" "Solution" "Monthly Cost"
echo "──────────────────────────────────────────"
printf "%-30s \$%.2f\n" "Zapier ($ZAPIER_PLAN)" "$ZAPIER_MONTHLY"
printf "%-30s \$%.2f\n" "n8n ($HOSTING_NAME)" "$N8N_MONTHLY"
if [ "$HOSTING_CHOICE" -eq 5 ]; then
    printf "%-30s %s\n" "n8n Cloud Plan" "$N8N_CLOUD_PLAN"
fi
echo "──────────────────────────────────────────"
printf "%-30s \$%.2f/month\n" "MONTHLY SAVINGS" "$SAVINGS_MONTHLY"
printf "%-30s \$%.2f/year\n" "ANNUAL SAVINGS" "$SAVINGS_ANNUAL"
if [ "$ZAPIER_MONTHLY" -gt 0 ]; then
    printf "%-30s %d%%\n" "SAVINGS PERCENTAGE" "$SAVINGS_PCT"
fi
echo ""

# 3-year comparison
echo "╔════════════════════════════════════════╗"
echo "║  3-Year Total Cost of Ownership        ║"
echo "╚════════════════════════════════════════╝"
echo ""

ZAPIER_3YEAR=$(echo "$ZAPIER_MONTHLY * 36" | bc)
N8N_3YEAR=$(echo "$N8N_MONTHLY * 36" | bc)
SAVINGS_3YEAR=$(echo "$ZAPIER_3YEAR - $N8N_3YEAR" | bc)

printf "%-30s \$%.2f\n" "Zapier (3 years)" "$ZAPIER_3YEAR"
printf "%-30s \$%.2f\n" "n8n (3 years)" "$N8N_3YEAR"
echo "──────────────────────────────────────────"
printf "%-30s \$%.2f\n" "3-YEAR SAVINGS" "$SAVINGS_3YEAR"
echo ""

# ROI Analysis
echo "╔════════════════════════════════════════╗"
echo "║  Return on Investment (ROI)            ║"
echo "╚════════════════════════════════════════╝"
echo ""
echo "Time saved by automation:"
echo "  Estimated: 15-20 hours per month"
echo ""
read -p "Your hourly rate (USD): \$" HOURLY_RATE

if [[ $HOURLY_RATE =~ ^[0-9]+$ ]] && [ $HOURLY_RATE -gt 0 ]; then
    HOURS_SAVED=15
    VALUE_SAVED=$(echo "$HOURLY_RATE * $HOURS_SAVED" | bc)

    # n8n ROI
    N8N_NET_VALUE=$(echo "$VALUE_SAVED - $N8N_MONTHLY" | bc)
    if [ "$(echo "$N8N_MONTHLY > 0" | bc)" -eq 1 ]; then
        N8N_ROI=$(echo "scale=0; ($N8N_NET_VALUE / $N8N_MONTHLY) * 100" | bc)
    else
        N8N_ROI=999999
    fi

    # Zapier ROI
    if [ "$(echo "$ZAPIER_MONTHLY > 0" | bc)" -eq 1 ]; then
        ZAPIER_NET_VALUE=$(echo "$VALUE_SAVED - $ZAPIER_MONTHLY" | bc)
        ZAPIER_ROI=$(echo "scale=0; ($ZAPIER_NET_VALUE / $ZAPIER_MONTHLY) * 100" | bc)
    else
        ZAPIER_ROI=0
    fi

    echo ""
    printf "Monthly value of time saved:   \$%.2f\n" "$VALUE_SAVED"
    echo ""
    printf "%-30s \$%.2f/month (%d%% ROI)\n" "n8n Net Value" "$N8N_NET_VALUE" "$N8N_ROI"
    if [ "$(echo "$ZAPIER_MONTHLY > 0" | bc)" -eq 1 ]; then
        printf "%-30s \$%.2f/month (%d%% ROI)\n" "Zapier Net Value" "$ZAPIER_NET_VALUE" "$ZAPIER_ROI"
    fi
    echo ""

    if [ "$(echo "$N8N_NET_VALUE > 0" | bc)" -eq 1 ]; then
        echo -e "${GREEN}✓ Strong ROI${NC} - Automation pays for itself!"
    else
        echo -e "${YELLOW}⚠ Marginal ROI${NC} - Review your automation strategy"
    fi
fi

# Recommendations
echo ""
echo "╔════════════════════════════════════════╗"
echo "║  Recommendations                       ║"
echo "╚════════════════════════════════════════╝"
echo ""

if [ "$(echo "$SAVINGS_MONTHLY > 0" | bc)" -eq 1 ]; then
    echo -e "${GREEN}💡 Recommendation:${NC} Switch to n8n and save \$$(printf '%.0f' $SAVINGS_ANNUAL)/year"
fi

if [ "$STEPS_PER_WORKFLOW" -gt 10 ]; then
    echo -e "${BLUE}💡 Tip:${NC} Complex workflows (${STEPS_PER_WORKFLOW} steps) benefit most from n8n's per-execution pricing"
fi

if [ "$HOSTING_CHOICE" -ge 3 ] && [ "$HOSTING_CHOICE" -le 4 ]; then
    echo -e "${BLUE}💡 Tip:${NC} Consider Oracle Cloud Free for \$0 hosting"
fi

# Save results
echo ""
read -p "Save this comparison for reference? [y/N]: " SAVE_RESULTS
if [[ $SAVE_RESULTS =~ ^[Yy]$ ]]; then
    FILENAME=~/n8n-cost-comparison-$(date +%Y%m%d).txt
    cat > "$FILENAME" <<EOF
n8n vs Zapier Cost Comparison
Generated: $(date)

Workflow Details:
  Workflows: $NUM_WORKFLOWS
  Steps per workflow: $STEPS_PER_WORKFLOW
  Executions per month: $EXECUTIONS_PER_MONTH
  Zapier tasks: $ZAPIER_TASKS

Cost Comparison:
  Zapier: \$$ZAPIER_MONTHLY/month ($ZAPIER_PLAN plan)
  n8n: \$$N8N_MONTHLY/month ($HOSTING_NAME)

Savings:
  Monthly: \$$SAVINGS_MONTHLY
  Annual: \$$SAVINGS_ANNUAL
  3-Year: \$$SAVINGS_3YEAR
  Percentage: $SAVINGS_PCT%

$(if [[ $HOURLY_RATE =~ ^[0-9]+$ ]]; then
    echo "ROI Analysis:"
    echo "  Hourly rate: \$$HOURLY_RATE"
    echo "  Monthly value: \$$VALUE_SAVED"
    echo "  n8n Net Value: \$$N8N_NET_VALUE ($N8N_ROI% ROI)"
fi)
EOF
    echo -e "${GREEN}✓${NC} Saved to: $FILENAME"
fi

echo ""
echo -e "${GREEN}Done!${NC} Use this data to make your decision."
echo ""
