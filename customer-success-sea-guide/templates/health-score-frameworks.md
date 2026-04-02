# AI-Generated Health Score Frameworks

**Last Updated**: 2026-02-07
**Purpose**: Ready-to-use AI prompts for generating customer health scores, churn predictions, and risk analyses

---

## How to Use These Templates

1. **Choose the framework** that matches your need (full health score, quick churn check, dimension-specific analysis)
2. **Replace [BRACKETED PLACEHOLDERS]** with your customer's data
3. **Copy-paste the prompt** into Claude Pro or your AI tool
4. **Review the AI output** and validate against your knowledge of the account
5. **Update CRM** with health score and recommended actions

**Time savings**: 90% reduction (30 min manual analysis → 3 min AI analysis)

---

## Framework 1: Comprehensive 6-Dimension Health Score

### Use Case
Weekly or monthly full health analysis for all accounts.

### AI Prompt

```
You are a customer success analyst. Generate a comprehensive health score for this customer account.

**Account Information**:
- Customer: [COMPANY NAME]
- Industry: [INDUSTRY]
- Country: [SG / MY / ID / TH / VN / PH]
- Product/plan: [PRODUCT, TIER]
- ARR/MRR: [$AMOUNT]
- Tenure: [MONTHS SINCE PURCHASE]
- Renewal date (if annual): [DATE]

**DIMENSION 1: PRODUCT USAGE (0-30 points)**

Usage data (last 30 days vs previous 30 days):
- Active users: [CURRENT] of [TOTAL SEATS] ([X%]) vs [PREVIOUS] ([Y%])
- Login frequency: [DAILY / WEEKLY / SPORADIC] (trend: [UP / STABLE / DOWN])
- Features used: [NUMBER] of [TOTAL AVAILABLE] ([X%])
- Key features: [LIST MOST-USED FEATURES]
- Unused features: [LIST]
- Last login: [X DAYS AGO]
- Usage hours/actions: [METRIC] vs [PREVIOUS] ([+/- X%])

**DIMENSION 2: ENGAGEMENT (0-20 points)**

Engagement data (last 30 days):
- Email response rate: [X%] (benchmark: 30-40%)
- WhatsApp/LINE response rate: [X%] (SEA benchmark: 80-90%)
- Response time: [HOURS] (trend: [IMPROVING / STABLE / SLOWING])
- Meeting attendance: [ATTENDED X of Y SCHEDULED]
- Proactive outreach: [NUMBER OF CUSTOMER-INITIATED MESSAGES]
- Last communication: [X DAYS AGO]
- Communication quality: [ENGAGED / NEUTRAL / SHORT RESPONSES]

**DIMENSION 3: SUPPORT SENTIMENT (0-15 points)**

Support data (last 30 days):
- Tickets submitted: [NUMBER] (trend: [UP / STABLE / DOWN])
- Ticket categories: [TOP 3 THEMES]
- Sentiment: [FRUSTRATED / NEUTRAL / POSITIVE]
- Example quotes (if available): [PASTE 1-2 RECENT TICKET EXCERPTS]
- CSAT (if available): [SCORE]
- Escalations: [NUMBER]
- Resolution time: [AVERAGE HOURS/DAYS]

**DIMENSION 4: ADOPTION VELOCITY (0-15 points)**

Adoption data:
- Days since purchase: [NUMBER]
- Time to first value: [DAYS] (benchmark: <30 days)
- Feature adoption curve:
  - Week 4: [% FEATURES ADOPTED]
  - Week 8: [% FEATURES ADOPTED]
  - Current: [% FEATURES ADOPTED]
- Training completion: [COMPLETED / IN PROGRESS / NOT STARTED]
- Adoption momentum: [ACCELERATING / STABLE / STALLED]

**DIMENSION 5: STAKEHOLDER STABILITY (0-10 points)**

Stakeholder data:
- Champion: [NAME, TITLE]
  - Status: [SAME / CHANGED / LEFT COMPANY]
  - Tenure in role: [MONTHS]
  - Engagement: [HIGH / MEDIUM / LOW]
- Executive sponsor: [NAME, TITLE]
  - Status: [ENGAGED / DISTANT / UNKNOWN]
- Team size: [CURRENT] vs [AT PURCHASE] ([+/- X%])
- Org changes (if known):
  - Layoffs: [YES/NO, IF YES: X%]
  - Funding: [RAISED / CUTTING / STABLE]
  - Leadership changes: [YES/NO]

**DIMENSION 6: BUSINESS OUTCOMES (0-10 points)**

Outcomes data:
- Stated goals (from onboarding/sales):
  - Goal 1: [DESCRIPTION]
  - Goal 2: [DESCRIPTION]
- Progress toward goals:
  - Goal 1: [ACHIEVED / IN PROGRESS / NO PROGRESS / UNKNOWN]
  - Goal 2: [ACHIEVED / IN PROGRESS / NO PROGRESS / UNKNOWN]
- ROI visibility: [CUSTOMER CAN QUANTIFY VALUE: YES/NO]
- Renewal sentiment (if expressed): [POSITIVE / NEUTRAL / NEGATIVE / UNKNOWN]
- Expansion interest: [YES / NO / NEUTRAL / UNKNOWN]

---

Generate a comprehensive health analysis:

## HEALTH SCORE BREAKDOWN

| Dimension | Score | Max | % | Status | Trend |
|-----------|-------|-----|---|--------|-------|
| Product Usage | [0-30] | 30 | [X%] | [🟢/🟡/🔴] | [↗️/→/↘️] |
| Engagement | [0-20] | 20 | [X%] | [🟢/🟡/🔴] | [↗️/→/↘️] |
| Support Sentiment | [0-15] | 15 | [X%] | [🟢/🟡/🔴] | [↗️/→/↘️] |
| Adoption Velocity | [0-15] | 15 | [X%] | [🟢/🟡/🔴] | [↗️/→/↘️] |
| Stakeholder Stability | [0-10] | 10 | [X%] | [🟢/🟡/🔴] | [↗️/→/↘️] |
| Business Outcomes | [0-10] | 10 | [X%] | [🟢/🟡/🔴] | [↗️/→/↘️] |
| **TOTAL** | **[SUM]** | **100** | **[X%]** | **[STATUS]** | **[TREND]** |

**Overall Health Category**:
- 90-100: 🟢 THRIVING
- 75-89: 🟢 HEALTHY
- 60-74: 🟡 AT RISK
- 40-59: 🔴 HIGH RISK
- 0-39: 🔴 CRITICAL

**This account**: [CATEGORY]

---

## CHURN RISK ASSESSMENT

**Churn Probability**: [X%]
**Timeframe**: [90+ DAYS / 60-90 DAYS / 30-60 DAYS / <30 DAYS]
**Confidence**: [HIGH / MEDIUM / LOW]

**Risk factors** (top 3):
1. [HIGHEST RISK DIMENSION + SPECIFIC ISSUE]
   - Evidence: [DATA POINT]
   - Severity: [CRITICAL / HIGH / MEDIUM]
2. [SECOND RISK]
   - Evidence:
   - Severity:
3. [THIRD RISK]
   - Evidence:
   - Severity:

**Positive signals** (top 3):
1. [STRONGEST DIMENSION + SPECIFIC WIN]
   - Evidence: [DATA POINT]
2. [SECOND STRENGTH]
   - Evidence:
3. [THIRD STRENGTH]
   - Evidence:

---

## SEA CULTURAL CONTEXT

In [COUNTRY]:
- **Health pattern interpretation**: [WHAT THIS PATTERN TYPICALLY MEANS IN THIS MARKET]
- **Communication style**: [DIRECT / INDIRECT]
- **Silent churn risk**: [LOW / MEDIUM / HIGH]
  - Rationale: [WHY — e.g., "In Indonesia, going silent = high churn risk"]
- **Intervention approach**: [RELATIONSHIP-BASED / DATA-BASED / HYBRID]

**Cultural signals** (specific to [COUNTRY]):
- [SIGNAL 1 — e.g., "WhatsApp response time increased = deprioritization"]
- [SIGNAL 2]

---

## RECOMMENDED ACTIONS

**Immediate (This Week)**:
1. [URGENT ACTION IF HIGH RISK]
   - Rationale: [WHY NOW]
   - Owner: [CSM NAME]

**Short-term (This Month)**:
2. [PROACTIVE INTERVENTION IF AT RISK]
   - Rationale:
   - Owner:

**Long-term (This Quarter)**:
3. [OPTIMIZATION IF HEALTHY OR EXPANSION IF THRIVING]
   - Rationale:
   - Owner:

---

## NEXT REVIEW

- Schedule next health analysis: [7 DAYS if at-risk, 30 DAYS if healthy]
- Trigger for escalation: [SPECIFIC METRIC OR BEHAVIOR — e.g., "Usage drops below 50%"]

---

**OUTPUT**: This analysis should be saved to CRM and reviewed by CSM.
```

