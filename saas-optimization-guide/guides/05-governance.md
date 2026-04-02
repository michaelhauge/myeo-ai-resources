# Step 5: Governance & Prevention

**Time required**: 1-2 hours setup, 30 minutes/quarter ongoing
**Prerequisites**: Completed optimization (consolidation + negotiation)
**Output**: Policies and processes to prevent future SaaS sprawl

---

## Why Governance Matters

**The problem**: Without governance, SaaS sprawl returns in 12-18 months

**Common causes of re-sprawl**:
- Departments buy tools without approval (shadow IT)
- Free trials convert to paid, never canceled
- No process to remove licenses when employees leave
- No annual review of tool usage and costs
- No centralized visibility into SaaS spend

**Result**: All your optimization work undone in 1-2 years

---

## Governance Framework

### 1. Procurement Approval

**Policy**: All new SaaS purchases require approval

**Approval tiers**:
- <$50/month: Manager approval
- $50-500/month: Department head approval
- >$500/month: CFO/CEO approval

**Approval process**:
1. Employee submits request via form (see template below)
2. IT checks if we already have tool that does this
3. Finance checks budget impact
4. Approver makes decision within 2 business days

**Request form template**:
```
Tool name: [e.g., Figma]
Vendor: [e.g., Figma Inc.]
Monthly cost: [e.g., $15/user × 5 users = $75/month]
Annual cost: [e.g., $900/year]
Why we need it: [e.g., Design team needs collaborative design tool]
Alternatives considered: [e.g., Canva (too basic), Adobe XD (expensive)]
Users: [e.g., 5 designers]
Integration requirements: [e.g., None, Slack, Google Drive]
Data sensitivity: [e.g., Low - design files only]
Trial period: [e.g., Used 14-day trial, team loved it]
```

**Implementation**:
- Simple: Google Form → sends email to approvers
- Advanced: Use approval workflow tool (Zapier, n8n, Make)

---

### 2. Renewal Review

**Policy**: Review all SaaS tools quarterly

