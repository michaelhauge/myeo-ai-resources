# Template: Metrics Dashboards — 20 Core Metrics Every Founder Must Track

**Purpose**: This template provides the 20 essential metrics for scaling from $1M to $10M ARR, with formulas, targets by stage, and tracking instructions.

**How to use**:
1. Set up weekly metrics dashboard (Google Sheets, Notion, or Metabase)
2. Calculate each metric every week (Friday recommended)
3. Review in Monday metrics meeting (15-30 minutes)
4. Track trends (4-week moving average)
5. Set alerts (when metrics fall below targets)

---

## Revenue Metrics

### 1. MRR (Monthly Recurring Revenue)

**What it measures**: Predictable monthly revenue from subscriptions

**Formula**:
```
MRR = Sum of all monthly subscription revenue
```

**Example**:
- 50 customers × $100/month = $5,000 MRR
- 20 customers × $500/month = $10,000 MRR
- Total MRR = $15,000

**Targets by stage**:
- $1M ARR ($83K MRR): Growing 20-30% MoM
- $3M ARR ($250K MRR): Growing 10-15% MoM
- $5M ARR ($417K MRR): Growing 7-10% MoM
- $10M ARR ($833K MRR): Growing 5-7% MoM

**How to track**: Export from Stripe Dashboard → Revenue tab → MRR chart

---

### 2. ARR (Annual Recurring Revenue)

**What it measures**: Annual run-rate of subscription revenue

**Formula**:
```
ARR = MRR × 12
```

**Example**:
- MRR = $250K
- ARR = $250K × 12 = $3M

**Targets by stage**:
- $1M ARR: Reached within 18-24 months of founding
- $3M ARR: Reached within 12-18 months of hitting $1M
- $5M ARR: Reached within 12-18 months of hitting $3M
- $10M ARR: Reached within 18-24 months of hitting $5M

**How to track**: MRR × 12 (calculate weekly)

---

### 3. New MRR

**What it measures**: Revenue from new customers this month

**Formula**:
```
New MRR = Sum of MRR from customers who signed up this month
```

**Example**:
- 10 new customers × $100/month = $1,000 new MRR

**Targets by stage**:
- $1M ARR: $10K-$20K new MRR/month (15-25% of existing MRR)
- $3M ARR: $25K-$40K new MRR/month (10-15% of existing MRR)
- $5M ARR: $35K-$60K new MRR/month (8-12% of existing MRR)
- $10M ARR: $50K-$100K new MRR/month (6-10% of existing MRR)

**How to track**: Filter Stripe customers by `created_at` this month → sum MRR

---

### 4. Expansion MRR

**What it measures**: Additional revenue from existing customers (upsells, add-ons)

**Formula**:
```
Expansion MRR = Sum of MRR increases from existing customers this month
```

**Example**:
- Customer A upgraded from $100/month → $200/month = $100 expansion
- Customer B added seats: $500/month → $700/month = $200 expansion
- Total expansion MRR = $300

**Targets by stage**:
- $1M ARR: $1K-$3K expansion MRR/month (5-10% of new MRR)
- $3M ARR: $5K-$10K expansion MRR/month (15-25% of new MRR)
- $5M ARR: $10K-$20K expansion MRR/month (25-35% of new MRR)
- $10M ARR: $20K-$40K expansion MRR/month (35-50% of new MRR)

**How to track**: Stripe webhook `customer.subscription.updated` → calculate MRR delta

---

### 5. Churned MRR

**What it measures**: Lost revenue from canceled subscriptions this month

**Formula**:
```
Churned MRR = Sum of MRR from customers who canceled this month
```

**Example**:
- 5 customers canceled × $100/month = $500 churned MRR

**Targets by stage**:
- $1M ARR: <$8K churned MRR/month (<10% of existing MRR)
- $3M ARR: <$12.5K churned MRR/month (<5% of existing MRR)
- $5M ARR: <$12.5K churned MRR/month (<3% of existing MRR)
- $10M ARR: <$21K churned MRR/month (<2.5% of existing MRR)

**How to track**: Filter Stripe customers by `canceled_at` this month → sum MRR

---

### 6. Net New MRR

**What it measures**: Net revenue change after new, expansion, and churn

**Formula**:
```
Net New MRR = New MRR + Expansion MRR - Churned MRR
```

**Example**:
- New MRR: $10,000
- Expansion MRR: $3,000
- Churned MRR: $2,000
- Net New MRR: $10,000 + $3,000 - $2,000 = $11,000

**Targets by stage**:
- $1M ARR: $15K-$25K net new MRR/month (15-30% growth)
- $3M ARR: $25K-$35K net new MRR/month (10-15% growth)
- $5M ARR: $30K-$50K net new MRR/month (7-12% growth)
- $10M ARR: $40K-$70K net new MRR/month (5-8% growth)

