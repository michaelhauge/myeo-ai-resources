# Ongoing Governance: Maintaining Savings Long-Term

## The $500K Problem That Creeps Back

**Scenario**: You complete a SaaS audit, save $500K/year (50% reduction), celebrate the win.

**12 months later**: SaaS spend is back to original levels ($1M/year).

**What happened?**:
- **Shadow IT returns**: Teams buy new tools without approval (20-30% of spend)
- **Seat creep**: No one removes inactive users (seat count grows 20%/year)
- **New subscriptions**: Every project adds 2-3 new tools (no consolidation discipline)
- **Auto-renewals**: Vendors renew at list price (no renegotiation)

**The Fix**: Implement ongoing governance (quarterly reviews, procurement policies, forecasting) to maintain savings long-term.

---

## Why One-Time Audits Fail

### Mistake #1: No Procurement Policy

**Problem**: Without approval workflows, teams buy tools freely (shadow IT).

**Example**:
- **Before audit**: 80 SaaS tools, $800K/year
- **After audit**: 50 tools, $400K/year (50% savings)
- **12 months later**: 75 tools, $750K/year (shadow IT added 25 tools)

**Fix**: Implement procurement policy (all SaaS purchases require finance approval).

---

### Mistake #2: No Seat Management Process

**Problem**: No one removes inactive users (seat count grows passively).

**Example**:
- **Before audit**: 100 Salesforce seats, $180K/year ($150/seat/month)
- **After audit**: 70 active seats, $126K/year (30% savings)
- **12 months later**: 95 seats, $171K/year (25 employees joined, no one removed 0 inactive users)

**Fix**: Quarterly seat audits (remove inactive users every 90 days).

---

### Mistake #3: No Renewal Management

**Problem**: Contracts auto-renew at list price (no renegotiation).

**Example**:
- **Before audit**: HubSpot $100K/year (list price)
- **After audit**: Negotiated to $75K/year (25% discount)
- **12 months later**: Auto-renewed at $100K/year (discount expired, no one renegotiated)

**Fix**: 90-day renewal calendar (renegotiate every contract 90 days before expiration).

---

## The 5-Pillar Governance Framework

### Pillar 1: Procurement Policy (Control Shadow IT)

**Goal**: All SaaS purchases require finance approval (eliminate shadow IT).

---

#### 1.1 The 3-Tier Approval Workflow

**Tier 1: <$1K/year (Auto-Approve)**
- **Approval**: Manager approval only (no finance review)
- **Examples**: Grammarly ($12/month), Calendly ($10/month), Canva Pro ($13/month)
- **Rationale**: Too small to justify approval overhead

**Tier 2: $1K-$10K/year (Finance Review)**
- **Approval**: Manager + Finance approval (2-step)
- **Examples**: Notion ($10/user/month × 20 users = $2.4K/year), Figma ($15/user/month × 10 users = $1.8K/year)
- **Rationale**: Meaningful spend, but low risk

**Tier 3: >$10K/year (Executive Approval)**
- **Approval**: Manager + Finance + CFO/COO approval (3-step)
- **Examples**: Salesforce ($180K/year), HubSpot ($50K/year), AWS ($100K/year)
- **Rationale**: Material spend, requires executive oversight

---

#### 1.2 The SaaS Purchase Request Form

**Purpose**: Standardize approval requests (ensure all relevant info is collected).

