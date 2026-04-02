# AI-Powered Customer Health Scoring for SEA

**Last Updated**: 2026-02-07
**Setup Time**: 1-2 weeks
**Expected ROI**: Identify at-risk accounts 60-90 days earlier, reduce churn by 20-30%

---

## The Problem

Traditional customer health scoring in SEA fails because:

- ❌ **Lagging indicators only** — NPS surveys and support tickets tell you customers are ALREADY churning
- ❌ **Manual score updates** — Quarterly or monthly updates = decisions on stale data
- ❌ **Reactive, not predictive** — You learn about churn when customer cancels (too late to save)
- ❌ **Western engagement signals** — Phone calls and emails aren't primary channels in SEA (WhatsApp/LINE are)
- ❌ **Misses cultural nuances** — In MY/ID/TH, customers won't complain directly (they just go silent)

**Why Traditional Health Scoring Fails in SEA**:

| Western Health Metrics | SEA Reality |
|------------------------|-------------|
| "Customer will tell us if unhappy" (NPS, CSAT) | Customers avoid confrontation (relationship cultures) |
| "Low email opens = disengagement" | Email isn't primary channel (WhatsApp 85-90% open rate) |
| "Support tickets = bad health" | SEA customers avoid bothering you (even when stuck) |
| "Low meeting attendance = churn risk" | Formal meetings less common (prefer chat-based communication) |
| "Green score = safe account" | Silent accounts can be the highest risk |

---

## The AI-First Transformation

### Before (Manual Health Scoring)
- **Data sources**: NPS surveys (quarterly), support ticket count, last meeting date
- **Update frequency**: Monthly or quarterly
- **Scoring method**: Manual spreadsheet or basic CRM automation
- **Prediction horizon**: 0-30 days (reactive)
- **Result**: "Green" accounts churn unexpectedly

### After (AI-Powered Health Scoring)
- **Data sources**: Usage patterns, feature adoption velocity, stakeholder changes, sentiment from support/chat, engagement across channels
- **Update frequency**: Weekly or real-time
- **Scoring method**: AI analyzes patterns + predicts churn risk
- **Prediction horizon**: 60-90 days (predictive)
- **Result**: Early warnings with time to intervene

**Impact**: Catch churn signals 2-3 months earlier, 20-30% churn reduction

---

## AI Health Scoring Framework: The 6-Dimension Model

```
Dimension 1: PRODUCT USAGE (30% weight)
├─ Login frequency trend
├─ Feature adoption breadth
├─ Power user emergence
└─ Usage velocity (growing vs declining)

Dimension 2: ENGAGEMENT (20% weight)
├─ Response rate (email, WhatsApp, LINE)
├─ Meeting attendance
├─ Proactive outreach vs reactive only
└─ Stakeholder availability

Dimension 3: SUPPORT SENTIMENT (15% weight)
├─ Ticket volume trend
├─ Ticket sentiment (frustrated vs neutral)
├─ Resolution time
└─ Escalations

Dimension 4: ADOPTION VELOCITY (15% weight)
├─ Time to first value
├─ Feature adoption rate
├─ Training completion
└─ Best practice implementation

Dimension 5: STAKEHOLDER STABILITY (10% weight)
├─ Champion turnover
├─ Executive sponsor changes
├─ Team expansion/contraction
└─ Org changes (layoffs, funding, etc.)

Dimension 6: BUSINESS OUTCOMES (10% weight)
├─ Stated goals achieved
├─ ROI visibility
├─ Renewals sentiment
└─ Expansion interest

Total Health Score: 0-100 (weighted sum)
```

**Health Categories**:
- **90-100**: 🟢 THRIVING — Expand opportunity
- **75-89**: 🟢 HEALTHY — Monitor, maintain
- **60-74**: 🟡 AT RISK — Proactive intervention
- **40-59**: 🔴 HIGH RISK — Urgent save strategy
- **0-39**: 🔴 CRITICAL — Churn imminent

---

## Dimension 1: Product Usage Health (30% weight)

### AI Analysis Prompt

