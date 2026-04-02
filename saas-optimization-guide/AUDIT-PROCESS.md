# SaaS Stack Audit Process

**The complete 4-step methodology to reduce your SaaS spend by 30-50%**

This document outlines the full audit process. For detailed step-by-step instructions, see the individual guides in the `/guides` folder.

---

## Overview

The audit follows a 4-phase approach:

```
1. DISCOVER → 2. ANALYZE → 3. OPTIMIZE → 4. GOVERN
   (Week 1)      (Week 2)      (Week 3)     (Ongoing)
```

**Total time**: 8-16 hours over 2-4 weeks
**Expected outcome**: 30-50% reduction in SaaS spend
**ROI**: 10-20x (savings typically 10-20x the time invested)

---

## Phase 1: Discover (Week 1)

**Goal**: Build a complete inventory of every SaaS tool your company uses.

**Why this matters**: You can't optimize what you don't measure. Most companies discover 20-40% more tools than they thought they had.

###Sources to Check

1. **Finance/Accounting Records**
   - Monthly recurring charges on credit cards
   - Vendor payments in accounting software (QuickBooks, Xero)
   - Subscription management tools (if you have one)

2. **IT Department/Admin**
   - SSO (Single Sign-On) provider logins (Okta, Google Workspace, Microsoft Azure AD)
   - User provisioning systems
   - IT ticketing system (requests for new tool access)

3. **Department Surveys**
   - Ask each department head: "What tools does your team use?"
   - Include shadow IT (tools bought with personal cards, expensed later)

4. **App Store Subscriptions**
   - Apple App Store (business account)
   - Google Play Store (business account)
   - Microsoft Store
   - Browser extensions (Chrome, Edge)

5. **Email Inbox Search**
   - Search for "invoice", "subscription", "renewal" emails
   - Search for welcome emails ("Welcome to [Tool Name]")

### Inventory Template

Download [saas-inventory.csv](./templates/saas-inventory.csv) and fill in:

| Column | What to Record | Example |
|--------|----------------|---------|
| Tool Name | Name of SaaS tool | "Asana" |
| Vendor | Company providing the tool | "Asana, Inc." |
| Category | Type of tool | "Project Management" |
| Monthly Cost | What you pay per month | "$240" (10 users × $24/user) |
| Annual Cost | What you pay per year | "$2,880" |
| Users Licensed | Number of licenses purchased | "10" |
| Users Active | Number who actually log in | "7" (check SSO data) |
| Plan Level | Which plan tier | "Premium" |
| Renewal Date | When subscription renews | "2026-03-15" |
| Owner/Champion | Who requested/uses this | "Product team / Sarah" |
| Notes | Any additional context | "Annual contract, auto-renew" |

### Common Discovery Pitfalls

❌ **Pitfall 1: Relying only on finance records**
- Finance may not see tools paid by personal cards and expensed
- Department heads often sign up for tools without central approval
- **Solution**: Combine finance + IT + surveys

❌ **Pitfall 2: Missing free trials that converted to paid**
- Teams sign up for "free trials", forget about them, get auto-billed
- **Solution**: Search email for "trial ending", "payment method required"

❌ **Pitfall 3: Not counting "per-user" costs accurately**
- Tool costs $10/user but you have 20 inactive licenses
- **Solution**: Get SSO login data to see actual usage

❌ **Pitfall 4: Missing app marketplace charges**
- Slack apps, Zoom apps, HubSpot marketplace add-ons
- **Solution**: Check each major platform's billing section

### Expected Outcomes

After discovery, you should have:

- [x] Complete list of 30-100+ SaaS tools (average company has 70+)
- [x] Total monthly SaaS spend calculated
- [x] Renewal dates for all tools
- [x] Owner/champion identified for each tool

**Time**: 2-4 hours
**Detailed guide**: [01-inventory.md](./guides/01-inventory.md)

---

## Phase 2: Analyze (Week 2)

**Goal**: Score each tool to identify waste, redundancy, and optimization opportunities.

**Why this matters**: Not all SaaS tools are created equal. Some are critical, others are "nice-to-have", and some are completely unused.

### Scoring Framework

Score each tool on **5 dimensions** (1-10 scale):

#### 1. Usage Score (1-10)

**How many people actually use this tool?**

| Score | Criteria |
|-------|----------|
| 10 | >80% of licensed users log in weekly |
| 7-9 | 50-80% of licensed users log in monthly |
| 4-6 | 25-50% of licensed users log in quarterly |
| 1-3 | <25% of licensed users ever log in |
| 0 | No logins in past 90 days (CANCEL IMMEDIATELY) |