---

### Expected Output
- 6-dimension health breakdown with scores
- Overall health category (Thriving → Critical)
- Churn risk assessment with probability and timeframe
- Top 3 risks and top 3 strengths
- SEA cultural context and signals
- Prioritized action plan with owners

**Time saved**: 30 min manual analysis → 3 min AI analysis + review

---

## Framework 2: Quick Churn Risk Check

### Use Case
Fast churn risk assessment when you notice concerning signals.

### AI Prompt

```
Quick churn risk check for [COMPANY NAME].

**Context**:
- Country: [SG / MY / ID / TH / VN / PH]
- Tenure: [MONTHS]
- Current health score (if known): [NUMBER or UNKNOWN]

**Concerning signals observed**:
1. [SIGNAL 1 — e.g., "Usage dropped 40% in last 14 days"]
2. [SIGNAL 2 — e.g., "Champion hasn't responded to last 3 WhatsApp messages (5 days)"]
3. [SIGNAL 3 — if applicable]

**Recent context**:
- Last positive interaction: [DATE, WHAT HAPPENED]
- Recent changes: [STAKEHOLDER CHANGE / ORG EVENT / OTHER]

Generate a quick churn risk analysis:

## CHURN RISK LEVEL

**Overall Risk**: [LOW / MEDIUM / HIGH / CRITICAL]

**Churn Probability**: [X%]

**Timeframe**: [DAYS UNTIL LIKELY CHURN IF NO INTERVENTION]

**Confidence**: [HIGH / MEDIUM / LOW]

---

## KEY SIGNALS ANALYSIS

For each signal:

**Signal 1**: [RESTATE SIGNAL]
- Severity: [CRITICAL / HIGH / MEDIUM / LOW]
- Pattern match: [X%] of accounts with this pattern churn within [Y] days
- Interpretation in [COUNTRY]: [WHAT THIS MEANS CULTURALLY]

**Signal 2**: [RESTATE SIGNAL]
- Severity:
- Pattern match:
- Interpretation in [COUNTRY]:

**Signal 3** (if applicable):
- Severity:
- Pattern match:
- Interpretation in [COUNTRY]:

---

## ROOT CAUSE HYPOTHESIS

**Most likely churn driver**:
- [VALUE GAP / SUPPORT ISSUES / PRODUCT FIT / PRICING / STAKEHOLDER CHANGE / LOW ADOPTION]

**Evidence**:
- [SPECIFIC DATA POINTS SUPPORTING THIS HYPOTHESIS]

---

## IMMEDIATE ACTIONS (48 HOURS)

1. [MOST URGENT ACTION — e.g., "Proactive WhatsApp check-in (not email)"]
   - Why: [RATIONALE]
   - Draft message: [AI-GENERATED CULTURALLY-APPROPRIATE MESSAGE]

2. [SECONDARY ACTION]
   - Why:

**If no response within 48 hours**: [ESCALATION PLAN]

---

**OUTPUT**: Quick risk assessment with immediate action plan (not full health analysis).
```

