# SaaS Audit Checklists & Templates

## 100-Point SaaS Audit Checklist

Use this comprehensive checklist to audit your entire SaaS stack. Each section worth specific points (total = 100 points).

**Scoring**:
- **90-100 points**: Excellent SaaS management (best-in-class)
- **75-89 points**: Good (minor gaps)
- **60-74 points**: Concerning (significant waste)
- **<60 points**: Critical (major optimization needed — likely wasting $200K-$2M+ annually)

---

### Section 1: Discovery & Inventory (20 points)

**Goal**: Find every SaaS subscription (including shadow IT)

- [ ] **5 pts** — Exported all credit card/bank transactions (last 12 months) and flagged recurring SaaS charges
- [ ] **3 pts** — Reviewed IT/procurement records for approved vendor list
- [ ] **3 pts** — Surveyed all department heads for tool usage
- [ ] **3 pts** — Checked SSO integration logs (Okta/OneLogin/Google) for connected apps
- [ ] **3 pts** — Analyzed expense reports for shadow IT (unapproved SaaS purchases)
- [ ] **3 pts** — Created complete vendor inventory spreadsheet (vendor name, cost, owner, contract end date)

**Deductions**:
- **-5 pts** if missing >20% of actual subscriptions (incomplete discovery)
- **-3 pts** if shadow IT not tracked (no visibility into unapproved purchases)

**Your Score**: _____ / 20

---

### Section 2: Cost Analysis (15 points)

**Goal**: Quantify exact spend per tool + total SaaS budget

- [ ] **5 pts** — Calculated annual cost for every tool (monthly × 12 or annual contract value)
- [ ] **3 pts** — Identified total annual SaaS spend (all tools combined)
- [ ] **3 pts** — Ranked vendors by spend (top 20 = 80% of spend)
- [ ] **2 pts** — Documented pricing model for each tool (per-seat, flat-rate, usage-based, tiered)
- [ ] **2 pts** — Tracked contract end dates (know when renewals happen)