```
Analyze product usage health for [COMPANY NAME].

Usage Data (from product analytics):
- Users: [ACTIVE USERS] of [TOTAL SEATS]
- Login frequency: [DAILY / WEEKLY / SPORADIC / INACTIVE]
- Last 30 days vs previous 30 days: [TREND: +X% or -X%]
- Features used: [LIST CORE FEATURES]
- Features NOT used: [LIST]
- Power users: [NUMBER OF USERS WITH DAILY USAGE]
- Feature adoption rate: [% OF AVAILABLE FEATURES USED]

Generate a Product Usage Health Analysis:

## Usage Score (0-30)
- Raw score: [NUMBER]
- Reasoning: [WHY THIS SCORE]

## Trend Analysis
- Momentum: [GROWING / STABLE / DECLINING]
- Velocity: [FAST / MODERATE / SLOW / STALLED]
- Concern level: [NONE / LOW / MEDIUM / HIGH / CRITICAL]

## Key Signals
🟢 Positive signals:
- [EXAMPLE: "Usage up 15% month-over-month"]
- [EXAMPLE: "3 power users emerging (daily usage)"]

🔴 Warning signals:
- [EXAMPLE: "Login frequency dropped from daily to weekly"]
- [EXAMPLE: "Core feature [X] abandoned after Week 2"]

## Churn Prediction from Usage
- Churn risk (usage only): [LOW / MEDIUM / HIGH]
- Similar patterns: [X% of customers with this pattern churned within 90 days]
- Time to intervention: [DAYS UNTIL CRITICAL]

## Recommended Actions
1. [IMMEDIATE ACTION IF RED FLAGS]
2. [PROACTIVE NUDGE IF YELLOW FLAGS]
3. [MAINTAIN IF GREEN]

Format as concise health brief (1 page).
```

**Output**: Usage health score + early warning signals

---

## Dimension 2: Engagement Health (20% weight)

### AI Analysis Prompt

```
Analyze engagement health for [COMPANY NAME] in [COUNTRY].

Engagement Data:
- Email response rate: [%] (industry benchmark: 30-40%)
- WhatsApp/LINE response rate: [%] (SEA benchmark: 80-90%)
- Meeting attendance: [ATTENDED X OF Y SCHEDULED]
- Proactive outreach: [NUMBER OF CUSTOMER-INITIATED MESSAGES IN 30 DAYS]
- Last communication: [DATE]
- Communication channel preference: [EMAIL / WHATSAPP / LINE / AVOIDING ALL]

Generate an Engagement Health Analysis:

## Engagement Score (0-20)
- Raw score: [NUMBER]
- Reasoning: [WHY THIS SCORE]

## Channel Analysis
Primary channel: [WHATSAPP / LINE / EMAIL]
- Response rate: [%]
- Trend: [IMPROVING / STABLE / DECLINING]
- Cultural note: In [COUNTRY], [EXPECTED BEHAVIOR]

## Stakeholder Availability
Champion: [RESPONSIVE / SLOW / GHOSTING]
Executive Sponsor: [ENGAGED / DISTANT / UNKNOWN]
Concern: [NONE / LOW / MEDIUM / HIGH]

## Red Flags
🔴 **Critical**:
- [EXAMPLE: "No response to last 3 WhatsApp messages (7 days)"]
- [EXAMPLE: "Champion hasn't attended last 2 scheduled meetings"]

🟡 **Warning**:
- [EXAMPLE: "Response time increasing (24h → 72h average)"]
- [EXAMPLE: "Switched from proactive to reactive-only communication"]

## SEA Cultural Context
In [COUNTRY]:
- Going silent = [INTERPRETATION: DISENGAGED / BUSY / CONFLICT-AVOIDANT]
- Expected engagement level: [WHAT'S NORMAL FOR THIS MARKET]
- Recommended intervention: [CULTURALLY APPROPRIATE OUTREACH]

## Churn Prediction from Engagement
- Churn risk (engagement only): [LOW / MEDIUM / HIGH]
- Pattern match: [X% of customers with this pattern churned]

## Recommended Actions
1. [IMMEDIATE: IF GHOSTING]
2. [PROACTIVE: IF SLOWING]
3. [MAINTAIN: IF HEALTHY]
```

**Output**: Engagement health score + communication pattern analysis

---

## Dimension 3: Support Sentiment Health (15% weight)

### AI Analysis Prompt

