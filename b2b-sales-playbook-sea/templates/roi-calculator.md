# AI-Powered ROI Calculator

**Purpose**: Build quantified business cases in 15 minutes (vs 2-3 hours manual). Use AI to gather data, calculate ROI, and generate compelling proposal sections.

**How to use**:
1. Gather prospect's current state data (time spent, costs, pain points)
2. Use AI prompt to calculate ROI
3. Copy output into proposal or business case presentation

---

## ROI Calculator Template (Copy-Paste into Spreadsheet)

### Tab 1: Current State (Manual Process)

| Metric | Value | Calculation | Annual Cost |
|--------|-------|-------------|-------------|
| **Time Metrics** | | | |
| Hours per [PROCESS] | [e.g., 40 hrs/week] | | |
| Team size doing [PROCESS] | [e.g., 5 people] | | |
| Hourly cost (loaded) | [e.g., $75/hr] | Salary + benefits ÷ 2080 hrs | |
| **Total time cost** | | 40 × 5 × 52 × $75 | **$780,000/year** |
| | | | |
| **Opportunity Cost** | | | |
| Deals lost to slow response | [e.g., 10/year] | | |
| Average deal size | [e.g., $50K] | | |
| **Total opportunity cost** | | 10 × $50K | **$500,000/year** |
| | | | |
| **Quality Cost** | | | |
| Proposals sent | [e.g., 100/year] | | |
| Win rate (current) | [e.g., 15%] | | |
| Deals won | [e.g., 15] | 100 × 15% | |
| **If win rate was 25%** | [e.g., 25 deals] | 100 × 25% | |
| Lost deals | [e.g., 10] | 25 - 15 | |
| **Quality cost** | | 10 × $50K | **$500,000/year** |
| | | | |
| **TOTAL CURRENT COST** | | | **$1,780,000/year** |

---

### Tab 2: Future State (With Your Solution)

| Metric | Value | Calculation | Annual Cost |
|--------|-------|-------------|-------------|
| **Time Metrics** | | | |
| Hours per [PROCESS] | [e.g., 10 hrs/week] | 75% reduction | |
| Team size doing [PROCESS] | [e.g., 5 people] | Same | |
| Hourly cost (loaded) | [e.g., $75/hr] | Same | |
| **Total time cost** | | 10 × 5 × 52 × $75 | **$195,000/year** |
| **Time saved** | | $780K - $195K | **$585,000/year** |
| | | | |
| **Opportunity Cost** | | | |
| Deals lost (reduced) | [e.g., 2/year] | 80% reduction | |
| Average deal size | [e.g., $50K] | Same | |
| **Total opportunity cost** | | 2 × $50K | **$100,000/year** |
| **Opportunity saved** | | $500K - $100K | **$400,000/year** |
| | | | |
| **Quality Cost** | | | |
| Proposals sent | [e.g., 100/year] | Same | |
| Win rate (improved) | [e.g., 25%] | +10 percentage points | |
| Deals won | [e.g., 25] | 100 × 25% | |
| **Additional deals** | [e.g., 10] | 25 - 15 | |
| **Quality improvement** | | 10 × $50K | **$500,000/year** |
| | | | |
| **TOTAL FUTURE COST** | | | **$295,000/year** |
| **TOTAL SAVINGS** | | $1,780K - $295K | **$1,485,000/year** |

---

### Tab 3: Your Investment

| Item | Cost | Calculation |
|------|------|-------------|
| **Year 1 Costs** | | |
| Software subscription | [e.g., $50K] | $4,167/month × 12 |
| Implementation | [e.g., $10K] | One-time |
| Training | [e.g., $5K] | One-time |
| **Total Year 1** | **$65,000** | |
| | | |
| **Ongoing Annual Costs** | | |
| Software subscription | [e.g., $50K] | Years 2+ |
| Support/maintenance | [e.g., $5K] | Optional |
| **Total Years 2+** | **$55,000/year** | |