**Template**:
```
=== SaaS Purchase Request Form ===

**Requestor Information**:
- Name: [YOUR NAME]
- Department: [SALES/MARKETING/ENG/OPS]
- Manager: [MANAGER NAME]

**Tool Information**:
- Tool name: [TOOL NAME]
- Vendor website: [URL]
- Use case: [WHAT PROBLEM DOES THIS SOLVE?]
- Current solution: [WHAT ARE YOU USING TODAY?] (if any)
- Why switching: [WHY IS CURRENT SOLUTION INADEQUATE?]

**Pricing**:
- Annual cost: $[X]/year
- Pricing model: [PER-SEAT / FLAT-RATE / USAGE-BASED / TIERED]
- Contract term: [MONTHLY / ANNUAL / MULTI-YEAR]
- Number of users: [X] users (initially), [Y] users (at 12 months)

**Alternatives Considered**:
- Alternative 1: [TOOL NAME] — [WHY REJECTED?]
- Alternative 2: [TOOL NAME] — [WHY REJECTED?]
- Alternative 3: Build in-house — [WHY REJECTED?]

**Budget Impact**:
- Budget approved: [YES / NO / PENDING]
- Budget source: [DEPARTMENT BUDGET / CENTRAL IT BUDGET / NEW REQUEST]
- ROI justification: [HOW DOES THIS SAVE TIME OR MONEY?]

**Consolidation Check**:
- Overlapping tools: [LIST ANY TOOLS THAT DO SIMILAR THINGS]
- Consolidation opportunity: [CAN WE USE EXISTING TOOL INSTEAD?] (if no, explain why)

**Approval**:
- [ ] Manager approval: [NAME] — [DATE]
- [ ] Finance approval: [NAME] — [DATE]
- [ ] Executive approval: [NAME] — [DATE] (if >$10K/year)

**Status**: [APPROVED / REJECTED / PENDING]
```

**Where to submit**: Google Form → Notion database → Slack notification to #finance-approvals

---

#### 1.3 The Shadow IT Enforcement Strategy

**Question**: What if teams buy tools without approval (bypass the policy)?

**Enforcement tactics**:

**Tactic 1: Credit card controls**
- Block company credit cards from SaaS purchases (unless pre-approved)
- Route all SaaS purchases through finance-controlled card
- Result: Teams CAN'T buy tools without approval (technical control)

**Tactic 2: Expense report audits**
- Flag all SaaS purchases in expense reports (Expensify, Concur, etc.)
- Finance team reviews monthly: "Is this approved?"
- If not approved: Reject expense report (employee pays out-of-pocket)

**Tactic 3: SSO log monitoring**
- Check Okta/Google Workspace logs for new OAuth-connected apps
- Flag unapproved apps: "Who authorized this?"
- Disable app access until approval is obtained

**Tactic 4: Quarterly SaaS audits**
- Run full audit every 90 days (find shadow IT)
- If found, trace back to purchaser: "Why wasn't this approved?"
- Consequence: Reprimand (first time), terminate subscription (repeat offenders)

---

#### 1.4 The "Approved Vendors" List

**Purpose**: Pre-approve common tools (eliminate approval overhead for standard tools).

**How it works**:
- Finance maintains list of "approved vendors" (e.g., Google Workspace, Slack, Zoom)
- Teams can purchase approved vendors without approval (within budget)
- New vendors require approval (standard 3-tier process)

**Example approved vendors list**:
```
=== Approved SaaS Vendors (No Approval Required) ===

**Communication**:
- Slack (up to $15K/year)
- Zoom (up to $10K/year)
- Google Workspace (no limit — enterprise-wide)

**Productivity**:
- Notion (up to $5K/year)
- Miro (up to $3K/year)
- Grammarly (up to $1K/year)

**Development**:
- GitHub (no limit — engineering-wide)
- Postman (up to $2K/year)
- Figma (up to $10K/year)

**Marketing**:
- Canva (up to $5K/year)
- Mailchimp (up to $10K/year)

**Sales**:
- Salesforce (no limit — pre-approved enterprise contract)
- HubSpot (no limit — pre-approved enterprise contract)

**Note**: Purchases exceeding listed limits require finance approval.
```

---

### Pillar 2: Seat Management (Prevent Seat Creep)

**Goal**: Maintain 70-85% seat utilization (optimal range).

---

#### 2.1 Quarterly Seat Audits

**Frequency**: Every 90 days (Q1, Q2, Q3, Q4)

