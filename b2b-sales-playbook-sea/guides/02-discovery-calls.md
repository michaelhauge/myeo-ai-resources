# AI-Powered Discovery Calls for SEA B2B Sales

**Last Updated**: 2026-02-07
**Setup Time**: 1-2 hours (initial setup), 10-15 minutes prep per call
**Expected ROI**: Cut discovery prep from 45 min → 10 min, improve call quality 40-60%

---

## The Problem

Discovery calls make or break B2B sales cycles. Yet most reps struggle with:

❌ **45+ minutes prep time** - Research company,read website, find stakeholders, draft questions
❌ **Generic questions** - Same questions for every prospect ("Tell me about your business")
❌ **Lost context** - Take notes during call, miss important details, can't remember everything
❌ **Slow follow-up** - Spend hours after call summarizing notes, writing recap email
❌ **Cultural blind spots** - Western discovery scripts don't work in SEA consensus cultures

**Traditional approach**: Manually research each prospect, wing it on the call, scramble to capture notes.

**AI-first approach**: AI researches prospects in 10 minutes, generates custom questions, transcribes and summarizes calls, drafts follow-up emails.

---

## AI-Powered Discovery Workflow

### Traditional Discovery (2-3 hours total)

```
Before Call:
├─ Research company website (20 min)
├─ Check LinkedIn for stakeholders (15 min)
├─ Read recent news (10 min)
├─ Draft generic questions (10 min)
└─ Total prep: 55 minutes

During Call:
├─ Ask questions (45-60 min)
└─ Take notes while listening (hard to do both)

After Call:
├─ Clean up notes (20 min)
├─ Draft follow-up email (15 min)
├─ Update CRM (10 min)
└─ Total follow-up: 45 minutes

TOTAL TIME: 2-3 hours per discovery call
```

### AI-First Discovery (30-45 minutes total)

```
Before Call:
├─ AI research (Claude): 10 min → human review: 5 min
├─ AI generates custom questions: 5 min → human review: 2 min
└─ Total prep: 22 minutes (vs 55 min manual)

During Call:
├─ AI records and transcribes (Otter.ai/Fireflies)
├─ Focus 100% on listening (no note-taking)
└─ 45-60 min call

After Call:
├─ AI summarizes call (2 min)
├─ AI drafts follow-up email (2 min → human review: 3 min)
├─ AI updates CRM fields (2 min)
└─ Total follow-up: 9 minutes (vs 45 min manual)

TOTAL TIME: 30-45 minutes (AI does the work)
Time saved: 75-105 minutes per call × 10 calls/month = 12-17 hours/month
```

---

## Phase 1: AI Pre-Call Research (10 minutes)

### Step 1: Company Research Prompt (Claude/ChatGPT)

**Use this exact prompt** (customize [BRACKETED] sections):

```
You are a B2B sales research assistant. Research [COMPANY NAME] and provide a discovery call brief for a sales rep selling [YOUR PRODUCT/SERVICE].

Company Intelligence:
1. Business model (1 sentence - what do they do?)
2. Size: Employee count, revenue (if public), growth indicators
3. Locations: HQ + other offices
4. Technology stack: What tools/platforms they use (from job postings, BuiltWith, LinkedIn)
5. Recent developments (last 6 months):
   - Funding rounds
   - Product launches
   - Expansions or new markets
   - Leadership changes
   - Any challenges mentioned publicly

Target Market:
6. Who are their customers? (B2B, B2C, industry)
7. Geographic focus (which SEA countries?)
8. Competitive landscape (who do they compete with?)

Pain Point Indicators:
9. Based on their industry, business model, and recent news, what are 3-5 likely pain points that [YOUR PRODUCT] could solve?
10. Evidence for each pain point (job postings, reviews, news, industry trends)

Stakeholder Mapping:
11. Key executives by function:
    - CEO/Founder
    - CTO/Head of Engineering (if tech product)
    - CFO/Finance lead
    - Head of Sales/Marketing (if relevant)
    - Head of Operations (if relevant)
12. My contact: [CONTACT NAME] - [TITLE]
    - Where do they fit in org chart?
    - Who do they report to?
    - What's their likely influence level?

Cultural Context:
13. Country: [SINGAPORE/MALAYSIA/INDONESIA/THAILAND/VIETNAM/PHILIPPINES]
14. Company culture indicators (from Glassdoor, LinkedIn, job posts):
    - Hierarchical or flat?
    - Consensus-driven or top-down?
    - Risk-averse or innovative?
15. Communication style recommendations for this culture

Discovery Call Prep:
16. Top 3 topics to explore based on this research
17. Red flags or disqualification signals to watch for
18. Potential objections they might have

Format: Use bullet points, be concise. This brief should take 5 minutes to read.
```