```
Analyze support sentiment health for [COMPANY NAME].

Support Data:
- Tickets (30 days): [NUMBER]
- Trend: [UP / STABLE / DOWN vs previous period]
- Ticket topics: [LIST TOP 3 CATEGORIES]
- Sentiment: [PASTE RECENT TICKET EXCERPTS OR SUMMARIES]
- Resolution time: [AVERAGE HOURS/DAYS]
- Escalations: [NUMBER]
- CSAT (if available): [SCORE]

Generate a Support Sentiment Analysis:

## Support Score (0-15)
- Raw score: [NUMBER]
- Reasoning: [WHY THIS SCORE]

## Sentiment Analysis
Overall tone: [FRUSTRATED / NEUTRAL / POSITIVE]
Evidence:
- [QUOTE OR PATTERN FROM TICKETS]
- [ESCALATION HISTORY]

## Ticket Pattern Analysis
🟢 **Healthy patterns**:
- [EXAMPLE: "Questions about advanced features (expansion signal)"]
- [EXAMPLE: "Positive feedback in tickets"]

🔴 **Unhealthy patterns**:
- [EXAMPLE: "Same issue reported 3x (not resolved properly)"]
- [EXAMPLE: "Increasing frustration in tone over time"]

## Red Flags
- [CRITICAL FLAG: "Executive escalation"]
- [WARNING FLAG: "Repeated issues with no resolution"]

## Churn Prediction from Support
- Churn risk (support only): [LOW / MEDIUM / HIGH]
- Pattern: [X% of customers with frustrated support sentiment churn]

## Recommended Actions
1. [IF FRUSTRATED: IMMEDIATE ESCALATION TO CSM]
2. [IF REPEATED ISSUES: ROOT CAUSE ANALYSIS]
3. [IF HEALTHY: MAINTAIN RESPONSE QUALITY]
```

**Output**: Support sentiment score + frustration signals

---

## Dimension 4: Adoption Velocity Health (15% weight)

### AI Analysis Prompt

```
Analyze adoption velocity for [COMPANY NAME].

Adoption Data:
- Days since purchase: [NUMBER]
- Time to first value: [DAYS] (benchmark: <30 days)
- Feature adoption curve: [% FEATURES ADOPTED BY WEEK]
  - Week 1: [%]
  - Week 4: [%]
  - Week 8: [%]
  - Week 12: [%]
- Training completion: [COMPLETED / IN PROGRESS / NOT STARTED]
- Best practices implemented: [NUMBER]

Generate an Adoption Velocity Analysis:

## Adoption Velocity Score (0-15)
- Raw score: [NUMBER]
- Reasoning: [WHY THIS SCORE]

## Velocity Assessment
Speed: [FAST / ON-TRACK / SLOW / STALLED]
- Expected: [% ADOPTION BY THIS POINT]
- Actual: [% ADOPTION]
- Gap: [+/- X%]

## Adoption Curve Analysis
📈 **Momentum indicators**:
- [EXAMPLE: "Adopted 3 new features in last 2 weeks (accelerating)"]
- [EXAMPLE: "Training completed ahead of schedule"]

📉 **Stall indicators**:
- [EXAMPLE: "No new feature adoption in 30 days (plateau)"]
- [EXAMPLE: "Stuck at 40% feature coverage for 3 weeks"]

## Churn Prediction from Adoption
- Churn risk (adoption velocity): [LOW / MEDIUM / HIGH]
- Pattern: Customers stalled at <50% adoption by Week 8 churn at [X%] rate

## Recommended Actions
1. [IF STALLED: IDENTIFY BLOCKERS, TRAINING]
2. [IF SLOW: PROACTIVE NUDGES, QUICK WINS]
3. [IF FAST: EXPAND OPPORTUNITIES]
```

**Output**: Adoption velocity score + stall detection

---

## Dimension 5: Stakeholder Stability Health (10% weight)

### AI Analysis Prompt