---

### Expected Output
- Churn risk level and probability
- Signal-by-signal severity analysis
- Root cause hypothesis
- Immediate 48-hour action plan
- Escalation trigger

**Time saved**: 15 min analysis → 2 min AI quick check

---

## Framework 3: Silent Churn Detection (SEA-Specific)

### Use Case
Detect churn risk in relationship cultures (MY/ID/TH) where customers go silent instead of complaining.

### AI Prompt

```
Analyze [COMPANY NAME] in [MY/ID/TH] for silent churn patterns.

**Account Context**:
- Country: [MALAYSIA / INDONESIA / THAILAND]
- Tenure: [MONTHS]
- Relationship strength: [STRONG / MODERATE / WEAK — based on history]

**Engagement History (Last 60 Days)**:

Week 1-2:
- Communication frequency: [X MESSAGES]
- Response time: [Y HOURS AVERAGE]
- Response quality: [ENGAGED / NEUTRAL]

Week 3-4:
- Communication frequency: [X MESSAGES]
- Response time: [Y HOURS AVERAGE]
- Response quality: [ENGAGED / NEUTRAL]

Week 5-6:
- Communication frequency: [X MESSAGES]
- Response time: [Y HOURS AVERAGE]
- Response quality: [ENGAGED / NEUTRAL / SHORT]

Week 7-8 (recent):
- Communication frequency: [X MESSAGES]
- Response time: [Y HOURS AVERAGE]
- Response quality: [ENGAGED / NEUTRAL / SHORT / MINIMAL]

**Behavioral Changes**:
- Meeting attendance: [TREND — attending → canceling]
- Message length: [TREND — detailed → short]
- Proactive outreach: [TREND — frequent → rare → none]
- WhatsApp/LINE status: [ACTIVE / LESS ACTIVE / OFFLINE]

Generate a silent churn risk analysis:

## SILENT CHURN RISK ASSESSMENT

**Overall Risk**: [LOW / MEDIUM / HIGH / CRITICAL]

**Cultural Context**: In [COUNTRY], silence = [INTERPRETATION]

---

## BEHAVIORAL PATTERN ANALYSIS

### Response Time Trend
- Week 1-2: [X HOURS]
- Week 7-8: [Y HOURS]
- **Change**: [+/- Z%]
- **Interpretation**: [DEPRIORITIZATION / BUSY / CONFLICT-AVOIDANT / DISENGAGED]

### Message Quality Trend
- Before: [DETAILED, ENGAGED MESSAGES]
- Now: [SHORT RESPONSES: "OK", "Yes", "Will check"]
- **Interpretation**: [MAINTAINING FACE WHILE DISENGAGING / AVOIDING CONFRONTATION]

### Meeting Engagement
- Pattern: [DESCRIBE — e.g., "Canceled last 2 meetings, cited 'busy'"]
- **Interpretation**: In [COUNTRY], repeated "busy" = [POLITE AVOIDANCE / PRIORITIES SHIFTED]

### Proactive Communication
- Before: [X CUSTOMER-INITIATED MESSAGES PER WEEK]
- Now: [Y CUSTOMER-INITIATED MESSAGES PER WEEK]
- **Interpretation**: [RELATIONSHIP COOLING / PROBLEM NOT VOCALIZED]

---

## SILENT CHURN SIGNALS (SEA-Specific)

Detected signals ranked by severity:

🔴 **Critical Signals**:
1. [SIGNAL — e.g., "No response to last 3 WhatsApp messages over 7 days"]
   - In [COUNTRY], this means: [CULTURAL INTERPRETATION]
   - Churn correlation: [X%] of accounts with this pattern churn

2. [SIGNAL]
   - In [COUNTRY], this means:
   - Churn correlation:

🟡 **Warning Signals**:
1. [SIGNAL — e.g., "Response time increased from 2h → 48h"]
   - In [COUNTRY], this means:

2. [SIGNAL]
   - In [COUNTRY], this means:

---

## ROOT CAUSE HYPOTHESIS

**Why customer is going silent** (even though not complaining):

Primary reason:
- [PRODUCT NOT WORKING / CHAMPION CHANGED / PRIORITIES SHIFTED / VALUE UNCLEAR / AVOIDING CONFRONTATION]

Evidence:
- [BEHAVIORAL DATA SUPPORTING HYPOTHESIS]

**Cultural note**: In [COUNTRY], customers avoid:
- Direct confrontation: [YES — won't say "we're unhappy"]
- Appearing unknowledgeable: [YES — won't admit struggling]
- Damaging relationship: [YES — easier to disengage than complain]

---

## INTERVENTION STRATEGY (CULTURALLY-APPROPRIATE)

**Immediate Actions (24-48 hours)**:

**Step 1: Face-Saving Outreach**

Channel: [WHATSAPP / LINE — not formal email]

Draft message:
```
Hi [NAME],