**Process**:
1. **Pull usage reports** from all major tools (Salesforce, HubSpot, Slack, etc.)
2. **Identify inactive users** (no logins in last 60 days)
3. **Confirm with managers** ("Is [USER] still using [TOOL]?")
4. **Remove inactive seats** (deprovision users, reduce seat count)
5. **Calculate savings** (seats removed × cost per seat)

**Time**: 2-4 hours per quarter

---

**Example quarterly seat audit**:

| Tool | Paid Seats | Active Users (60 days) | Utilization % | Inactive Seats | Action | Savings |
|------|------------|------------------------|---------------|----------------|--------|---------|
| Salesforce | 80 | 62 | 78% | 18 | Remove 18 seats | $32.4K/year |
| HubSpot | 50 | 38 | 76% | 12 | Remove 12 seats | $14.4K/year |
| Slack | 120 | 105 | 88% | 15 | Remove 15 seats | $2.7K/year |
| Zoom | 100 | 85 | 85% | 15 | Remove 15 seats | $3K/year |
| **Total** | **350** | **290** | **83%** | **60** | - | **$52.5K/year** |

**Result**: $52.5K/year saved (15% reduction) from one quarterly seat audit.

---

#### 2.2 Automated Seat Management

**Goal**: Automate deprovisioning (reduce manual effort).

**How it works**:
- Connect HR system (BambooHR, Workday, Rippling) to SaaS tools
- When employee leaves: HR system triggers → All SaaS accounts deactivated automatically
- Result: Inactive seats removed within 24 hours (no manual intervention)

**Tools for automation**:
- **Okta Lifecycle Management**: Auto-provision/deprovision users
- **Rippling**: Connect HR to SaaS tools (auto-deprovision on termination)
- **Zapier**: Build custom workflows (HR system → SaaS tools)

**Cost**: $5K-$20K/year (automation tools)
**Savings**: $50K-$200K/year (from removing inactive seats faster)
**ROI**: 250-1,000%

---

#### 2.3 The "Seat Budget" by Department

**Goal**: Hold departments accountable for seat usage.

**How it works**:
- Finance allocates "seat budget" to each department (e.g., Sales gets 50 Salesforce seats, Marketing gets 30 HubSpot seats)
- Departments manage their own seat count (stay within budget)
- If department wants more seats: Must request approval + justify ROI

**Example**:
```
=== SaaS Seat Budget (FY2026) ===

**Sales Department**:
- Salesforce: 50 seats (budget: $90K/year)
- HubSpot: 20 seats (budget: $24K/year)
- Zoom: 50 seats (budget: $10K/year)
- **Total**: $124K/year

**Marketing Department**:
- HubSpot: 30 seats (budget: $36K/year)
- Canva: 10 seats (budget: $1.2K/year)
- Mailchimp: 1 account (budget: $3K/year)
- **Total**: $40.2K/year

**Engineering Department**:
- GitHub: 40 seats (budget: $8K/year)
- Jira: 40 seats (budget: $12K/year)
- Figma: 15 seats (budget: $6.75K/year)
- **Total**: $26.75K/year

**Operations**:
- Slack (company-wide): 120 seats (budget: $21.6K/year)
- Google Workspace (company-wide): 120 seats (budget: $36K/year)
- **Total**: $57.6K/year

**Grand Total**: $248.55K/year
```

**Enforcement**: Quarterly reviews (departments over budget must reduce seats or justify overage).

---

### Pillar 3: Renewal Management (Renegotiate Every Contract)

**Goal**: Renegotiate every contract 90 days before expiration (never auto-renew).

---

#### 3.1 The 90-Day Renewal Calendar

**System**: Track all contract renewal dates (90-day advance notice).

**Tools**:
- **Google Sheets**: Simple renewal calendar (works for <50 vendors)
- **Notion**: Database with renewal reminders (works for 50-150 vendors)
- **Torii/Zylo**: SaaS management platforms (auto-track renewals, works for >150 vendors)

