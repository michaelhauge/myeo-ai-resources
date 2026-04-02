# SaaS Procurement Policy Templates

## The Complete SaaS Procurement Policy Framework

**Purpose**: Standardize SaaS purchasing to eliminate shadow IT, control costs, and maintain governance.

**Target audience**: Finance, IT, Operations teams implementing SaaS governance.

**What's included**:
- 3-tier approval workflow
- Purchase request form template
- Approved vendors list
- Shadow IT enforcement policy
- Quarterly review process

---

## Template 1: Complete SaaS Procurement Policy (Ready to Implement)

### [COMPANY NAME] SaaS Procurement Policy

**Effective date**: [YYYY-MM-DD]

**Policy owner**: [CFO / COO / Finance Director]

**Last updated**: [YYYY-MM-DD]

---

### 1. Purpose

This policy establishes procedures for purchasing, renewing, and managing Software-as-a-Service (SaaS) subscriptions at [COMPANY NAME].

**Goals**:
- Control SaaS spend (prevent shadow IT and redundant purchases)
- Standardize vendor selection (ensure tools meet security, compliance, and business requirements)
- Optimize costs (negotiate volume discounts, eliminate zombie subscriptions)
- Maintain visibility (track all subscriptions in central registry)

---

### 2. Scope

This policy applies to:
- ✅ All SaaS subscriptions (cloud-based software accessed via web browser or mobile app)
- ✅ All employees (regardless of department or seniority)
- ✅ All payment methods (corporate credit cards, wire transfers, expense reimbursements)

This policy does NOT apply to:
- ❌ Hardware purchases (laptops, monitors, etc.)
- ❌ On-premise software (installed locally, not cloud-based)
- ❌ One-time software purchases (not subscription-based)

---

### 3. Approval Workflow

**All SaaS purchases require approval before purchasing.** Purchases made without approval will not be reimbursed.

#### Tier 1: Small Purchases (<$1,000/year)

**Approval required**: Manager approval only

**Process**:
1. Employee requests approval from direct manager (via email or Slack)
2. Manager approves or denies within 24 hours
3. If approved, employee can purchase (using approved payment method)
4. Employee submits expense report (within 7 days of purchase)

**Timeline**: 1-2 days

**Examples**: Grammarly ($144/year), Calendly ($120/year), Canva Pro ($155/year)

---

#### Tier 2: Medium Purchases ($1,000-$10,000/year)

**Approval required**: Manager + Finance approval

**Process**:
1. Employee submits **SaaS Purchase Request Form** (see Section 4)
2. Manager reviews and approves/denies within 48 hours
3. Finance reviews and approves/denies within 48 hours
   - Finance checks: Budget availability, overlap with existing tools, pricing competitiveness
4. If approved, employee can purchase (using Finance-controlled corporate card)
5. Finance logs subscription in **SaaS Registry** (see Section 7)

**Timeline**: 3-5 days

**Examples**: Notion ($2,400/year for 20 users), Figma ($1,800/year for 10 users), Zoom ($4,800/year for 40 users)

---

#### Tier 3: Large Purchases (>$10,000/year)

**Approval required**: Manager + Finance + Executive (CFO/COO) approval

**Process**:
1. Employee submits **SaaS Purchase Request Form** (see Section 4)
2. Manager reviews and approves/denies within 48 hours
3. Finance reviews and approves/denies within 3-5 days
   - Finance checks: Budget availability, overlap, pricing, vendor evaluation (see Section 5)
   - Finance may request: Vendor demos, competitive quotes, contract review
4. Executive (CFO/COO) reviews and approves/denies within 3-5 days
5. If approved, Finance negotiates with vendor (aim for 20-30% discount)
6. Finance signs contract and sets up payment
7. Finance logs subscription in **SaaS Registry**

**Timeline**: 10-14 days

**Examples**: Salesforce ($180K/year), HubSpot ($75K/year), AWS ($120K/year)

---

### 4. SaaS Purchase Request Form

**All Tier 2 and Tier 3 purchases** require submitting this form.

**How to submit**: [LINK TO GOOGLE FORM / NOTION DATABASE / JIRA TICKET]

**Form fields**:

```
=== SaaS Purchase Request Form ===

**Requestor Information**:
- Name: [YOUR NAME]
- Department: [SALES / MARKETING / ENGINEERING / OPERATIONS / FINANCE / HR]
- Manager: [MANAGER NAME]
- Email: [YOUR EMAIL]

**Tool Information**:
- Tool name: [TOOL NAME]
- Vendor website: [URL]
- Category: [PROJECT MANAGEMENT / CRM / COMMUNICATION / etc.]
- Use case: [WHAT PROBLEM DOES THIS SOLVE?]
  - Be specific: "We need to automate email campaigns (currently manual)"
  - Not generic: "We need a marketing tool"

**Current Solution** (if any):
- What are you using today: [TOOL NAME or "Nothing"]
- Why is it inadequate: [SPECIFIC REASONS]
- Have you tried to solve this with existing tools: [YES / NO]
  - If YES, which tools did you try and why didn't they work?

**Pricing**:
- Annual cost: $[X]/year
- Pricing model: [PER-SEAT ($X/user/month) / FLAT-RATE ($X/month) / USAGE-BASED ($X/unit) / TIERED (tiers listed below)]
- Number of users: [X] users (initially), [Y] users (at 12 months)
- Contract term: [MONTHLY / ANNUAL / MULTI-YEAR]
- Free trial available: [YES (X days) / NO]

**Alternatives Considered**:
- Alternative 1: [TOOL NAME] — [WHY REJECTED?]
- Alternative 2: [TOOL NAME] — [WHY REJECTED?]
- Alternative 3: Build in-house — [WHY REJECTED?]
- Alternative 4: Do nothing — [WHY NOT ACCEPTABLE?]

**Consolidation Check**:
- Overlapping tools: [LIST ANY TOOLS AT [COMPANY] THAT DO SIMILAR THINGS]
- Can we use an existing tool instead: [YES / NO]
  - If NO, explain why existing tools don't meet this need

**Business Impact**:
- Problem severity: [CRITICAL / HIGH / MEDIUM / LOW]
  - CRITICAL: Blocking revenue, compliance, or operations (need within 1 week)
  - HIGH: Significant efficiency loss or risk (need within 1 month)
  - MEDIUM: Nice-to-have improvement (need within 3 months)
  - LOW: Optional enhancement (no urgency)

- Estimated time savings: [X hours/week saved across Y people]
- Estimated revenue impact: [$X/year revenue enabled or protected]
- Estimated cost savings: [$X/year saved by using this tool]

**ROI Justification**:
- Annual cost: $[X]/year
- Annual benefit: $[Y]/year (time savings + revenue + cost savings)
- ROI: [Y ÷ X] × 100 = [Z]%
- Payback period: [X ÷ Y] × 12 = [Z] months

**Budget**:
- Budget approved: [YES / NO / PENDING]
- Budget source: [DEPARTMENT BUDGET / CENTRAL IT BUDGET / NEW REQUEST]
- Budget owner: [DEPARTMENT HEAD NAME]

**Security & Compliance**:
- Data sensitivity: [PUBLIC / INTERNAL / CONFIDENTIAL / RESTRICTED]
- Compliance requirements: [NONE / SOC 2 / ISO 27001 / GDPR / HIPAA]
- SSO required: [YES / NO]
- Data residency requirements: [NONE / MUST BE IN [REGION]]

**Additional Notes**:
[Any other relevant information]

---

**Approval Status**:
- [ ] Manager approval: [NAME] — [DATE]
- [ ] Finance approval: [NAME] — [DATE]
- [ ] Executive approval: [NAME] — [DATE] (if >$10K/year)

**Status**: [APPROVED / REJECTED / PENDING]

**If rejected, reason**: [EXPLANATION]
```

---

### 5. Vendor Evaluation Criteria

**For Tier 3 purchases (>$10K/year)**, Finance will evaluate vendors using these criteria:

#### Mandatory Requirements (Must-Have)

- [ ] **Security certifications**: SOC 2 Type II (or in progress)
- [ ] **Data export**: Can export all data (CSV or API)
- [ ] **Contract flexibility**: Annual contract (or month-to-month), not multi-year lock-in
- [ ] **Vendor stability**: Vendor has >$10M ARR or is profitable (low risk of shutdown)
- [ ] **Pricing transparency**: Vendor publishes pricing (no "contact us" gatekeeping)