**Example Output** (abridged):

```
COMPANY: GrabFood (Grab - Indonesia division)

Business Model: Food delivery marketplace connecting restaurants, delivery partners, consumers

Size: Part of Grab (45,000+ employees), GrabFood Indonesia ~5,000 employees
Revenue: Grab overall ~$2B annually, Indonesia is largest market

Technology Stack: React, Node.js, AWS, Kafka, MongoDB, Kubernetes (from job posts)

Recent Developments:
- Expanded to 200+ cities in Indonesia (2025)
- Launched GrabMart (grocery delivery) - scaling challenges
- Raised $500M for Indonesia expansion
- Complaints on Twitter about slow merchant onboarding

Target Market: B2C (consumers), B2B (restaurants/merchants)

Likely Pain Points:
1. Merchant onboarding takes too long (Twitter complaints)
   Evidence: Merchants complain "2-3 weeks to get activated"
2. Operations team scaling challenges (job posts hiring 50+ ops roles)
   Evidence: "manage high volume" in job descriptions
3. Proposal/contract generation for merchants (manual process suspected)
   Evidence: Growing from 100k to 200k merchants rapidly

Stakeholders:
- CEO: Anthony Tan (Singapore HQ)
- Indonesia Country Head: Neneng Goenadi
- GrabFood Head: [To be identified]
- CFO: Peter Oey (Singapore HQ)
- My Contact: Sarah Wijaya - Head of Merchant Operations
  Reports to: Indonesia Country Head
  Influence: High (owns merchant experience)

Cultural Context: Indonesia - Consensus-driven, relationship-first
- Expect 5-7 stakeholders in decision
- Build relationship before pitching
- Indirect communication (soft nos, read between lines)

Discovery Topics:
1. Merchant onboarding process (pain point #1)
2. Operational scaling (hiring spree signals pain)
3. Current tools for contracts/proposals to merchants

Red Flags:
- If they're happy with current process (no urgency)
- If budget is frozen (contradicts expansion)
- If Sarah can't connect you to GrabFood Head (no champion path)
```

**Time**: 10 minutes for AI to generate, 5 minutes for human to read

---

### Step 2: Custom Question Generation (5 minutes)

Feed your research into this prompt:

```
Based on this company research:
[PASTE RESEARCH FROM STEP 1]

Generate 12-15 discovery call questions optimized for [COUNTRY] business culture:

Rapport Building (2-3 questions):
- Warm opening questions appropriate for [CULTURE]
- Not too personal, not too cold

Company & Role Understanding (2-3 questions):
- Understand their role and challenges
- Validate research findings

Pain Discovery (4-5 questions):
- Open-ended to uncover pain points
- Include follow-ups to quantify impact
- Tie to research findings (mention what you learned)

Current State & Solutions (2-3 questions):
- What they're doing today
- What they've tried before
- What's not working

BANT Qualification (3-4 questions):
- Budget process (indirect)
- Decision stakeholders
- Timeline drivers

Vision & Success (1-2 questions):
- What would ideal solution look like?
- How would they measure success?

Format each question with:
- Question text
- Why you're asking (what you're trying to learn)
- Follow-up prompts if they give shallow answer

Tone: Consultative, respectful, appropriate for [INDONESIA/MALAYSIA/etc.] - avoid direct/aggressive Western style
```

**Example Output** (for GrabFood Indonesia):