**Data source**: SSO login analytics, tool's own usage dashboard

---

#### 2. Business Value Score (1-10)

**What would happen if we didn't have this tool?**

| Score | Impact |
|-------|--------|
| 10 | Business-critical (revenue stops, compliance violated) |
| 7-9 | Major productivity loss (team can't work effectively) |
| 4-6 | Minor inconvenience (workarounds exist) |
| 1-3 | Nice-to-have (no material impact) |
| 0 | No value (why do we have this?) |

**Ask**: "If this tool disappeared tomorrow, who would complain and how loudly?"

---

#### 3. Overlap Score (1-10, inverted)

**How many other tools do the same thing?**

| Score | Overlap |
|-------|---------|
| 10 | Unique capability, no alternatives in our stack |
| 7-9 | Minimal overlap, different use cases |
| 4-6 | Moderate overlap, could consolidate |
| 1-3 | Major overlap, clear redundancy |
| 0 | Complete duplicate (CONSOLIDATE IMMEDIATELY) |

**Example**: Asana + Monday + ClickUp + Trello = Overlap score of 0-3

---

#### 4. Cost Efficiency Score (1-10)

**Is this expensive relative to value and alternatives?**

| Score | Cost vs Value |
|-------|---------------|
| 10 | Cheap or free, high value |
| 7-9 | Fair pricing for value delivered |
| 4-6 | Overpriced but necessary |
| 1-3 | Very expensive, cheaper alternatives exist |
| 0 | Outrageously expensive (NEGOTIATE OR REPLACE) |

**Check**: Compare to alternatives in [ALTERNATIVES.md](./ALTERNATIVES.md)

---

#### 5. Strategic Fit Score (1-10)

**Does this align with company's tool strategy?**

| Score | Fit |
|-------|-----|
| 10 | Part of core tech stack, company-wide standard |
| 7-9 | Officially approved for specific departments |
| 4-6 | Tolerated but not preferred |
| 1-3 | Shadow IT, not aligned with company standards |
| 0 | Actively trying to phase out |

**Ask**: "Does this support our consolidation goals or add to sprawl?"

---

### Overall Tool Rating

**Formula**: Average the 5 scores

| Overall Score | Action |
|---------------|--------|
| **8-10: Keep** | Keep as-is, maybe renegotiate for better pricing |
| **6-7: Negotiate** | Keep but negotiate better terms at renewal |
| **4-5: Consolidate** | Look for replacement or merge with another tool |
| **1-3: Cancel** | Cancel or downgrade plan |
| **0: Cancel Immediately** | No value, cancel as soon as possible |

### Analysis Output

Fill in the "Score" and "Decision" columns in your inventory spreadsheet:

| Tool | Overall Score | Decision | Action Item |
|------|---------------|----------|-------------|
| Slack | 9.2 | Keep | Renegotiate at renewal for 10% discount |
| Asana | 6.8 | Negotiate | Ask for volume discount (20+ users) |
| Monday | 4.2 | Consolidate | Migrate to Notion, cancel Monday |
| Trello | 2.1 | Cancel | No usage past 6 months, cancel |
| ToolX | 0 | Cancel | Zero logins ever, cancel immediately |

**Time**: 2-3 hours
**Detailed guide**: [02-usage-analysis.md](./guides/02-usage-analysis.md)

---

## Phase 3: Optimize (Week 3)

**Goal**: Execute cost-saving actions - cancel, consolidate, negotiate.

**Why this matters**: Analysis is worthless without action. This phase converts insights into actual savings.

### Action Categories

#### A. Cancel (Score: 0-3)

**When to cancel**:
- Zero or near-zero usage
- Complete duplicates
- Free alternatives exist
- Tool was for one-time project (now complete)

**How to cancel**:
1. Export any data you might need (backups)
2. Notify users (if any exist)
3. Cancel subscription (usually in billing settings)
4. Confirm cancellation email
5. Remove payment method to prevent auto-renewal

**Common cancellation gotchas**:
- Annual contracts may have early termination fees
- Some vendors require 30-day notice
- Data deletion policies vary (export first!)

**Expected savings**: $500-2,000/month (10-20 tools × $50-100/tool average)

---

#### B. Consolidate (Score: 4-6)

**When to consolidate**:
- Multiple tools in same category
- All-in-one platform available
- Features overlap >60%

**Consolidation strategies**:

1. **All-in-one platforms**:
   - Zoho ONE ($37/user) replaces 45+ separate tools
   - Google Workspace ($12/user) replaces email + docs + storage
   - HubSpot Growth Suite ($50/user) replaces CRM + marketing + sales tools

2. **Category consolidation**:
   - Project management: 3 tools → 1 (Asana + Monday + Trello → Notion)
   - Communication: 2 tools → 1 (Slack + Teams → pick one)
   - Design: Adobe CC → Canva Pro (80% use cases at 76% cost savings)

3. **Feature consolidation**:
   - Use features you already pay for (Google Sheets → instead of Airtable)
   - Upgrade one tool vs paying for two (Notion → replace Asana + Confluence)

**Migration considerations**:
- Data export/import process
- User training time
- Integration compatibility
- Downtime during migration

**Expected savings**: $800-3,000/month

**Detailed guide**: [03-consolidation.md](./guides/03-consolidation.md)

---

#### C. Negotiate (Score: 6-8)

**When to negotiate**:
- Renewal coming up (60-90 days before)
- Critical tool you'll keep regardless
- Paying list price (never negotiated before)
- Multi-year commitment possible

**Negotiation tactics**:

**Tactic 1: Volume discount**
- "We've grown from 10 to 25 users, can we get enterprise pricing?"
- Typical savings: 15-25%

**Tactic 2: Multi-year commitment**
- "If we commit to 2-3 years, what discount can you offer?"
- Typical savings: 20-30%

**Tactic 3: Competitive quotes**
- "We're evaluating [Competitor], can you match their pricing?"
- Typical savings: 10-20%

**Tactic 4: Payment terms**
- "If we prepay annual instead of monthly, what discount?"
- Typical savings: 10-20%

**Tactic 5: Downgrade threat**
- "We're considering downgrading to Starter plan, is there a loyalty discount to stay on Pro?"
- Typical savings: 15-25% (retention offers)

**Tactic 6: End-of-quarter timing**
- Vendors have quarterly quotas - negotiate in last 2 weeks of quarter
- Sales reps more willing to discount to hit targets

**Negotiation email templates**: [negotiation-emails.md](./templates/negotiation-emails.md)

**Expected savings**: $400-1,500/month

**Detailed guide**: [04-negotiation.md](./guides/04-negotiation.md)

---

### Optimization Summary

After optimization, you should have:

- [x] Canceled 10-25% of tools
- [x] Consolidated 3-5 tool categories
- [x] Negotiated discounts on 5-10 major tools
- [x] Documented all changes

**Total expected savings**: $1,500-6,500/month (30-50% of baseline spend)
**Time**: 4-6 hours + 2-4 weeks for vendor negotiations

---

## Phase 4: Govern (Ongoing)

**Goal**: Prevent SaaS sprawl from happening again.

**Why this matters**: Without governance, you'll be back to 100+ tools in 12-18 months.

### Governance Framework

#### 1. Procurement Approval Process

**Before any new SaaS tool**:

1. **Requestor fills out form**:
   - Tool name and cost
   - Business justification
   - Alternative tools already in stack
   - Number of users needed

2. **IT reviews**:
   - Security assessment
   - Integration compatibility
   - Existing alternatives check

3. **Finance approves**:
   - Budget availability
   - Cost comparison
   - Contract terms review

**Approval levels**:
- <$100/month: Manager approval
- $100-500/month: Director approval
- $500-2,000/month: VP/CFO approval
- >$2,000/month: C-level approval

---

#### 2. Quarterly Usage Review

**Every 90 days**:

1. Pull SSO login data for all tools
2. Identify tools with <50% utilization
3. Contact owners of underutilized tools
4. Cancel or downgrade as appropriate

**Automate this**: Set calendar reminder, use script to pull usage data

---

#### 3. Offboarding Process

**When employee leaves**:

1. IT removes access from all SaaS tools (SSO deprovision)
2. HR notifies finance to adjust license counts
3. Finance downgrades/cancels licenses within 7 days
4. Owner reassigns any owned resources

**Why this matters**: Paying for departed employees is the #1 source of license waste

---

#### 4. Renewal Review

**60 days before renewal**:

1. Finance sends reminder to tool owner
2. Owner confirms: Keep / Negotiate / Cancel
3. If Keep: Negotiate better pricing (see tactics above)
4. If Cancel: Identify migration path

**Set up**: Use [renewal-calendar.csv](./templates/renewal-calendar.csv) or run [renewal-tracker.py](./scripts/renewal-tracker.py) monthly

---

#### 5. "Consolidation First" Policy

**Before buying new tool**:

1. Check if existing tool can do this (even at higher plan tier)
2. Check if all-in-one platform includes this feature
3. Only buy if no consolidation path exists

**Example**:
- ❌ Don't buy Mailchimp if HubSpot Marketing is already purchased
- ✅ Do buy specialized video tool if no alternative exists

---

### Governance Outcomes

After governance implementation:

- [x] New tool requests drop 40-60%
- [x] Average tool count stays flat or decreases
- [x] Zero licenses for departed employees after 90 days
- [x] 95%+ tools reviewed before renewal

**Time**: 1-2 hours setup, then 30 min/quarter maintenance
**Detailed guide**: [05-governance.md](./guides/05-governance.md)

---

## Annual Review Process

**Every 12 months**: Repeat the full audit

**Why annually**:
- New tools sneak in despite governance
- Business needs change (tools become less valuable)
- New alternatives emerge (cheaper/better options)
- Vendor pricing changes (renegotiation opportunities)

**Annual audit checklist**:

1. Re-run discovery (Step 1) - find new tools
2. Re-score all tools (Step 2) - identify new waste
3. Execute optimizations (Step 3) - cancel/consolidate/negotiate
4. Update governance (Step 4) - adjust policies as needed

**Time**: 4-6 hours (faster than first audit)
**Expected savings**: 15-25% additional (from previous year's baseline)

**Detailed guide**: [06-annual-review.md](./guides/06-annual-review.md)

---

## Success Metrics

Track these metrics to measure audit success:

### Primary Metrics

- **Total SaaS spend** (monthly)
  - Before audit: $X,XXX
  - After audit: $X,XXX
  - Savings: $XXX (X%)

- **Tool count**
  - Before: XX tools
  - After: XX tools
  - Reduction: XX tools

- **License utilization**
  - Before: XX% (active/licensed)
  - After: XX% (active/licensed)
  - Improvement: +XX%

### Secondary Metrics

- **Cost per employee** (Total SaaS spend / # employees)
- **Tools per employee** (Tool count / # employees)
- **Average cost per tool** (Total spend / Tool count)
- **Negotiation success rate** (% of renewals with discounts)

### Benchmark Targets

| Metric | Before Audit (typical) | After Audit (target) | Best-in-class |
|--------|------------------------|----------------------|---------------|
| SaaS spend | $100/employee/month | $60-70/employee/month | $50/employee/month |
| Tool count | 70-100 tools | 40-60 tools | 30-40 tools |
| License utilization | 60-70% | 85-95% | >95% |
| Tools with discounts | <20% | 60-80% | >80% |

---

## Common Mistakes to Avoid

### Mistake 1: Only looking at big-ticket items

**Problem**: Focusing only on $1,000/month tools, ignoring 50 tools at $20/month each
**Impact**: Miss $1,000/month in small tool waste
**Solution**: Audit EVERY tool, no matter how small

---

### Mistake 2: Canceling without data export

**Problem**: Cancel tool, realize 6 months later you needed the data
**Impact**: Data permanently lost, may violate retention policies
**Solution**: Always export data before canceling

---

### Mistake 3: Consolidating without user buy-in

**Problem**: Force team onto new tool without training/input
**Impact**: Low adoption, team finds workarounds, defeats purpose
**Solution**: Involve power users in consolidation decisions

---

### Mistake 4: Negotiating without competitive quotes

**Problem**: Ask for discount with no leverage
**Impact**: Vendor says "our pricing is firm" and you accept
**Solution**: Always have 2-3 competitive quotes ready

---

### Mistake 5: No governance after audit

**Problem**: Complete audit, save $2,000/month, but 12 months later back to baseline
**Impact**: All savings eroded
**Solution**: Implement governance framework (Phase 4)

---

## Next Steps

1. **Download templates**:
   - [saas-inventory.csv](./templates/saas-inventory.csv)
   - [renewal-calendar.csv](./templates/renewal-calendar.csv)

2. **Start discovery** following [01-inventory.md](./guides/01-inventory.md)

3. **Schedule time blocks**:
   - Week 1: 3-4 hours for discovery
   - Week 2: 2-3 hours for analysis
   - Week 3: 4-6 hours for optimization
   - Week 4: 1-2 hours for governance setup

4. **Set expectations** with leadership:
   - Target: 30-50% savings
   - Timeline: 4 weeks to completion
   - Ongoing: Quarterly reviews

---

**Ready to start? Begin with [01-inventory.md](./guides/01-inventory.md)**

**Questions? See [FAQ.md](./FAQ.md)**

---

**Last Updated**: February 6, 2026