**Template (Google Sheets)**:
```
| Vendor | Contract Start | Contract End | Annual Cost | Renewal Alert (90 days before) | Owner | Status |
|--------|---------------|--------------|-------------|--------------------------------|-------|--------|
| Salesforce | 2025-01-01 | 2026-01-01 | $180K | 2025-10-03 | [SALES VP] | Pending |
| HubSpot | 2025-03-15 | 2026-03-15 | $75K | 2025-12-15 | [MARKETING VP] | Pending |
| AWS | 2025-06-01 | 2026-06-01 | $120K | 2026-03-03 | [CTO] | Pending |
```

**Automation**: Set Google Calendar reminders (90 days before each renewal date).

---

#### 3.2 The Renewal Negotiation Playbook

**Goal**: Renegotiate every contract (aim for 10-20% discount at renewal).

**Process** (90 days before renewal):

**Step 1: Pull usage data** (30-60 days before renewal)
- Check seat utilization: Are we paying for unused seats?
- Check feature usage: Are we paying for features we don't use?
- Check alternatives: What are competitors offering?

**Step 2: Draft renewal proposal** (60 days before renewal)
- **Current spend**: $[X]/year
- **Target spend**: $[Y]/year (10-20% reduction)
- **Justification**: Usage data, competitive quotes, multi-year commitment

