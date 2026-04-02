# AI-Powered Churn Prevention for SEA

**Last Updated**: 2026-02-07
**Setup Time**: 2-3 weeks
**Expected ROI**: 15-25% improvement in save rate, catch churn signals 60-90 days earlier, reduce annual churn by 20-30%

---

## The Problem

Churn prevention in SEA faces unique challenges that Western approaches miss:

**Traditional churn management fails because**:
- ❌ **Reactive firefighting** — Learn about churn when customer cancels (too late to save)
- ❌ **Lagging indicators** — NPS, CSAT, support tickets = customer already churning
- ❌ **Generic save offers** — "What can we do to keep you?" feels desperate, not strategic
- ❌ **SEA silent churn** — In MY/ID/TH, customers avoid confrontation, just disappear
- ❌ **No systematic playbooks** — Ad hoc responses, inconsistent save strategies

**Why Western Churn Prevention Fails in SEA**:

| Western Approach | SEA Reality |
|------------------|-------------|
| "Customer will complain if unhappy" | Customers avoid confrontation (relationship cultures) |
| "Exit interviews reveal churn reasons" | Customers give polite excuses, not real reasons |
| "Aggressive save tactics" | Pressure damages relationship (face-saving cultures) |
| "Price discount saves accounts" | Value gap is real issue, not just price |
| "We'll know 30 days out" | Silent disengagement starts 60-90 days earlier |

---

## The AI-First Transformation

### Before (Reactive Churn Management)
- **Detection**: Customer cancels or mentions churn (0-14 days notice)
- **Analysis**: Scramble to understand why (2-4 hours)
- **Response**: Generic save offer or price discount
- **Save rate**: 10-20% (too late, relationship damaged)
- **Post-mortem**: Manual analysis, unclear patterns

### After (AI-Powered Churn Prevention)
- **Detection**: AI predicts churn 60-90 days ahead from usage patterns
- **Analysis**: AI identifies root cause + save strategy (15 min)
- **Response**: Personalized intervention based on churn driver
- **Save rate**: 30-50% (early intervention, value-based)
- **Learning**: AI identifies patterns, improves predictions

**Impact**: 2-3x earlier detection, 2-3x higher save rate, systematic not ad hoc

---

## AI Churn Prevention Framework: The 4-Stage Model

```
Stage 1: EARLY WARNING DETECTION (60-90 days ahead)
├─ AI analyzes usage patterns, engagement velocity
├─ Flags accounts before customer knows they're churning
└─ Trigger: Proactive health check-in

Stage 2: ROOT CAUSE ANALYSIS (AI diagnosis)
├─ AI identifies churn driver (product fit, support, value, pricing)
├─ Generates hypothesis + evidence
└─ Output: Personalized intervention strategy

Stage 3: INTERVENTION EXECUTION
├─ AI drafts save strategy (culturally-appropriate)
├─ CSM executes (relationship-based, not transactional)
└─ Track: Response rate, engagement improvement

Stage 4: LEARNING & PREDICTION IMPROVEMENT
├─ AI analyzes save success/failure
├─ Identifies patterns by segment, country, use case
└─ Improves future predictions
```

---

## Stage 1: Early Warning Detection

### AI Churn Prediction Prompt

**Goal**: Identify at-risk accounts 60-90 days before churn

