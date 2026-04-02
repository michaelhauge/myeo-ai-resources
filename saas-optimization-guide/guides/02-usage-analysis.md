# Step 2: Usage Analysis & Scoring

**Time required**: 2-3 hours
**Prerequisites**: Completed SaaS inventory (Step 1)
**Output**: Each tool scored and categorized as Keep / Negotiate / Consolidate / Cancel

---

## Why Score Your Tools?

Not all SaaS tools are created equal. Some are mission-critical, others are waste. Scoring helps you make objective decisions about what to keep, optimize, or eliminate.

**The goal**: Convert subjective opinions ("I think we need this") into objective data ("Usage: 20%, Value: 3/10, Overlap: 9/10 → Cancel")

---

## The 5-Dimension Scoring Framework

Score each tool on these 5 dimensions (1-10 scale, 10 = best):

### 1. Usage Score

**What it measures**: How many licensed users actually use the tool?

**Scoring**:
- **10**: 90-100% utilization (everyone licensed is using it)
- **8-9**: 70-89% utilization (most people use it)
- **6-7**: 50-69% utilization (half the team uses it)
- **4-5**: 30-49% utilization (less than half use it)
- **2-3**: 10-29% utilization (barely used)
- **1**: 1-9% utilization (almost no one uses it)
- **0**: 0% utilization (zero logins in 90 days)

**How to calculate**:
```
Usage Score = (Active Users / Licensed Users) × 10

Example: 8 active users ÷ 10 licensed users = 0.8 → 8/10
```

**Where to get data**:
- SSO admin panels (Okta, Google Workspace, Azure AD)
- Tool's built-in analytics (e.g., Slack workspace analytics)
- Ask vendor for "user activity report"
- Check last login dates in admin panel

**⚠️ If you don't have login data**: Estimate based on team feedback. Ask: "How many people on your team actually use this daily?"

---

### 2. Business Value Score

**What it measures**: How critical is this tool to your business operations?

**Scoring**:
- **10**: Mission-critical (business stops without it) - Email, payment processing, core product infrastructure
- **8-9**: Highly valuable (major disruption if removed) - CRM, project management, support desk
- **6-7**: Valuable (some disruption, workarounds exist) - Marketing automation, analytics tools
- **4-5**: Moderately useful (nice to have, not essential) - Design tools, survey tools
- **2-3**: Low value (barely used, minimal impact) - Experimental tools, single-use tools
- **1**: Zero value (provides no meaningful benefit)
- **0**: Negative value (causes more problems than it solves)

**How to assess**:
- Ask: "What breaks if we remove this tomorrow?"
- Ask: "What business outcome does this enable?"
- Ask tool owner: "Rate the impact if we canceled this (1-10)"

**Examples**:
- Google Workspace (email, docs): **10** (mission-critical)
- Salesforce (CRM for sales team): **9** (highly valuable)
- Mailchimp (email marketing): **7** (valuable, but alternatives exist)
- Loom (video recording): **5** (nice to have, OBS Studio is free alternative)
- Old Trello account with 2 boards: **2** (low value, migrating to Asana)

---

### 3. Overlap Score

**What it measures**: How much does this tool duplicate functionality of other tools?

**Scoring**:
- **10**: Unique (no other tool does this) - Niche tools, specialized software
- **8-9**: Mostly unique (some overlap but mostly distinct)
- **6-7**: Moderate overlap (50% of features available elsewhere)
- **4-5**: High overlap (70-80% duplicate functionality)
- **2-3**: Nearly complete overlap (90%+ duplicate)
- **1**: Total overlap (100% duplicate, no unique features)
- **0**: Worse than duplicate (other tool does it better)

**How to assess**:
- List top 5 features you use in this tool
- Check if other tools in your inventory have those features
- Calculate: Unique features / Total features

**Examples**:
- Using Asana + Monday + Trello for project management:
  - Asana: Overlap = **3** (all three do kanban, tasks, assignees)
  - Monday: Overlap = **3** (same overlap)
  - Trello: Overlap = **2** (worst overlap, least features)