Hope you're well! I wanted to check in — it's been a while since we last connected.

[IF PATTERN OBSERVED]: I noticed [OBSERVATION — gently stated, not accusatory].

How is [PRODUCT] working for your team? Is there anything we can help with?

Would love to catch up briefly if you have 15 min this week.

[YOUR NAME]
```

Tone: Warm, patient, non-confrontational

**Step 2: Alternative Channel (if no response)**

If no WhatsApp response in 48 hours:
- Try: [EMAIL / PHONE CALL / LINKEDIN MESSAGE]
- Frame: Partnership check-in (not "why are you ignoring us")

**Step 3: Stakeholder Diversification**

If champion unresponsive:
- Reach out to: [EXECUTIVE SPONSOR / OTHER STAKEHOLDER]
- Frame: "Want to ensure we're supporting [COMPANY] well. Haven't heard from [CHAMPION] recently — is everything OK?"

**Step 4: Escalation (if 7+ days no response)**

- Internal: Flag account as CRITICAL RISK
- External: Executive-level outreach from your manager

---

## SUCCESS CRITERIA

Intervention successful if:
- ✅ Customer responds within 48-72 hours
- ✅ Schedules call to discuss status
- ✅ Engagement returns to normal levels

Re-churn risk if:
- 🔴 No response after multiple touchpoints (7+ days)
- 🔴 Responses remain minimal/polite but disengaged
- 🔴 Avoids scheduling call

---

**OUTPUT**: Silent churn risk analysis with culturally-adapted intervention plan.
```