**Step 3: Negotiate with vendor** (45-60 days before renewal)
- Email template: See [Renewal Negotiation Template](#renewal-negotiation-email-template) below
- Stack leverage points: Expiring contract + competitive pressure + multi-year commitment
- Target: 10-20% discount

**Step 4: Sign renewed contract** (30 days before renewal)
- Lock in pricing for 1-3 years
- Update renewal calendar (next renewal date)

---

**Renewal Negotiation Email Template**:
```
Subject: [VENDOR] Contract Renewal — Pricing Discussion

Hi [ACCOUNT MANAGER],

Our [VENDOR] contract expires on [DATE] (60 days from now). We'd like to renew, but need better pricing.

**Current contract**:
- Plan: [ENTERPRISE / PROFESSIONAL / etc.]
- Seats: [X] users
- Cost: $[Y]/year

**Usage analysis**:
- Active users: [X] (last 60 days)
- Seat utilization: [Z]% (we're paying for unused seats)
- Feature usage: [LOW / MEDIUM / HIGH] — we're not using [FEATURE A, FEATURE B]

**Competitive landscape**:
- We've received quotes from [COMPETITOR 1] and [COMPETITOR 2]
- [COMPETITOR 1] offered $[X]/year (15% cheaper than [VENDOR])
- [COMPETITOR 2] offered $[Y]/year (20% cheaper than [VENDOR])

**Renewal proposal**:
- **Target pricing**: $[Z]/year (20% reduction from current)
- **Contract term**: 2-year commitment (in exchange for discount)
- **Seat reduction**: Reduce to [X] active seats (remove unused seats)

Can we schedule a call to discuss renewal terms?

Available [3 DATE/TIME OPTIONS].

If we can't agree on pricing by [DATE], we'll need to evaluate alternatives.

Thanks,
[YOUR NAME]
```

---

#### 3.3 The "Auto-Renew Kill Switch"

**Problem**: Vendors auto-renew contracts (often at higher prices) if you don't cancel 30-90 days before expiration.

**Fix**: Disable auto-renew on all contracts.

**How**:
1. **Check contract terms**: Look for "auto-renewal" clause (usually Section 5-7: "Term and Termination")
2. **Send cancellation notice**: Email vendor 90 days before expiration: "We're canceling auto-renewal. We'll renegotiate before expiration."
3. **Negotiate new contract**: 30-60 days before expiration, negotiate new pricing
4. **Sign new contract**: Lock in new pricing (and disable auto-renew again)

**Email template**:
```
Subject: Disable Auto-Renewal — [VENDOR] Contract

Hi [ACCOUNT MANAGER],

Our [VENDOR] contract expires on [DATE].

Per Section [X] of our contract, we're providing notice that we're **disabling auto-renewal**.

We plan to renegotiate pricing before [DATE]. We'll reach out in [60 days] to discuss renewal terms.

Thanks,
[YOUR NAME]
```

---

### Pillar 4: Usage Monitoring (Catch Zombies Early)

**Goal**: Detect underutilized tools before they become zombies (0% usage).

---

#### 4.1 Monthly Usage Dashboards

**What to track**:
- **Active users**: How many users logged in last 30 days?
- **Login frequency**: Daily / Weekly / Monthly / Never
- **Feature usage**: Which features are being used?
- **Seat utilization**: Active users ÷ Paid seats

**Tools**:
- **Built-in analytics**: Most SaaS tools have usage dashboards (Salesforce Reports, HubSpot Analytics, Slack Analytics)
- **SaaS management platforms**: Torii, Zylo, Productiv (aggregate usage across all tools)
- **Google Sheets**: Manual tracking (export usage reports monthly, track in spreadsheet)

**Example usage dashboard** (Google Sheets):

| Tool | Paid Seats | Active Users (30 days) | Utilization % | Trend | Status |
|------|------------|------------------------|---------------|-------|--------|
| Salesforce | 80 | 68 | 85% | ↑ | Healthy |
| HubSpot | 50 | 42 | 84% | → | Healthy |
| Slack | 120 | 110 | 92% | ↑ | Healthy |
| Zoom | 100 | 45 | 45% | ↓ | ⚠️ Under-utilized |
| Jira | 60 | 25 | 42% | ↓ | ⚠️ Under-utilized |
| Asana | 30 | 8 | 27% | ↓ | 🚨 Zombie risk |

**Action**: Flag tools with <50% utilization (investigate why usage is low).

---

#### 4.2 Quarterly "Zombie Hunts"

**Frequency**: Every 90 days

**Process**:
1. **Pull usage reports** from all tools (last 90 days)
2. **Flag zombies** (tools with <10% utilization or 0 logins)
3. **Confirm with users**: "Are you still using [TOOL]?"
4. **Cancel zombies**: If no one objects, cancel subscription
5. **Calculate savings**: Zombies canceled × annual cost

**Example zombie hunt**:

| Tool | Annual Cost | Active Users (90 days) | Utilization % | Owner | Decision | Savings |
|------|-------------|------------------------|---------------|-------|----------|---------|
| Asana | $10K | 2 / 30 | 7% | Marketing | Cancel | $10K |
| Typeform | $4K | 0 / 10 | 0% | Sales | Cancel | $4K |
| Hootsuite | $6K | 1 / 5 | 20% | Marketing | Keep (but reduce seats) | $3K |
| **Total** | **$20K** | - | - | - | - | **$17K/year** |

**Result**: $17K/year saved from one quarterly zombie hunt.

---

### Pillar 5: Forecasting & Budgeting (Predictable Spend)

**Goal**: Predict SaaS spend 12-24 months ahead (avoid budget surprises).

---

#### 5.1 The SaaS Spend Forecast Model

**Purpose**: Forecast SaaS spend based on headcount growth, new projects, and renewals.

**Inputs**:
- **Current SaaS spend**: $[X]/year
- **Headcount growth**: [Y]% per year (new employees = more seats)
- **New projects**: [Z] new projects per year (each adds 2-3 new tools)
- **Renewals**: [W] contracts renewing (potential price increases)

**Formula**:
```
Forecasted SaaS Spend = Current Spend × (1 + Headcount Growth %) + (New Projects × Avg Cost per Project) + (Renewals × Avg Price Increase %)

Example:
- Current spend: $500K/year
- Headcount growth: 20% (from 100 to 120 employees)
- New projects: 4 projects × $10K per project = $40K
- Renewals: $200K renewing × 10% avg increase = $20K
- **Forecasted spend**: $500K × 1.20 + $40K + $20K = $660K/year

Actual forecast: Add 10% buffer for unknowns → $726K/year
```

---

**Example SaaS spend forecast** (3-year horizon):

| Year | Employees | SaaS Spend | Spend per Employee | Notes |
|------|-----------|------------|-------------------|-------|
| 2024 (actual) | 100 | $500K | $5,000/employee | Baseline |
| 2025 (forecast) | 120 (+20%) | $660K | $5,500/employee | 4 new projects added |
| 2026 (forecast) | 144 (+20%) | $825K | $5,729/employee | Continued growth |
| 2027 (forecast) | 173 (+20%) | $1,030K | $5,954/employee | Scaling phase |

**Key insight**: Without optimization, SaaS spend grows 30-40%/year (faster than headcount).

**With governance**: SaaS spend grows 10-15%/year (in line with headcount).

---

#### 5.2 The "SaaS Budget by Department" Model

**Purpose**: Allocate SaaS budget to departments (accountability).

**Example**:

| Department | FY2025 Budget | FY2026 Budget | Growth % | Notes |
|------------|---------------|---------------|----------|-------|
| Sales | $150K | $180K | 20% | Growing sales team (30 → 40 reps) |
| Marketing | $80K | $100K | 25% | New marketing automation tools |
| Engineering | $120K | $150K | 25% | Scaling infra (AWS, GitHub, Datadog) |
| Operations | $100K | $110K | 10% | Stable headcount, minor seat growth |
| Finance | $30K | $35K | 17% | New FP&A tools |
| **Total** | **$480K** | **$575K** | **20%** | Overall growth |

**Governance**: Each department must stay within budget (or request approval for overages).

---

#### 5.3 The "SaaS Spend per Employee" Benchmark

**Purpose**: Benchmark your SaaS spend against industry averages.

**Industry benchmarks**:
- **Startups (<50 employees)**: $5K-$10K per employee per year
- **Growth-stage (50-200 employees)**: $4K-$8K per employee per year
- **Mid-market (200-1,000 employees)**: $3K-$6K per employee per year
- **Enterprise (1,000+ employees)**: $2K-$4K per employee per year

**Why spend per employee decreases**:
- **Economies of scale**: Larger companies negotiate better volume discounts
- **Consolidated tools**: Larger companies have fewer overlapping tools

**Example**:
- **Your company**: 120 employees, $660K SaaS spend = $5,500/employee
- **Benchmark**: $4K-$8K per employee (growth-stage companies)
- **Assessment**: Within range, but on the higher end (opportunity to optimize)

---

## Governance Playbook: The Quarterly Review

**Frequency**: Every 90 days (Q1, Q2, Q3, Q4)

**Time**: 4-8 hours per quarter

**Deliverables**: Quarterly SaaS optimization report

---

### Quarter 1 (Jan-Mar): Audit & Cleanup

**Activities**:
- [ ] Run full SaaS audit (find all subscriptions, identify zombies)
- [ ] Cancel zombie subscriptions (0% usage)
- [ ] Remove inactive seats (quarterly seat audit)
- [ ] Update renewal calendar (flag contracts renewing in next 90 days)

**Deliverable**: Q1 Savings Report ($X saved from zombies + seat reductions)

---

### Quarter 2 (Apr-Jun): Negotiation & Consolidation

**Activities**:
- [ ] Renegotiate contracts expiring in Q2-Q3 (90-day advance notice)
- [ ] Evaluate consolidation opportunities (overlapping tools)
- [ ] Switch to local currency pricing (where available)
- [ ] Update SaaS spend forecast (based on Q1 actuals)

**Deliverable**: Q2 Negotiations Report ($Y saved from renegotiations + consolidations)

---

### Quarter 3 (Jul-Sep): Governance Enforcement

**Activities**:
- [ ] Audit shadow IT (check expense reports, SSO logs)
- [ ] Enforce procurement policy (reject unapproved purchases)
- [ ] Review department SaaS budgets (who's over/under budget?)
- [ ] Plan Q4 renewals (contracts expiring in Q4-Q1)

**Deliverable**: Q3 Governance Report (shadow IT found, budget compliance)

---

### Quarter 4 (Oct-Dec): Forecasting & Planning

**Activities**:
- [ ] Finalize FY[NEXT] SaaS budget (by department)
- [ ] Update 3-year SaaS spend forecast
- [ ] Run year-end zombie hunt (cancel unused tools before Jan 1)
- [ ] Prepare annual SaaS optimization report (FY summary)

**Deliverable**: FY[NEXT] SaaS Budget + Annual Savings Report

---

## SaaS Governance Metrics Dashboard

**Track these 10 metrics monthly**:

### Metric 1: Total SaaS Spend
```
Total SaaS Spend = Sum of all subscription costs

Target: <5% growth month-over-month (in line with headcount)
```

### Metric 2: SaaS Spend per Employee
```
SaaS Spend per Employee = Total SaaS Spend ÷ Number of Employees

Target: $4K-$8K per employee per year (growth-stage companies)
```

### Metric 3: Number of Subscriptions
```
Number of Subscriptions = Count of all active SaaS tools

Target: <30 tools (for <100 employees), <60 tools (for 100-200 employees)
```

### Metric 4: Shadow IT %
```
Shadow IT % = (Unapproved subscriptions ÷ Total subscriptions) × 100

Target: <10% (indicates good procurement policy enforcement)
```

### Metric 5: Average Seat Utilization
```
Average Seat Utilization = (Total active users ÷ Total paid seats) × 100

Target: 70-85% (optimal range)
```

### Metric 6: Zombie Subscription Count
```
Zombie Subscription Count = Number of subscriptions with 0% usage (last 90 days)

Target: 0 (indicates good usage monitoring)
```

### Metric 7: Contract Renewal Success Rate
```
Contract Renewal Success Rate = (Contracts renegotiated ÷ Total renewals) × 100

Target: 100% (never auto-renew without negotiation)
```

### Metric 8: Average Renewal Discount
```
Average Renewal Discount = (Sum of discounts at renewal ÷ Number of renewals) × 100

Target: 10-20% discount at renewal
```

### Metric 9: Vendor Concentration Risk
```
Vendor Concentration Risk = (Top 5 vendors spend ÷ Total SaaS spend) × 100

Target: <60% (avoid over-dependence on few vendors)
```

### Metric 10: Savings from Optimization
```
Savings from Optimization = (Zombies canceled + Seat reductions + Renegotiations + Consolidations)

Target: 5-10% of total SaaS spend per quarter
```

---

## SaaS Governance Roles & Responsibilities

### Role 1: SaaS Program Manager (Finance/Ops)

**Responsibilities**:
- Own the SaaS optimization program (quarterly reviews, governance enforcement)
- Maintain renewal calendar (90-day advance reminders)
- Run quarterly seat audits (remove inactive users)
- Enforce procurement policy (approve/reject purchase requests)
- Track metrics dashboard (monthly reporting)

**Time commitment**: 10-15 hours/week (part-time role for finance/ops team)

**For companies >200 employees**: Hire dedicated SaaS Procurement Manager (full-time)

---

### Role 2: Department SaaS Owners (Department Heads)

**Responsibilities**:
- Manage department SaaS budget (stay within allocation)
- Request new SaaS purchases (submit purchase request form)
- Remove inactive users from department tools (quarterly seat audits)
- Participate in renewal negotiations (provide usage data, justify need)

**Time commitment**: 2-4 hours/quarter

---

### Role 3: CFO/COO (Executive Sponsor)

**Responsibilities**:
- Approve large SaaS purchases (>$10K/year)
- Review quarterly SaaS optimization reports (savings achieved)
- Enforce procurement policy (mandate compliance)
- Allocate annual SaaS budget (by department)

**Time commitment**: 1-2 hours/quarter (review + approval)

---

## Common Governance Failures (What NOT to Do)

### Failure 1: No Executive Buy-In

**Problem**: Finance tries to enforce procurement policy, but CEO/COO doesn't support it.

**Result**: Teams ignore policy (shadow IT continues).

**Fix**: Get executive mandate ("All SaaS purchases require finance approval — no exceptions").

---

### Failure 2: Approval Process Too Slow

**Problem**: SaaS purchase requests take 2-4 weeks to approve (teams bypass process).

**Result**: Shadow IT (teams buy tools anyway, ask forgiveness later).

**Fix**: Fast approvals (<48 hours for <$10K purchases, <1 week for >$10K).

---

### Failure 3: No Usage Monitoring

**Problem**: No one checks if tools are being used (zombies accumulate).

**Result**: 15-25% of spend wasted on unused tools.

**Fix**: Quarterly zombie hunts (cancel tools with <10% utilization).

---

### Failure 4: Auto-Renewals Not Disabled

**Problem**: Contracts auto-renew at list price (no renegotiation).

**Result**: Miss 10-20% discount opportunities at renewal.

**Fix**: Disable auto-renew on all contracts, renegotiate 90 days before expiration.

---

### Failure 5: No Department Accountability

**Problem**: Central IT/finance controls all SaaS (departments have no ownership).

**Result**: Departments complain about "IT saying no" (bad for morale).

**Fix**: Allocate SaaS budget to departments (they manage their own spend, within limits).

---

## SaaS Governance Tools

### Option 1: DIY (Google Sheets + Calendar)

**Best for**: <50 SaaS subscriptions

**Tools**:
- Google Sheets: Track subscriptions, renewal dates, seat counts
- Google Calendar: Set renewal reminders (90 days before expiration)
- Google Forms: SaaS purchase request form

**Cost**: $0

**Effort**: 10-15 hours/month (manual tracking)

---

### Option 2: SaaS Management Platforms

**Best for**: 50-150 SaaS subscriptions

**Vendors**: Torii, Zylo, Productiv, Cleanshelf

**Features**:
- Auto-discovery (find all subscriptions via credit card, SSO, browser extensions)
- Usage monitoring (track logins, seat utilization)
- Renewal management (90-day advance reminders)
- Shadow IT detection (flag unapproved purchases)
- Vendor negotiation support (benchmark pricing)

**Cost**: $10K-$50K/year (typical for 100-200 employees)

**ROI**: $100K-$500K/year savings → 200-1,000% ROI

---

### Option 3: Enterprise Procurement Platforms

**Best for**: >150 SaaS subscriptions (enterprise companies)

**Vendors**: Coupa, Zip (formerly Procurify), Vendr, Vertice

**Features**:
- Full procurement workflow (PO creation, approvals, invoicing)
- Vendor negotiation services (experts negotiate on your behalf)
- Contract lifecycle management (store contracts, track terms)
- Spend analytics (dashboards, forecasting)

**Cost**: $50K-$200K/year

**ROI**: $500K-$2M/year savings → 250-1,000% ROI

---

## Summary: The Governance Checklist

**Monthly**:
- [ ] Review SaaS spend dashboard (10 metrics)
- [ ] Approve SaaS purchase requests (<48 hours)
- [ ] Monitor usage (flag tools with declining usage)

**Quarterly**:
- [ ] Run seat audit (remove inactive users)
- [ ] Hunt zombies (cancel unused tools)
- [ ] Renegotiate renewals (90-day advance notice)
- [ ] Audit shadow IT (expense reports, SSO logs)
- [ ] Update forecast (adjust budget based on actuals)

**Annually**:
- [ ] Set annual SaaS budget (by department)
- [ ] Update 3-year forecast
- [ ] Run comprehensive SaaS audit
- [ ] Review governance policy (update as needed)

---

## Next Steps

**Step 1**: Implement procurement policy using [Procurement Policy Template](../templates/procurement-policies.md)

**Step 2**: Set up renewal calendar (track all contracts, 90-day reminders)

**Step 3**: Run first quarterly review (audit → seat cleanup → zombie hunt → renegotiations)

**Step 4**: Track metrics dashboard (10 metrics, monthly reporting)

**Step 5**: Repeat quarterly (maintain savings long-term)

---

**Ready to maintain $200K-$2M+ annual savings through ongoing governance?** Start with the [Procurement Policy Template](../templates/procurement-policies.md). 🚀