**Deductions**:
- **-5 pts** if cost data is >20% inaccurate (don't know true spend)
- **-3 pts** if can't identify top 10 vendors by spend

**Your Score**: _____ / 15

---

### Section 3: Usage Analysis (25 points)

**Goal**: Identify unused, underutilized, over-provisioned tools

- [ ] **10 pts** — Pulled usage reports for top 20 vendors (active users, login frequency, feature adoption)
- [ ] **5 pts** — Calculated seat utilization % for all seat-based tools (active users ÷ paid seats)
- [ ] **5 pts** — Identified zombie subscriptions (0 active users in last 60-90 days)
- [ ] **3 pts** — Analyzed feature usage (which paid features are used vs ignored)
- [ ] **2 pts** — Tracked login frequency (DAU, WAU, MAU per tool)

**Deductions**:
- **-10 pts** if no usage data available (can't assess waste)
- **-5 pts** if usage data is >6 months old (stale analysis)

**Your Score**: _____ / 25

---

### Section 4: Optimization Opportunities (25 points)

**Goal**: Identify specific cost-saving actions

- [ ] **5 pts** — Identified all zombie subscriptions (tools to cancel immediately)
- [ ] **5 pts** — Identified seat over-provisioning (tools to reduce seat count)
- [ ] **4 pts** — Identified tier downgrade opportunities (paying for unused Enterprise features)
- [ ] **4 pts** — Identified duplicate/overlapping tools (consolidation opportunities)
- [ ] **4 pts** — Identified renegotiation opportunities (expiring contracts, never renegotiated)
- [ ] **3 pts** — Identified currency optimization opportunities (USD vs local currency)

**Deductions**:
- **-10 pts** if no optimization opportunities identified (means audit was too shallow)
- **-5 pts** if savings estimate not quantified (can't prioritize)

**Your Score**: _____ / 25

---

### Section 5: Implementation & Governance (15 points)

**Goal**: Execute optimizations + maintain savings long-term

- [ ] **5 pts** — Canceled zombie subscriptions (immediate savings realized)
- [ ] **3 pts** — Reduced seat counts on over-provisioned tools
- [ ] **3 pts** — Implemented procurement policy (require approval for SaaS purchases >$X)
- [ ] **2 pts** — Set up quarterly re-audit schedule (maintain governance)
- [ ] **2 pts** — Allocated SaaS costs by department (visibility + accountability)

**Deductions**:
- **-10 pts** if audit findings not acted upon (no savings realized)
- **-5 pts** if no governance in place (waste will return in 6-12 months)

**Your Score**: _____ / 15

---

### TOTAL SCORE: _____ / 100

**Interpretation**:
- **90-100**: Best-in-class SaaS management (minimal waste, strong governance)
- **75-89**: Good SaaS hygiene (minor optimization opportunities, $50K-$200K potential savings)
- **60-74**: Concerning (significant waste, $200K-$500K potential savings)
- **40-59**: Critical (major waste, $500K-$1M+ potential savings)
- **<40**: SaaS chaos (likely wasting 40-60% of budget, $1M-$2M+ potential savings)

---

## 30-Day Rapid Audit Checklist

**Use this for quick wins** (if you don't have 6 weeks for comprehensive audit).

### Week 1: Discovery

**Day 1-2: Financial Records**
- [ ] Export credit card statements (last 12 months) from all company cards
- [ ] Export bank account transactions (wire transfers)
- [ ] Highlight all recurring charges (look for $X.00/month patterns)
- [ ] Create vendor list in Google Sheets (3 columns: Vendor, Monthly Cost, Annual Cost)

**Day 3-4: IT & Department Survey**
- [ ] Request approved vendor list from IT department
- [ ] Email all department heads: "What SaaS tools does your team use?" (provide checkbox list)
- [ ] Check SSO admin panel (Okta/OneLogin/Google) for integrated apps
- [ ] Merge IT list + survey results into vendor inventory

**Day 5: Reconciliation**
- [ ] Compare financial records vs IT records vs survey results
- [ ] Flag discrepancies (tools in financial records but not IT records = shadow IT)
- [ ] Final vendor count: _____ total subscriptions
- [ ] **Deliverable**: Complete vendor inventory spreadsheet

---

### Week 2: Usage Analysis

**Day 6-7: Request Admin Access**
- [ ] Identify top 20 vendors by spend (these are your priorities)
- [ ] Request admin access from tool owners (or have them pull reports for you)
- [ ] If tool owner is unresponsive, reach out to vendor directly (some will provide usage reports)

**Day 8-10: Pull Usage Reports**
- [ ] For each top 20 vendor, export usage report (active users, last login date)
- [ ] Create usage analysis tab in spreadsheet (Vendor, Paid Seats, Active Users, Utilization %)
- [ ] Flag tools with <50% utilization (over-provisioned)
- [ ] Flag tools with 0% utilization (zombies)

**Day 11-12: Analysis & Prioritization**
- [ ] Calculate total wasted spend (zombies + over-provisioning)
- [ ] Rank optimization opportunities by savings (highest first)
- [ ] **Deliverable**: Usage analysis + prioritized savings opportunities

---

### Week 3: Quick Wins

**Day 13-15: Cancel Zombies**
- [ ] Confirm with department heads ("Are you still using [TOOL]? Usage shows 0 active users.")
- [ ] If confirmed unused: Cancel subscription (if monthly) or mark for non-renewal (if annual)
- [ ] Document cancellation (date, reason, approver)
- [ ] **Immediate savings realized**: $_____ annual run rate reduction

**Day 16-18: Reduce Seat Counts**
- [ ] For tools with <60% utilization, request seat reduction
- [ ] Formula: Target seat count = (Active users ÷ 0.8) rounded up (80% utilization target)
- [ ] Email vendor: "We'd like to reduce from X seats to Y seats effective [DATE]"
- [ ] Most vendors allow seat reductions at any time (pro-rated refund or credit)
- [ ] **Immediate savings realized**: $_____ annual run rate reduction

**Day 19: Renegotiate Expiring Contracts**
- [ ] Filter vendor list for contracts expiring in next 60 days
- [ ] Email vendors: "Our renewal is coming up. What's the best pricing you can offer for multi-year commitment?"
- [ ] Request 20-25% discount (see guides/03-negotiation-tactics.md)
- [ ] **Expected savings**: $_____ annual (if 20% discount achieved)

---

### Week 4: Strategic Planning

**Day 20-22: Consolidation Planning**
- [ ] Group tools by category (CRM, project management, communication, analytics, etc.)
- [ ] Identify duplicates (multiple tools in same category)
- [ ] Prioritize consolidation by ROI (savings ÷ migration effort)
- [ ] Create consolidation project plan (which tools to consolidate, timeline, owner)

**Day 23-24: Governance Setup**
- [ ] Draft procurement policy (require approval for SaaS purchases >$X/year)
- [ ] Set up quarterly re-audit calendar reminder
- [ ] Allocate SaaS costs by department (create accountability)
- [ ] **Deliverable**: 90-day SaaS optimization roadmap

**Day 25: Present Findings**
- [ ] Create executive summary (1-pager)
  - Total SaaS spend: $X
  - Immediate savings realized (Week 3): $Y
  - Additional savings potential (next 90 days): $Z
  - Recommended next steps
- [ ] Present to CFO/CEO (get buy-in for consolidation projects)

---

### Expected Outcomes (30-Day Rapid Audit)

**Immediate savings** (Week 3):
- Zombie subscription cleanup: $50K-$150K annual
- Seat reductions: $30K-$100K annual
- Quick renegotiations: $20K-$80K annual
- **Total**: $100K-$330K annual savings in 30 days

**Additional savings potential** (next 90 days):
- Vendor consolidation: $50K-$500K annual
- Comprehensive renegotiation: $100K-$500K annual
- Currency optimization: $30K-$150K annual
- **Total**: $180K-$1.15M additional savings

**Grand total potential**: $280K-$1.48M annual savings

**Time investment**: 40-60 hours (Finance/Ops team, part-time over 30 days)

**ROI**: 500-2,000% (assuming $50K blended cost)

---

## Shadow IT Detection Checklist

**Goal**: Find unapproved SaaS purchases (20-30% of actual spend)

### Method 1: Expense Report Analysis
- [ ] Export all expense reports (last 12 months)
- [ ] Filter for "Software", "Subscription", or common SaaS vendor names
- [ ] Look for recurring charges ($X/month patterns)
- [ ] Cross-reference with approved vendor list
- [ ] Flag unapproved tools (not on IT/finance list)
- [ ] **Found**: _____ shadow IT tools, $_____/year spend

### Method 2: Credit Card Analysis
- [ ] Export transactions from all company credit cards (including department cards)
- [ ] Search for known SaaS vendors (Salesforce, HubSpot, Slack, etc.)
- [ ] Search for recurring charge patterns
- [ ] Identify cardholders (who bought what?)
- [ ] **Found**: _____ shadow IT tools, $_____/year spend

### Method 3: SSO Login Tracking
- [ ] Access SSO admin panel (Okta, OneLogin, Google Workspace, Azure AD)
- [ ] Navigate to "Apps" or "Integrations" section
- [ ] Export list of OAuth-connected apps
- [ ] Cross-reference with approved vendor list
- [ ] Flag unapproved OAuth apps
- [ ] **Found**: _____ shadow IT tools (usage tracked via SSO)

### Method 4: Browser Extension Audit (Advanced)
- [ ] Deploy SaaS discovery browser extension (Torii, Productiv, or custom)
- [ ] Ask employees to install (voluntary or mandatory)
- [ ] Extension tracks which SaaS URLs are accessed
- [ ] Aggregate data shows which tools are being used
- [ ] **Found**: _____ shadow IT tools via browser tracking

### Method 5: Network Traffic Analysis (Advanced)
- [ ] IT team: Analyze outbound HTTP/HTTPS traffic from company network
- [ ] Identify SaaS API calls (common patterns: api.vendor.com, *.saas.com)
- [ ] Cross-reference with approved vendor list
- [ ] Flag unapproved API traffic
- [ ] **Found**: _____ shadow IT tools via network analysis

### Method 6: Anonymous Employee Survey
- [ ] Create anonymous survey: "What tools do you use that IT might not know about?"
- [ ] Provide amnesty ("We won't punish you, just want visibility")
- [ ] Send to all employees
- [ ] Aggregate responses
- [ ] **Found**: _____ shadow IT tools via survey

---

### Common Shadow IT Categories

**Marketing** (most common):
- [ ] Canva / Adobe Creative Cloud (design)
- [ ] Unbounce / Instapage (landing pages)
- [ ] Mailchimp / SendGrid (email marketing)
- [ ] Typeform / SurveyMonkey (surveys)
- [ ] Calendly / Chili Piper (scheduling)
- [ ] Buffer / Hootsuite (social media management)

**Sales**:
- [ ] LinkedIn Sales Navigator (prospecting)
- [ ] ZoomInfo / Apollo (contact data)
- [ ] Hunter.io / Clearbit (email lookup)
- [ ] Gong / Chorus (call recording)
- [ ] PandaDoc / DocuSign (contract management)

**Engineering**:
- [ ] GitHub Copilot (AI coding assistant)
- [ ] Postman (API testing)
- [ ] Heroku / Vercel / Netlify (hosting)
- [ ] Datadog / New Relic (monitoring)
- [ ] JetBrains / Visual Studio (IDEs)

**Operations**:
- [ ] Zapier / Make.com (automation)
- [ ] Airtable / Notion / Coda (databases)
- [ ] Loom (video recording)
- [ ] Miro / Figma (collaboration)
- [ ] Calendly (scheduling)

**Total Shadow IT Found**: _____ tools
**Total Shadow IT Spend**: $_____/year

---

## Zombie Subscription Recovery Checklist

**Goal**: Cancel unused tools (recover $50K-$200K annually)

### Step 1: Identify Zombies
- [ ] Filter usage analysis for tools with 0 active users (last 60 days)
- [ ] Or: Tools with <5% seat utilization
- [ ] Or: Department head confirms "we don't use that anymore"
- [ ] **Total zombies identified**: _____ tools

### Step 2: Confirm Before Canceling
- [ ] For each zombie tool, email department head: "Usage shows 0 active users for [TOOL]. Are you still using it?"
- [ ] Wait 3-5 days for response
- [ ] If no response, send follow-up
- [ ] **Confirmed unused**: _____ tools

### Step 3: Check Contract Type
For each confirmed zombie:
- [ ] Monthly subscription? → Can cancel immediately (no penalty)
- [ ] Annual subscription? → Mark for non-renewal (set calendar reminder)
- [ ] Multi-year subscription? → Calculate early termination cost (is it worth it?)

### Step 4: Cancel Monthly Subscriptions
- [ ] Log into each tool admin panel
- [ ] Navigate to Billing/Subscription settings
- [ ] Click "Cancel subscription" (effective immediately or end of billing cycle)
- [ ] Download final invoice (for records)
- [ ] Document cancellation (date, reason, approver, savings)
- [ ] **Monthly zombies canceled**: _____ tools, $_____/month saved

### Step 5: Mark Annual Subscriptions for Non-Renewal
- [ ] Set calendar reminder 30 days before renewal date
- [ ] When reminder fires: Email vendor "Please do not renew our subscription"
- [ ] Follow up to confirm cancellation
- [ ] Document non-renewal (date, reason, approver, savings)
- [ ] **Annual zombies marked for non-renewal**: _____ tools, $_____/year saved

### Step 6: Calculate Immediate Savings
- [ ] Add up all canceled monthly subscriptions × 12 = annual savings
- [ ] Add up all annual subscriptions marked for non-renewal = annual savings (when they expire)
- [ ] **Total zombie cleanup savings**: $_____/year

---

### Common Zombie Scenarios

**Scenario 1: Departed Employee Tool**
- **Symptom**: Tool is under someone's name who left company 6+ months ago
- **Action**: Check if anyone else uses it → if not, cancel
- **Example**: Ex-marketer's Canva subscription ($120/year) still active

**Scenario 2: Failed Project**
- **Symptom**: Tool was bought for specific project that ended/failed
- **Action**: Confirm project is complete → cancel tool
- **Example**: Event management tool ($500/year) for conference that was 1-time event

**Scenario 3: Team Switched Tools**
- **Symptom**: Team migrated to different tool but never canceled old one
- **Action**: Confirm new tool is working → cancel old one
- **Example**: Switched from Asana to Jira but Asana subscription ($1,200/year) still active

**Scenario 4: Founder/Executive Tool**
- **Symptom**: CEO/founder subscribed to something 2+ years ago, forgot about it
- **Action**: Ask if still needed → 90% of time it's not
- **Example**: CEO's LinkedIn Sales Navigator ($1,600/year) that was trial, never used after

**Scenario 5: Free Trial That Converted**
- **Symptom**: Team started free trial, never used it, auto-converted to paid
- **Action**: Cancel immediately (never actually onboarded)
- **Example**: Marketing tool free trial ($299/month) that auto-converted, no one noticed for 8 months

---

## Seat Utilization Optimization Checklist

**Goal**: Right-size seat counts (recover $50K-$150K annually)

### Step 1: Pull Active User Reports
For each seat-based tool:
- [ ] Request admin access (or have tool owner pull report)
- [ ] Export user list with "Last login date"
- [ ] Filter for users who haven't logged in 30+ days (inactive)
- [ ] **Tools analyzed**: _____ out of _____ seat-based tools

### Step 2: Calculate Utilization %
For each tool:
- [ ] Count active users (logged in last 30 days)
- [ ] Divide by paid seats
- [ ] Utilization % = (Active users ÷ Paid seats) × 100
- [ ] Flag tools with <60% utilization (over-provisioned)
- [ ] **Over-provisioned tools**: _____ tools

### Step 3: Identify Inactive Users
For each over-provisioned tool:
- [ ] List inactive users (name, email, department, last login)
- [ ] Categorize:
  - Departed employees (should be removed immediately)
  - Role changed (no longer needs access)
  - Switched to different tool (team migrated)
  - Never onboarded (was provisioned but never used)
- [ ] **Total inactive users**: _____ across all tools

### Step 4: Remove Inactive Users
- [ ] Deactivate users in tool admin panel (frees up seats)
- [ ] Or: Archive/suspend (keeps data but removes license cost)
- [ ] Document removal (user name, tool, date, reason)
- [ ] **Inactive users removed**: _____ users

### Step 5: Request Seat Reduction
- [ ] Calculate target seat count: (Active users ÷ 0.8) rounded up (80% utilization target)
- [ ] Email vendor: "We'd like to reduce from X seats to Y seats"
- [ ] Most vendors allow reductions anytime (pro-rated refund or credit to next invoice)
- [ ] Confirm new seat count + savings
- [ ] **Seat reductions requested**: _____ tools

### Step 6: Calculate Savings
For each tool:
- [ ] Old cost: [Old seat count] × [Cost per seat] × 12 months
- [ ] New cost: [New seat count] × [Cost per seat] × 12 months
- [ ] Savings: Old cost - New cost
- [ ] **Total seat optimization savings**: $_____/year

---

### Seat Utilization Targets

**Aim for 70-85% utilization**:
- Too low (<60%) = wasting money on unused seats
- Too high (>90%) = no buffer for growth (will need to buy more seats soon)
- Sweet spot = 70-85% (efficient but room for growth)

---

### Example: Salesforce Seat Optimization

**Before**:
- Paid seats: 100
- Active users (last 30 days): 65
- Utilization: 65%
- Cost: 100 seats × $150/month = $15,000/month = **$180,000/year**

**Actions**:
1. Identified 35 inactive users:
   - 15 departed employees (remove immediately)
   - 10 contractors who finished projects (remove)
   - 8 employees who switched roles (no longer need Salesforce)
   - 2 never onboarded (were provisioned but never logged in)
2. Removed 35 users from Salesforce (freed up seats)
3. Calculated new target: 65 active users ÷ 0.8 = 81 seats (80% utilization target)
4. Requested reduction from 100 → 81 seats

**After**:
- Paid seats: 81
- Active users: 65
- Utilization: 80% (optimal)
- Cost: 81 seats × $150/month = $12,150/month = **$145,800/year**

**Savings**: $180,000 - $145,800 = **$34,200/year** (19% reduction)

---

## Tier Downgrade Analysis Checklist

**Goal**: Stop paying for Enterprise features you don't use

### Step 1: Inventory Current Tiers
- [ ] For each major tool, document current tier (Starter, Professional, Enterprise, etc.)
- [ ] Note monthly/annual cost
- [ ] **Tools on Enterprise tier**: _____ tools

### Step 2: Compare Tier Features
For each Enterprise-tier tool:
- [ ] Go to vendor pricing page → download tier comparison PDF
- [ ] Or: Request from account manager
- [ ] Create spreadsheet: Feature name | Available in Professional? | Available in Enterprise? | Actually used?
- [ ] **Tier comparisons completed**: _____ tools

### Step 3: Analyze Feature Usage
For each Enterprise feature:
- [ ] Is this feature actually being used? (check usage reports)
- [ ] Ask power users: "Do you use [FEATURE]?"
- [ ] If unused: Mark for downgrade consideration
- [ ] If used: Keep Enterprise tier (feature is justified)
- [ ] **Enterprise features actually used**: _____% (if <50%, strong downgrade candidate)

### Step 4: Map Used Features to Tiers
- [ ] List all features your team actually uses
- [ ] Check which tier each feature is available in
- [ ] **Recommendation**: Lowest tier that includes all used features
- [ ] **Example**: If all used features are in Professional → downgrade from Enterprise

### Step 5: Assess Downgrade Risk
For each downgrade candidate:
- [ ] What features will we lose? (list them)
- [ ] Are they nice-to-have or critical?
- [ ] Can we work around missing features? (manual process, different tool, etc.)
- [ ] Get stakeholder approval (especially from power users)
- [ ] **Downgrade risk**: Low / Medium / High

### Step 6: Request Tier Downgrade
- [ ] Email vendor: "We'd like to downgrade from Enterprise to Professional effective [DATE]"
- [ ] Some vendors allow mid-contract downgrades (pro-rated refund)
- [ ] Others require waiting until renewal (mark calendar)
- [ ] Confirm new pricing + savings
- [ ] **Tier downgrades requested**: _____ tools

### Step 7: Calculate Savings
For each downgrade:
- [ ] Old cost: [Enterprise tier price] × 12 months
- [ ] New cost: [Professional tier price] × 12 months
- [ ] Savings: Old cost - New cost
- [ ] **Total tier downgrade savings**: $_____/year

---

### Common Tier Downgrade Opportunities

| Tool | Enterprise Features Rarely Used | Downgrade Opportunity |
|------|--------------------------------|----------------------|
| **HubSpot** | Advanced reporting, custom objects, predictive lead scoring | Enterprise → Professional ($2,800/mo savings) |
| **Salesforce** | Advanced forecasting, AI features, custom app development | Enterprise → Professional ($150/user → $75/user) |
| **Slack** | Enterprise Key Management, data residency, advanced compliance | Business+ → Business ($7.50/user savings) |
| **Zoom** | Webinar capacity >500, cloud recording transcription, advanced analytics | Enterprise → Business ($10/user savings) |
| **Monday.com** | Advanced integrations, automations >250/month, advanced reporting | Enterprise → Pro ($8/user savings) |

---

## Vendor Consolidation Quick Assessment

**Goal**: Identify which duplicate tools to consolidate (40-60% savings potential)

### Step 1: Group Tools by Category
- [ ] CRM: _____ tools (list them)
- [ ] Marketing automation: _____ tools
- [ ] Project management: _____ tools
- [ ] Communication: _____ tools
- [ ] Analytics: _____ tools
- [ ] Customer support: _____ tools
- [ ] HR/Benefits: _____ tools
- [ ] Finance/Accounting: _____ tools
- [ ] Other: _____ tools

### Step 2: Identify Duplicates
For each category with 2+ tools:
- [ ] Why do we have multiple tools? (different teams, different use cases, or true duplication?)
- [ ] Can we consolidate to 1 tool? (or 2 if use cases genuinely differ)
- [ ] **Consolidation candidates**: _____ opportunities

### Step 3: Prioritize by ROI
For each consolidation candidate:
- [ ] Calculate potential savings (eliminate redundant tools)
- [ ] Estimate migration effort (Low / Medium / High)
- [ ] ROI = Savings ÷ Effort
- [ ] Rank by ROI (highest first)
- [ ] **Top 3 consolidation priorities**:
  1. _____ (savings: $_____, effort: _____)
  2. _____ (savings: $_____, effort: _____)
  3. _____ (savings: $_____, effort: _____)

### Step 4: Plan Migration
For each consolidation project:
- [ ] Which tool will we consolidate TO? (keep the most feature-rich or widely adopted)
- [ ] Which tools will we eliminate?
- [ ] What's the migration process? (data export → import → user training)
- [ ] Timeline: _____ weeks
- [ ] Owner: _____

**See**: [Vendor Consolidation Guide](../guides/02-vendor-consolidation.md) for detailed consolidation playbook

---

## Next Steps After Completing Checklists

**You've completed the audit checklists. Now what?**

1. **Immediate actions** (Week 1-2):
   - Cancel zombie subscriptions
   - Reduce over-provisioned seat counts
   - **Expected savings**: $100K-$350K annually

2. **Short-term actions** (Month 1-2):
   - Renegotiate expiring contracts (see [Negotiation Guide](../guides/03-negotiation-tactics.md))
   - Switch to local currency pricing (see [Multi-Currency Guide](../guides/04-multi-currency.md))
   - **Expected savings**: $150K-$700K additionally

3. **Medium-term actions** (Month 2-4):
   - Execute vendor consolidation projects (see [Consolidation Guide](../guides/02-vendor-consolidation.md))
   - **Expected savings**: $50K-$500K additionally

4. **Ongoing governance** (Month 3+):
   - Implement procurement policies
   - Set up quarterly re-audits
   - **See**: [Governance Guide](../guides/05-governance.md)

**Total expected savings**: $300K-$1.5M+ annually (30-50% SaaS cost reduction)