**How to track**: Calculate weekly from components above

---

### 7. Revenue Growth Rate

**What it measures**: Month-over-month revenue growth

**Formula**:
```
Revenue Growth Rate = (This month's MRR - Last month's MRR) / Last month's MRR × 100
```

**Example**:
- Last month MRR: $100,000
- This month MRR: $115,000
- Growth rate: ($115K - $100K) / $100K × 100 = 15%

**Targets by stage**:
- $1M ARR: 20-30% MoM
- $3M ARR: 10-15% MoM
- $5M ARR: 7-10% MoM
- $10M ARR: 5-7% MoM

**How to track**: Calculate monthly

---

### 8. Net Revenue Retention (NRR)

**What it measures**: Revenue retention from existing customers (including expansion)

**Formula**:
```
NRR = (Starting MRR + Expansion MRR - Churned MRR) / Starting MRR × 100
```

**Example**:
- Starting MRR (Jan 1): $100,000
- Expansion MRR (Jan): $10,000
- Churned MRR (Jan): $5,000
- Ending MRR from Jan 1 cohort: $105,000
- NRR = $105,000 / $100,000 × 100 = 105%

**Targets by stage**:
- $1M ARR: 90-100% (acceptable to be <100%)
- $3M ARR: 100-110% (should be >100%)
- $5M ARR: 110-120% (expansion > churn)
- $10M ARR: 120-130% (strong expansion motion)

**How to track**: Calculate monthly cohort retention

---

## Customer Metrics

### 9. Total Customers

**What it measures**: Count of active paying customers

**Formula**:
```
Total Customers = Count of active subscriptions
```

**Targets by stage**:
- $1M ARR: 100-500 customers (depends on ARPU)
- $3M ARR: 300-1,500 customers
- $5M ARR: 500-2,500 customers
- $10M ARR: 1,000-5,000 customers

**How to track**: Query Stripe API → count subscriptions where `status = "active"`

---

### 10. New Customers

**What it measures**: Number of customers acquired this month

**Formula**:
```
New Customers = Count of new subscriptions this month
```

**Targets by stage**:
- $1M ARR: 10-50 new customers/month
- $3M ARR: 30-100 new customers/month
- $5M ARR: 50-150 new customers/month
- $10M ARR: 80-250 new customers/month

**How to track**: Filter Stripe subscriptions by `created_at` this month → count

---

### 11. Customer Churn Rate

**What it measures**: Percentage of customers who cancel each month

**Formula**:
```
Customer Churn Rate = (Customers canceled this month / Customers at start of month) × 100
```

**Example**:
- Start of month: 200 customers
- Canceled: 10 customers
- Churn rate: (10 / 200) × 100 = 5%

**Targets by stage**:
- $1M ARR: <10% monthly (<2.5% is excellent)
- $3M ARR: <5% monthly (<2% is excellent)
- $5M ARR: <3% monthly (<1.5% is excellent)
- $10M ARR: <2.5% monthly (<1% is excellent)

**How to track**: Calculate monthly

---

### 12. ARPU (Average Revenue Per User)

**What it measures**: Average monthly revenue per customer

**Formula**:
```
ARPU = MRR / Total Customers
```

**Example**:
- MRR: $100,000
- Total customers: 500
- ARPU: $100,000 / 500 = $200/customer

**Targets by stage**:
- $1M ARR: $100-$500 ARPU (SMB focus)
- $3M ARR: $200-$1,000 ARPU (mid-market)
- $5M ARR: $500-$2,000 ARPU (moving upmarket)
- $10M ARR: $1,000-$5,000 ARPU (enterprise)

**How to track**: Calculate weekly

---

## Sales & Marketing Metrics

### 13. CAC (Customer Acquisition Cost)

**What it measures**: Cost to acquire one customer

**Formula**:
```
CAC = (Sales + Marketing spend) / New customers acquired
```

**Example**:
- Sales spend: $50,000/month
- Marketing spend: $30,000/month
- New customers: 40
- CAC = ($50K + $30K) / 40 = $2,000/customer

**Targets by stage**:
- $1M ARR: CAC < $500 (low-touch sales)
- $3M ARR: CAC < $2,000 (mid-touch sales)
- $5M ARR: CAC < $5,000 (enterprise sales)
- $10M ARR: CAC < $10,000 (large enterprise)

**How to track**: Calculate monthly

---

### 14. LTV (Lifetime Value)

**What it measures**: Total revenue expected from one customer over their lifetime

**Formula**:
```
LTV = ARPU / Monthly Churn Rate × Gross Margin %
```