---

### Tab 4: ROI Summary

| Metric | Value | Calculation |
|--------|-------|-------------|
| **Total Savings (Annual)** | **$1,485,000** | From Tab 2 |
| **Total Investment (Year 1)** | **$65,000** | From Tab 3 |
| **Net Gain (Year 1)** | **$1,420,000** | $1,485K - $65K |
| | | |
| **ROI (Year 1)** | **2,185%** | ($1,420K ÷ $65K) × 100 |
| **Payback Period** | **0.5 months** | $65K ÷ ($1,485K ÷ 12) |
| | | |
| **3-Year Total** | | |
| Total Savings (3 years) | **$4,455,000** | $1,485K × 3 |
| Total Investment (3 years) | **$175,000** | $65K + $55K + $55K |
| **3-Year Net Gain** | **$4,280,000** | $4,455K - $175K |
| **3-Year ROI** | **2,446%** | ($4,280K ÷ $175K) × 100 |

---

## AI Prompt for ROI Calculation

Copy this prompt into Claude/ChatGPT, fill in the [BRACKETS], and get instant ROI calculation:

```
I need to calculate ROI for a prospect. Help me build a business case.

**Prospect Info**:
- Company: [NAME]
- Industry: [e.g., fintech, e-commerce]
- Team size: [e.g., 5 AEs, 1 VP Sales]
- Current state: [e.g., manual proposal process, 3 days per proposal]

**Time Metrics**:
- Process: [e.g., proposal writing, discovery call prep]
- Time spent: [e.g., 40 hours/week across team]
- Team members: [e.g., 5 people]
- Loaded hourly cost: [e.g., $75/hr = $150K salary ÷ 2080 hrs]

**Opportunity Cost**:
- Deals lost: [e.g., 10/year to slow response times]
- Average deal size: [e.g., $50K ACV]

**Quality Cost**:
- Current win rate: [e.g., 15%]
- Expected win rate with solution: [e.g., 25%]
- Proposals sent/year: [e.g., 100]
- Average deal size: [e.g., $50K]

**Your Solution**:
- Time reduction: [e.g., 75% less time on manual work]
- Opportunity improvement: [e.g., 80% fewer lost deals]
- Quality improvement: [e.g., +10 percentage point win rate]
- Annual cost: [e.g., $50K subscription + $10K implementation]

**Calculate**:
1. Current state annual cost (time + opportunity + quality)
2. Future state annual cost (with your solution)
3. Total annual savings
4. ROI (Year 1 and 3-year)
5. Payback period (months)

**Output format**:
- Summary paragraph (for proposal executive summary)
- Detailed table (for proposal appendix)
- Key talking points (for sales call)
```

---

## Example AI Output

**Input**:
- Company: Acme Fintech
- Team: 5 AEs spending 40 hrs/week on manual proposals
- Loaded cost: $75/hr
- Lost deals: 10/year (slow response) × $50K = $500K
- Win rate: 15% → 25% = 10 more deals/year × $50K = $500K
- Solution cost: $65K Year 1

**AI Output**:

### Summary Paragraph (Copy into Proposal)

"Acme Fintech currently spends $780K annually on manual proposal writing (40 hrs/week × 5 AEs × $75/hr). Additionally, slow response times cost $500K/year in lost deals, and a 15% win rate (vs industry standard 25%) costs another $500K/year. **Total hidden cost: $1.78M annually.**

With our AI-powered sales system, Acme would save 75% of proposal time ($585K), reduce lost deals by 80% ($400K), and increase win rate to 25% ($500K additional revenue). **Total value: $1.49M annually.**

**Investment: $65K Year 1**
**Net gain: $1.42M Year 1**
**ROI: 2,185%**
**Payback: 0.5 months**"

---

### Detailed Table (Copy into Proposal Appendix)