**Quarterly review checklist**:
- [ ] Pull usage data from SSO (who's logging in?)
- [ ] Identify unused licenses (no login in 90 days)
- [ ] Remove inactive users
- [ ] Check for duplicate tools (new purchases overlapping with existing)
- [ ] Update renewal calendar
- [ ] Flag upcoming renewals (60 days out) for negotiation

**When**: First week of each quarter (January, April, July, October)

**Owner**: CFO or Head of IT

**Time required**: 1-2 hours per quarter

---

### 3. Offboarding Process

**Policy**: Remove SaaS access when employees leave

**Offboarding checklist**:
- [ ] Disable SSO access (Okta, Google Workspace, Azure AD)
- [ ] Remove from communication tools (Slack, Teams, Zoom)
- [ ] Remove licenses from paid tools
- [ ] Transfer ownership of files/projects
- [ ] Export any critical data
- [ ] Update seat counts at next renewal

**When**: Day 1 after employee departure

**Owner**: IT or People Ops

**Automation**: Use SSO deprovisioning (SCIM) to auto-remove access

**Savings**: Removing licenses for departed employees can save $50-200/month per person

---

### 4. Consolidation First

**Policy**: Before buying new tool, check if existing tool can do it

**Decision tree**:
```
1. Do we already have a tool that does this?
   → Yes: Use existing tool (deny new request)
   → No: Continue to #2

2. Does our all-in-one platform (Zoho, Microsoft 365, Google Workspace) have this feature?
   → Yes: Use platform feature (deny new request)
   → No: Continue to #3

3. Can we get this feature by upgrading existing tool?
   → Yes: Evaluate cost of upgrade vs new tool
   → No: Continue to #4

4. Is there a free alternative that's good enough?
   → Yes: Use free alternative
   → No: Approve new tool purchase
```

**Example**:
- Request: "We need SurveyMonkey for customer surveys"
- IT checks: "Google Forms (which we already have) can do this"
- Decision: Denied - use Google Forms instead

---

### 5. Annual Audit

**Policy**: Repeat full SaaS audit annually

**Annual audit process** (see [06-annual-review.md](./06-annual-review.md)):
1. Rebuild SaaS inventory (find new tools added during year)
2. Score all tools using 5-dimension framework
3. Identify consolidation opportunities
4. Negotiate upcoming renewals
5. Update governance policies based on learnings

**When**: Same month each year (e.g., January)

**Owner**: CFO or Operations Manager

**Time required**: 8-16 hours (same as initial audit)

**Expected savings**: Recapture 10-20% of SaaS spend that crept back during the year

---

## Governance Tools

### Tool 1: Centralized Dashboard

**Purpose**: Single view of all SaaS tools, costs, renewals

**Options**:
- **Simple**: Google Sheets (our [saas-inventory.csv](../templates/saas-inventory.csv))
- **Medium**: Airtable (database with reminders)
- **Advanced**: SaaS management platform (Torii, Zylo, Productiv)

**What to track**:
- Tool name, vendor, category
- Monthly cost, annual cost
- Users licensed, users active
- Renewal date, contract length
- Owner, approval date

---

### Tool 2: Renewal Calendar

**Purpose**: Never miss a renewal (60-day negotiation window)

**Options**:
- **Simple**: Google Calendar with renewal events
- **Medium**: Our [renewal-calendar.csv](../templates/renewal-calendar.csv)
- **Advanced**: Our [renewal-tracker.py](../scripts/renewal-tracker.py) (automated email reminders)

**Setup**:
1. Export renewal dates from SaaS inventory
2. Create calendar event 60 days before each renewal
3. Set reminder email 7 days before event

**Benefit**: Start negotiations 60 days before renewal (optimal timing)

---

### Tool 3: Approval Workflow

**Purpose**: Enforce procurement approval policy

**Options**:
- **Simple**: Google Form → email to approvers
- **Medium**: Zapier/n8n workflow (form → check budget → notify approvers)
- **Advanced**: Procurement tool (Vendr, Zip, Intello)

**Simple setup**:
1. Create Google Form with request template
2. Form submission sends email to approver
3. Approver replies "Approved" or "Denied"
4. IT adds tool to inventory if approved

---

### Tool 4: SSO Deprovisioning

**Purpose**: Auto-remove SaaS access when employee leaves

**Setup** (if using Okta, Google Workspace, Azure AD):
1. Enable SCIM provisioning for each SaaS tool
2. When user removed from SSO, they're auto-removed from all apps
3. No manual cleanup needed

**Benefit**: Prevent paying for departed employees' licenses

---

## Governance Policies Document

Create a simple 1-page policy document:

```markdown
# SaaS Governance Policy

## Procurement Approval

All new SaaS purchases require approval:
- <$50/month: Manager approval
- $50-500/month: Department head approval
- >$500/month: CFO approval

Submit requests via: [Link to Google Form]

## Quarterly Review

CFO reviews all SaaS tools each quarter (Jan, Apr, Jul, Oct):
- Remove unused licenses
- Check for duplicates
- Update renewal calendar

## Offboarding

IT removes all SaaS access within 24 hours of employee departure.

## Consolidation First

Before requesting new tool, check:
1. Do we already have this?
2. Can existing tool do this?
3. Does Microsoft 365 / Google Workspace have this feature?

## Annual Audit

Full SaaS audit conducted every January:
- Rebuild inventory
- Score all tools
- Negotiate renewals
- Consolidate overlaps
```

**Distribution**: Send to all employees, add to employee handbook

---

## Common Governance Challenges

### Challenge 1: "Employees bypass approval and buy tools anyway"

**Solution**:
- Block personal credit cards from expensing SaaS (finance policy)
- Monitor corporate card charges weekly (catch unauthorized purchases)
- SSO requirement (can't use tool without IT setup)
- Culture shift (explain why governance matters)

---

### Challenge 2: "Quarterly reviews are too time-consuming"

**Solution**:
- Automate usage reporting (SSO exports active users)
- Only review tools >$100/month (80% of spend, 20% of tools)
- Delegate to department heads (they review their teams' tools)

---

### Challenge 3: "No one follows the approval process"

**Solution**:
- Get CEO/CFO buy-in (send company-wide email)
- Enforce consequences (deny expense reimbursement for unapproved tools)
- Make approval fast (2 business day SLA)
- Show ROI (share savings from governance)

---

### Challenge 4: "We don't have IT staff to enforce this"

**Solution**:
- Finance owns governance (CFO reviews quarterly)
- Automate where possible (SSO deprovisioning, renewal reminders)
- Start simple (just track renewals and review quarterly)

---

## Governance Metrics

Track these metrics to measure governance success:

### 1. SaaS Spend Trend

**Metric**: Total SaaS spend per month

**Target**: Flat or declining (after optimization)

**How to measure**: Sum of all SaaS tools in inventory

**Red flag**: Spend increasing >10% year-over-year (sprawl returning)

---

### 2. Tool Count Trend

**Metric**: Number of active SaaS tools

**Target**: Stable (after consolidation)

**How to measure**: Count of tools in inventory

**Red flag**: Tool count increasing >15% year-over-year (shadow IT)

---

### 3. Utilization Rate

**Metric**: Active users / Licensed users (company-wide average)

**Target**: >75% (most licenses being used)

**How to measure**: Average utilization across all tools

**Red flag**: Utilization <60% (paying for too many unused licenses)

---

### 4. Shadow IT Rate

**Metric**: % of tools purchased without approval

**Target**: <10% (most purchases go through approval)

**How to measure**: Tools discovered in audit that weren't in approval system

**Red flag**: Shadow IT >25% (approval process not working)

---

## Quarterly Review Template

### Q1 Review (January)

**Tools reviewed**: [List top 20 by spend]

**Actions taken**:
- Removed 8 unused licenses from Slack → Save $58/month
- Canceled Trello (migrated to Asana) → Save $50/month
- Flagged HubSpot for renewal negotiation (March) → Target $200/month savings
- Approved new tool: Figma ($75/month for design team)

**Total savings**: $108/month

**Upcoming renewals (next 90 days)**:
- March 15: Asana ($250/month) - Negotiate 20% discount
- March 31: HubSpot ($900/month) - Q1 end, target 25% discount

---

### Q2 Review (April)

**Tools reviewed**: [List top 20 by spend]

**Actions taken**:
- Negotiated Asana renewal: $250 → $190 (24% discount) → Save $60/month
- Negotiated HubSpot renewal: $900 → $720 (20% discount) → Save $180/month
- Removed 3 departed employees' licenses → Save $120/month
- Denied request for Monday.com (use Asana instead)

**Total savings**: $360/month

**Upcoming renewals (next 90 days)**:
- June 15: Mailchimp ($100/month) - Consider Brevo migration
- June 30: Zoom ($150/month) - Q2 end, negotiate or switch to Google Meet

---

## What's Next

After setting up governance, you've completed the full optimization cycle:

1. ✅ **Discover** - Built SaaS inventory
2. ✅ **Analyze** - Scored tools, identified waste
3. ✅ **Optimize** - Consolidated, negotiated, canceled
4. ✅ **Govern** - Implemented policies to prevent re-sprawl

**Ongoing**: Quarterly reviews + Annual audit (see [06-annual-review.md](./06-annual-review.md))

**Total time commitment**: 8-16 hours initial audit + 2-4 hours/quarter ongoing

**Total savings**: 30-50% SaaS cost reduction, sustained long-term

---

## Related Resources

- **[06-annual-review.md](./06-annual-review.md)** - Yearly audit process
- **[renewal-calendar.csv](../templates/renewal-calendar.csv)** - Track renewal dates
- **[renewal-tracker.py](../scripts/renewal-tracker.py)** - Automated renewal reminders
- **[saas-inventory.csv](../templates/saas-inventory.csv)** - Central tracking spreadsheet