```
Analyze stakeholder stability for [COMPANY NAME].

Stakeholder Data:
- Champion: [NAME, TITLE]
  - Tenure in role: [MONTHS/YEARS]
  - LinkedIn activity: [UPDATED RECENTLY / STABLE / LEFT COMPANY]
- Executive Sponsor: [NAME, TITLE]
  - Tenure in role: [MONTHS/YEARS]
  - Status: [ENGAGED / DISTANT / UNKNOWN]
- Team size: [NUMBER NOW] vs [NUMBER AT PURCHASE]
- Org changes (if known):
  - Layoffs: [YES/NO]
  - Funding news: [RAISED / CUTTING / STABLE]
  - Leadership changes: [YES/NO]

Generate a Stakeholder Stability Analysis:

## Stakeholder Score (0-10)
- Raw score: [NUMBER]
- Reasoning: [WHY THIS SCORE]

## Stability Assessment
Overall: [STABLE / AT RISK / HIGH RISK]

## Red Flags
🔴 **Critical**:
- [EXAMPLE: "Champion left company 2 weeks ago (no new contact)"]
- [EXAMPLE: "Company announced 30% layoff (team using product cut)"]

🟡 **Warning**:
- [EXAMPLE: "Champion promoted (new priorities)"]
- [EXAMPLE: "Executive sponsor changed (new leader unknown to us)"]

## SEA Context
In [COUNTRY]:
- Stakeholder turnover = [TYPICAL PATTERN]
- Relationship transfer: [EASY / DIFFICULT]
- Recommended action: [BUILD MULTI-STAKEHOLDER RELATIONSHIPS]

## Churn Prediction from Stakeholder Changes
- Churn risk (stakeholder stability): [LOW / MEDIUM / HIGH]
- Pattern: Champion turnover → [X%] churn rate within 90 days if not managed

## Recommended Actions
1. [IF CHAMPION LEFT: IMMEDIATE OUTREACH TO FIND NEW CONTACT]
2. [IF ORG CHANGES: CHECK-IN TO ASSESS IMPACT]
3. [IF STABLE: DIVERSIFY STAKEHOLDERS (DON'T RELY ON ONE)]
```

**Output**: Stakeholder stability score + turnover risk

---

## Dimension 6: Business Outcomes Health (10% weight)

### AI Analysis Prompt

```
Analyze business outcomes health for [COMPANY NAME].

Outcomes Data:
- Stated goals (from sales/kickoff):
  - Goal 1: [DESCRIPTION]
  - Goal 2: [DESCRIPTION]
- Progress on goals:
  - Goal 1: [ACHIEVED / IN PROGRESS / NO PROGRESS / UNKNOWN]
  - Goal 2: [ACHIEVED / IN PROGRESS / NO PROGRESS / UNKNOWN]
- ROI visibility: [CAN CUSTOMER QUANTIFY VALUE / UNCLEAR]
- Renewal sentiment: [POSITIVE / NEUTRAL / NEGATIVE / UNKNOWN]
- Expansion interest: [EXPRESSED INTEREST / NEUTRAL / NOT INTERESTED]

Generate a Business Outcomes Analysis:

## Outcomes Score (0-10)
- Raw score: [NUMBER]
- Reasoning: [WHY THIS SCORE]

## Goal Achievement
Goal 1: [STATUS]
- Evidence: [HOW WE KNOW]
- Impact: [QUANTIFIED IF POSSIBLE]

Goal 2: [STATUS]
- Evidence:
- Impact:

## ROI Clarity
Customer can articulate value: [YES / PARTIALLY / NO]
- If YES: [WHAT THEY SAY]
- If NO: [WHY UNCLEAR — NEED TO HELP THEM SEE VALUE]

## Renewal Signals
🟢 **Positive signals**:
- [EXAMPLE: "Customer mentioned renewal positively in last QBR"]
- [EXAMPLE: "Asked about multi-year pricing"]

🔴 **Negative signals**:
- [EXAMPLE: "Avoided renewal conversation when raised"]
- [EXAMPLE: "Questioned value/ROI"]

## Churn Prediction from Outcomes
- Churn risk (business outcomes): [LOW / MEDIUM / HIGH]
- Pattern: Customers who can't articulate ROI churn at [X%] rate

## Recommended Actions
1. [IF NO ROI CLARITY: HELP QUANTIFY VALUE]
2. [IF GOALS NOT ACHIEVED: INTERVENTION TO UNBLOCK]
3. [IF GOALS ACHIEVED: LEVERAGE FOR RENEWAL/EXPANSION]
```

**Output**: Business outcomes score + value realization status