| Category | Current State | Future State | Annual Savings |
|----------|---------------|--------------|----------------|
| **Time cost** | $780,000 | $195,000 | **$585,000** |
| **Opportunity cost** | $500,000 | $100,000 | **$400,000** |
| **Quality improvement** | $0 | $500,000 | **$500,000** |
| **Total** | $1,280,000 | $295,000 | **$1,485,000** |
| | | | |
| **Investment** | | | **$65,000** |
| **Net Gain** | | | **$1,420,000** |
| **ROI** | | | **2,185%** |
| **Payback** | | | **0.5 months** |

---

### Key Talking Points (For Sales Call)

1. **Time savings**: "Your team spends 40 hours/week on proposals. That's $780K/year in labor cost. We cut that to 10 hours/week, saving you $585K."

2. **Opportunity cost**: "You're losing 10 deals/year ($500K) because prospects move on while you're writing proposals. We cut that to 2 deals/year, saving $400K."

3. **Quality improvement**: "Your 15% win rate is below the 25% industry standard. That's costing you 10 deals/year ($500K). Our AI-personalized proposals can help close that gap."

4. **Payback**: "You'll recoup your $65K investment in 2 weeks. Everything after that is pure profit."

5. **3-year value**: "Over 3 years, you save $4.3M. That's 24x your investment."

---

## Common ROI Scenarios

### Scenario 1: Sales Team Productivity

**Current State**:
- 10 AEs spending 20 hrs/week on admin (proposals, research, CRM)
- Loaded cost: $75/hr
- Annual cost: 20 × 10 × 52 × $75 = **$780,000**

**Future State**:
- Same 10 AEs spending 5 hrs/week (75% reduction with AI)
- Annual cost: 5 × 10 × 52 × $75 = **$195,000**
- **Savings: $585,000/year**

**Your investment**: $50K/year
**ROI**: ($585K - $50K) ÷ $50K = **1,070%**

---

### Scenario 2: Lost Deal Prevention

**Current State**:
- 20 deals/year lost to slow response times
- Average deal: $50K ACV
- Annual lost revenue: **$1,000,000**

**Future State**:
- 5 deals/year lost (75% reduction with faster AI-powered responses)
- Annual lost revenue: **$250,000**
- **Prevented losses: $750,000/year**

**Your investment**: $50K/year
**ROI**: ($750K - $50K) ÷ $50K = **1,400%**

---

### Scenario 3: Win Rate Improvement

**Current State**:
- 100 proposals/year
- 15% win rate = 15 deals
- Average deal: $50K
- Revenue: **$750,000**

**Future State**:
- 100 proposals/year (same volume)
- 25% win rate = 25 deals (+10 from better personalization)
- Average deal: $50K
- Revenue: **$1,250,000**
- **Additional revenue: $500,000/year**

**Your investment**: $50K/year
**ROI**: ($500K - $50K) ÷ $50K = **900%**

---

### Scenario 4: New Rep Ramp Time

**Current State**:
- New AE ramp time: 9 months to full productivity
- Target quota: $1M/year
- Lost productivity: 9/12 × $1M = **$750K per new rep**

**Future State**:
- New AE ramp time: 4 months (with AI-powered playbook)
- Lost productivity: 4/12 × $1M = **$333K per new rep**
- **Savings: $417K per new rep**

**If hiring 3 AEs/year**:
- Total savings: $417K × 3 = **$1.25M/year**

**Your investment**: $50K/year
**ROI**: ($1.25M - $50K) ÷ $50K = **2,400%**

---

## Pro Tips for ROI Calculations

### 1. Use Conservative Numbers

**Bad** (too aggressive):
- "We'll cut your sales cycle from 9 months to 2 months" (78% reduction)
- "We'll increase your win rate from 15% to 50%" (+35 percentage points)

**Good** (conservative):
- "We'll cut your sales cycle from 9 months to 6 months" (33% reduction)
- "We'll increase your win rate from 15% to 20%" (+5 percentage points)