---

### Expected Output
- Silent churn risk level specific to SEA cultures
- Behavioral pattern analysis (response time, message quality, engagement)
- SEA-specific signal interpretation (what silence means)
- Root cause hypothesis considering cultural avoidance of confrontation
- Face-saving intervention strategy

**Time saved**: 20 min analysis → 3 min AI analysis (critical for SEA markets)

---

## Framework 4: Dimension-Specific Deep Dive

### Use Case
When one health dimension is concerning, get detailed analysis of that dimension only.

### AI Prompt (Example: Product Usage Deep Dive)

```
Deep dive analysis of product usage health for [COMPANY NAME].

**Usage Data (Last 90 Days)**:

Month 1 (Days 1-30):
- Active users: [X of Y]
- Login frequency: [DAILY / WEEKLY]
- Features used: [LIST]
- Usage hours/actions: [METRIC]

Month 2 (Days 31-60):
- Active users: [X of Y]
- Login frequency: [DAILY / WEEKLY / SPORADIC]
- Features used: [LIST]
- Usage hours/actions: [METRIC]

Month 3 (Days 61-90, most recent):
- Active users: [X of Y]
- Login frequency: [DAILY / WEEKLY / SPORADIC / INACTIVE]
- Features used: [LIST]
- Usage hours/actions: [METRIC]

**Feature Adoption Details**:
- Core features (critical): [% ADOPTION]
- Advanced features: [% ADOPTION]
- Unused features: [LIST]
- Feature abandonment: [ANY FEATURES USED THEN STOPPED?]

**Power User Analysis**:
- Number of power users (daily, >90% features): [X]
- Power user names/roles (if known): [LIST]
- Power user trend: [GROWING / STABLE / DECLINING]

Generate a product usage deep dive:

## USAGE HEALTH SCORE

**Score**: [0-30]/30

**Category**:
- 25-30: Excellent usage
- 20-24: Good usage
- 15-19: Moderate usage (room for growth)
- 10-14: Low usage (at-risk)
- 0-9: Critical (minimal usage)

**This account**: [CATEGORY]

---

## USAGE TREND ANALYSIS

### 90-Day Trajectory

**Direction**: [GROWING / STABLE / DECLINING / ERRATIC]

**Velocity**: [FAST / MODERATE / SLOW / STALLED]

**Month-over-month changes**:
- Month 1 → Month 2: [+/- X%]
- Month 2 → Month 3: [+/- Y%]

**Trend interpretation**:
- [ACCELERATING ADOPTION / STEADY STATE / PLATEAU / DECLINE]

**Concern level**: [NONE / LOW / MEDIUM / HIGH / CRITICAL]

---

## FEATURE ADOPTION ANALYSIS

### Adoption Breadth (# of features used)
- Using: [X] of [Y] features ([Z%])
- Benchmark: Healthy accounts use [N%] of features by Month 3

### Adoption Depth (how intensively)
- Daily users: [X]
- Weekly users: [Y]
- Monthly/sporadic: [Z]

### Feature Gaps
**High-value features NOT being used**:
1. [FEATURE 1] — [WHY IT MATTERS FOR THEIR USE CASE]
2. [FEATURE 2]
3. [FEATURE 3]

**Why gaps exist** (hypothesis):
- [NOT AWARE / DON'T SEE VALUE / TOO COMPLEX / NOT NEEDED]

---

## POWER USER DYNAMICS

**Power user count**: [X]

**Trend**: [GROWING / STABLE / DECLINING]

**Impact**:
- Power users = expansion champions
- If growing: Positive signal (expansion opportunity)
- If declining: Risk signal (disengagement starting)

**Power user names** (if known):
- [NAME 1, ROLE] — [USAGE PATTERN]
- [NAME 2, ROLE]

---

## CHURN PREDICTION FROM USAGE ALONE

**Churn risk (usage only)**: [LOW / MEDIUM / HIGH / CRITICAL]

**Pattern match**:
- Accounts with [SIMILAR USAGE PATTERN] churn at [X%] rate within [Y] days

**Leading indicators of churn** (from usage):
- Usage decline >30% month-over-month: [YES/NO]
- Feature abandonment (used then stopped): [YES/NO]
- Low activation (<60% of core features): [YES/NO]
- No power users: [YES/NO]
- Last login >7 days: [YES/NO]

**Red flags detected**: [NUMBER]

---

## RECOMMENDED ACTIONS

**If usage is declining**:
1. Proactive check-in: "How is [PRODUCT] working for you?"
2. Identify blockers: "What's preventing more usage?"
3. Training offer: "Would a refresher on [FEATURE] help?"

**If usage is low but stable**:
1. Feature nudges: "Have you tried [HIGH-VALUE FEATURE]?"
2. Use case expansion: "I notice you're using [FEATURE A] — [FEATURE B] would complement it"

**If usage is healthy**:
1. Expand to advanced features
2. Identify expansion opportunity (more seats, higher tier)

---

**OUTPUT**: Deep dive on product usage dimension only (not full health analysis).
```