**Example**:
- ARPU: $200/month
- Monthly churn: 5% (0.05)
- Gross margin: 85% (0.85)
- LTV = $200 / 0.05 × 0.85 = $3,400

**Targets by stage**:
- $1M ARR: LTV > $1,500
- $3M ARR: LTV > $5,000
- $5M ARR: LTV > $10,000
- $10M ARR: LTV > $25,000

**How to track**: Calculate monthly

---

### 15. LTV:CAC Ratio

**What it measures**: Return on customer acquisition spend

**Formula**:
```
LTV:CAC Ratio = LTV / CAC
```

**Example**:
- LTV: $6,000
- CAC: $2,000
- LTV:CAC = $6,000 / $2,000 = 3:1

**Targets by stage**:
- All stages: >3:1 (healthy), >5:1 (excellent), <1:1 (burning cash)

**Interpretation**:
- <1:1: Losing money on every customer (UNSUSTAINABLE)
- 1:1-2:1: Breaking even or small margin (RISKY)
- 3:1-5:1: Healthy unit economics (GOOD)
- >5:1: Excellent, consider investing more in growth (GREAT)

**How to track**: Calculate monthly

---

### 16. CAC Payback Period

**What it measures**: Months to recover customer acquisition cost

**Formula**:
```
CAC Payback Period = CAC / (ARPU × Gross Margin %)
```

**Example**:
- CAC: $2,000
- ARPU: $200/month
- Gross margin: 85% (0.85)
- Payback = $2,000 / ($200 × 0.85) = 11.8 months

**Targets by stage**:
- $1M ARR: <12 months (ideally <6)
- $3M ARR: <18 months (ideally <12)
- $5M ARR: <18 months (enterprise sales cycles longer)
- $10M ARR: <24 months (large enterprise)

**How to track**: Calculate monthly

---

## Financial Metrics

### 17. Gross Margin

**What it measures**: Profitability after direct costs

**Formula**:
```
Gross Margin % = (Revenue - COGS) / Revenue × 100

COGS (Cost of Goods Sold) = Hosting + Payment processing + Customer support
```

**Example**:
- Revenue: $100,000/month
- Hosting: $5,000/month
- Payment processing: $3,000/month (3% of revenue)
- Support: $7,000/month
- COGS: $15,000
- Gross margin: ($100K - $15K) / $100K × 100 = 85%

**Targets by stage**:
- All stages: >70% (minimum), >80% (good), >85% (excellent)

**How to track**: Calculate monthly

---

### 18. Burn Rate

**What it measures**: Monthly cash spent

**Formula**:
```
Burn Rate = Starting cash - Ending cash (per month)
```

**Example**:
- Jan 1 cash: $1,000,000
- Feb 1 cash: $850,000
- Burn rate: $150,000/month

**Targets by stage**:
- $1M ARR: $50K-$150K/month burn
- $3M ARR: $150K-$300K/month burn
- $5M ARR: $250K-$500K/month burn
- $10M ARR: $400K-$800K/month burn (or profitable)

**How to track**: Export bank statements monthly

---

### 19. Runway

**What it measures**: Months of cash remaining at current burn rate

**Formula**:
```
Runway = Cash balance / Burn rate
```

**Example**:
- Cash balance: $1,200,000
- Burn rate: $150,000/month
- Runway: $1,200,000 / $150,000 = 8 months

**Targets by stage**:
- All stages: >12 months (healthy), 6-12 months (start fundraising), <6 months (urgent)

**How to track**: Calculate weekly

---

### 20. Rule of 40

**What it measures**: Balance between growth and profitability

**Formula**:
```
Rule of 40 = Revenue Growth Rate % + Profit Margin %
```

**Example**:
- Revenue growth rate: 50% YoY
- Profit margin: -10% (burning cash)
- Rule of 40: 50% + (-10%) = 40%

**Targets by stage**:
- $1M-$5M ARR: >30-40% (growth-focused, acceptable to burn)
- $5M-$10M ARR: >40% (balanced growth + efficiency)
- $10M+ ARR: >40-50% (path to profitability)

**Interpretation**:
- >40%: Excellent (healthy balance)
- 30-40%: Good (growing efficiently)
- <30%: Poor (slow growth or burning too much cash)

**How to track**: Calculate quarterly

---

## Weekly Metrics Dashboard Template

**Copy this to Google Sheets or Notion**:

```
WEEKLY METRICS DASHBOARD — Week of [DATE]

REVENUE
- MRR: $_______ (vs last week: +/- ___%)
- ARR: $_______ (MRR × 12)
- New MRR: $_______ (target: $______)
- Expansion MRR: $_______
- Churned MRR: $_______
- Net New MRR: $_______
- Growth Rate: ___% MoM

CUSTOMERS
- Total Customers: _____ (vs last week: +/- ___)
- New Customers: _____ (target: _____)
- Churned Customers: _____
- Churn Rate: ___% monthly
- ARPU: $_______

UNIT ECONOMICS
- CAC: $_______
- LTV: $_______
- LTV:CAC: ___:1 (target: >3:1)
- CAC Payback: ___ months (target: <12)
- Gross Margin: ___%

FINANCIAL
- Burn Rate: $_______/month
- Runway: ___ months (target: >12)
- Cash Balance: $_______

ALERTS (Metrics below target)
- [ ] MRR growth below target
- [ ] Churn above target
- [ ] LTV:CAC below 3:1
- [ ] Runway below 12 months
```

---

## How to Set Up Metrics Tracking

### Option 1: Google Sheets (Free, Manual)

**Pros**: Free, flexible, easy to customize
**Cons**: Manual data entry, error-prone

**Setup**:
1. Create new Google Sheet
2. Create tabs: Revenue, Customers, Sales, Financial
3. Enter formulas for each metric
4. Update weekly (Friday)

---

### Option 2: Stripe Dashboard + Google Sheets (Hybrid)

**Pros**: Auto-sync from Stripe, minimal manual work
**Cons**: Requires Stripe, limited to Stripe data

**Setup**:
1. Use Stripe Data Pipeline (export to Google Sheets)
2. Create Google Sheet with formulas referencing Stripe data
3. Auto-updates daily

---

### Option 3: Metabase / Tableau (Advanced, Automated)

**Pros**: Fully automated, real-time dashboards
**Cons**: Requires technical setup, $50-$200/month

**Setup**:
1. Connect Metabase to your Postgres database
2. Create SQL queries for each metric
3. Build dashboards with charts/tables
4. Share with team (live dashboards)

---

## Metrics Review Cadence

**Weekly** (Monday, 15-30 min meeting):
- Review all 20 metrics
- Identify trends (4-week moving average)
- Spot red flags (metrics below target)
- Assign action items (e.g., "investigate why churn spiked")

**Monthly** (First Monday of month, 1 hour):
- Deep-dive into underperforming metrics
- Compare to targets (on track for quarterly goals?)
- Adjust strategy (double down or pivot)
- Update board deck (prepare for investor update)

**Quarterly** (End of quarter, half-day session):
- Review full quarter performance
- Set next quarter targets
- Strategic planning (what to focus on next quarter)
- Celebrate wins (share with team)

---

## Common Metrics Mistakes

### Mistake 1: Tracking Vanity Metrics

**Vanity metrics** (don't track these):
- Total signups (meaningless if they don't convert)
- Website traffic (meaningless if they don't convert)
- Social media followers (meaningless if they don't buy)

**Actionable metrics** (track these instead):
- Paying customers
- MRR
- Churn rate

---

### Mistake 2: Not Tracking Cohorts

**The mistake**: Only looking at aggregate metrics (total MRR, total churn)

**Why it's bad**: Hides trends (Jan cohort might churn at 2%, but Dec cohort at 15%)

**Fix**: Track cohorts monthly (Jan signups → track their retention/expansion over time)

---

### Mistake 3: No Weekly Review

**The mistake**: Calculate metrics once per month (or not at all)

**Why it's bad**: React too late (churn spikes, but you don't notice for 4 weeks)

**Fix**: Weekly metrics meeting (15-30 min, every Monday)

---

## Summary

**20 Core Metrics to Track**:

**Revenue** (8 metrics):
1. MRR
2. ARR
3. New MRR
4. Expansion MRR
5. Churned MRR
6. Net New MRR
7. Revenue Growth Rate
8. Net Revenue Retention

**Customers** (4 metrics):
9. Total Customers
10. New Customers
11. Customer Churn Rate
12. ARPU

**Sales & Marketing** (4 metrics):
13. CAC
14. LTV
15. LTV:CAC Ratio
16. CAC Payback Period

**Financial** (4 metrics):
17. Gross Margin
18. Burn Rate
19. Runway
20. Rule of 40

**Tracking cadence**:
- Calculate metrics: Weekly (Friday)
- Review metrics: Weekly (Monday, 15-30 min)
- Deep-dive: Monthly (1 hour)
- Strategic planning: Quarterly (half-day)

**Next steps**:
- Copy the Weekly Metrics Dashboard template to Google Sheets
- Set up data pipeline (Stripe → Google Sheets or Metabase)
- Schedule Monday metrics meeting (recurring, 15-30 min)
- Review Part 1: Operations at Scale for context on using these metrics
