# AI-Powered Lead Qualification for Southeast Asia

**Last Updated**: 2026-02-07
**Setup Time**: 2-3 hours to learn frameworks, 10-15 minutes per prospect
**Expected ROI**: Reduce time on unqualified leads by 30-40%, qualify in hours instead of days

---

## The Problem

Western qualification frameworks (BANT, MEDDIC) were designed for individual decision-makers who can say "yes" or "no" quickly. **This doesn't work in Southeast Asia.**

### Why Western BANT Fails in SEA

**Traditional BANT**:
- **B**udget: "Do you have budget?" → Prospect says yes/no
- **A**uthority: "Are you the decision-maker?" → Prospect says yes/no
- **N**eed: "Do you have this problem?" → Prospect says yes/no
- **T**imeline: "When do you need to decide?" → Prospect gives date

**What actually happens in SEA**:
- **Budget**: "We need to check with finance" (means: consensus needed)
- **Authority**: "I can decide" (means: I can recommend, but 5 others must approve)
- **Need**: "Yes, this is interesting" (means: maybe, but we're being polite)
- **Timeline**: "Q2" (means: no firm timeline, depends on approvals)

**Result**: You think it's qualified, spend 3 months, then learn there was never budget or real authority.

---

## BANT-SEA: Adapted for Consensus Cultures

### The BANT-SEA Framework

BANT-SEA maintains the same acronym but adds **cultural layers** to each question:

```
Budget (Funds + Approval Process)
  ├─ Western: "Do you have budget?"
  └─ SEA: "How are budget decisions made at your company? Who needs to approve?"

Authority (Stakeholders + Decision Process)
  ├─ Western: "Are you the decision-maker?"
  └─ SEA: "Who else would be involved in evaluating this? What's the approval process?"

Need (Stated vs Real Pain)
  ├─ Western: "Do you have this problem?"
  └─ SEA: "What happens if you don't solve this? What's the business impact?"

Timeline (Decision Process, not Date)
  ├─ Western: "When will you decide?"
  └─ SEA: "What needs to happen before you can move forward? What could delay the decision?"
```

---

## BANT-SEA: Detailed Breakdown

### B: Budget (Funds + Approval Process)

**What you're really qualifying**:
1. Is there actual budget allocated? (not just "we can find budget if needed")
2. Who controls the budget?
3. What's the approval process?
4. Are there competing priorities?

**Questions to ask** (indirect, respectful):

```
Direct (too Western): "What's your budget for this?"
Better (SEA-adapted): "How do budget decisions typically work for projects like this?"

Follow-ups:
- "Who needs to approve expenditures of this size?"
- "Have you allocated budget for this initiative, or would it need to be approved?"
- "Are there other priorities competing for the same budget?"
- "What's the typical timeline for budget approval at your company?"
```

**AI Pre-Qualification Prompt** (use before call):

```
Research [COMPANY NAME] and provide budget signals:
1. Recent funding rounds (if startup) or revenue size (if established)
2. Are they hiring? (hiring freeze = tight budget)
3. Recent expansions or office openings (indicates budget)
4. Technology they currently use (from job postings, LinkedIn) - shows willingness to pay for tools
5. Industry benchmarks: typical budget for [YOUR SOLUTION] in [THEIR INDUSTRY]
6. Red flags: layoffs, cost-cutting announcements, pivot

Format as:
- Budget likelihood: High / Medium / Low
- Evidence: [specific data points]
- Recommended approach: [how to discuss budget]
```

**Scoring Budget (1-5)**:

| Score | Criteria |
|-------|----------|
| 5 | Budget allocated, single approver, ready to buy |
| 4 | Budget allocated, 2-3 approvers, 1-2 month timeline |
| 3 | Budget available but not allocated, needs internal pitch |
| 2 | Budget uncertain, would need to fight for it |
| 1 | No budget, "exploring options" |

**Red flags** (score 1-2, disqualify or nurture):
- "We don't have budget right now, but maybe next year"
- Can't answer who controls budget
- Multiple competing priorities with same budget
- Layoffs or hiring freeze

---

### A: Authority (Stakeholders + Decision Process)

**What you're really qualifying**:
1. Who are ALL the stakeholders? (not just your champion)
2. What's the decision-making process?
3. Does anyone have veto power?
4. Who influences the decision (even if they don't "approve")?

**Questions to ask**:

```
Direct (too Western): "Are you the decision-maker?"
Better (SEA-adapted): "Who else would typically be involved in evaluating a solution like this?"

Follow-ups:
- "How have decisions like this been made in the past?"
- "Who would need to sign off before moving forward?"
- "Are there any teams that would be affected by this and should be consulted?"
- "What concerns might [Finance/IT/Operations] have about this?"
```

**AI Stakeholder Mapping Prompt**:

```
Based on this company information:
- Company: [NAME]
- Industry: [INDUSTRY]
- Size: [EMPLOYEE COUNT]
- My solution: [BRIEF DESCRIPTION]

Identify likely stakeholders:
1. Economic Buyer (holds budget)
2. Technical Buyer (evaluates solution fit)
3. Champion (internal advocate)
4. Users (will use the solution)
5. Blockers (might resist change)

For each, provide:
- Typical title for this role
- Their likely concerns
- How to engage them

Also identify:
- Country culture: [SG/MY/ID/TH/VN/PH]
- Decision style: Consensus-driven or Top-down?
- Recommended engagement strategy
```

**Authority Mapping Matrix**:

| Role | Who | Their Question | How to Engage |
|------|-----|----------------|---------------|
| Economic Buyer | CFO, Finance VP | "What's the ROI?" | Business case, cost savings |
| Technical Buyer | CTO, IT Manager | "Will this work with our systems?" | Technical specs, integration |
| Champion | Your main contact | "How do I sell this internally?" | Provide pitch deck, ROI calc |
| Users | Sales team, Operations | "Will this make my job harder?" | Demo, training plan |
| Blocker | Incumbent vendor fan | "Why change?" | Address switching costs |

**Scoring Authority (1-5)**:

| Score | Criteria |
|-------|----------|
| 5 | Champion has budget authority, no other approvers needed |
| 4 | Champion + 1-2 approvers, all identified and accessible |
| 3 | Multiple approvers (3-5), champion can reach them all |
| 2 | Many approvers (5+), or can't identify all stakeholders |
| 1 | No champion, unclear who decides |

**Red flags** (score 1-2):
- "I'll need to check with my team" (who's on the team?)
- Can't name who else is involved
- "My boss would need to approve" but won't introduce you
- Decision by committee with no clear champion

---

### N: Need (Stated vs Real Pain)

**What you're really qualifying**:
1. Is there a real business problem?
2. What's the cost of NOT solving it?
3. Is this a "nice to have" or "must have"?
4. Is the pain urgent or someday?

**Questions to ask**:

```
Direct (too Western): "Do you have this problem?"
Better (SEA-adapted): "What's currently happening that made you interested in exploring this?"

Follow-ups:
- "What's the business impact of this problem? (revenue loss, cost, time, etc.)"
- "What happens if you don't solve this in the next 6-12 months?"
- "Have you tried other solutions? What didn't work?"
- "What would success look like for you?"
```

**AI Need Validation Prompt**:

```
Based on this discovery call summary:
[PASTE DISCOVERY NOTES]

Assess the need:
1. Problem severity: Critical / Important / Nice-to-have / Unclear
2. Business impact: [quantify if possible - revenue, cost, time]
3. Urgency: Must solve now / This year / Someday / Just exploring
4. Current workarounds: [how are they handling this today?]
5. Pain level: High (bleeding) / Medium (annoying) / Low (curious)

Red flags:
- Vague problem statements
- No quantified impact
- "We're fine today but thinking ahead"
- Just doing vendor comparisons

Recommendation:
- Qualified: [why]
- Nurture: [what needs to change]
- Disqualify: [why]
```

**Need Intensity Levels**:

| Level | Description | Example |
|-------|-------------|---------|
| **Bleeding** | Problem is causing active damage right now | "We're losing deals because proposals take too long" |
| **Aching** | Problem is ongoing but manageable | "Sales admin takes 50% of rep time" |
| **Annoying** | Problem exists but workarounds are ok | "Qualification could be better" |
| **Curious** | No real problem, just exploring | "Wanted to see what's out there" |

**Scoring Need (1-5)**:

| Score | Criteria |
|-------|----------|
| 5 | Bleeding problem, quantified impact, urgency |
| 4 | Aching problem, can quantify impact, timeline defined |
| 3 | Annoying problem, impact unclear, no firm timeline |
| 2 | Curious, no clear problem, "maybe in future" |
| 1 | No problem, vendor comparison exercise |

**Red flags** (score 1-2):
- "We're happy with current process, just exploring"
- Can't quantify business impact
- Vague answers to "what happens if you don't solve this?"
- "My boss asked me to get some quotes"

---

### T: Timeline (Decision Process, not Date)

**What you're really qualifying**:
1. What needs to happen before they can decide?
2. What could delay the decision?
3. Is there a real deadline or just a target?
4. What's driving the timeline (or lack of)?

**Questions to ask**:

```
Direct (too Western): "When will you make a decision?"
Better (SEA-adapted): "What are the key steps in your evaluation process?"

Follow-ups:
- "What would need to happen before you could move forward?"
- "Are there any events or deadlines that would influence the timeline? (budget year, project launch, etc.)"
- "What could delay this decision?"
- "How long did similar decisions take in the past?"
```

**AI Timeline Assessment Prompt**:

```
Based on this information:
- Company: [NAME]
- Industry: [INDUSTRY]
- Country: [SG/MY/ID/TH/VN/PH]
- Deal size: [AMOUNT]
- Current stage: [Discovery / Proposal / Negotiation]

Estimate timeline:
1. Realistic close timeline: [X weeks/months]
2. Key milestones:
   - Technical evaluation: [timeline]
   - Budget approval: [timeline]
   - Legal/procurement: [timeline]
   - Implementation planning: [timeline]

3. Country-specific timeline adjustments:
   - SG: Add 0-20% (most Western)
   - MY: Add 20-40% (relationship building)
   - ID: Add 40-60% (consensus-driven)
   - TH: Add 30-50% (hierarchy approvals)
   - VN: Add 20-40% (price negotiations)
   - PH: Add 10-30% (US-influenced but relationship matters)

4. Potential delays:
   - [List based on industry, deal size, country]

5. Red flags:
   - [Timeline concerns]
```

**SEA Timeline Expectations by Country**:

| Country | Base Multiplier | Typical Enterprise Deal |
|---------|-----------------|-------------------------|
| Singapore | 1.0-1.2x | 3-4 months |
| Malaysia | 1.2-1.4x | 4-5 months |
| Indonesia | 1.4-1.6x | 5-6 months |
| Thailand | 1.3-1.5x | 4-5 months |
| Vietnam | 1.2-1.4x | 4-5 months |
| Philippines | 1.1-1.3x | 3-4 months |

**Scoring Timeline (1-5)**:

| Score | Criteria |
|-------|----------|
| 5 | Clear deadline, urgency, steps defined, decision authority in place |
| 4 | Target timeline, business reason, approval process defined |
| 3 | Vague timeline ("Q2", "this year"), no firm deadline |
| 2 | "When budget is available", "sometime next year" |
| 1 | No timeline, "just exploring", "keeping options open" |

**Red flags** (score 1-2):
- No answer to "what's driving the timeline?"
- "We're not in a rush"
- "Just getting quotes for next year's budget"
- Timeline keeps slipping ("actually, need to wait for...")

---

## BANT-SEA Scorecard

After your discovery call, score each BANT dimension:

| Dimension | Score (1-5) | Notes |
|-----------|-------------|-------|
| **B**udget | ____ | Who approves? Process? Timeline? |
| **A**uthority | ____ | All stakeholders identified? Champion strength? |
| **N**eed | ____ | Bleeding/Aching/Annoying/Curious? Quantified? |
| **T**imeline | ____ | Real deadline or target? What drives it? |
| **TOTAL** | ____ / 20 | Qualification decision below |

**Qualification Decision**:
- **16-20 points**: ✅ **Qualified** - High priority, strong champion, clear need
- **12-15 points**: ⚠️ **Qualified with Concerns** - Address gaps before investing heavily
- **8-11 points**: 🔄 **Nurture** - Not ready now, check back in 1-3 months
- **1-7 points**: ❌ **Disqualify** - Politely disengage, low probability

---

## MEDDIC-SEA: For Enterprise Deals

For larger deals (>$50K ACV, 6+ month cycles), use **MEDDIC-SEA** instead of BANT-SEA:

### MEDDIC-SEA Framework

```
M - Metrics (Quantified Value)
  └─ SEA: "How will you measure success internally?"

E - Economic Buyer (Budget Authority)
  └─ SEA: "Who controls budget for this initiative?"

D - Decision Criteria (Evaluation Process)
  └─ SEA: "What's your evaluation process? Who's involved?"

D - Decision Process (Steps + Timeline)
  └─ SEA: "What needs to happen before you can move forward?"

I - Identify Pain (Business Impact)
  └─ SEA: "What's the cost of this problem to the business?"

C - Champion (Internal Advocate)
  └─ SEA: "Who would own this internally and drive adoption?"
```

### M: Metrics (Quantified Value)

**Question**: "If we implement this, how will you measure whether it was successful?"

**What you're qualifying**:
- Can they quantify the problem?
- Do they have metrics they track?
- What does "success" mean to them?

**Scoring**:
- 5: Specific metrics defined (e.g., "reduce proposal time by 50%")
- 3: General metrics (e.g., "save time")
- 1: No metrics, "it would be nice"

---

### E: Economic Buyer (Budget Authority)

**Question**: "Who typically approves expenditures of this size at your company?"

**What you're qualifying**:
- Have you met the economic buyer?
- Do they see value in this?
- Are they accessible?

**Scoring**:
- 5: Met economic buyer, they're engaged
- 3: Champion can reach economic buyer
- 1: Can't access economic buyer

---

### D: Decision Criteria (Evaluation Process)

**Question**: "What criteria will you use to evaluate solutions?"

**What you're qualifying**:
- What are they comparing you to?
- What features matter most?
- How will they score vendors?

**Scoring**:
- 5: Criteria defined, you meet them
- 3: Criteria vague but you likely fit
- 1: Criteria unknown or you don't fit

---

### D: Decision Process (Steps + Timeline)

**Question**: "What are the steps in your decision process?"

**What you're qualifying**:
- Technical evaluation?
- Pilot/POC required?
- Legal/procurement review?
- Approvals needed?

**Scoring**:
- 5: Process mapped, timeline clear
- 3: Process known but timeline vague
- 1: Process unclear

---

### I: Identify Pain (Business Impact)

**Question**: "What's the business impact of not solving this?"

**What you're qualifying**:
- Real pain or nice-to-have?
- Quantified cost?
- Urgency?

**Scoring**:
- 5: Quantified pain, urgent
- 3: Pain exists but not quantified
- 1: No clear pain

---

### C: Champion (Internal Advocate)

**Question**: "Who would own this internally after purchase?"

**What you're qualifying**:
- Do you have a champion?
- Are they motivated to sell internally?
- Do they have influence?

**Champion Strength Levels**:

| Level | Description | What They Do |
|-------|-------------|--------------|
| **Strong** | Will sell this internally, has political capital | Arranges meetings with stakeholders, sends internal pitch, pushes timeline |
| **Moderate** | Supportive but won't fight hard | Answers questions, provides info, but passive |
| **Weak** | Likes idea but no influence | Can't move deal forward, just point of contact |

**Scoring**:
- 5: Strong champion with influence
- 3: Moderate champion or weak champion with your help
- 1: No champion

---

## MEDDIC-SEA Scorecard

| Dimension | Score (1-5) | Notes |
|-----------|-------------|-------|
| **M**etrics | ____ | Quantified success criteria? |
| **E**conomic Buyer | ____ | Accessible? Engaged? |
| **D**ecision Criteria | ____ | Defined? Do you fit? |
| **D**ecision Process | ____ | Steps clear? Timeline? |
| **I**dentify Pain | ____ | Quantified? Urgent? |
| **C**hampion | ____ | Strong? Will sell internally? |
| **TOTAL** | ____ / 30 | Qualification decision below |

**Qualification Decision**:
- **24-30 points**: ✅ **Qualified** - Enterprise deal worth pursuing
- **18-23 points**: ⚠️ **Qualified with Gaps** - Fill gaps before heavy investment
- **12-17 points**: 🔄 **Nurture** - Promising but not ready
- **1-11 points**: ❌ **Disqualify** - Low probability of close

---

## AI Pre-Qualification Workflow (Before First Call)

Save 45 minutes of manual research:

### Step 1: AI Company Research (10 minutes)

**Prompt for Claude/ChatGPT**:

```
Research [COMPANY NAME] and provide a pre-qualification brief:

Company Overview:
- Industry and business model (1 sentence)
- Size (employees, revenue if public)
- Locations (headquarters, offices)
- Recent news (funding, expansion, leadership changes - last 6 months)

Budget Signals:
- Recent funding rounds or revenue indicators
- Hiring status (growing, stable, freeze)
- Technology stack (from job postings, LinkedIn, BuiltWith)
- Red flags: layoffs, cost-cutting, pivots

Stakeholder Mapping:
- Key executives by function (CEO, CTO, CFO, Sales VP, etc.)
- Department structure (from LinkedIn)
- Decision-making culture: Consensus or Top-down? (based on country + industry)

Pain Point Indicators:
- Challenges mentioned in news, job postings, reviews
- Competitors they use (if visible)
- Growth signals that might create need for [YOUR SOLUTION]

SEA-Specific Context:
- Country: [COUNTRY]
- Cultural considerations for selling to this company
- Recommended communication style

Pre-Qualification Recommendation:
- Budget likelihood: High / Medium / Low
- Authority complexity: Simple / Moderate / Complex
- Need indicators: Strong / Moderate / Weak
- Overall qualification: Pursue / Investigate / Pass
```

**Output Example**:

```
Company: Tokopedia (Indonesia)
Industry: E-commerce marketplace
Size: 2,000+ employees, ~$1B revenue
HQ: Jakarta, Indonesia

Budget Signals: HIGH
- Raised $350M Series G (2023)
- Actively hiring (200+ open roles)
- Technology stack: Modern (React, AWS, ML)
- No red flags

Stakeholders:
- CEO: Melissa Siska Juminto
- CTO: Anto Satriyo Nugroho
- CFO: To be identified
- Decision style: Consensus-driven (Indonesian culture)

Pain Indicators:
- Scaling challenges mentioned in job posts ("handling high volume")
- Customer service complaints about response time
- Competitor (Shopee) investing heavily in seller tools

SEA Context:
- Indonesia: Relationship-first, consensus decisions
- Expect 5-7 stakeholders in B2B deal
- WhatsApp is primary communication channel
- Timeline: Add 40-60% to Western benchmarks

Pre-Qualification: PURSUE (High budget, clear need, timeline okay)
```

---

### Step 2: AI Question Generation (5 minutes)

**Prompt**:

```
Based on this company research on [COMPANY]:
[PASTE RESEARCH FROM STEP 1]

Generate BANT-SEA discovery questions:

Budget Questions (2-3):
- Indirect, respectful approach
- Focus on process, not "do you have money?"

Authority Questions (3-4):
- Identify all stakeholders
- Understand decision process
- Find the champion

Need Questions (3-4):
- Uncover business impact
- Quantify the pain
- Validate urgency

Timeline Questions (2-3):
- Understand decision drivers
- Identify potential delays
- Get realistic timeline

Tone: Consultative, appropriate for [COUNTRY] business culture
```

**Output Example (for Tokopedia)**:

```
Budget Questions:
1. "How do technology investments typically get prioritized and approved at Tokopedia?"
2. "For a project like this, who would typically be involved in the budget discussion?"
3. "Are there specific budget cycles or planning periods we should be aware of?"

Authority Questions:
1. "Beyond yourself, who else would be involved in evaluating a solution like this?"
2. "How have similar technology decisions been made in the past?"
3. "Are there specific teams (engineering, product, operations) that would need to weigh in?"
4. "What concerns might your CTO or CFO have about a solution like this?"

Need Questions:
1. "You mentioned scaling challenges - can you quantify the impact? (volume, costs, team hours, etc.)"
2. "What happens if these challenges aren't addressed in the next 6-12 months?"
3. "What solutions have you tried so far, and what didn't work about them?"
4. "How would you measure success if we implemented this?"

Timeline Questions:
1. "What would need to happen before you could move forward with a decision?"
2. "Are there any upcoming events or milestones that would influence the timeline? (product launch, peak season, etc.)"
3. "Based on past projects, what's a realistic timeline for evaluation and implementation?"
```

---

### Step 3: Post-Call AI Scoring (5 minutes)

After the call, feed the transcription or your notes to AI:

**Prompt**:

```
Score this prospect using BANT-SEA framework (1-5 for each):

Call notes:
[PASTE NOTES OR TRANSCRIPTION]

Provide:
1. Budget Score (1-5): [score] - Evidence: [quote from call]
2. Authority Score (1-5): [score] - Evidence: [quote]
3. Need Score (1-5): [score] - Evidence: [quote]
4. Timeline Score (1-5): [score] - Evidence: [quote]

Total BANT-SEA Score: [X / 20]

Recommendation:
- Qualification decision: Qualified / Qualified with Concerns / Nurture / Disqualify
- Key gaps to address: [list]
- Recommended next steps: [specific actions]
- Red flags: [any concerns]
```

---

## Common SEA Qualification Mistakes (and How AI Fixes Them)

### Mistake 1: Taking "Yes, I'm the decision-maker" at face value

**What happens**: Champion says they decide, but reveals 5 stakeholders later

**Western approach**: "Are you the decision-maker?" → "Yes" → Proceed

**SEA approach**: "Who else would typically be involved?" → Map all stakeholders

**AI solution**: AI prompts you to map stakeholders even if champion says they decide

---

### Mistake 2: Not adjusting timeline for consensus cultures

**What happens**: Prospect says "Q2", you forecast March close, deal closes in June

**Western approach**: Take stated timeline at face value

**SEA approach**: Add 20-60% to stated timeline (varies by country)

**AI solution**: AI provides country-specific timeline adjustments in research phase

---

### Mistake 3: Mistaking politeness for interest

**What happens**: Prospect is polite ("this is interesting"), you think it's qualified

**Western approach**: "Are you interested?" → "Yes" → Qualified

**SEA approach**: Probe for business impact, urgency, budget → Validate real need

**AI solution**: AI need validation checks for quantified impact, not just stated interest

---

### Mistake 4: Not identifying the real economic buyer

**What happens**: Your champion can't actually approve budget

**Western approach**: "Do you have budget?" → "Yes" → Proceed

**SEA approach**: "Who approves expenditures of this size?" → Find economic buyer

**AI solution**: AI stakeholder mapping identifies economic buyer by title/role

---

## Templates for Your CRM

### BANT-SEA Fields (add to your CRM)

```
Qualification Method: [ ] BANT-SEA  [ ] MEDDIC-SEA

Budget Score (1-5): ____
Budget Notes: [Text field]
  - Who approves?
  - Process?
  - Timeline for approval?

Authority Score (1-5): ____
Authority Notes: [Text field]
  - All stakeholders identified: [Y/N]
  - Economic buyer accessible: [Y/N]
  - Champion strength: Strong / Moderate / Weak

Need Score (1-5): ____
Need Notes: [Text field]
  - Pain level: Bleeding / Aching / Annoying / Curious
  - Business impact (quantified): [Text]
  - Urgency: [High/Medium/Low]

Timeline Score (1-5): ____
Timeline Notes: [Text field]
  - Target close date: [Date]
  - Adjusted for country (+___%): [Date]
  - Approval steps remaining: [Text]

TOTAL QUALIFICATION SCORE: ____ / 20

Qualification Status:
  [ ] Qualified (16-20)
  [ ] Qualified with Concerns (12-15)
  [ ] Nurture (8-11)
  [ ] Disqualified (1-7)

AI Research Date: [Date]
AI Research Summary: [Link to notes]
```

---

## Next Steps

1. **Pick your framework**:
   - Deals < $50K, simple sales: **BANT-SEA**
   - Deals > $50K, enterprise: **MEDDIC-SEA**

2. **Set up AI tools**:
   - Claude Pro or ChatGPT Plus ($20/mo)
   - Bookmark the prompts from this guide

3. **Test on next 3-5 prospects**:
   - Run AI pre-qualification before calls
   - Use AI-generated questions
   - Score with BANT-SEA/MEDDIC-SEA after call

4. **Measure improvement**:
   - Before: Time spent on unqualified leads
   - After: Time saved, deal quality

5. **Roll out to team**:
   - Share AI prompts
   - Add CRM fields
   - Train on frameworks

---

## Questions?

**This guide**: Part of [B2B Sales Playbook for SEA](../README.md)
**Next guide**: [02-discovery-calls.md](./02-discovery-calls.md) (AI-powered discovery)
**Templates**: [qualification-scorecards.md](../templates/qualification-scorecards.md)

**Issues**: [GitHub](https://github.com/michaelhauge/myeo-ai-resources/issues)
**Support**: hello@myeo.ai

---

**Last Updated**: 2026-02-07