```
RAPPORT BUILDING

Q1: "Sarah, thank you for making time today. I saw that GrabFood just expanded to 200+ cities - that's impressive growth. How has that expansion been going?"

Why: Warm opening, acknowledges their achievement, opens door to discuss scaling challenges
Follow-up: "What's been the most challenging part of scaling that fast?"

Q2: "How long have you been leading Merchant Operations? What attracted you to Grab?"

Why: Understand her tenure (new = less context, veteran = knows pain well), build relationship
Follow-up: "What's changed the most in your role over that time?"

COMPANY & ROLE UNDERSTANDING

Q3: "Can you walk me through your typical day or week? What takes up most of your time?"

Why: Understand where the pain is, what's consuming their resources
Follow-up: "Of all those things, what do you wish you could spend less time on?"

Q4: "You mentioned [X in pre-call research]. How is that impacting your team day-to-day?"

Why: Validate research findings, open door to discuss specific pain
Follow-up: "What would change if that problem was solved?"

PAIN DISCOVERY

Q5: "I read that GrabFood grew from 100,000 to 200,000+ merchants in the last year. What does that growth mean for your operations team?"

Why: Tie to research, uncover operational pain from scaling
Follow-up: "How many people does it take to onboard a merchant today? How long does the process take?"

Q6: "Walk me through what happens when a new merchant wants to join GrabFood, from their first contact to going live."

Why: Understand their process, identify bottlenecks
Follow-up: "Where do things typically slow down in that process?"

Q7: "I've seen some merchant feedback on social media about onboarding timelines. Is that something your team has visibility into?"

Why: Bring up pain point indirectly, see if they acknowledge it
Follow-up: "What's causing the delays? Is it documentation, approvals, technical setup?"

Q8: "As you're scaling the team (I saw you're hiring 50+ ops roles), what are the biggest challenges in getting new team members productive?"

Why: Uncover training, process documentation pain
Follow-up: "How long does it take a new ops person to ramp up?"

Q9: "If you had a magic wand and could fix one thing about merchant onboarding tomorrow, what would it be?"

Why: Get them to prioritize pain points, dream about solution
Follow-up: "What's preventing that from happening today?"

CURRENT STATE & SOLUTIONS

Q10: "What tools or systems does your team use today for [merchant onboarding/contract generation/etc.]?"

Why: Understand current stack, identify gaps
Follow-up: "What works well about those tools? What frustrates your team?"

Q11: "Have you looked at other solutions to streamline this process?"

Why: Understand buying stage, what they've evaluated
Follow-up: "What did you learn from those evaluations? What was missing?"

BANT QUALIFICATION

Q12: "How do technology investments typically get approved at Grab Indonesia? Who's usually involved in those decisions?"

Why: Understand budget process, identify stakeholders (indirect)
Follow-up: "For a tool focused on merchant operations, would that fall under your budget or would it be a shared decision?"

Q13: "Beyond yourself, who else would care about improving merchant onboarding? Who would be impacted by changes to this process?"

Why: Identify all stakeholders, map decision-makers
Follow-up: "How do cross-functional projects like this typically get approved?"

Q14: "Is there a specific event or timeline driving when you'd want to have a solution in place? (e.g., next expansion phase, budget year, etc.)"

Why: Understand urgency, timeline drivers
Follow-up: "What happens if this doesn't get solved in that timeframe?"

VISION & SUCCESS

Q15: "If we fast-forward 6 months and this problem is solved, what does success look like for you and your team?"

Why: Understand their vision, get buy-in on value
Follow-up: "How would you measure that success? (time saved, merchants onboarded, NPS, etc.)"
```

**Time**: 5 minutes for AI to generate, 2 minutes for human to review and select 8-10 questions

---

## Phase 2: During the Call (45-60 minutes)

### Setup: AI Call Recording

**Tools** (pick one):
1. **Otter.ai** ($10/mo) - Good transcription, simple, integrates with Zoom/Meet
2. **Fireflies.ai** ($10-19/mo) - Better AI summaries, more features
3. **Native Zoom transcription** (free but less accurate)

**Setup steps**:
1. Connect tool to your meeting platform (Zoom, Google Meet, Teams)
2. In meeting settings: Enable "Auto-record and transcribe"
3. Before call: Test that recording/transcription works
4. During call intro: "I'm recording this call for my notes, hope that's ok?" (get verbal consent)

### Discovery Call Structure (SEA-Adapted)

