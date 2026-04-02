# SaaS Audit & Discovery: The Complete Framework

## Why SaaS Audits Matter

**The hidden cost of not auditing**:
- $50K-$200K wasted annually on zombie subscriptions (tools no one uses)
- 20-30% of actual spend is "shadow IT" (unapproved purchases you don't know about)
- 30-40% seat over-provisioning (paying for 100 seats when only 60 are active)
- Duplicate tools across departments (sales and marketing both buy separate CRMs)

**What a proper audit finds**:
- Every SaaS subscription (including shadow IT)
- Exact cost per tool (annual vs monthly vs usage-based)
- Usage metrics (active users, login frequency, feature adoption)
- Duplicate/overlapping capabilities
- Optimization opportunities ($200K-$2M+ in savings)

---

## The 4-Step SaaS Audit Process

### Step 1: Discovery (Find Every Subscription)
**Goal**: Create complete inventory of all SaaS tools

**Time**: 3-5 days

**Methods**:
1. **Financial records** (most reliable)
   - Export all credit card transactions (last 12-24 months)
   - Export all bank wire transfers
   - Flag recurring charges (monthly/annual patterns)
   - Common SaaS charge patterns: "$X.00/month", "SALESFORCE", "GSUITE", etc.

2. **IT/Procurement records**
   - Request approved vendor list from IT
   - Check procurement system (if you have one)
   - Review IT help desk tickets (people asking for tool access)

3. **Department surveys**
   - Email all department heads: "What tools does your team use?"
   - Include: CRM, marketing automation, analytics, project management, communication, HR, finance
   - Provide list of known tools (easier to check boxes than recall from memory)

4. **Browser extension audit** (advanced)
   - Ask employees to install SaaS audit browser extension (e.g., Torii, Productiv)
   - Tracks which SaaS apps are accessed via web browser
   - Finds shadow IT (tools not in financial records yet)

5. **SSO integration logs** (if using Okta/OneLogin/Google SSO)
   - Check SSO admin panel for list of integrated apps
   - Shows which tools employees are logging into

**Expected findings**:
- $1M-$5M ARR company: 30-80 SaaS subscriptions
- $5M-$20M ARR company: 80-150 subscriptions
- $20M-$50M ARR company: 150-300+ subscriptions

**Output**: Complete vendor inventory spreadsheet

---

### Step 2: Cost Analysis (Quantify Total Spend)
**Goal**: Calculate exact annual cost for each tool

**Time**: 2-3 days

**Data to collect per vendor**:
- Subscription type (monthly, annual, usage-based)
- Number of seats/licenses purchased
- Cost per seat (or total cost if not seat-based)
- Annual cost (monthly × 12 or annual contract value)
- Contract end date (when does renewal happen?)
- Payment method (credit card, wire, invoice)
- Department owner (who uses this tool?)

**Pricing model types**:
1. **Per-seat** (most common) — Pay per user (e.g., Salesforce $150/user/month)
2. **Flat-rate** — Pay fixed price regardless of users (e.g., Slack $6,250/month for unlimited users)
3. **Usage-based** — Pay based on activity (e.g., AWS $X per GB storage, Twilio $X per SMS)
4. **Tiered** — Different pricing tiers (Starter/Professional/Enterprise)
5. **Freemium** — Free tier + paid upgrades

**Common cost traps**:
- **Annual paid monthly** — Looks like $100/month but actually $1,200/year contract (can't cancel mid-year)
- **Auto-renewal** — Renews automatically without notification (you forget to cancel)
- **Hidden fees** — Implementation fees, support fees, overage charges
- **Seat creep** — Start with 10 seats, now paying for 50 (no one removed departing employees)

**Output**: Cost analysis spreadsheet with total annual spend + cost per tool

---

### Step 3: Usage Analysis (Who's Actually Using What?)
**Goal**: Identify unused, underutilized, and over-provisioned tools

**Time**: 5-7 days (requesting admin access + pulling reports)

**Data to collect per tool**:
1. **Active users** (last 30 days)
   - How many users logged in?
   - How many seats are paid for but unused?
   - Seat utilization % = (Active users ÷ Paid seats) × 100

2. **Login frequency**
   - Daily active users (DAU)
   - Weekly active users (WAU)
   - Monthly active users (MAU)
   - Red flag: MAU <20% of paid seats (tool not sticky)

3. **Feature usage**
   - Which features are being used?
   - Which paid features are ignored?
   - Red flag: Paying for Enterprise tier but only using Starter features

4. **Department usage**
   - Which teams use this tool?
   - Is it company-wide or team-specific?
   - Red flag: Tool bought for "everyone" but only 1 team uses it

**How to get usage data**:
- **Method 1**: Request admin access from tool owner → pull usage report from admin panel
- **Method 2**: Ask vendor for usage report (many vendors will send CSV on request)
- **Method 3**: Use SaaS management platform (Torii, Productiv, Zylo) — aggregates usage across all tools

**Benchmarks for utilization**:
- **>80%**: Excellent (tool is well-adopted)
- **60-80%**: Good (acceptable utilization)
- **40-60%**: Concerning (over-provisioned, could reduce seats)
- **20-40%**: Poor (consider downgrading tier or consolidating)
- **<20%**: Critical (zombie tool — cancel or dramatically reduce)

**Output**: Usage analysis spreadsheet with seat utilization, login frequency, feature adoption

---

### Step 4: Opportunity Identification (Where to Optimize)
**Goal**: Prioritize optimization opportunities by ROI

**Time**: 2-3 days

**Optimization categories**:

#### **Category 1: Zombie Subscriptions** (immediate savings)
**Definition**: Tools with 0 active users in last 30-90 days

**How to find**: Filter usage analysis for tools with 0% utilization

**Action**: Cancel immediately

**Expected savings**: $50K-$200K annually (10-20% of total SaaS spend)

**Example**: You're paying $5,000/year for an analytics tool that no one has logged into for 6 months → Cancel → $5K saved

---

#### **Category 2: Seat Over-Provisioning** (quick win)
**Definition**: Tools where paid seats significantly exceed active users

**How to find**: Filter usage analysis for tools with <60% seat utilization

**Action**: Reduce seat count to match active users + 10% buffer

**Expected savings**: $50K-$150K annually (varies by tool)

**Example**:
- Current: Paying for 100 Salesforce seats at $150/month/user = $180,000/year
- Actual: Only 65 users logged in (last 30 days)
- Action: Reduce to 70 seats (65 active + 5 buffer) = $126,000/year
- **Savings**: $54,000/year (30% reduction)

---

#### **Category 3: Tier Downgrade** (moderate effort)
**Definition**: Tools where you're on Enterprise tier but only using Professional features

**How to find**: Review feature usage reports, compare to tier feature lists

**Action**: Downgrade to lower tier (if features suffice)

**Expected savings**: $20K-$100K annually (varies by tool)

**Example**:
- Current: HubSpot Enterprise ($3,600/month) for marketing automation
- Actual usage: Only using email campaigns + landing pages (Professional tier features)
- Action: Downgrade to Professional ($800/month)
- **Savings**: $33,600/year (77% reduction on that tool)

**Risk**: Ensure no critical features are lost (get stakeholder approval)

---

#### **Category 4: Duplicate Tools** (consolidation opportunity)
**Definition**: Multiple tools across teams that do the same thing

**How to find**: Group tools by category (CRM, project management, etc.), look for overlap

**Action**: Consolidate to single tool (or 2 if use cases differ)

**Expected savings**: $50K-$500K annually (plus reduced complexity)

**Common duplicates**:
- **CRM**: Sales uses Salesforce, Marketing uses HubSpot, CS uses Zendesk
- **Project management**: Engineering uses Jira, Marketing uses Asana, Operations uses Monday
- **Communication**: Some teams on Slack, others on Microsoft Teams
- **Storage**: Dropbox + Google Drive + Box all in use

**Example**:
- Current: Salesforce ($180K/year) + HubSpot CRM ($50K/year) + Pipedrive ($10K/year) = $240K
- Action: Consolidate to Salesforce (already most expensive, most features)
- Migration: Export HubSpot/Pipedrive data → import to Salesforce
- **Savings**: $60K/year (25% reduction)

**Note**: Consolidation requires change management (teams resist switching tools)

---

#### **Category 5: Vendor Renegotiation** (no migration needed)
**Definition**: Tools where you're paying list price (or close to it)

**How to find**: Check if you've never renegotiated (original contract terms)

**Action**: Request 20-30% discount (see guides/03-negotiation-tactics.md)

**Expected savings**: $100K-$500K annually (10-20% of total spend)

**Example**:
- Current: Salesforce $180K/year (list price)
- Action: Negotiate multi-year deal + volume discount
- Result: $135K/year (25% discount)
- **Savings**: $45K/year

---

#### **Category 6: Currency Optimization** (SEA-specific)
**Definition**: Paying in USD when local currency (SGD/MYR) pricing is available

**How to find**: Check if vendor offers local currency pricing (Salesforce, HubSpot, Google do)

**Action**: Switch to local currency pricing (if cheaper after FX)

**Expected savings**: $50K-$200K annually (5-15% FX arbitrage)

**Example**:
- Current: Salesforce $180K/year (billed in USD)
- Local pricing: SGD $160K/year (Singapore company)
- **Savings**: $20K/year (11% FX savings)

**See**: [Multi-Currency Optimization Guide](04-multi-currency.md) for details

---

### Optimization Prioritization Matrix

**Prioritize by ROI** (Savings ÷ Effort):

| Category | Avg Savings | Effort | ROI | Priority |
|----------|-------------|--------|-----|----------|
| **Zombie subscriptions** | $50K-$200K | Low (1-2 days) | High | **1st** |
| **Seat over-provisioning** | $50K-$150K | Low (2-3 days) | High | **2nd** |
| **Vendor renegotiation** | $100K-$500K | Medium (1-2 weeks) | High | **3rd** |
| **Currency optimization** | $50K-$200K | Medium (2-3 weeks) | Medium | **4th** |
| **Tier downgrade** | $20K-$100K | Medium (1-2 weeks) | Medium | **5th** |
| **Duplicate consolidation** | $50K-$500K | High (4-8 weeks) | Medium | **6th** |

**Recommendation**: Start with low-effort/high-ROI (zombies, seat reductions) → move to medium-effort (negotiation, currency) → tackle high-effort consolidation last.

---

## SaaS Audit Spreadsheet Template

### Tab 1: Vendor Inventory

| Vendor Name | Category | Department | Contract Type | Seats | Cost/Seat | Annual Cost | Contract End | Payment Method |
|-------------|----------|------------|---------------|-------|-----------|-------------|--------------|----------------|
| Salesforce | CRM | Sales | Annual | 100 | $150 | $180,000 | Dec 31, 2026 | Credit card |
| HubSpot | Marketing | Marketing | Monthly | 25 | $200 | $60,000 | N/A (month-to-month) | Credit card |
| Slack | Communication | Company-wide | Annual | Unlimited | N/A | $75,000 | Jan 15, 2027 | Wire transfer |
| ... | ... | ... | ... | ... | ... | ... | ... | ... |

**Total Annual Spend**: $X

---

### Tab 2: Usage Analysis

| Vendor Name | Paid Seats | Active Users (30d) | Utilization % | Login Frequency | Feature Usage | Status |
|-------------|------------|-------------------|---------------|-----------------|---------------|--------|
| Salesforce | 100 | 68 | 68% | Daily (45), Weekly (15), Monthly (8) | Core CRM only (not using AI features) | 🟡 Reduce seats |
| HubSpot | 25 | 22 | 88% | Daily (18), Weekly (4) | Using all paid features | 🟢 Keep as-is |
| Notion | 50 | 5 | 10% | Weekly (3), Monthly (2) | Basic docs only | 🔴 Cancel (zombie) |
| ... | ... | ... | ... | ... | ... | ... |

**Status key**:
- 🟢 Keep as-is (>80% utilization, high value)
- 🟡 Optimize (reduce seats, downgrade tier)
- 🔴 Cancel/consolidate (zombie or duplicate)

---

### Tab 3: Optimization Opportunities

| Vendor Name | Opportunity Type | Current Cost | Optimized Cost | Savings | Effort | Priority | Owner |
|-------------|------------------|--------------|----------------|---------|--------|----------|-------|
| Notion | Cancel (zombie) | $5,000 | $0 | $5,000 | Low | 1 | Finance |
| Salesforce | Reduce seats (100→70) | $180,000 | $126,000 | $54,000 | Low | 1 | Sales Ops |
| HubSpot | Renegotiate (multi-year) | $60,000 | $45,000 | $15,000 | Medium | 2 | Marketing Ops |
| Jira+Asana | Consolidate to Jira | $25,000 | $15,000 | $10,000 | High | 3 | Eng+Marketing |
| ... | ... | ... | ... | ... | ... | ... | ... |

**Total Potential Savings**: $X

---

### Tab 4: Implementation Roadmap

| Optimization | Savings | Timeline | Status | Owner | Notes |
|--------------|---------|----------|--------|-------|-------|
| Cancel 12 zombie tools | $65,000 | Week 1-2 | ✅ Complete | Finance | Recovered $65K immediately |
| Reduce Salesforce seats | $54,000 | Week 3 | ⏳ In progress | Sales Ops | Waiting for seat removal approval |
| Renegotiate HubSpot | $15,000 | Week 4 | 📋 Planned | Marketing Ops | Renewal is in 45 days |
| ... | ... | ... | ... | ... | ... |

**Total Savings (YTD)**: $X

---

## Shadow IT Detection

**What is Shadow IT?**
- SaaS purchases made by departments without IT/finance approval
- Typically paid with personal credit cards (expensed) or department credit cards
- Common in marketing, sales, engineering (teams buy tools for themselves)

**Why it's a problem**:
- Security risk (IT doesn't know about these tools, can't audit/protect)
- Cost waste (departments buy duplicate tools, no central negotiation)
- Compliance risk (data stored in unapproved tools)
- Lack of visibility (CFO doesn't know true SaaS spend)

**How to detect shadow IT**:

### Method 1: Expense Report Analysis
- Export all expense reports (last 12 months)
- Filter for SaaS vendors (look for recurring charges like "$X/month")
- Common shadow IT categories: Marketing tools, analytics, collaboration

### Method 2: SSO Login Tracking
- If using Okta/OneLogin/Google SSO: Check for OAuth apps
- OAuth apps = SaaS tools employees logged into via SSO
- Many of these won't be in your approved vendor list

### Method 3: Browser Extension Audit
- Ask employees to install SaaS discovery extension (Torii, Productiv)
- Tracks which SaaS URLs are visited in browser
- Finds tools IT didn't know about

### Method 4: Network Traffic Analysis
- IT team: Analyze outbound traffic from company network
- Look for SaaS API calls (to vendors not on approved list)
- Advanced method, requires IT team involvement

### Method 5: Employee Survey
- Anonymous survey: "What tools do you use that IT might not know about?"
- Provide amnesty ("We won't punish you, just want to know")
- Surprisingly effective (people confess if no consequences)

**Common shadow IT tools**:
- **Marketing**: Canva, Unbounce, Mailchimp, Typeform, Calendly
- **Sales**: LinkedIn Sales Navigator, ZoomInfo, Apollo, Hunter.io
- **Engineering**: GitHub Copilot, Postman, Heroku, Vercel
- **Operations**: Zapier, Airtable, Notion, Coda
- **Design**: Figma, Adobe Creative Cloud, Sketch

**Shadow IT policy** (see templates/procurement-policies.md):
- Require finance/IT approval for SaaS purchases >$X/year
- Centralize payment (use company credit card, not personal)
- Regular audits (quarterly expense report reviews)

---

## Zombie Subscription Cleanup

**What is a zombie subscription?**
- Tool that no one uses anymore but you're still paying for
- Common causes: Team member who championed tool left company, project ended, team switched to different tool

**How to find zombies**:
- Filter usage analysis for tools with <5% seat utilization
- Or: 0 logins in last 60-90 days
- Or: Department head says "we don't use that anymore"

**Immediate action**:
1. Confirm with department head ("Are you still using [TOOL]?")
2. If "no" → Check if monthly or annual contract
3. If monthly → Cancel immediately
4. If annual → Mark for non-renewal (set calendar reminder)
5. Document cancellation (in case someone asks later)

**Expected recovery**: $50K-$200K (10-20% of total SaaS spend)

**Common zombie categories**:
- **Marketing experiments**: Tried a tool for campaign, never used again
- **Founder tools**: CEO subscribed to something 2 years ago, forgot about it
- **Departed employee tools**: Person left, tool still active under their name
- **Failed projects**: Started initiative, project failed, tool remains

**Example zombie cleanup** (Singapore SaaS company, $10M ARR):
- Found 28 zombie tools (out of 87 total subscriptions)
- Combined annual cost: $118,000
- Action: Canceled 22 immediately (monthly), marked 6 for non-renewal (annual)
- **Recovered**: $118K annual run rate savings

---

## Seat Utilization Optimization

**The seat over-provisioning problem**:
- You buy 100 seats of Salesforce for sales team (50 reps + 50 buffer)
- 6 months later: Only 65 reps active (turnover, slow hiring)
- You're paying for 35 unused seats = $63,000/year wasted

**How to optimize seat count**:

### Step 1: Pull active user report (last 30 days)
- Admin panel → Users → Filter by "Last login"
- Or: Request usage report from vendor

### Step 2: Identify inactive users
- **Inactive = no login in 30+ days** (or 60 days for seasonal tools)
- Common reasons: departed employees, role changed, switched to different tool

### Step 3: Remove inactive users
- Deactivate users in tool (frees up seats)
- Or: Request vendor to reduce seat count

### Step 4: Right-size seat count
- **Formula**: Active users + 10% buffer + expected growth (next 3 months)
- **Example**: 65 active users + 7 buffer + 8 expected hires = 80 seats (down from 100)

### Step 5: Monitor quarterly
- Set calendar reminder to review every 90 days
- Adjust seat count as team grows/shrinks

**Expected savings**: $50K-$150K annually (varies by tool)

**Seat utilization benchmarks**:
- **80-100%**: Excellent (fully utilized, might need more seats soon)
- **60-80%**: Good (reasonable buffer for growth)
- **40-60%**: Over-provisioned (reduce seats)
- **<40%**: Significantly over-provisioned (reduce by 30-50%)

**Example**:
- **Before**: 100 Salesforce seats @ $150/month = $180,000/year
- **Active users**: 68 (32% waste)
- **Action**: Reduce to 75 seats (68 active + 7 buffer)
- **After**: 75 seats @ $150/month = $135,000/year
- **Savings**: $45,000/year (25% reduction)

---

## Tier Downgrade Analysis

**The over-tiering problem**:
- You're on Enterprise tier ($5,000/month) for advanced features
- Actual usage: Only using Standard tier features ($1,000/month)
- Result: Paying $48,000/year for features you don't use

**How to identify tier downgrade opportunities**:

### Step 1: Review tier comparison
- Go to vendor's pricing page → compare tier features
- Or: Ask account manager for feature comparison doc

### Step 2: Analyze feature usage
- Check usage reports: Which features are being used?
- Interview power users: "What features do you actually need?"
- Common finding: 80% of value from 20% of features

### Step 3: Map features to tiers
- Create spreadsheet: Features used vs Tier they're available in
- Example: If all features used are in Professional tier, you don't need Enterprise

### Step 4: Assess downgrade risk
- What features will you lose?
- Are they critical or nice-to-have?
- Can you work around missing features?

### Step 5: Test downgrade (if possible)
- Ask vendor for 30-day trial of lower tier
- Pilot with small team before company-wide downgrade
- If pilot succeeds → downgrade everyone

**Expected savings**: $20K-$100K annually per tool

**Common tier downgrade scenarios**:

| Tool | Current Tier | Cost | Actual Usage | Recommended Tier | Savings |
|------|--------------|------|--------------|------------------|---------|
| HubSpot | Enterprise | $3,600/mo | Email + landing pages only | Professional | $33,600/year |
| Salesforce | Enterprise | $300/user | Core CRM + reports | Professional | $100/user = $120K/year (for 100 users) |
| Slack | Business+ | $12.50/user | Messaging only (not using advanced security) | Business | $5/user = $90K/year (for 200 users) |

**Risk mitigation**:
- Get stakeholder approval before downgrading (especially from power users)
- Document which features will be lost (create "known limitations" doc)
- Have rollback plan (can upgrade back if needed within 30 days)

---

## Department Cost Allocation

**Why allocate SaaS costs by department?**
- Visibility: Show department heads their SaaS spend
- Accountability: Teams manage budgets more carefully when cost is visible
- Budget planning: Forecast future spend by department
- Optimization prioritization: Focus on departments with highest waste

**How to allocate costs**:

### Method 1: Direct allocation (simplest)
- **Rule**: Charge tool cost to department that uses it
- **Example**: Salesforce → Sales department, HubSpot → Marketing department
- **Pro**: Simple, clear ownership
- **Con**: Doesn't work for shared tools (Slack used by everyone)

### Method 2: Usage-based allocation
- **Rule**: Allocate shared tool costs based on usage (seat count per department)
- **Example**: Slack has 200 users (100 Eng, 50 Sales, 30 Marketing, 20 Ops) → allocate Slack cost 50%/25%/15%/10%
- **Pro**: Fair (departments pay proportional to usage)
- **Con**: Requires tracking usage by department

### Method 3: Headcount-based allocation
- **Rule**: Allocate shared tool costs based on headcount %
- **Example**: Company has 200 employees (100 Eng, 50 Sales, 30 Marketing, 20 Ops) → allocate shared costs 50%/25%/15%/10%
- **Pro**: Simple, doesn't require usage tracking
- **Con**: Less accurate (assumes equal usage per employee)

**Recommended approach**: Hybrid
- Direct allocation for department-specific tools (CRM → Sales, Marketing automation → Marketing)
- Usage-based allocation for shared tools (Slack, Google Workspace, Zoom)
- Headcount-based allocation for company-wide tools without usage tracking (Benefits platform, HR tools)

**Department cost allocation spreadsheet**:

| Tool | Total Cost | Allocation Method | Sales | Marketing | Eng | Ops | Customer Success |
|------|------------|-------------------|-------|-----------|-----|-----|------------------|
| Salesforce | $180K | Direct | $180K | - | - | - | - |
| HubSpot | $60K | Direct | - | $60K | - | - | - |
| Slack | $75K | Usage-based | $19K (25%) | $15K (20%) | $30K (40%) | $8K (10%) | $3K (5%) |
| Google Workspace | $50K | Headcount-based | $12.5K (25%) | $12.5K (25%) | $25K (50%) | - | - |
| **Department Total** | **$365K** | - | **$211.5K** | **$87.5K** | **$55K** | **$8K** | **$3K** |

**How to present to department heads**:
1. Share department-specific cost breakdown (quarterly or annually)
2. Highlight optimization opportunities ("Your team can save $50K by reducing Salesforce seats")
3. Set department SaaS budgets (based on historical spend + growth expectations)
4. Track overspend ("Marketing is 20% over SaaS budget this quarter — let's discuss")

**Result**: Department heads become cost-conscious, proactively optimize their own tools

---

## Next Steps After Audit

**You've completed the audit. Now what?**

### Step 1: Implement quick wins (Week 1-2)
- Cancel zombie subscriptions (immediate $50K-$200K savings)
- Reduce seat counts on over-provisioned tools ($50K-$150K savings)
- Total quick wins: $100K-$350K annual savings

### Step 2: Tackle medium-effort optimizations (Month 1-2)
- Renegotiate expiring contracts ([Negotiation Tactics Guide](03-negotiation-tactics.md))
- Switch to local currency pricing ([Multi-Currency Guide](04-multi-currency.md))
- Downgrade over-tiered tools
- Total medium wins: $150K-$700K additional savings

### Step 3: Plan long-term consolidation (Month 2-4)
- Identify duplicate tools to consolidate ([Vendor Consolidation Guide](02-vendor-consolidation.md))
- Prioritize by ROI (savings ÷ migration effort)
- Create migration project plans
- Total consolidation: $50K-$500K additional savings (plus reduced complexity)

### Step 4: Implement ongoing governance (Month 3+)
- Procurement policies (require approval for SaaS purchases)
- Quarterly reviews (re-audit every 90 days)
- Budget planning (forecast future SaaS spend)
- See: [Ongoing Governance Guide](05-governance.md)

**Expected total savings**: $200K-$2M+ annually (30-50% cost reduction)

**Timeline**: 3-6 months from audit start to full optimization

---

## SaaS Audit Checklist

Use this checklist to track audit progress:

**Week 1: Discovery**
- [ ] Export credit card/bank transactions (12 months)
- [ ] Flag all recurring SaaS charges
- [ ] Request approved vendor list from IT
- [ ] Survey department heads for tool usage
- [ ] Check SSO logs (if using Okta/OneLogin)
- [ ] **Deliverable**: Complete vendor inventory (expect 30-300 tools)

**Week 2: Cost Analysis**
- [ ] Populate cost spreadsheet (vendor name, seats, cost, contract end date)
- [ ] Calculate total annual SaaS spend
- [ ] Identify top 20 vendors by spend (80/20 rule — 20% of vendors = 80% of spend)
- [ ] **Deliverable**: Cost analysis showing $X total annual spend

**Week 3-4: Usage Analysis**
- [ ] Request admin access to top 20 tools
- [ ] Pull usage reports (active users, login frequency, feature usage)
- [ ] Calculate seat utilization % for each tool
- [ ] Flag zombie subscriptions (0% usage)
- [ ] Flag over-provisioned tools (<60% seat utilization)
- [ ] **Deliverable**: Usage analysis spreadsheet

**Week 5: Opportunity Identification**
- [ ] Identify zombies (cancel immediately)
- [ ] Identify seat reductions (reduce to 80% utilization target)
- [ ] Identify tier downgrades (paying for unused features)
- [ ] Identify duplicates (multiple tools, same category)
- [ ] Identify renegotiation opportunities (expiring contracts)
- [ ] Identify currency optimization (USD vs local currency)
- [ ] **Deliverable**: Optimization roadmap with savings estimates

**Week 6: Prioritization & Planning**
- [ ] Prioritize by ROI (savings ÷ effort)
- [ ] Assign owners (who will execute each optimization?)
- [ ] Set timelines (when will each be completed?)
- [ ] Get stakeholder buy-in (department heads approve changes)
- [ ] **Deliverable**: Implementation roadmap

**Week 7-8+: Execution**
- [ ] Cancel zombie subscriptions
- [ ] Reduce seat counts (coordinate with tool owners)
- [ ] Initiate vendor renegotiations
- [ ] Plan vendor consolidations
- [ ] **Deliverable**: Savings realized report

---

## Common Audit Mistakes to Avoid

### Mistake #1: Incomplete discovery
**Problem**: You audit only known tools (miss 20-30% shadow IT)
**Fix**: Use multiple discovery methods (financial records + surveys + SSO logs + browser extensions)

### Mistake #2: Focusing only on big vendors
**Problem**: You optimize Salesforce ($180K) but ignore 50 small tools ($80K combined)
**Fix**: Audit all tools (small subscriptions add up — death by 1,000 cuts)

### Mistake #3: Not tracking usage
**Problem**: You see a tool costs $50K but don't know if anyone uses it
**Fix**: Pull usage reports (admin panels) before making decisions

### Mistake #4: Canceling without consulting users
**Problem**: You cancel a tool that 3 people rely on → they're upset
**Fix**: Always confirm with department head before canceling ("Still using [TOOL]?")

### Mistake #5: One-time audit (no ongoing governance)
**Problem**: You audit once, save $500K, but waste creeps back in 12 months
**Fix**: Quarterly re-audits + procurement policies (see [Governance Guide](05-governance.md))

### Mistake #6: Not getting executive buy-in
**Problem**: You identify $1M in savings but can't execute (departments resist changes)
**Fix**: Present findings to CFO/CEO first, get mandate to optimize

### Mistake #7: Optimizing for cost only (ignoring value)
**Problem**: You cancel a $10K tool that delivers $100K in value (bad ROI)
**Fix**: Balance cost savings with business value (don't cut tools that drive revenue)

---

## ROI of SaaS Audit

**Typical investment**:
- Internal time: 40-80 hours (Finance + IT + Ops)
- Cost: $20K-$80K (at $50-$100/hour blended rate)
- Or: Hire consultant ($30K-$100K for full audit + implementation)

**Typical savings**:
- Immediate (zombies + seat reductions): $100K-$350K
- Medium-term (negotiation + currency + tier downgrades): $150K-$700K
- Long-term (consolidation + governance): $50K-$500K
- **Total**: $300K-$1.5M+ annual savings

**ROI**: 500-2,000% in first year

**Payback period**: <30 days (immediate savings exceed audit cost)

**Ongoing benefit**: $300K-$1.5M recurring annual savings (if governance maintained)

---

## Tools to Help with SaaS Audits

### SaaS Management Platforms (paid)
1. **Torii** — SaaS discovery, usage tracking, procurement workflows ($3-10/employee/month)
2. **Productiv** — SaaS management for mid-market/enterprise ($5-15/employee/month)
3. **Zylo** — SaaS optimization platform ($X per user)
4. **Blissfully** (acquired by Vendr) — SaaS management for SMBs

**When to use**: If you have >100 SaaS tools, platform ROI justifies cost

### Free/DIY Tools
1. **Google Sheets + Zapier** — Build custom audit tracker
2. **SSO login reports** — Use Okta/OneLogin/Google admin panel (free if you have SSO)
3. **Browser extensions** — Torii offers free Chrome extension for personal audits
4. **Expense report analysis** — Export from Expensify/Ramp/Brex (built-in reports)

**When to use**: If you have <100 tools, manual audit is sufficient

---

## Next: Vendor Consolidation

**Once you've completed the audit**, move to [Vendor Consolidation](02-vendor-consolidation.md) to tackle duplicate tools (40-60% savings potential).

**Or jump to**:
- [Negotiation Tactics](03-negotiation-tactics.md) — Get 20-30% discounts on expiring contracts
- [Multi-Currency Optimization](04-multi-currency.md) — SEA-specific currency savings
- [Ongoing Governance](05-governance.md) — Maintain savings long-term