**AI Prompt**:
```
You are a customer success analyst specializing in churn prediction. Analyze this account for churn risk.

**Account Information**:
- Customer: [COMPANY NAME]
- Industry: [INDUSTRY]
- Country: [SG / MY / ID / TH / VN / PH]
- Product: [YOUR PRODUCT]
- Contract: [ANNUAL / MONTHLY], [ARR/MRR]
- Tenure: [MONTHS SINCE PURCHASE]
- Renewal date: [DATE — if annual]

**Usage Data (Last 30 days vs Previous 30 days)**:
- Active users: [CURRENT] vs [PREVIOUS] ([+/-X%])
- Login frequency: [DAILY / WEEKLY / SPORADIC] vs [PREVIOUS]
- Features used: [CURRENT LIST] vs [PREVIOUS LIST]
- Usage hours/sessions: [CURRENT] vs [PREVIOUS] ([+/-X%])
- Last login: [DATE — days ago]

**Engagement Data**:
- Email response rate: [X%] vs [PREVIOUS %]
- WhatsApp/LINE response rate: [X%] vs [PREVIOUS %]
- Response time: [HOURS] vs [PREVIOUS]
- Meeting attendance: [ATTENDED X of Y] vs [PREVIOUS PERIOD]
- Proactive outreach: [CUSTOMER-INITIATED MESSAGES] vs [PREVIOUS]
- Last communication: [DATE — days ago]

**Support Data**:
- Tickets (30 days): [NUMBER] vs [PREVIOUS]
- Ticket sentiment: [FRUSTRATED / NEUTRAL / POSITIVE]
- Resolution satisfaction: [HIGH / MEDIUM / LOW]
- Escalations: [NUMBER]

**Stakeholder Changes**:
- Champion status: [SAME / CHANGED / LEFT COMPANY]
- Executive sponsor: [ENGAGED / DISTANT / UNKNOWN]
- Team size: [CURRENT] vs [AT PURCHASE]
- Org changes: [LAYOFFS / FUNDING / LEADERSHIP CHANGES]

**Business Context**:
- Goals achieved: [YES / PARTIAL / NO / UNKNOWN]
- ROI clarity: [CUSTOMER CAN QUANTIFY / UNCLEAR]
- Renewal sentiment (if expressed): [POSITIVE / NEUTRAL / NEGATIVE / UNKNOWN]
- Expansion interest: [YES / NO / NEUTRAL]

Generate a Churn Risk Analysis:

## Churn Risk Score (0-100)
- **Overall Risk**: [LOW / MEDIUM / HIGH / CRITICAL]
- **Churn Probability**: [X%]
- **Timeframe**: [90+ DAYS / 60-90 DAYS / 30-60 DAYS / <30 DAYS]
- **Confidence Level**: [HIGH / MEDIUM / LOW]

## Key Churn Signals (Ranked by Severity)

**🔴 Critical Signals** (Immediate action needed):
1. [SIGNAL + EVIDENCE — e.g., "Usage dropped 60% in 30 days (10 logins → 4 logins)"]
2. [SIGNAL + EVIDENCE]

**🟡 Warning Signals** (Monitor closely):
1. [SIGNAL + EVIDENCE — e.g., "Champion response time increased from 2h → 48h"]
2. [SIGNAL + EVIDENCE]

**🟢 Positive Signals** (Strengths):
1. [SIGNAL + EVIDENCE — e.g., "Executive sponsor attended last QBR, expressed satisfaction"]

## Root Cause Hypothesis

**Primary churn driver** (most likely):
- [PRODUCT FIT / VALUE GAP / SUPPORT ISSUES / PRICING / STAKEHOLDER CHANGE / COMPETITOR]

**Evidence**:
- [LIST SPECIFIC DATA POINTS SUPPORTING THIS HYPOTHESIS]

**Secondary factors**:
- [ADDITIONAL CONTRIBUTING FACTORS]

## Churn Pattern Match

Accounts with similar patterns (usage drop, engagement decline, [SPECIFIC PATTERN]):
- Churn rate: [X%] within [Y] days
- Common save strategies that worked: [LIST]

## SEA Cultural Context

In [COUNTRY]:
- **Silent churn interpretation**: [WHAT THIS PATTERN TYPICALLY MEANS]
  - Example: "In Indonesia, 48h WhatsApp response delay = relationship deprioritization"
- **Communication style**: [DIRECT / INDIRECT]
- **Likely to vocalize dissatisfaction**: [YES / NO]
- **Recommended intervention approach**: [RELATIONSHIP-BASED / DATA-BASED / HYBRID]

## Recommended Actions (Priority Order)

**Immediate (Within 48 hours)**:
1. [URGENT ACTION — e.g., "Proactive check-in via WhatsApp (not email) to re-engage"]
2. [SECONDARY URGENT ACTION]

**Short-term (This Week)**:
3. [PROACTIVE INTERVENTION — e.g., "Schedule value review call with champion + sponsor"]
4. [SUPPORT ACTION]

**Medium-term (This Month)**:
5. [STRATEGIC INTERVENTION — e.g., "Build case study of their success, reinforce ROI"]

## Save Strategy Preview

[BRIEF OUTLINE OF PERSONALIZED SAVE APPROACH BASED ON ROOT CAUSE]

## Next Review

- Schedule next churn risk analysis: [7 DAYS / 14 DAYS / 30 DAYS]
- Trigger for escalation: [SPECIFIC METRIC OR BEHAVIOR]
```

**Output**: Comprehensive churn risk analysis with save strategy roadmap

---

## Stage 2: Root Cause Analysis

### AI Churn Driver Diagnosis