- Using Zoom + Google Meet (both do video calls):
  - Zoom: Overlap = **4** (Google Meet does 80% of what you use Zoom for)
  - Google Meet: Overlap = **4** (but you already pay for it in Workspace)

---

### 4. Cost Efficiency Score

**What it measures**: Is this tool priced fairly relative to alternatives and value provided?

**Scoring**:
- **10**: Exceptional value (free, or very cheap for high value) - Free tiers, Google Workspace
- **8-9**: Good value (competitive pricing, fair for features) - Most well-priced SaaS
- **6-7**: Acceptable (fair price but not cheap) - Average SaaS tools
- **4-5**: Expensive (could get similar value for 30-50% less) - Premium tools
- **2-3**: Very expensive (2-3x the cost of alternatives) - Enterprise tools on wrong plan
- **1**: Outrageously expensive (5x+ the cost of alternatives) - Being overcharged
- **0**: Absurd (paying for something that should be free)

**How to calculate**:
```
Cost Efficiency Score = 10 - (Your Cost vs Market Average Cost)

If you're paying 2x market rate → Score = 5
If you're paying 0.5x market rate → Score = 10
```

**How to assess**:
- Check [ALTERNATIVES.md](../ALTERNATIVES.md) for typical pricing
- Google "[Tool Name] alternatives pricing comparison"
- Ask in your network: "What do you pay for [Tool]?"

**Examples**:
- HubSpot CRM at $900/month for 10 users = $90/user (Market: $39/user for Freshsales) → Score = **3**
- Notion at $150/month for 15 users = $10/user (Market: competitive) → Score = **8**
- Google Workspace at $240/month for 20 users = $12/user (Great value) → Score = **9**
- Loom at $125/month for 10 users = $12.50/user (OBS Studio is free) → Score = **5**

---

### 5. Strategic Fit Score

**What it measures**: Does this tool align with your company's technology strategy?