```
0-5 min: Warm Opening
├─ Thank them for their time
├─ Rapport building (Q1-Q2 from prep)
├─ Set agenda: "I'd love to learn about [X], understand [Y], and see if we might be able to help"
└─ Ask permission: "Does that work for you?" (respectful, not assuming)

5-15 min: Company & Role Understanding
├─ Ask Q3-Q4 (broad questions about their role/day)
├─ Validate your research findings
├─ Listen more than talk (80/20 rule)
└─ Build trust before diving into pain

15-35 min: Pain Discovery (Core of Discovery)
├─ Ask Q5-Q9 (pain-focused questions)
├─ CRITICAL: Follow up with "why?", "tell me more", "what's the impact?"
├─ Listen for:
│   - Quantified pain ("costs us 40 hours/week")
│   - Urgency signals ("need to solve this by Q2")
│   - Stakeholder mentions ("CFO is asking about this")
└─ Don't pitch yet - just understand

35-45 min: Current State & Qualification
├─ Ask Q10-Q14 (current tools, budget process, stakeholders)
├─ Confirm BANT-SEA understanding
└─ Gauge qualification level

45-55 min: Vision & Next Steps
├─ Ask Q15 (vision of success)
├─ If qualified: "Based on what you shared, I think we might be able to help with [X]. Would it make sense to [next step]?"
├─ If not qualified: "Thanks for sharing. Let's stay in touch - I'll [nurture action]"
└─ Recap action items

55-60 min: Relationship Close
├─ Thank them warmly
├─ Confirm next steps
└─ SEA-appropriate close (not too aggressive)
```

### What to Listen For (AI Can't Do This)

While AI transcribes, **you** listen for:

1. **Energy shifts** - When do they get excited or frustrated?
2. **Hedging language** - "We might..." "Possibly..." "Need to check..." (soft nos in SEA cultures)
3. **Stakeholder hints** - "My boss mentioned..." "The team has been asking..."
4. **Urgency signals** - Deadlines, pain quantification, budget discussions
5. **Cultural cues** - Indirectness, politeness masking disinterest

**AI transcribes words. You read between the lines.**

---

## Phase 3: After the Call (10 minutes)

### Step 1: AI Call Summary (2 minutes)

**Prompt for Claude/ChatGPT** (paste transcription):

```
Summarize this discovery call transcription:

[PASTE FULL TRANSCRIPTION]

Provide:

## Executive Summary (2-3 sentences)
- What we learned
- Qualification status
- Recommended next step

## Key Insights
- Top 3 pain points mentioned (with quotes)
- Quantified impact (if discussed)
- Urgency indicators

## Stakeholders Mentioned
- List all people/roles mentioned
- Decision-making process discussed

## BANT-SEA Scoring
- Budget: [Score 1-5] - Evidence: [quote]
- Authority: [Score 1-5] - Evidence: [quote]
- Need: [Score 1-5] - Evidence: [quote]
- Timeline: [Score 1-5] - Evidence: [quote]
- Total: [X/20]

## Objections or Concerns Raised
- List any hesitations or objections

## Commitments Made
- What did prospect commit to?
- What did we commit to?

## Recommended Next Steps
- Immediate: [within 1 week]
- Near-term: [1-4 weeks]

## Red Flags (if any)
- Anything concerning for qualification
```

**Time**: 2 minutes to generate, 1 minute to review

---

### Step 2: AI Follow-Up Email Draft (2 minutes)

**Prompt**:

```
Based on this discovery call summary:
[PASTE SUMMARY FROM STEP 1]

Draft a follow-up email to [CONTACT NAME]:

Tone:
- Professional but warm
- Appropriate for [INDONESIA/MALAYSIA/etc.] business culture
- Consultative, not salesy

Structure:
1. Thank them for their time (specific detail from call to show you listened)
2. Recap what we discussed (3-4 bullet points of key insights)
3. Acknowledge their pain/challenge (show empathy)
4. Suggest next step (specific, low-pressure)
5. Warm close

Length: 150-200 words (short enough for WhatsApp if needed)
Subject line: [Something specific from the call, not generic]

Note: Do NOT pitch product yet - this is relationship building
```

**Example Output**:

```
Subject: Following up - Merchant onboarding challenges

Hi Sarah,

Thank you for taking the time to speak with me yesterday. I really appreciated learning about GrabFood's rapid expansion to 200+ cities - it's impressive, and I can see why merchant onboarding at that scale is a challenge.

A few key things that stood out from our conversation:
• Merchant onboarding currently takes 2-3 weeks, with bottlenecks in document verification
• Your ops team spends 40+ hours/week on manual contract generation
• The goal is to cut onboarding time to under 1 week to support your growth targets
• You mentioned needing to involve the GrabFood Head and Finance in any solution evaluation

I'd love to show you how some of our customers in similar scaling situations have tackled this. Would it make sense for me to put together a brief overview specific to your merchant onboarding process? We could schedule 20-30 minutes next week to walk through it.

Let me know what works for you.

Warm regards,
[YOUR NAME]
```