**Goal**: Identify WHY customer is churning (not just THAT they're churning)

**AI Prompt**:
```
Diagnose the root cause of churn risk for [COMPANY NAME].

**Account Context**:
- Churn risk level: [HIGH / CRITICAL]
- Key signals:
  1. [SIGNAL 1]
  2. [SIGNAL 2]
  3. [SIGNAL 3]

**Customer Journey Review**:
- Onboarding: [SMOOTH / ROCKY / INCOMPLETE]
- Activation: [FAST / SLOW / FAILED]
- Feature adoption: [BROAD / NARROW / STALLED]
- Support interactions: [POSITIVE / NEUTRAL / FRUSTRATED]
- Stated goals: [ACHIEVED / IN PROGRESS / NOT ACHIEVED]

**Recent Communications** (last 30-60 days):
- [PASTE SUMMARY OF RECENT EMAILS, WHATSAPP, MEETINGS]

**Support Ticket Themes**:
- [PASTE RECENT TICKET SUMMARIES OR THEMES]

Generate a Root Cause Analysis:

## Primary Churn Driver

**Category**: [SELECT ONE]
1. **Product Fit Gap** — Product doesn't solve their actual problem
2. **Value Gap** — Not seeing ROI, can't justify cost
3. **Support/Experience Issues** — Frustrated with support quality, responsiveness
4. **Pricing Concern** — Budget cuts, cheaper alternative
5. **Stakeholder Change** — Champion left, new decision-maker doesn't value product
6. **Competitor Win** — Actively evaluating or switched to competitor
7. **Use Case Evolution** — Needs changed, product no longer fits
8. **Low Adoption** — Team never adopted, product sitting unused

**Evidence** (Specific data points):
- [QUOTE, METRIC, OR BEHAVIOR SUPPORTING THIS DIAGNOSIS]
- [ADDITIONAL EVIDENCE]
- [ADDITIONAL EVIDENCE]

## Contributing Factors

Secondary issues making it worse:
1. [FACTOR 1]
2. [FACTOR 2]

## Customer Perspective (Likely)

What customer is thinking (even if not saying):
- "[INTERNAL NARRATIVE — e.g., 'We're not getting enough value for the cost']"
- "[PAIN POINT — e.g., 'Support is too slow, we're stuck too often']"

In [COUNTRY], they're unlikely to say this directly because:
- [CULTURAL REASON — e.g., "Confrontation is avoided, would damage relationship"]

## Churn Likelihood by Driver

| Driver | Save Difficulty | Typical Save Rate | Save Strategy |
|--------|-----------------|-------------------|---------------|
| [PRIMARY DRIVER] | [EASY / MEDIUM / HARD] | [X%] | [APPROACH] |

## Recommended Diagnostic Validation

Before executing save strategy, validate hypothesis:
1. [VALIDATION STEP — e.g., "Ask champion directly: 'How are you feeling about [PRODUCT]?'"]
2. [ADDITIONAL VALIDATION]

**If hypothesis confirmed**: Proceed to save strategy
**If hypothesis incorrect**: Re-diagnose with new information
```

**Output**: Clear diagnosis of WHY customer is churning + validation steps

---

## Stage 3: Intervention Execution

### AI Save Strategy Generator

**Goal**: Create personalized, culturally-appropriate save plan

**AI Prompt**:
```
Generate a save strategy for [COMPANY NAME] at churn risk.

**Churn Context**:
- Churn risk: [HIGH / CRITICAL]
- Churn driver: [PRIMARY DRIVER FROM DIAGNOSIS]
- Timeframe: [DAYS UNTIL LIKELY CHURN]
- Country: [SG / MY / ID / TH / VN / PH]

**Stakeholders**:
- Champion: [NAME, STATUS — ENGAGED / DISTANT / LEFT]
- Executive Sponsor: [NAME, ENGAGEMENT LEVEL]
- Decision-maker for renewal: [ROLE]

**Account Value**:
- ARR/MRR: [AMOUNT]
- Strategic importance: [HIGH / MEDIUM / LOW]
- Effort to save: [HIGH / MEDIUM / LOW]

Generate a comprehensive Save Strategy:

---

## SAVE STRATEGY FOR [COMPANY NAME]

### Objective
[SPECIFIC SAVE GOAL — e.g., "Demonstrate ROI and secure renewal commitment within 30 days"]

### Save Difficulty: [EASY / MEDIUM / HARD]

**Factors**:
- Driver severity: [HOW FIXABLE IS THE ROOT CAUSE]
- Relationship strength: [STRONG / MODERATE / WEAK]
- Tenure: [NEW CUSTOMER / ESTABLISHED / LONG-TERM]
- Engagement: [RESPONSIVE / SLOWING / GHOSTING]

---

## Phase 1: Re-Engagement (Week 1)

**Goal**: Re-establish relationship, gather intelligence

**Step 1: Proactive Outreach (Within 48 hours)**

Channel: [WHATSAPP / EMAIL / CALL — based on COUNTRY + URGENCY]

**Message** (AI-drafted):

[FOR WHATSAPP — 50-75 words]:
```
Hi [NAME],

Wanted to check in — I noticed [SPECIFIC OBSERVATION — non-accusatory].

How are things going with [PRODUCT]? Anything we can help with?

Would love to catch up briefly if you have 15 min this week.

[YOUR NAME]
```

[FOR EMAIL — 100-150 words]:
```
Subject: Quick check-in — How's [PRODUCT] working for you?

Hi [NAME],

I hope you're well! I wanted to reach out because [SPECIFIC, NON-ACCUSATORY OBSERVATION — e.g., "I noticed we haven't connected in a few weeks"].

I want to make sure [PRODUCT] is delivering value for [COMPANY]. Are there any challenges or questions we can help with?

I'd love to schedule a brief call (15-20 min) to:
- Check in on your progress toward [GOAL]
- Address any blockers
- Share some [RELEVANT RESOURCE/FEATURE] that might help

Would [DAY 1] or [DAY 2] work for a quick sync?

Looking forward to connecting!

[YOUR NAME]
```

**Tone Adaptation for [COUNTRY]**:
- SG: Direct, results-focused ("Let's ensure you're getting ROI")
- MY/ID/TH: Warm, relationship-first ("Hope you're well, wanted to check in")
- VN: Practical, growth-oriented ("Let's review progress toward your goals")
- PH: Friendly, collaborative ("How's the team doing with [PRODUCT]?")

**Expected Response**:
- ✅ Responsive: Schedule call, proceed to Phase 2
- 🟡 Slow response: Follow up in 2-3 days, try alternate channel
- 🔴 No response (7+ days): Escalate to executive sponsor

---

**Step 2: Discovery Call (If Responsive)**

**Goal**: Understand current state, validate churn hypothesis

**Call Structure** (15-20 min):
1. **Open** (2 min): How are things going overall?
2. **Usage check** (3 min): How's the team using [PRODUCT]?
3. **Value probe** (5 min):
   - "Are you seeing the value you expected?"
   - "How are you tracking toward [GOAL]?"
4. **Pain point discovery** (5 min):
   - "What's working well?"
   - "What's been challenging?"
5. **Commitment** (5 min): "What would help you get more value?"

**AI-Generated Questions** (based on churn driver):

**If Value Gap**:
- "How are you measuring success with [PRODUCT]?"
- "What outcomes were you hoping to see by now?"
- "Are there features you're not using that might help?"

**If Support Issues**:
- "How has your experience been with our support team?"
- "Have you hit any blockers that slowed you down?"
- "What would make support more helpful?"

**If Product Fit**:
- "Has your use case evolved since purchase?"
- "Are there workflows [PRODUCT] doesn't handle well?"
- "What would make [PRODUCT] a better fit?"

**If Pricing**:
- "How are you feeling about the value for the cost?"
- "Any budget pressures we should be aware of?"
- "Would different packaging make more sense?"

**SEA Cultural Adaptation**:
- In MY/ID/TH: Don't ask "Are you unhappy?" → Ask "How can we support you better?"
- Frame as "partnership check-in" not "save call"
- Allow silence, don't fill every gap
- Read between the lines (indirect communication)

---

## Phase 2: Value Reinforcement (Week 2)

**Goal**: Demonstrate ROI, close value gap

**Step 3: AI-Generated Value Summary**

**AI Prompt**:
```
Create a value summary for [COMPANY NAME] showing ROI delivered.

Usage data:
- [PASTE USAGE METRICS]

Outcomes achieved:
- [GOALS FROM KICKOFF]
- [PROGRESS TOWARD GOALS]

Generate a "Value Delivered" summary:

**Subject**: The impact [PRODUCT] has delivered for [COMPANY]

**Body**:

Hi [NAME],

Following our call, I wanted to share a quick summary of the value [PRODUCT] has delivered for [COMPANY] so far.

**What You've Accomplished**:
- [QUANTIFIED OUTCOME 1 — e.g., "Processed 500+ [THINGS] (vs manual process)"]
- [QUANTIFIED OUTCOME 2 — e.g., "Saved [X] hours/week for [TEAM]"]
- [PROGRESS TOWARD GOAL — e.g., "Achieved [Y%] of your stated goal: [GOAL]"]

**Usage Highlights**:
- [X] users actively using [PRODUCT] [DAILY/WEEKLY]
- [Y] features adopted (out of [Z] available)
- [SPECIFIC WIN — e.g., "Power user [NAME] using advanced [FEATURE]"]

**What This Means**:
- Time savings: [QUANTIFY]
- Efficiency gain: [QUANTIFY]
- [OTHER BUSINESS IMPACT]

**Looking Ahead**:
Based on our conversation, I've identified a few ways to increase value:
1. [RECOMMENDATION 1]
2. [RECOMMENDATION 2]
3. [RECOMMENDATION 3]

Let's schedule a follow-up to discuss these — would [DATE] work?

[CLOSING]
```

---

**Step 4: Address Root Cause (Specific to Driver)**

**If Value Gap**:
- Build case study of their success
- Identify underutilized features that solve pain points
- Quantify time/cost savings
- Position ROI in business terms (not product features)

**If Support Issues**:
- Assign dedicated support contact
- Offer hands-on training or onboarding refresh
- Fast-track open tickets
- Commit to response time SLA

**If Product Fit**:
- Explore workarounds or integrations
- Roadmap preview (if relevant features coming)
- Custom configuration or setup
- Acknowledge gaps honestly, propose mitigation

**If Pricing**:
- Understand budget constraints
- Right-size package (downgrade if needed — retain > lose)
- Payment flexibility (quarterly vs annual)
- Demonstrate cost vs benefit (ROI justification)

**If Stakeholder Change**:
- Request introduction to new decision-maker
- Re-kickoff with new stakeholders
- Align product to new priorities
- Build champions in new regime

**AI Prompt (Root Cause Solution)**:
```
Customer's churn driver is [DRIVER]. Draft a solution proposal.

Context:
- Driver: [DESCRIBE SPECIFIC ISSUE]
- Their perspective: [WHAT THEY'RE EXPERIENCING]
- Our capability: [WHAT WE CAN ACTUALLY FIX]

Generate a solution proposal:

Subject: Addressing [ISSUE] — here's how we can help

[DRAFT EMAIL THAT]:
1. Acknowledges the issue (don't defend)
2. Proposes specific solution
3. Commits to timeline/outcome
4. Invites collaboration

Tone: [COUNTRY]-appropriate, solution-oriented (not defensive)
```

---

## Phase 3: Commitment & Monitoring (Week 3-4)

**Goal**: Secure renewal commitment or save decision

**Step 5: Save Decision Point**

**Options**:
1. **Full Save**: Customer commits to renewal, issue resolved
2. **Conditional Save**: Customer gives 30-60 days to prove value
3. **Downgrade Save**: Retain at lower tier/price
4. **Lost**: Customer churns despite efforts

**AI Prompt (Commitment Ask)**:
```
Draft a renewal commitment message for [COMPANY] after save efforts.

Context:
- Save strategy executed: [WHAT WE DID]
- Customer response: [HOW THEY RESPONDED]
- Renewal date: [DATE — in X days]

Generate a commitment ask:

[IF RESPONSIVE TO SAVE EFFORTS]:
Hi [NAME],

I'm glad we were able to address [ISSUE]. Based on our conversations and the progress we've made, I wanted to confirm your renewal for [DATE].

Would you like to move forward with [CURRENT PLAN / ADJUSTED PLAN]?

[IF STILL UNCERTAIN]:
Hi [NAME],

I know you're still evaluating [PRODUCT]. To help with your decision, I'd like to propose:

**30-Day Success Plan**:
- [SPECIFIC MILESTONE 1]
- [SPECIFIC MILESTONE 2]
- Check-in: [DATE]

If we hit these milestones, would that give you confidence to renew?

Tone: [COUNTRY]-appropriate, collaborative (not pushy)
```

---

**Step 6: Post-Save Monitoring (30-60 days)**

**Even if save successful, monitor closely**:
- Weekly usage checks
- Bi-weekly check-ins
- Confirm value delivery
- Build relationship depth

**Red Flags After Save**:
- Usage drops again
- Engagement declines
- Missed commitments (theirs or yours)

**AI Prompt (Post-Save Monitoring)**:
```
Customer [COMPANY] was at churn risk, we executed save strategy. Monitor for re-churn.

Usage data (last 30 days post-save):
- [USAGE METRICS]

Engagement data:
- [ENGAGEMENT METRICS]

Analyze:
1. Is save holding? (usage stable/improving vs declining)
2. Engagement sustained? (responsive vs slipping again)
3. Re-churn risk? (LOW / MEDIUM / HIGH)
4. Recommended action: [MAINTAIN / PROACTIVE CHECK-IN / ESCALATE]
```

---

## Save Strategies by Churn Driver

### Driver #1: Value Gap (Can't See ROI)

**Symptoms**:
- "We're not seeing the value"
- Questions cost/benefit
- Low adoption (product available but unused)

**AI Save Strategy**:
```
Generate a value realization plan for [COMPANY] with value gap churn risk.

Their stated goals:
- [GOAL 1]
- [GOAL 2]

Current usage:
- [USAGE DATA]

Create a 30-day value acceleration plan:

**Week 1: Value Audit**
- Quantify current value delivered (time saved, efficiency gained)
- Identify underutilized features that solve pain points
- Build ROI calculation

**Week 2: Quick Wins**
- Implement 2-3 high-impact features not yet used
- Demonstrate specific outcomes
- Quantify results

**Week 3: Case Study**
- Document their success story
- Quantify business impact
- Present to executive sponsor

**Week 4: Commitment**
- Review value delivered
- Confirm renewal
- Discuss expansion (if applicable)

Output this as an email proposal to customer.
```

**Save Rate**: 40-60% (addressable if we can demonstrate ROI)

---

### Driver #2: Support/Experience Issues

**Symptoms**:
- Frustrated support tickets
- "Support is too slow"
- Escalations, negative feedback

**AI Save Strategy**:
```
Draft a support improvement plan for [COMPANY] churning due to support issues.

Support history:
- Recent tickets: [SUMMARY]
- Response times: [METRICS]
- CSAT: [SCORE]

Create a support recovery plan:

**Immediate (48 hours)**:
- Assign dedicated support contact
- Fast-track all open tickets
- Apologize for experience (specific, not generic)

**Short-term (2 weeks)**:
- Hands-on training session
- Proactive check-ins (don't wait for tickets)
- Commit to response time SLA

**Long-term (30 days)**:
- Dedicated Slack/WhatsApp channel
- Monthly success review
- Support satisfaction tracking

Output as email to customer + internal accountability plan.
```

**Save Rate**: 50-70% (most recoverable if we act fast)

---

### Driver #3: Product Fit Gap

**Symptoms**:
- "This doesn't do what we need"
- Use case evolution
- Feature requests for critical gaps

**AI Save Strategy**:
```
Address product fit gap for [COMPANY].

Gap description:
- What they need: [DESCRIBE]
- What we offer: [CURRENT CAPABILITY]
- Gap: [SPECIFIC MISSING FUNCTIONALITY]

Generate a fit recovery plan:

**Option 1: Workaround**
- How to achieve their goal with current features
- Integrations that fill gap
- Process adaptation

**Option 2: Roadmap Preview**
- If feature is coming: Share timeline
- Beta access if available
- Commitment to notify when ready

**Option 3: Custom Solution**
- Professional services engagement
- Custom configuration
- Integration development

**Option 4: Honest Assessment**
- If we can't solve: Acknowledge gap
- Recommend complementary tool
- Offer to downgrade (retain relationship)

Output as honest, solution-oriented proposal.
```

**Save Rate**: 20-40% (lower, depends on gap severity)

---

### Driver #4: Pricing Concern

**Symptoms**:
- "Too expensive"
- Budget cuts
- Evaluating cheaper alternatives

**AI Save Strategy**:
```
Create a pricing/value proposal for [COMPANY] with budget concerns.

Context:
- Current plan: [PLAN, $AMOUNT]
- Budget pressure: [DESCRIBE]
- Value delivered: [USAGE, OUTCOMES]

Generate a pricing save strategy:

**Option 1: ROI Justification**
- Calculate cost vs value (time saved, efficiency gained)
- Position as investment, not expense
- Compare to manual process cost

**Option 2: Right-Sizing**
- Downgrade to smaller plan
- Remove unused features
- Retain core value

**Option 3: Payment Flexibility**
- Quarterly vs annual (lower commitment)
- Staged rollout (fewer seats now)
- Custom package

**Option 4: Bridge Offer**
- Temporary discount (3-6 months)
- Give time for budget recovery
- Revisit at next renewal

Output as value-first pricing proposal (not just discount).
```

**Save Rate**: 50-60% (if we can justify ROI or downgrade)

---

### Driver #5: Stakeholder Change

**Symptoms**:
- Champion left company
- New decision-maker doesn't know product
- Org changes (layoffs, new leadership)

**AI Save Strategy**:
```
Address stakeholder change churn risk for [COMPANY].

Change description:
- Previous champion: [NAME — LEFT / PROMOTED]
- New contact: [NAME, TITLE — if known]
- Org context: [LAYOFFS / LEADERSHIP CHANGE / RESTRUCTURE]

Generate a relationship transfer plan:

**Step 1: Find New Champion (Week 1)**
- Ask previous champion for intro (if still accessible)
- Reach out to executive sponsor
- Identify new decision-maker via LinkedIn

**Step 2: Re-Kickoff (Week 2)**
- Treat as new customer onboarding
- Align product to new stakeholder's priorities
- Demonstrate value quickly

**Step 3: Build Champions (Week 3-4)**
- Engage multiple stakeholders (don't rely on one)
- Identify power users who can advocate
- Executive sponsor buy-in

**Step 4: Renewal Confirmation (Week 4)**
- Secure commitment from new decision-maker
- Document value for their context
- Plan ongoing engagement

Output as relationship rebuild plan with timeline.
```

**Save Rate**: 30-50% (depends on access to new stakeholders)

---

## SEA-Specific Save Tactics

### Indonesia/Malaysia/Thailand: Relationship-Based Save

**Cultural Context**:
- Churn decisions are relationship-driven, not just transactional
- Direct confrontation avoided (won't say "we're canceling")
- Face-saving is critical (don't make them look bad for considering churn)

**Save Approach**:
```
Draft a relationship-based save strategy for [COMPANY] in [MY/ID/TH].

Context:
- Relationship strength: [STRONG / MODERATE / WEAK]
- Silent churn signals: [DESCRIBE]
- Time at risk: [X DAYS]

Generate a save plan:

**Phase 1: Re-Establish Relationship**
- WhatsApp check-in (not formal email): "How are you? Wanted to catch up"
- Frame as partnership review, not save call
- Patient, warm tone (no pressure)

**Phase 2: Face-Saving Intervention**
- Acknowledge any issues gently: "We want to make sure we're supporting you well"
- Don't imply they failed: "Sometimes teams need different approaches"
- Offer help without making them ask

**Phase 3: Relationship Depth**
- Engage multiple stakeholders (build network)
- In-person meeting if possible (relationship cultures value face-to-face)
- Long-term commitment (not short-term transaction)

**Cultural Do's**:
- Maintain regular contact (relationship maintenance)
- Be patient (don't rush decision)
- Build personal connection (not just business)

**Cultural Don'ts**:
- Don't pressure ("We need a decision by Friday")
- Don't make them explain publicly why they considered leaving
- Don't use aggressive discounts (feels desperate)

Tone: Warm, patient, relationship-first
```

**Key Difference**: Save is about rebuilding relationship, not just fixing product issue

---

### Singapore/Philippines: Direct + Value-Based Save

**Cultural Context**:
- More direct communication (will tell you if there's a problem)
- Value/ROI-focused (SG) or relationship+transaction balance (PH)
- Can be more direct in save conversation

**Save Approach**:
```
Draft a direct save strategy for [COMPANY] in [SG/PH].

Context:
- They've expressed: [CONCERN]
- Value delivered: [METRICS]
- Time at risk: [X DAYS]

Generate a save plan:

**Phase 1: Direct Conversation**
- Acknowledge issue directly: "You mentioned [CONCERN]. Let's address it."
- Ask for specifics: "What would need to change for you to renew?"
- Propose solutions: "Here's what we can do: [OPTIONS]"

**Phase 2: ROI Demonstration (SG) or Value + Relationship (PH)**
- SG: Metrics-heavy, business case
- PH: Combination of value delivered + partnership commitment

**Phase 3: Clear Ask**
- "If we address [X], will you commit to renewal?"
- Get decision timeline
- Follow up promptly

**Cultural Do's**:
- Be direct and clear (no beating around the bush)
- Use data and metrics (SG especially)
- Action-oriented next steps

**Cultural Don'ts**:
- Don't be vague or avoid the issue
- Don't make promises you can't keep
- Don't drag out decision process

Tone: Professional, results-focused (SG) or friendly, collaborative (PH)
```

**Key Difference**: Can be more direct about churn risk, focus on data/ROI

---

## Common Save Mistakes in SEA

### Mistake #1: Waiting for Customer to Mention Churn
**What happens**: In MY/ID/TH, customers avoid confrontation. By the time they mention churn, decision is made.

**Western approach**: Wait for customer to say "we're canceling"
**SEA approach**: Intervene at first behavioral signals (usage drop, engagement decline)

**AI Solution**:
```
Prompt: "Customer in [MY/ID/TH] shows silent churn signals (usage -40%, WhatsApp response time 2h → 48h). They haven't mentioned canceling. Should we intervene proactively?"

Expected: "YES — immediate intervention. Silent disengagement = 80%+ churn risk."
```

---

### Mistake #2: Aggressive Save Tactics
**What happens**: Pressure ("We'll give you 50% off if you decide today!") damages relationship in face-saving cultures.

**Western approach**: Aggressive discount, urgency
**SEA approach**: Value demonstration, patience, relationship investment

**AI Solution**:
```
Prompt: "Customer in [ID] considering churn. Draft save offer that doesn't feel pushy or desperate."

Expected: "Focus on value reinforcement, ask 'How can we better support you?', offer partnership (not discount), be patient."
```

---

### Mistake #3: Generic Save Offers
**What happens**: "What can we do to keep you?" shows you don't understand their needs.

**Western approach**: Ask customer to tell you how to save them
**SEA approach**: Diagnose root cause, propose personalized solution

**AI Solution**:
```
Prompt: "Customer showing churn risk. Analyze root cause from data: [USAGE, ENGAGEMENT, SUPPORT]. Generate personalized save strategy (not generic discount)."
```

---

### Mistake #4: Ignoring Stakeholder Changes
**What happens**: Champion leaves, you lose relationship, new decision-maker cancels.

**Western approach**: Focus on single champion
**SEA approach**: Build network of stakeholders, diversify relationships

**AI Solution**:
```
Prompt: "Champion left company 2 weeks ago. We haven't engaged new stakeholders. Churn risk?"

Expected: "CRITICAL risk. Immediate action: Find new champion, re-kickoff with new stakeholders, executive sponsor engagement."
```

---

## Save Rate Benchmarks

### By Churn Driver

| Driver | Difficulty | Expected Save Rate | Key Success Factor |
|--------|------------|--------------------|--------------------|
| Value Gap | Medium | 40-60% | Demonstrate ROI quickly |
| Support Issues | Easy | 50-70% | Fix support, rebuild trust |
| Product Fit | Hard | 20-40% | Honest about gaps, workarounds |
| Pricing | Medium | 50-60% | Justify value or downgrade |
| Stakeholder Change | Medium | 30-50% | Access to new decision-makers |
| Low Adoption | Medium | 40-55% | Hands-on enablement |

### By SEA Market

| Country | Silent Churn Risk | Save Approach | Expected Save Rate |
|---------|-------------------|---------------|-------------------|
| Singapore | Low (direct) | ROI-focused | 50-60% |
| Malaysia | High (indirect) | Relationship-first | 40-50% |
| Indonesia | Very High | Patience + relationship | 35-45% |
| Thailand | High (kreng jai) | Face-saving, gentle | 40-50% |
| Vietnam | Medium | Value + growth | 45-55% |
| Philippines | Low (direct) | Value + relationship | 50-60% |

**Key**: MY/ID/TH require earlier intervention (60-90 days) due to silent churn patterns

---

## Templates for Your CRM

### Churn Risk Fields
- **Churn Risk Level**: [LOW / MEDIUM / HIGH / CRITICAL]
- **Churn Probability**: [0-100%]
- **Churn Timeframe**: [>90 DAYS / 60-90 / 30-60 / <30]
- **Churn Driver**: [VALUE GAP / SUPPORT / PRODUCT FIT / PRICING / STAKEHOLDER / ADOPTION]
- **Save Strategy Status**: [NOT STARTED / IN PROGRESS / COMPLETED / LOST]
- **Save Owner**: [CSM NAME]
- **Last Intervention Date**: [DATE]
- **Next Review Date**: [DATE]

### Save Workflow (CRM Automation)
**Trigger**: Health score < 60 OR Churn risk = HIGH
**Actions**:
1. Create task: "URGENT: Churn Risk - [COMPANY]"
2. Run AI churn risk analysis
3. Flag account as "At Risk"
4. Notify CSM + Manager
5. Schedule intervention call within 48 hours

---

## Next Steps

### 1. Set Up Churn Detection
**Week 1**: Define churn signals
- Usage drop >30%
- Engagement decline
- Support sentiment negative
- Stakeholder changes

**Week 2**: Implement AI churn prediction
- Run weekly churn risk analysis (all accounts)
- Flag high-risk accounts automatically

---

### 2. Build Save Playbooks
**By Churn Driver**:
- Value Gap → ROI demonstration playbook
- Support Issues → Support recovery playbook
- Product Fit → Fit assessment + workaround playbook
- Pricing → Value justification + downsell playbook
- Stakeholder Change → Relationship rebuild playbook

---

### 3. Train Your Team
**Save Call Training**:
- How to conduct discovery call
- Root cause diagnosis
- Save strategy execution
- SEA cultural adaptation

**Role-play scenarios** by country and churn driver

---

### 4. Measure & Improve
**Metrics to Track**:
- Early warning detection rate (% caught 60+ days early)
- Save rate by driver
- Save rate by country
- Churn reason distribution
- Cost to save vs LTV

---

## Related Resources

**Previous Guide**: [AI Health Scoring](02-health-scoring.md) — Predict churn before it happens

**Next Guide**: [AI Expansion & Upsell](04-expansion-upsell.md) — Turn healthy accounts into growth

**Templates**: [Health Score Frameworks](../templates/health-score-frameworks.md) — Churn prediction models

**Cultural Context**: [CULTURAL-CS.md](../CULTURAL-CS.md) — SEA save strategies by country

**Main Guide**: [Back to README](../README.md)

---

**Questions or Issues?**
- GitHub: [Open an issue](https://github.com/michaelhauge/myeo-ai-resources/issues)
- Email: hello@myeo.ai

---

**Last Updated**: 2026-02-07