---

### Other Dimension-Specific Prompts

**Engagement Deep Dive**:
Replace usage data with engagement data (response rates, meeting attendance, communication quality trends)

**Support Sentiment Deep Dive**:
Replace with support ticket data, sentiment analysis, CSAT trends

**Adoption Velocity Deep Dive**:
Replace with onboarding milestones, time-to-value metrics, feature adoption curve

**Stakeholder Stability Deep Dive**:
Replace with stakeholder turnover, org changes, LinkedIn activity

**Business Outcomes Deep Dive**:
Replace with goal achievement, ROI visibility, renewal sentiment

---

## Framework 5: Weekly Batch Health Scoring

### Use Case
Automate weekly health score refresh for all accounts (or segment of accounts).

### AI Prompt

```
Batch health analysis for [NUMBER] accounts.

**Input data** (CSV or structured format):
[PASTE CSV WITH COLUMNS: Company, Active Users, Login Frequency, Response Rate, Tickets, Engagement Score, etc.]

For each account, generate:

1. **Health Score** (0-100)
2. **Trend** (IMPROVING / STABLE / DECLINING)
3. **Churn Risk** (LOW / MEDIUM / HIGH / CRITICAL)
4. **Top Risk Factor** (one dimension causing most concern)
5. **Recommended Action** (one immediate action to take)

**Output as CSV**:
```
Company, Health Score, Trend, Churn Risk, Top Risk, Action
[COMPANY A], 85, Stable, Low, None, Monitor
[COMPANY B], 62, Declining, Medium, Low usage, Proactive check-in
[COMPANY C], 42, Declining, High, Ghosting, Immediate outreach + escalation
...
```

**Prioritization**:
- Flag all accounts with Health <60 for immediate CSM attention
- Flag all accounts with "Declining" trend for proactive check-in

**SEA Cultural Flags**:
- For MY/ID/TH accounts: Flag any "Declining" engagement as higher risk (silent churn)
- For SG/PH accounts: Trust direct communication (if health score green, likely OK)

---

**OUTPUT**: CSV with health scores + actions for all accounts in batch.
```