**Human review**: Personalize the opening, adjust tone, verify facts.

**Time**: 2 minutes to generate, 3 minutes for human to review and personalize

---

### Step 3: AI CRM Update (3 minutes)

**Prompt**:

```
Based on this call summary:
[PASTE SUMMARY]

Extract CRM field values:

Deal Stage: [Discovery / Qualification / Proposal / etc.]

BANT-SEA Scores:
- Budget: [1-5]
- Authority: [1-5]
- Need: [1-5]
- Timeline: [1-5]
- Total: [X/20]
- Qualification Status: [Qualified / Qualified with Concerns / Nurture / Disqualified]

Key Stakeholders (copy to CRM contacts):
- [Name - Title - Role in decision]

Pain Points (copy to notes):
- [List with quantification if available]

Next Action:
- Task: [Specific action]
- Due Date: [Date]
- Owner: [You or team member]

Close Date Estimate:
- Based on timeline discussion: [Date]
```

**Time**: 3 minutes to generate and copy to CRM

---

## Common SEA Discovery Mistakes (and How to Avoid Them)

### Mistake 1: Asking "Do you have budget?" directly

**Why it fails**: Too direct for SEA cultures, prospect will say "yes" to be polite

**Better approach**: "How do technology investments typically get approved here?"

**AI help**: AI-generated questions use indirect phrasing automatically

---

### Mistake 2: Not reading indirect communication

**Example**:
- Prospect: "We'll need to discuss this with the team"
- Western interpretation: "OK, they'll discuss and get back to me"
- SEA reality: Soft no, they're not interested but being polite

**How to probe**:
- "When do you think that discussion might happen?"
- "Who specifically would be in that conversation?"
- "What would need to come out of that discussion for you to move forward?"

**AI help**: AI call summary flags hedging language as potential red flags

---

### Mistake 3: Pitching too early

**Why it fails**: SEA cultures prefer relationship first, transaction later

**Better approach**:
- Discovery call = 100% questions, 0% pitch
- Show interest in their business, not your product
- Build trust before asking for commitment

**AI help**: AI-generated questions focus on discovery, not pitching

---

### Mistake 4: Not identifying all stakeholders

**Why it fails**: Consensus cultures = many decision-makers

**Example**:
- You qualify CFO as economic buyer
- Later discover CTO, Legal, Procurement also have veto power

**Better approach**: "Who else would typically be involved in a decision like this?"

**AI help**: AI stakeholder mapping predicts typical decision structure

---

### Mistake 5: Taking stated timeline at face value

**Example**:
- Prospect: "We want to decide by end of Q2"
- Reality: Q2 in Indonesia = add 40-60% → mid-Q3

**Better approach**: Adjust timeline by country (see qualification guide)

**AI help**: AI timeline assessment applies country-specific multipliers

---

## Cultural Adaptation by Country

### Singapore

**Communication style**: Most Western-like, direct communication OK

**Discovery tips**:
- Get to the point faster (less small talk needed)
- Quantify ROI explicitly (SG buyers are metric-driven)
- Expect faster decisions (weeks not months)

**AI prompt adjustment**: "Use professional, efficient tone for Singapore business culture"

---

### Malaysia

**Communication style**: Relationship-first, indirect (especially Malay business culture)

**Discovery tips**:
- Invest in rapport building (5-10 min at start)
- Respect hierarchy (defer to senior person if multiple on call)
- Understand Malay/Chinese business dynamics (different approaches)

**AI prompt adjustment**: "Use warm, relationship-focused tone for Malaysian business culture, balance directness and respect"

---

### Indonesia

**Communication style**: Very indirect, consensus-driven, relationship-paramount

**Discovery tips**:
- Build relationship before business (may take 2-3 calls)
- Never pressure for fast decision (will backfire)
- Saying "no" directly is rude - listen for soft nos
- Expect 5-7 stakeholders, long timeline