**Why**: Conservative numbers are more credible. Over-deliver instead of over-promise.

---

### 2. Show the Math

**Bad** (black box):
- "You'll save $500K/year with our solution"

**Good** (transparent):
- "You spend 40 hrs/week on proposals × 5 AEs × 52 weeks × $75/hr = $780K"
- "We cut that 75% = 10 hrs/week"
- "New cost: 10 × 5 × 52 × $75 = $195K"
- "**Savings: $585K/year**"

**Why**: Showing the math builds trust. Prospects can verify your numbers.

---

### 3. Include Non-Monetary Benefits

**Quantify these when possible**:
- **Faster time-to-value**: "Start closing deals 5 months sooner"
- **Better customer experience**: "Respond to prospects in 2 hours vs 2 days"
- **Competitive advantage**: "Win deals competitors can't because you're faster"
- **Employee satisfaction**: "Reduce burnout from manual work"

**Example**: "In addition to $1M savings, you'll respond to prospects 10x faster, winning deals competitors lose due to slow response times."

---

### 4. Address the "But Our Team is Different" Objection

**Objection**: "These numbers might work for other companies, but we're different."

**Response**: "Let's calculate your specific ROI. What's your team size? Hours spent on [PROCESS]? Average deal size?"

Then run the ROI calculator with **their numbers** in real-time on the call.

**Why**: Personalized ROI > generic case study.

---

## AI Prompt Library for ROI Calculations

### Prompt 1: Quick ROI Estimate (30 seconds)

```
Calculate quick ROI:
- Current cost: [e.g., $500K/year on manual work]
- Your solution cost: [e.g., $50K/year]
- Value provided: [e.g., save 75% of time = $375K]

What's the ROI and payback period?
```

---

### Prompt 2: Full Business Case (5 minutes)

```
Build full business case with:
1. Current state costs (time, opportunity, quality)
2. Future state costs (with our solution)
3. Total savings (Year 1 and 3-year)
4. ROI and payback period
5. Executive summary paragraph
6. Detailed table
7. Key talking points

[PASTE all prospect data here]
```

---

### Prompt 3: Comparison with Alternatives

```
Prospect is comparing us to:
- Do nothing (status quo)
- Hire 2 more AEs (cost: $300K/year)
- Use competitor solution (cost: $80K/year)

Compare ROI for all 4 options:
1. Status quo (baseline)
2. Hire 2 AEs
3. Competitor solution
4. Our solution

Show which has best ROI.
```

**AI Output Example**:

| Option | Investment | Savings/Value | Net Gain | ROI |
|--------|------------|---------------|----------|-----|
| **Status quo** | $0 | $0 | $0 | 0% |
| **Hire 2 AEs** | $300K/year | $400K (2 AEs × $200K quota) | $100K | 33% |
| **Competitor** | $80K/year | $300K (time savings only) | $220K | 275% |
| **Our solution** | $50K/year | $1M (time + quality + speed) | $950K | **1,900%** |

**Conclusion**: "Our solution delivers 7x better ROI than competitors and 57x better than hiring."

---

## Summary

**What you get**:
- Spreadsheet template (4 tabs: Current State, Future State, Investment, ROI Summary)
- AI prompts to calculate ROI in 5-15 minutes
- 4 common ROI scenarios (productivity, lost deals, win rate, ramp time)
- Pro tips (conservative numbers, show math, non-monetary benefits)

**How to use**:
1. Gather prospect data (time spent, costs, pain points)
2. Use AI prompt to calculate ROI
3. Copy output into proposal or presentation
4. Walk prospect through the math on sales call

**Expected results**:
- ROI calculation time: 2-3 hours → 15 minutes
- Proposal quality: More compelling (quantified vs generic)
- Win rate: +10-15% (quantified business case > feature list)

**Next template**: Objection Handling (AI-powered responses to 25 common objections)