**If vendor fails any mandatory requirement**: Reject purchase (find alternative vendor).

---

#### Preferred Requirements (Nice-to-Have)

- ⭐ **Volume discounts**: Vendor offers 15%+ discount for >50 users
- ⭐ **SEA localization**: Vendor supports SGD/MYR/IDR/THB pricing (10-20% savings)
- ⭐ **Free trial**: 14-30 day free trial (test before committing)
- ⭐ **Customer references**: Vendor provides 2-3 customer references in similar industry
- ⭐ **Integration ecosystem**: Native integrations with [YOUR CORE STACK]

**Scoring**: Award 1 point for each preferred requirement met (max 5 points).
- **4-5 points**: Strong vendor (approve)
- **2-3 points**: Adequate vendor (approve with conditions)
- **0-1 points**: Weak vendor (consider alternatives)

---

### 6. Approved Vendors List

**Pre-approved vendors** can be purchased without full evaluation (Tiers 2-3 still require approval, but Finance fast-tracks approval).

**Category: Communication**
- Slack (up to $20K/year) — Pre-approved enterprise tool
- Zoom (up to $10K/year) — Pre-approved enterprise tool
- Google Workspace (no limit) — Pre-approved enterprise-wide

**Category: Productivity**
- Notion (up to $5K/year)
- Miro (up to $3K/year)
- Grammarly (up to $1K/year)

**Category: Development**
- GitHub (no limit) — Pre-approved engineering-wide
- Figma (up to $10K/year)
- Postman (up to $2K/year)

**Category: Marketing**
- HubSpot (no limit) — Pre-approved enterprise contract
- Canva (up to $5K/year)
- Mailchimp (up to $10K/year)

**Category: Sales**
- Salesforce (no limit) — Pre-approved enterprise contract
- LinkedIn Sales Navigator (up to $15K/year)

**Category: Finance**
- QuickBooks (no limit) — Pre-approved enterprise-wide
- Expensify (up to $5K/year)

**Category: HR**
- BambooHR (no limit) — Pre-approved enterprise-wide
- Gusto (no limit) — Pre-approved enterprise-wide

**Note**: Purchases exceeding listed limits require standard Tier 3 approval (even if vendor is pre-approved).

---

### 7. SaaS Registry (Central Tracking)

**All approved SaaS subscriptions** must be logged in the central SaaS Registry.

**Location**: [LINK TO GOOGLE SHEET / NOTION DATABASE / ZYLO / TORII]

**Required fields**:
- Tool name
- Vendor website
- Category (Project Management, CRM, etc.)
- Owner (department and person responsible)
- Pricing ($X/year)
- Seat count (if applicable)
- Contract start date
- Contract end date
- Renewal alert date (90 days before end date)
- Payment method (which corporate card / bank account)
- Status (Active / Canceled / Pending Renewal)

**Who updates**: Finance team (after approval)

**Frequency**: Real-time (every new purchase/cancellation logged immediately)

---

### 8. Shadow IT Enforcement

**Shadow IT** = SaaS purchases made without following this approval process.

#### Detection Methods

**Method 1: Credit card monitoring**
- Finance reviews all corporate credit card transactions weekly
- Flag any SaaS purchases (recurring charges, "Software" merchant category)
- If purchase wasn't approved: Contact employee and manager

**Method 2: Expense report audits**
- Finance reviews all expense reports containing SaaS purchases
- If purchase wasn't approved: Reject expense report (employee pays out-of-pocket)

**Method 3: SSO log monitoring**
- IT reviews Okta/Google Workspace OAuth-connected apps quarterly
- Flag unapproved apps: "Who authorized this?"
- Disable app access until approval is obtained

**Method 4: Quarterly SaaS audits**
- Finance runs full SaaS audit every 90 days (find all subscriptions)
- If shadow IT found: Trace back to purchaser, follow enforcement actions below

---

#### Enforcement Actions