---

## Composite AI Health Score

### Combined Analysis Prompt

```
Generate a comprehensive health score for [COMPANY NAME].

Input from all 6 dimensions:
1. Product Usage: [SCORE]/30
2. Engagement: [SCORE]/20
3. Support Sentiment: [SCORE]/15
4. Adoption Velocity: [SCORE]/15
5. Stakeholder Stability: [SCORE]/10
6. Business Outcomes: [SCORE]/10

Generate a Comprehensive Health Report:

## Overall Health Score
- **Total**: [SUM]/100
- **Category**: [THRIVING / HEALTHY / AT RISK / HIGH RISK / CRITICAL]
- **Trend**: [IMPROVING / STABLE / DECLINING]

## Health Breakdown
| Dimension | Score | Status | Trend |
|-----------|-------|--------|-------|
| Product Usage | [X]/30 | [🟢/🟡/🔴] | [↗️/→/↘️] |
| Engagement | [X]/20 | [🟢/🟡/🔴] | [↗️/→/↘️] |
| Support Sentiment | [X]/15 | [🟢/🟡/🔴] | [↗️/→/↘️] |
| Adoption Velocity | [X]/15 | [🟢/🟡/🔴] | [↗️/→/↘️] |
| Stakeholder Stability | [X]/10 | [🟢/🟡/🔴] | [↗️/→/↘️] |
| Business Outcomes | [X]/10 | [🟢/🟡/🔴] | [↗️/→/↘️] |

## Churn Risk Assessment
- **Overall churn probability**: [LOW / MEDIUM / HIGH / CRITICAL]
- **Timeframe**: [90+ days / 60-90 days / 30-60 days / <30 days]
- **Confidence**: [HIGH / MEDIUM / LOW]

## Top 3 Risk Factors
1. [HIGHEST RISK DIMENSION + SPECIFIC ISSUE]
2. [SECOND RISK]
3. [THIRD RISK]

## Top 3 Positive Signals
1. [STRONGEST DIMENSION + SPECIFIC WIN]
2. [SECOND STRENGTH]
3. [THIRD STRENGTH]

## Recommended Actions (Priority Order)
**Immediate (This Week)**:
1. [URGENT ACTION IF CRITICAL/HIGH RISK]

**Short-term (This Month)**:
2. [PROACTIVE INTERVENTION IF AT RISK]

**Long-term (This Quarter)**:
3. [OPTIMIZATION IF HEALTHY]

## SEA Cultural Context
In [COUNTRY]:
- This health pattern typically means: [INTERPRETATION]
- Cultural intervention approach: [RELATIONSHIP-BASED / DATA-BASED]
- Recommended communication: [CHANNEL + TONE]

## Next Review Date
- [DATE — typically 7-14 days for at-risk, 30 days for healthy]
```

**Output**: Comprehensive 1-2 page health report with action plan

---

## SEA-Specific Health Signals

### Indonesia/Malaysia/Thailand: Silent Churn Patterns

In relationship cultures, customers won't tell you they're unhappy. Watch for:

**🔴 Red Flags (SEA-Specific)**:
1. **Response time increasing**:
   - Week 1-4: Respond to WhatsApp within 2 hours
   - Week 5+: Respond within 24-48 hours or not at all
   - **Interpretation**: Deprioritizing relationship (but won't say so)

2. **Switched to short/polite responses**:
   - Before: Detailed, engaged messages
   - After: "Yes", "OK", "Will check" (minimal engagement)
   - **Interpretation**: Maintaining face while disengaging

3. **Champion suddenly "too busy"**:
   - Pattern: Cancels 2-3 meetings in a row, cites "busy"
   - **Interpretation**: Avoiding confrontation (doesn't want to say there's a problem)

4. **Executive sponsor MIA**:
   - Pattern: Sponsor was engaged, now unreachable
   - **Interpretation**: Priorities shifted (product deprioritized)

**AI Prompt (SEA Silent Churn Detection)**:
```
Analyze [COMPANY NAME] in [COUNTRY] for silent churn patterns.

Engagement history:
- [PASTE LAST 4-6 WEEKS OF INTERACTION SUMMARY]

Look for:
1. Response time trend (increasing = risk)
2. Message length/detail trend (shortening = disengagement)
3. Meeting cancellation pattern
4. Stakeholder availability changes
5. Shift from proactive → reactive-only

Generate a Silent Churn Risk Analysis:
- Risk level: [LOW / MEDIUM / HIGH]
- Evidence: [SPECIFIC PATTERNS]
- Cultural interpretation: In [COUNTRY], this means...
- Recommended intervention: [CULTURALLY APPROPRIATE OUTREACH]
```

---

### Singapore/Philippines: Direct Churn Signals

In more direct cultures, customers will tell you (but still need to watch usage):

**🔴 Red Flags (Direct Markets)**:
1. **Explicit dissatisfaction**: "This isn't working for us"
2. **ROI questions**: "We're not seeing the value we expected"
3. **Competitor mentions**: "We're evaluating [COMPETITOR]"
4. **Budget pressure**: "We need to cut costs"

**AI Prompt (Direct Churn Detection)**:
```
Analyze [COMPANY NAME] in [SG/PH] for explicit churn signals.

Recent communications:
- [PASTE LAST 3-5 INTERACTIONS]

Support tickets:
- [PASTE RECENT TICKET SUMMARIES]

Look for:
1. Explicit value/ROI questions
2. Competitor references
3. Budget/cost concerns
4. Feature gap complaints
5. Renewal hesitation

Generate a Churn Risk Analysis:
- Risk level: [LOW / MEDIUM / HIGH]
- Evidence: [SPECIFIC QUOTES]
- Root cause: [PRODUCT FIT / PRICING / SUPPORT / OTHER]
- Save strategy: [RECOMMENDED APPROACH]
```

---

## Health Score Automation

### Weekly Health Score Refresh (AI Workflow)

**Goal**: Auto-update health scores weekly without manual work

**Setup**:
1. Export usage data from product analytics (CSV/API)
2. Export CRM engagement data
3. Export support ticket data
4. Feed to AI for analysis

**AI Prompt (Weekly Health Batch)**:
```
You are a customer success analyst. Analyze health for all accounts.

Input data:
- [PASTE USAGE DATA CSV]
- [PASTE ENGAGEMENT DATA]
- [PASTE SUPPORT DATA]

For each account, generate:
1. Health score (0-100)
2. Trend (improving/stable/declining)
3. Churn risk (low/medium/high)
4. Top risk factor
5. Recommended action

Output as CSV:
Company, Health Score, Trend, Churn Risk, Top Risk, Action
[COMPANY A], 85, Stable, Low, None, Monitor
[COMPANY B], 62, Declining, Medium, Low usage, Proactive check-in
...
```

**Output**: CSV with health scores + actions for all accounts

---

### Real-Time Churn Alerts

**Trigger AI analysis when**:
- Usage drops >30% week-over-week
- No login for 7+ days
- Champion email bounces (left company)
- Support ticket escalated
- Meeting canceled 2x in a row

**AI Prompt (Churn Alert)**:
```
URGENT: [TRIGGER EVENT] detected for [COMPANY NAME].

Event: [DESCRIBE TRIGGER]
Account context: [RECENT HISTORY]

Generate an urgent churn risk alert:
1. Risk level: [MEDIUM / HIGH / CRITICAL]
2. Churn probability: [%]
3. Timeframe: [DAYS UNTIL LIKELY CHURN]
4. Root cause hypothesis: [WHY THIS HAPPENED]
5. Immediate action needed: [WITHIN 24-48 HOURS]
6. Draft outreach message: [FOR CHAMPION]

SEA context for [COUNTRY]:
- How to frame the outreach (face-saving vs direct)
```

---

## Common Health Scoring Mistakes in SEA

### Mistake #1: Over-Relying on NPS/CSAT
**What happens**: In SEA, customers give inflated scores to avoid confrontation. 4/5 NPS might be "politely declining".

**Western approach**: Trust NPS/CSAT scores at face value
**SEA approach**: Weight usage data and engagement trends higher than surveys

**AI Solution**:
```
Prompt: "Analyze [COMPANY] health. Their NPS is 4/5 but usage dropped 40%. In [COUNTRY], interpret this discrepancy and predict actual churn risk."
```

---

### Mistake #2: Ignoring WhatsApp/LINE Engagement
**What happens**: You track email opens (20-30%) and miss that customer is active on WhatsApp (85-90% engagement).

**Western approach**: Email-centric engagement tracking
**SEA approach**: Multi-channel engagement (WhatsApp >> Email)

**AI Solution**:
```
Prompt: "Customer hasn't opened emails but responds to WhatsApp within 1 hour. What's their true engagement level in [COUNTRY]?"
```

---

### Mistake #3: Treating "Silent" as "Healthy"
**What happens**: Customer stops responding but doesn't complain. You assume everything is fine. They churn.

**Western approach**: "No news is good news"
**SEA approach**: "Silence is a red flag in relationship cultures"

**AI Solution**:
```
Prompt: "Customer in [MY/ID/TH] has gone from 5 messages/week to 1 message/week. Response time increased from 2h to 48h. They haven't complained. Assess churn risk."
```

---

### Mistake #4: Waiting for "Red" Scores to Act
**What happens**: By the time score drops to "red", customer has mentally checked out. Too late to save.

**Western approach**: Intervene at <60 health score
**SEA approach**: Intervene at <75 health score (earlier)

**AI Solution**:
```
Prompt: "Customer at 72 health score (barely yellow). In [COUNTRY], should we intervene proactively or wait for red?"
```

---

## Templates for Your CRM

### Health Score Fields (CRM)
- **Overall Health Score**: [0-100]
- **Health Category**: [THRIVING / HEALTHY / AT RISK / HIGH RISK / CRITICAL]
- **Health Trend**: [IMPROVING / STABLE / DECLINING]
- **Last Health Update**: [DATE]
- **Churn Risk**: [LOW / MEDIUM / HIGH / CRITICAL]
- **Churn Timeframe**: [90+ DAYS / 60-90 / 30-60 / <30]
- **Top Risk Factor**: [FREE TEXT]
- **Top Strength**: [FREE TEXT]
- **Next Health Review**: [DATE]

**Dimension Scores** (for tracking):
- Usage Score: [0-30]
- Engagement Score: [0-20]
- Support Score: [0-15]
- Adoption Score: [0-15]
- Stakeholder Score: [0-10]
- Outcomes Score: [0-10]

---

### Health Alert Workflow (CRM Automation)
**Trigger**: Health score drops below 60
**Actions**:
1. Create task for CSM: "URGENT: Health score dropped to [X]"
2. Flag account as "At Risk"
3. Schedule intervention call within 48 hours
4. Run AI churn risk analysis
5. Draft save strategy using AI

---

## Next Steps

### 1. Set Up Your Health Scoring System
**Week 1**: Define data sources
- Product usage data (from analytics)
- CRM engagement data
- Support ticket data
- Stakeholder info (LinkedIn, CRM)

**Week 2**: Run first AI health analysis
- Pick 5-10 accounts
- Run composite health score prompt
- Validate AI output vs your gut feel

---

### 2. Implement Weekly Health Refresh
**Automate**:
- Weekly export from analytics/CRM
- AI batch analysis
- Upload scores to CRM
- Auto-flag at-risk accounts

---

### 3. Set Up Churn Alerts
**Real-time triggers**:
- Usage drop >30%
- No login 7+ days
- Meeting canceled 2x
- Support escalation
- Stakeholder change

---

### 4. Build Your Save Playbook
For each risk level:
- **At Risk (60-74)**: Proactive check-in within 7 days
- **High Risk (40-59)**: Intervention call within 48 hours
- **Critical (<40)**: Executive engagement + save offer

---

## Related Resources

**Previous Guide**: [AI Customer Onboarding](01-customer-onboarding.md) — Onboard customers for health

**Next Guide**: [AI Churn Prevention](03-churn-prevention.md) — Intervene when health drops

**Templates**: [Health Score Frameworks](../templates/health-score-frameworks.md) — Ready-to-use scoring models

**Cultural Context**: [CULTURAL-CS.md](../CULTURAL-CS.md) — SEA health signal interpretation

**Main Guide**: [Back to README](../README.md)

---

**Questions or Issues?**
- GitHub: [Open an issue](https://github.com/michaelhauge/myeo-ai-resources/issues)
- Email: hello@myeo.ai

---

**Last Updated**: 2026-02-07