**AI prompt adjustment**: "Use indirect, warm, consultative tone for Indonesian business culture, avoid any pressure or urgency"

---

### Thailand

**Communication style**: Respectful of hierarchy, indirect, face-saving important

**Discovery tips**:
- Show respect to senior members (use titles)
- Don't make anyone lose face (no public disagreement)
- Silence doesn't mean agreement (may mean discomfort)
- LINE is preferred over email for follow-up

**AI prompt adjustment**: "Use respectful, hierarchy-aware tone for Thai business culture, maintain face-saving language"

---

### Vietnam

**Communication style**: Price-sensitive, northern (Hanoi) vs southern (HCMC) styles differ

**Discovery tips**:
- Northern Vietnam: More formal, slower decisions
- Southern Vietnam: More entrepreneurial, faster pace
- Price objections are common (doesn't mean disqualified)
- ROI must be very clear

**AI prompt adjustment**: "Use clear ROI-focused tone for Vietnamese business culture, address value explicitly"

---

### Philippines

**Communication style**: Most US-influenced, English fluent, relationship + transaction mix

**Discovery tips**:
- English proficiency high (less translation needed)
- Western-style discovery works better here than other SEA
- Still values relationships (not purely transactional)
- Responsive on email and messaging

**AI prompt adjustment**: "Use professional but friendly tone for Philippine business culture, balance US directness with Asian relationship focus"

---

## Tools Comparison: Call Recording & AI

| Tool | Price | Transcription Quality | AI Summary | CRM Integration | Best For |
|------|-------|----------------------|------------|-----------------|----------|
| **Otter.ai** | $10/mo | Good (90-95% accurate) | Basic | Salesforce, HubSpot | Simple setup, budget-friendly |
| **Fireflies.ai** | $10-19/mo | Excellent (95%+ accurate) | Advanced | Salesforce, HubSpot, Pipedrive, Zoho | Best AI features, SEA accents |
| **Gong.io** | $100+/mo | Excellent | Advanced + coaching | Major CRMs | Enterprise teams only |
| **Zoom (native)** | Free | Fair (85-90% accurate) | None | Manual export | Testing, no budget |

**Recommendation**: **Fireflies.ai** ($19/mo Pro plan) - best accuracy for SEA accents, good AI summaries

---

## Next Steps

1. **Set up call recording tool**:
   - Fireflies.ai (recommended) or Otter.ai
   - Connect to Zoom/Google Meet
   - Test on an internal call first

2. **Bookmark AI prompts**:
   - Company research prompt
   - Question generation prompt
   - Call summary prompt
   - Email draft prompt

3. **Test on next 3 discovery calls**:
   - Use AI research before calls (measure time saved)
   - Bring AI-generated questions
   - Record and transcribe
   - Use AI for follow-up

4. **Measure results**:
   - Prep time: Before vs After
   - Call quality: Qualification accuracy
   - Follow-up speed: Hours vs minutes

5. **Roll out to team**:
   - Share prompts as team library
   - Train team on tools
   - Create shared CRM fields for BANT-SEA

---

## FAQs

**Q: Do I need to tell prospects the call is recorded?**
A: Yes. Say: "I'm recording this for my notes, hope that's OK?" Get verbal consent. SEA cultures generally fine with this.

**Q: What if AI transcription has errors?**
A: Common with SEA accents/names. Review and correct key details (names, numbers, dates) before using AI summary.

**Q: Can I use AI during the call in real-time?**
A: Some tools (Gong, Fireflies) offer real-time AI cues. But focus on listening, not reading AI during the call. Use AI after.

**Q: Should I share the AI transcript with the prospect?**
A: Not the raw transcript (has errors). Share the cleaned-up summary or email follow-up.

**Q: What about privacy/security?**
A: Check your company policy. Don't record if discussing sensitive information without proper consent and encryption.

---

## Related Resources

**Previous**: [01-qualification-frameworks.md](./01-qualification-frameworks.md) (BANT-SEA, MEDDIC-SEA)
**Next**: [03-proposal-writing.md](./03-proposal-writing.md) (AI proposal generation)
**Templates**: [discovery-scripts.md](../templates/discovery-scripts.md) (full scripts)
**Main guide**: [README.md](../README.md)

---

**Last Updated**: 2026-02-07