---

### Expected Output
- Batch processed health scores for entire portfolio
- CSV format ready to upload to CRM
- Automatic prioritization of at-risk accounts
- Country-specific risk adjustments

**Time saved**: 5 hours manual scoring (100 accounts) → 15 min AI batch + review

---

## Country-Specific Health Adjustments

### Singapore: Trust Direct Signals

**Adjustment**:
- Weight engagement higher (they'll tell you if there's a problem)
- Lower weight on "silence" (busy ≠ churn in SG)
- Metrics-driven threshold: Health <70 = intervene

---

### Malaysia/Indonesia: Weight Silence Heavily

**Adjustment**:
- Engagement decline = RED FLAG (not yellow)
- Response time increase >24h = immediate intervention
- "Busy" excuses = potential churn signal
- Threshold: Health <75 = intervene (earlier than SG)

---

### Thailand: Face-Saving Lens

**Adjustment**:
- Polite disengagement = highest risk
- Never ask "Are you unhappy?" (they'll say no even if yes)
- Behavioral signals only (words unreliable)
- Threshold: Health <75 = intervene

---

### Vietnam: Results-Focused

**Adjustment**:
- ROI clarity most important dimension
- If value unclear, health at risk (even if usage OK)
- Practical intervention approach
- Threshold: Health <70 = intervene

---

### Philippines: Balance Direct + Relationship

**Adjustment**:
- They'll communicate issues (like SG)
- But relationship matters (like MY/ID)
- Hybrid approach: Trust signals + relationship maintenance
- Threshold: Health <70 = intervene

---

## AI Prompts: Quick Reference

### For Copy-Paste

**Full Health Score**:
"Generate comprehensive 6-dimension health score for [COMPANY]. [PASTE DATA]. Country: [COUNTRY]. Output: scores, churn risk, actions."

**Quick Churn Check**:
"Quick churn risk for [COMPANY] in [COUNTRY]. Signals: [LIST]. Output: risk level, immediate actions."

**Silent Churn (SEA)**:
"Silent churn analysis for [COMPANY] in [MY/ID/TH]. Engagement history: [PASTE]. Output: behavioral patterns, culturally-appropriate intervention."

**Usage Deep Dive**:
"Product usage deep dive for [COMPANY]. Usage data: [PASTE 90 DAYS]. Output: usage health, trends, feature gaps, actions."

**Weekly Batch**:
"Batch health scoring for [X] accounts. Data: [PASTE CSV]. Output: CSV with scores, trends, risks, actions."

---

## Related Resources

**Guide**: [AI Health Scoring](../guides/02-health-scoring.md) — Full health scoring framework

**Guide**: [AI Churn Prevention](../guides/03-churn-prevention.md) — What to do when health drops

**Cultural Context**: [CULTURAL-CS.md](../CULTURAL-CS.md) — SEA health signal interpretation

**Main Guide**: [Back to README](../README.md)

---

**Questions or Issues?**
- GitHub: [Open an issue](https://github.com/michaelhauge/myeo-ai-resources/issues)
- Email: hello@myeo.ai

---

**Last Updated**: 2026-02-07