**Scoring**:
- **10**: Core tech stack (standardized, company-wide, part of long-term plan)
- **8-9**: Strategic (aligns with tech stack, well-integrated)
- **6-7**: Acceptable (works fine, not strategic but not problematic)
- **4-5**: Misaligned (doesn't integrate well, isolated tool)
- **2-3**: Shadow IT (bought without approval, security concerns)
- **1**: Deprecated (on sunset list, plan to replace)
- **0**: Banned (violates security/compliance policies)

**How to assess**:
- Does it integrate with core tools (SSO, API connections)?
- Is it part of a platform you're standardizing on (Zoho ONE, Microsoft 365)?
- Did IT approve this, or was it purchased independently?
- Is it on your "approved tools" list?

**Examples**:
- Google Workspace (company standard): **10**
- Asana (approved project management tool): **9**
- Random Trello account one team bought: **4** (not standardized)
- Old WordPress plugin still auto-billing: **1** (deprecated, forgot to cancel)

---

## Overall Score Calculation

```
Overall Score = (Usage + Value + (10 - Overlap) + Cost Efficiency + Strategic Fit) ÷ 5
```

**Note**: Overlap is inverted (10 - Overlap) because LOW overlap is GOOD.

---

## Decision Framework

Based on Overall Score:

| Overall Score | Decision | Action |
|---------------|----------|--------|
| **8-10** | **Keep** | Renew, possibly negotiate for better rate |
| **6-7** | **Negotiate** | Keep but get better pricing at renewal |
| **4-5** | **Consolidate** | Replace with alternative or migrate to all-in-one platform |
| **1-3** | **Cancel** | Eliminate immediately or after migration |
| **0** | **Cancel NOW** | Unused, immediate cancellation |

---

## Scoring Examples

### Example 1: Google Workspace

**Scenario**: 20 users, all active, $240/month

| Dimension | Score | Reasoning |
|-----------|-------|-----------|
| **Usage** | 10 | 20/20 licensed users active daily |
| **Value** | 10 | Mission-critical (email, docs, storage) |
| **Overlap** | 10 | Unique (no other company email system) |
| **Cost Efficiency** | 9 | $12/user is competitive for features |
| **Strategic Fit** | 10 | Core tech stack, company standard |
| **Overall** | **9.8** | **KEEP** - Essential tool |

**Action**: Keep, consider multi-year contract for discount

---

### Example 2: Trello (Zombie Account)

**Scenario**: 10 licensed users, 2 active, $50/month, migrating to Asana

| Dimension | Score | Reasoning |
|-----------|-------|-----------|
| **Usage** | 2 | 2/10 licensed users active (20% utilization) |
| **Value** | 3 | Low value (2 old boards, archived projects) |
| **Overlap** | 2 | Complete overlap with Asana (already using) |
| **Cost Efficiency** | 5 | Not expensive, but paying for unused licenses |
| **Strategic Fit** | 3 | Shadow IT, not company standard |
| **Overall** | **3.0** | **CANCEL** - Low utilization, duplicate of Asana |

**Action**: Cancel immediately after archiving old boards

---

### Example 3: HubSpot CRM

**Scenario**: 10 users, 9 active, $900/month, critical for sales but expensive

| Dimension | Score | Reasoning |
|-----------|-------|-----------|
| **Usage** | 9 | 9/10 users active (90% utilization) |
| **Value** | 9 | Highly valuable (sales CRM, pipeline management) |
| **Overlap** | 6 | Some overlap (could use Freshsales or Zoho) |
| **Cost Efficiency** | 2 | $90/user vs Freshsales at $39/user (expensive) |
| **Strategic Fit** | 8 | Approved tool, well-integrated |
| **Overall** | **6.8** | **NEGOTIATE** - Valuable but overpriced |

**Action**: Negotiate renewal (target 30% discount) or evaluate Freshsales migration

---

### Example 4: Monday.com (Underutilized)

**Scenario**: 10 licensed, 3 active, $100/month, team prefers Asana

| Dimension | Score | Reasoning |
|-----------|-------|-----------|
| **Usage** | 3 | 3/10 users active (30% utilization) |
| **Value** | 5 | Moderate value (some active projects) |
| **Overlap** | 3 | High overlap with Asana (which we also have) |
| **Cost Efficiency** | 4 | $10/user is fair, but paying for 7 unused licenses |
| **Strategic Fit** | 4 | Not company standard (Asana is preferred) |
| **Overall** | **3.8** | **CANCEL** - Low usage, consolidate to Asana |

**Action**: Migrate active projects to Asana, cancel Monday

---

## Scoring Workflow

### Step 1: Prioritize High-Cost Tools

**Focus first on tools costing >$200/month**. These represent 70-80% of your spend.

**Why**: Scoring 100 tools is exhausting. Start with the 20 tools that cost the most.

---

### Step 2: Gather Usage Data

**For each high-cost tool**:
1. Check SSO admin panel (last login dates, active users)
2. Check tool's built-in analytics (if available)
3. Ask vendor for user activity report
4. Survey tool owner: "How many people actually use this?"

**Expected time**: 5-10 minutes per tool

---

### Step 3: Score Each Tool

**For each tool**:
1. Calculate Usage Score (Active Users / Licensed Users × 10)
2. Assign Value Score (ask: "What breaks without this?")
3. Assign Overlap Score (check for duplicate tools in inventory)
4. Assign Cost Efficiency Score (compare to alternatives)
5. Assign Strategic Fit Score (is this approved / integrated?)
6. Calculate Overall Score (average of 5 scores, with Overlap inverted)
7. Assign Decision (Keep / Negotiate / Consolidate / Cancel)

**Expected time**: 3-5 minutes per tool

---

### Step 4: Identify Quick Wins

**Sort your inventory by Overall Score (lowest to highest)**.

**Immediate cancellations** (Score 0-1):
- Tools with 0% utilization (no logins in 90 days)
- Tools for employees who left (forgotten subscriptions)
- Failed experiments (tried it, didn't work, forgot to cancel)

**Expected savings**: $200-500/month from immediate cancellations

---

### Step 5: Plan Consolidations

**Identify overlapping tools** (Overlap Score 1-4):
- Multiple project management tools (Asana + Monday + Trello)
- Multiple communication tools (Slack + Teams + Zoom)
- Multiple support tools (Zendesk + Intercom)

**For each category**:
1. Pick ONE tool to keep (usually highest Value Score)
2. Plan migration timeline (30-60 days)
3. Mark others for cancellation

**Expected savings**: $500-1,500/month from consolidations

---

### Step 6: Flag Negotiation Targets

**Tools with Overall Score 6-8 AND high cost**:
- High value but expensive (HubSpot, Salesforce)
- Well-used but overpriced (paying list price)
- Upcoming renewal (within 90 days)

**For each tool**:
1. Note renewal date
2. Research alternatives (for negotiation leverage)
3. Set calendar reminder 60 days before renewal
4. Mark "Negotiate" in Action column

**Expected savings**: $300-1,000/month from negotiations

---

## Sample Scoring Session

### Before Scoring

**Tool**: Asana Business
- Cost: $250/month ($10.99/user × 10 users)
- Users Licensed: 10
- Renewal: April 15, 2026

---

### Scoring Process

**1. Gather usage data**:
- Check Okta: 6 users logged in past 30 days
- Ask IT: "Can you pull Asana login data?"
- Result: 6 active users, 4 inactive

**2. Score dimensions**:
- **Usage**: 6/10 active = 60% utilization → **6/10**
- **Value**: Ask product team: "Critical for sprint planning" → **8/10**
- **Overlap**: We also have Monday and Trello → **4/10** (high overlap)
- **Cost Efficiency**: ClickUp costs $5/user vs our $10.99/user → **5/10**
- **Strategic Fit**: Company-approved project management tool → **8/10**

**3. Calculate overall**:
```
Overall = (6 + 8 + (10-4) + 5 + 8) / 5 = 33 / 5 = 6.6
```

**4. Assign decision**: Score 6.6 → **Negotiate**

**5. Determine action**:
- Remove 4 inactive licenses → Save $44/month immediately
- Negotiate renewal for 20% discount → Save $50/month at renewal
- Consider ClickUp migration → Save $119/month if we switch
- **Action Item**: "Remove 4 licenses now, negotiate renewal for 15-20% discount"

---

## Common Scoring Pitfalls

### Pitfall 1: Overestimating Value

**Problem**: Tool owners say "We need this!" but usage data shows 20% utilization.

**Solution**: Trust the data over opinions. If usage is low, value is low (regardless of what people say).

---

### Pitfall 2: Ignoring Overlap

**Problem**: Keeping Asana, Monday, AND Trello because "different teams like different tools."

**Solution**: Standardize on ONE tool. Preferences are less important than cost savings and data centralization.

---

### Pitfall 3: Scoring Too Generously

**Problem**: Everything gets a 7-9 score, no clear cancel targets.

**Solution**: Force a distribution:
- Only 20% of tools should score 8-10 (Keep)
- 30% should score 6-7 (Negotiate)
- 30% should score 4-5 (Consolidate)
- 20% should score 0-3 (Cancel)

---

### Pitfall 4: Not Accounting for Hidden Costs

**Problem**: Scoring a "cheap" tool highly without considering:
- Integration costs (Zapier workflows)
- Training time
- Support overhead
- Data export complexity

**Solution**: Adjust Cost Efficiency Score down if tool has high hidden costs.

---

## Quality Checks

Before moving to Step 3 (Optimization), verify:

- [ ] All tools costing >$200/month have been scored
- [ ] Usage Score based on actual data (not guesses)
- [ ] Tools with 0% utilization marked for cancellation
- [ ] Overlapping tools identified (3+ tools in same category)
- [ ] Negotiation targets flagged (Score 6-8, high cost, upcoming renewal)

---

## What's Next

Once scoring is complete, proceed to:

**[Step 3: Consolidation](./03-consolidation.md)** - Merge overlapping tools
**[Step 4: Negotiation](./04-negotiation.md)** - Get better pricing

**Expected outcome after Steps 3-4**: $1,000-4,000/month in savings (30-50% SaaS cost reduction)

---

## Related Resources

- **[AUDIT-PROCESS.md](../AUDIT-PROCESS.md)** - Full 4-step methodology
- **[ALTERNATIVES.md](../ALTERNATIVES.md)** - Compare pricing for cost efficiency scores
- **[saas-inventory.csv](../templates/saas-inventory.csv)** - Spreadsheet with scoring columns