**First offense**: Verbal warning
- Finance contacts employee and manager: "This purchase wasn't approved. Please follow the approval process in the future."
- Purchase is retroactively approved (if it meets criteria) or canceled (if redundant)

**Second offense**: Written warning
- Finance emails employee, manager, and HR: "This is the second unapproved purchase. Future violations may result in termination of subscription and expense reimbursement denial."
- Purchase is reviewed: If redundant or over-budget, subscription is canceled immediately

**Third offense**: Serious consequences
- Subscription is terminated immediately (employee's access disabled)
- Future expense reports for SaaS are auto-rejected (must get pre-approval for reimbursement)
- Manager is notified (may affect performance review)

---

### 9. Contract Renewal Process

**Goal**: Renegotiate every contract 90 days before expiration (never auto-renew).

#### 90 Days Before Renewal

**Action**: Finance sends email to vendor (disable auto-renewal):
```
Subject: Disable Auto-Renewal — [VENDOR] Contract

Hi [ACCOUNT MANAGER],

Our [VENDOR] contract expires on [DATE].

Per Section [X] of our contract, we're providing notice that we're disabling auto-renewal.

We'll reach out in 60 days to discuss renewal terms.

Thanks,
[FINANCE CONTACT]
```

---

#### 60 Days Before Renewal

**Action**: Finance sends renewal negotiation email (see [Negotiation Templates](negotiation-templates.md#template-2-contract-renewal-expiring-contract-leverage)):
- Request 10-20% discount
- Pull usage data (seat utilization, feature usage)
- Mention competitive alternatives (if applicable)

---

#### 30 Days Before Renewal

**Action**: Finance finalizes renewal terms:
- Lock in pricing (negotiate 10-20% discount)
- Sign renewed contract
- Update SaaS Registry (new end date, new pricing)

---

#### Renewal Alert System

**How**: Set Google Calendar reminders (90 days before each renewal date)
- 90 days before: Disable auto-renewal
- 60 days before: Start renewal negotiation
- 30 days before: Finalize renewal

**Who**: Finance team (SaaS Program Manager)

---

### 10. Seat Management Policy

**Goal**: Maintain 70-85% seat utilization (remove inactive users quarterly).

#### Quarterly Seat Audits (Every 90 Days)

**Process**:
1. **Pull usage reports** from all tools (active users in last 60 days)
2. **Identify inactive users** (0 logins in last 60 days)
3. **Confirm with managers**: "Is [USER] still using [TOOL]?"
4. **Remove inactive seats** (deprovision users, reduce seat count)
5. **Calculate savings** (seats removed × cost per seat)

**Responsibility**:
- Finance: Pull usage reports, calculate savings
- Managers: Confirm which users are inactive
- IT: Deprovision users (remove access)

**Timeline**: Completed within first 2 weeks of each quarter (Q1, Q2, Q3, Q4)

---

#### Automated Deprovisioning

**Goal**: Automatically remove SaaS access when employees leave.

**How**:
- Connect HR system (BambooHR, Workday, Rippling) to SaaS tools
- When employee is terminated in HR system: All SaaS accounts automatically deactivated within 24 hours
- Result: Inactive seats removed immediately (no manual intervention)

**Tools**: Okta Lifecycle Management, Rippling, Zapier

**ROI**: $50K-$200K/year savings (faster deprovisioning = fewer wasted seats)

---

### 11. Budget Allocation by Department

**Goal**: Hold departments accountable for SaaS spend.

**FY[YEAR] SaaS Budget**:

| Department | Budget | Notes |
|------------|--------|-------|
| Sales | $[X]/year | Salesforce, HubSpot, LinkedIn, etc. |
| Marketing | $[X]/year | HubSpot, Canva, Mailchimp, etc. |
| Engineering | $[X]/year | GitHub, Jira, Figma, AWS, Datadog, etc. |
| Operations | $[X]/year | Slack, Zoom, Google Workspace (company-wide) |
| Finance | $[X]/year | QuickBooks, Expensify, etc. |
| HR | $[X]/year | BambooHR, Gusto, etc. |
| **Total** | **$[TOTAL]/year** | |

**Governance**:
- Each department must stay within budget
- If department wants to exceed budget: Must request approval from CFO + justify ROI
- If department is under budget: Surplus can be carried forward to next fiscal year (or reallocated)

**Tracking**: Finance tracks actual spend vs budget monthly (reports to CFO/COO)

---

### 12. Quarterly SaaS Review

**Goal**: Maintain visibility and control of SaaS spend.

**Frequency**: Every 90 days (Q1, Q2, Q3, Q4)

**Agenda**:
1. **Audit**: Find all subscriptions (detect shadow IT)
2. **Usage analysis**: Check seat utilization, identify underutilized tools
3. **Zombie hunt**: Cancel tools with <10% utilization
4. **Seat cleanup**: Remove inactive users (quarterly seat audit)
5. **Renewal prep**: Identify contracts expiring in next 90 days (schedule negotiations)
6. **Budget review**: Actual spend vs budget by department (flag overages)
7. **Savings report**: Calculate savings from zombies canceled, seats reduced, renegotiations

**Attendees**: CFO, Finance team, IT/Ops team, Department heads (optional)

**Deliverable**: Quarterly SaaS Optimization Report (sent to CFO/COO)

---

### 13. Exceptions & Exemptions

#### When to Grant Exceptions

**Scenario 1: Urgent need (business-critical tool needed immediately)**
- Example: "We're launching a campaign tomorrow and need [TOOL] today"
- Process: Employee emails CFO directly (explain urgency)
- CFO can grant emergency approval (bypassing standard approval process)
- Finance logs purchase retroactively (within 48 hours)

**Scenario 2: Executive mandate**
- Example: CEO decides to use a specific tool company-wide
- Process: CEO notifies Finance (add to Approved Vendors List)
- No approval needed for this tool going forward

**Scenario 3: Free trials (no cost, testing only)**
- Example: "I want to test [TOOL] for 14 days (free trial)"
- Process: No approval needed for free trials
- If user wants to purchase after trial: Must follow standard approval process

---

### 14. Policy Violations & Consequences

**Violation 1: Purchasing without approval (shadow IT)**
- See Section 8: Shadow IT Enforcement

**Violation 2: Auto-renewal without renegotiation**
- Consequence: Finance contacts tool owner: "Why wasn't this renegotiated?"
- Owner must justify (if no good reason, owner's manager is notified)

**Violation 3: Exceeding department budget**
- Consequence: Finance flags to CFO (department head must explain overage)
- If overage is unapproved: No reimbursement (department pays out-of-pocket)

**Violation 4: Not removing inactive seats**
- Consequence: Finance removes seats unilaterally (after confirming with manager)
- Wasted seat cost is charged back to department budget (accountability)

---

### 15. Policy Review & Updates

**This policy is reviewed annually** (every January) by Finance + IT + Operations.

**Review process**:
1. Assess effectiveness (did we achieve goals? What worked? What didn't?)
2. Update approval thresholds (adjust Tier 1/2/3 thresholds based on company size)
3. Update Approved Vendors List (add new pre-approved vendors, remove outdated ones)
4. Update budget allocations (adjust department budgets for next fiscal year)
5. Publish updated policy (announce company-wide)

**Next review date**: [YYYY-MM-DD]

**Policy version**: v1.0

---

## Template 2: SaaS Spend Dashboard (Metrics Tracking)

**Purpose**: Track 10 key SaaS governance metrics monthly.

**Location**: [GOOGLE SHEETS / NOTION / LOOKER / TABLEAU]

### Monthly SaaS Metrics Dashboard

| Metric | This Month | Last Month | Trend | Target | Status |
|--------|------------|------------|-------|--------|--------|
| **1. Total SaaS Spend** | $[X] | $[Y] | [↑/↓/→] | <5% growth MoM | [✅/⚠️/❌] |
| **2. SaaS Spend per Employee** | $[X]/employee | $[Y]/employee | [↑/↓/→] | $4K-$8K/employee/year | [✅/⚠️/❌] |
| **3. Number of Subscriptions** | [X] | [Y] | [↑/↓/→] | <60 (for 100-200 employees) | [✅/⚠️/❌] |
| **4. Shadow IT %** | [X]% | [Y]% | [↑/↓/→] | <10% | [✅/⚠️/❌] |
| **5. Average Seat Utilization** | [X]% | [Y]% | [↑/↓/→] | 70-85% | [✅/⚠️/❌] |
| **6. Zombie Subscriptions** | [X] tools | [Y] tools | [↑/↓/→] | 0 | [✅/⚠️/❌] |
| **7. Contracts Expiring (next 90 days)** | [X] | [Y] | [↑/↓/→] | - | - |
| **8. Contracts Renegotiated (this quarter)** | [X] | [Y] | [↑/↓/→] | 100% of renewals | [✅/⚠️/❌] |
| **9. Average Renewal Discount** | [X]% | [Y]% | [↑/↓/→] | 10-20% | [✅/⚠️/❌] |
| **10. Savings from Optimization** | $[X] | $[Y] | [↑/↓/→] | 5-10% of total spend/quarter | [✅/⚠️/❌] |

**Status legend**:
- ✅ Green: On target
- ⚠️ Yellow: Off target (needs attention)
- ❌ Red: Critical (immediate action required)

---

## Template 3: Quarterly SaaS Optimization Report

**Purpose**: Report SaaS optimization results to CFO/COO quarterly.

**Template**:

```
=== Quarterly SaaS Optimization Report ===

**Period**: Q[X] FY[YEAR] ([START DATE] — [END DATE])

**Prepared by**: [FINANCE CONTACT]

**Date**: [YYYY-MM-DD]

---

## Executive Summary

**Highlights**:
- Total SaaS spend: $[X]/quarter ($[Y]/year run rate)
- Savings this quarter: $[Z]/quarter ($[W]/year run rate)
- Seat utilization: [X]% (target: 70-85%)
- Shadow IT: [Y] subscriptions found (target: 0)
- Contracts renegotiated: [Z] (target: 100% of renewals)

**Key wins**:
- [SPECIFIC WIN 1]: Saved $[X]/year by [ACTION]
- [SPECIFIC WIN 2]: Saved $[Y]/year by [ACTION]
- [SPECIFIC WIN 3]: Saved $[Z]/year by [ACTION]

**Areas for improvement**:
- [ISSUE 1]: [DESCRIPTION] — [ACTION PLAN]
- [ISSUE 2]: [DESCRIPTION] — [ACTION PLAN]

---

## Detailed Metrics

### 1. SaaS Spend by Department

| Department | Q[X] Spend | Budget | Variance | Status |
|------------|------------|--------|----------|--------|
| Sales | $[X] | $[Y] | [+/-]$[Z] ([%]%) | [✅/⚠️/❌] |
| Marketing | $[X] | $[Y] | [+/-]$[Z] ([%]%) | [✅/⚠️/❌] |
| Engineering | $[X] | $[Y] | [+/-]$[Z] ([%]%) | [✅/⚠️/❌] |
| Operations | $[X] | $[Y] | [+/-]$[Z] ([%]%) | [✅/⚠️/❌] |
| Finance | $[X] | $[Y] | [+/-]$[Z] ([%]%) | [✅/⚠️/❌] |
| HR | $[X] | $[Y] | [+/-]$[Z] ([%]%) | [✅/⚠️/❌] |
| **Total** | **$[X]** | **$[Y]** | **[+/-]$[Z]** | |

---

### 2. Top 10 Vendors by Spend

| Vendor | Category | Q[X] Spend | Change from Q[X-1] | Notes |
|--------|----------|------------|-------------------|-------|
| Salesforce | CRM | $[X] | [↑/↓/→] [%]% | [NOTES] |
| AWS | Infrastructure | $[X] | [↑/↓/→] [%]% | [NOTES] |
| HubSpot | Marketing | $[X] | [↑/↓/→] [%]% | [NOTES] |
| Google Workspace | Productivity | $[X] | [↑/↓/→] [%]% | [NOTES] |
| Slack | Communication | $[X] | [↑/↓/→] [%]% | [NOTES] |
| ... | ... | ... | ... | ... |

---

### 3. Zombie Subscriptions Canceled

| Tool | Annual Cost | Utilization | Owner | Date Canceled | Savings |
|------|-------------|-------------|-------|---------------|---------|
| Asana | $10K | 7% (2/30 users) | Marketing | [DATE] | $10K/year |
| Typeform | $4K | 0% (0/10 users) | Sales | [DATE] | $4K/year |
| Hootsuite | $6K | 20% (1/5 users) | Marketing | [DATE] | $6K/year |
| **Total** | **$20K** | - | - | - | **$20K/year** |

---

### 4. Seat Optimization

| Tool | Paid Seats | Active Users | Utilization | Seats Removed | Savings |
|------|------------|--------------|-------------|---------------|---------|
| Salesforce | 80 | 62 | 78% | 18 | $32.4K/year |
| HubSpot | 50 | 38 | 76% | 12 | $14.4K/year |
| Slack | 120 | 105 | 88% | 15 | $2.7K/year |
| **Total** | **250** | **205** | **82%** | **45** | **$49.5K/year** |

---

### 5. Contract Renegotiations

| Vendor | Old Cost | New Cost | Discount | Method | Owner | Savings |
|--------|----------|----------|----------|--------|-------|---------|
| Salesforce | $180K/year | $150K/year | 17% | Multi-year (3 years) | Sales | $30K/year |
| HubSpot | $75K/year | $60K/year | 20% | Competitive quote + end-of-quarter | Marketing | $15K/year |
| AWS | $120K/year | $105K/year | 13% | Volume discount | Engineering | $15K/year |
| **Total** | **$375K/year** | **$315K/year** | **16% avg** | - | - | **$60K/year** |

---

### 6. Shadow IT Detected

| Tool | Owner | Department | Cost | Status | Action |
|------|-------|------------|------|--------|--------|
| Canva Pro | [NAME] | Marketing | $15/month | Retroactively approved | Added to registry |
| Typeform | [NAME] | Sales | $50/month | Canceled (redundant with Google Forms) | Subscription terminated |
| **Total** | - | - | $65/month | - | - |

---

## Savings Summary

| Category | Savings (Annual) |
|----------|------------------|
| Zombie subscriptions | $20K/year |
| Seat optimization | $49.5K/year |
| Contract renegotiations | $60K/year |
| Consolidations | $0 (none this quarter) |
| Multi-currency optimization | $0 (none this quarter) |
| **Total** | **$129.5K/year** |

---

## Next Quarter Priorities

1. **Consolidation**: Evaluate consolidating [TOOL A] + [TOOL B] → [TOOL C] (potential $[X]K savings)
2. **Multi-currency optimization**: Switch [VENDOR] from USD to SGD pricing (potential $[Y]K savings)
3. **Renewal prep**: [Z] contracts expiring in Q[NEXT] — start negotiations now
4. **Automation**: Implement Okta Lifecycle Management (auto-deprovision users on termination)

---

## Recommendations

1. **[RECOMMENDATION 1]**: [DESCRIPTION] — Expected savings: $[X]/year
2. **[RECOMMENDATION 2]**: [DESCRIPTION] — Expected savings: $[Y]/year
3. **[RECOMMENDATION 3]**: [DESCRIPTION] — Expected savings: $[Z]/year

---

**Questions?** Contact [FINANCE CONTACT] at [EMAIL]

```

---

## Next Steps

**Step 1**: Customize [Template 1: Complete SaaS Procurement Policy](#template-1-complete-saas-procurement-policy-ready-to-implement) for your company

**Step 2**: Get executive buy-in (CFO/COO must endorse policy)

**Step 3**: Announce policy company-wide (all-hands meeting + email + Slack)

**Step 4**: Set up infrastructure:
- SaaS Purchase Request Form (Google Form or Notion)
- SaaS Registry (Google Sheet or Notion)
- Renewal Calendar (Google Calendar)

**Step 5**: Run first quarterly review (audit → seat cleanup → zombie hunt)

**Step 6**: Track metrics monthly using [Template 2: SaaS Spend Dashboard](#template-2-saas-spend-dashboard-metrics-tracking)

**Step 7**: Report results quarterly using [Template 3: Quarterly SaaS Optimization Report](#template-3-quarterly-saas-optimization-report)

---

**Ready to implement SaaS governance?** Start with [Template 1: Complete SaaS Procurement Policy](#template-1-complete-saas-procurement-policy-ready-to-implement). 🚀
