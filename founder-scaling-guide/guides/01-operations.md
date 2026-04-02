# Operations at Scale: From $1M to $10M ARR

## The Operations Crisis at Scale

**Scenario**: You hit $3M ARR with 40 employees. Everything is breaking.

**What's breaking**:
- Manual processes that worked for 10 customers break at 100 customers
- Team spending 40-60% of time on admin vs customer-facing work
- Sales team manually entering data into CRM (4 hours/week per rep)
- Support team manually triaging tickets (6 hours/week)
- Finance team manually preparing reports (20 hours/week)
- Everyone complaining "we need more people" (but more people = more chaos)

**The root cause**: You scaled revenue without scaling operations.

**The fix**: This guide shows you how to build repeatable, automated processes that scale from 10 → 100 → 1,000 customers without proportionally increasing headcount.

---

## The 3-Stage Operations Evolution

### Stage 1: Manual Everything ($0-$1M ARR, 1-15 employees)

**Characteristics**:
- Founder does everything (sales, support, product, operations)
- No formal processes (everyone figures it out as they go)
- Tools: Spreadsheets, email, Slack
- Team capacity waste: 20-30% (acceptable at this stage)

**This is OK**: At <$1M ARR, focus on finding product-market fit, not building processes.

---

### Stage 2: Process Hell ($1M-$3M ARR, 15-40 employees)

**Characteristics**:
- Informal processes break (can't rely on everyone "just knowing")
- Communication silos form (teams don't know what other teams are doing)
- Manual bottlenecks emerge (reporting, data entry, admin tasks)
- Team capacity waste: 40-60% (UNACCEPTABLE — this is where you are now)

**This is the danger zone**: Most startups get stuck here. You're burning cash on headcount, but productivity is declining.

**The fix**: Systematize operations (next section).

---

### Stage 3: Scaled Operations ($3M-$10M ARR, 40-100 employees)

**Characteristics**:
- Repeatable processes (documented, automated where possible)
- Clear ownership (every process has a DRI - Directly Responsible Individual)
- Metrics-driven (20 core metrics tracked weekly, dashboards updated automatically)
- Team capacity waste: 15-25% (acceptable, productive organization)

**This is the goal**: Reach $10M ARR without proportionally scaling headcount (maintain $150K-$200K revenue per employee).

---

## The Operations Audit: Finding Your Bottlenecks

**Time to complete**: 1-2 weeks

**Goal**: Identify top 10 bottlenecks consuming team capacity.

### Step 1: Map All Core Processes

**Method**: List every recurring process across all departments.

**Process categories**:
- **Sales**: Lead qualification, demos, proposals, contract negotiation, closing
- **Onboarding**: Account setup, training, kickoff meetings
- **Customer Success**: Check-ins, renewals, expansion, escalations
- **Support**: Ticket triage, resolution, escalation
- **Product**: Feature requests, bug reports, releases
- **Finance**: Invoicing, collections, reporting, payroll
- **HR**: Recruiting, onboarding, performance reviews

**Deliverable**: Complete process map (50-100 processes listed).

---

### Step 2: Estimate Time Spent per Process

**Method**: Survey team (ask: "How many hours/week do you spend on [PROCESS]?")

**Example**:

| Process | Owner | Frequency | Time per Instance | Hours/Week |
|---------|-------|-----------|-------------------|------------|
| Lead qualification | Sales | 50 leads/week | 15 min/lead | 12.5 hrs |
| Manual CRM data entry | Sales | 20 deals/week | 10 min/deal | 3.3 hrs |
| Customer onboarding | CS | 5 new customers/week | 4 hrs/customer | 20 hrs |
| Support ticket triage | Support | 100 tickets/week | 3 min/ticket | 5 hrs |
| Weekly sales report | Sales Ops | 1 report/week | 6 hrs/report | 6 hrs |
| Invoice generation | Finance | 50 invoices/month | 10 min/invoice | 2 hrs |

**Deliverable**: Time audit spreadsheet (all processes with hours/week).

---

### Step 3: Calculate Team Capacity Waste

**Formula**:
```
Team Capacity Waste % = (Manual/admin hours ÷ Total team hours) × 100

Example:
- Total team: 40 employees × 40 hrs/week = 1,600 hrs/week
- Manual/admin hours: 650 hrs/week (from time audit)
- Team capacity waste: (650 ÷ 1,600) × 100 = 40.6%
```

**Benchmarks**:
- **<25%**: Healthy (most time spent on customer-facing work)
- **25-40%**: Moderate waste (should optimize)
- **40-60%**: High waste (URGENT — you're here now)
- **>60%**: Critical waste (company is dying slowly)

**Deliverable**: Team capacity waste percentage.

---

### Step 4: Prioritize Bottlenecks by ROI

**ROI Formula** (for prioritization — not financial projections):
```
Priority Score = (Hours saved per week × $100/hr) ÷ Automation cost

Where:
- Hours saved = Current manual hours/week
- $100/hr = Loaded cost per employee hour (salary + overhead ÷ 2,000 hours/year)
  → Adjust for your market: SEA rates typically $30-60/hr loaded
- Automation cost = Setup cost + first-year maintenance
```

> **Note**: This formula is for *ranking which bottlenecks to fix first*, not for calculating financial returns to show investors. Real-world savings are typically 50-70% of theoretical savings, because: (1) automations need ongoing maintenance, (2) some edge cases still need manual handling, and (3) the learning curve for new tools takes 2-4 weeks.

**Example**:
- **Process**: Weekly sales report (6 hrs/week manual)
- **Automation**: Metabase dashboard ($0/month for self-hosted, 20 hrs setup + ~2 hrs/month maintenance)
- **Hours saved**: 6 hrs/week × 52 weeks = 312 hrs/year (theoretical)
- **Realistic savings**: ~200-250 hrs/year (some reports still need manual input)
- **Value**: Frees up senior team time for analysis instead of data assembly

**Deliverable**: Prioritized bottleneck list (top 10 by ROI).

---

## The Automation Playbook: Quick Wins (Month 1-2)

**Goal**: Automate top 3 bottlenecks (save 20-40 hours/week).

### Bottleneck #1: Manual Reporting (20-30 hours/week waste)

**Problem**: Sales Ops / Finance manually pulling data from multiple sources (CRM, payment processor, analytics) and assembling weekly/monthly reports.

**Fix**: Automated dashboards (Metabase, Looker, Tableau).

**Implementation** (2-3 weeks):
1. **Week 1**: Set up Metabase (open-source, free)
   - Connect data sources (Postgres, MySQL, Salesforce, Stripe)
   - Create 10 core dashboards (revenue, pipeline, churn, support metrics)
2. **Week 2**: Replace manual reports with dashboard links
   - Share dashboard URLs with executives (Monday morning email → dashboard link)
   - Train team on dashboard usage (1-hour session)
3. **Week 3**: Monitor adoption (ensure team uses dashboards, not manual reports)

**Time saved**: 20-30 hours/week (finance/ops team capacity reclaimed)

**Cost**: $0 (Metabase self-hosted) or $500-$2K/month (Looker, Tableau)

**Value**: High — replaces 20-30 hours/week of manual data assembly with self-serve dashboards

---

### Bottleneck #2: Manual Data Entry (10-20 hours/week waste)

**Problem**: Sales reps manually entering data into CRM after calls/meetings.

**Fix**: Call recording + auto-transcription + CRM sync (Gong, Chorus, Fireflies).

**Implementation** (1-2 weeks):
1. **Week 1**: Set up Gong or Fireflies
   - Connect Zoom/Google Meet (auto-record all sales calls)
   - Connect CRM (Salesforce, HubSpot) for auto-sync
2. **Week 2**: Train sales team
   - Show how to review call transcripts (instead of taking manual notes)
   - Explain CRM auto-sync (data flows automatically, no manual entry)

**Time saved**: 10-20 hours/week (4 reps × 2-5 hours/week each)

**Cost**: $50-$100/user/month (Gong, Fireflies)

**Value**: High — eliminates manual CRM data entry, improving both data quality and rep productivity

---

### Bottleneck #3: Manual Onboarding (15-25 hours/week waste)

**Problem**: CS team manually onboarding each new customer (setup, training, documentation).

**Fix**: Automated onboarding flows (Userpilot, Appcues, Pendo).

**Implementation** (2-4 weeks):
1. **Week 1-2**: Build onboarding flow
   - Create in-app tours (10-15 steps: account setup → first feature → success milestone)
   - Record video tutorials (5-10 min each, hosted on Loom or YouTube)
2. **Week 3**: Deploy to new customers
   - New signups automatically enter onboarding flow (triggered by account creation)
   - CS team only intervenes for high-touch customers (Enterprise accounts)
3. **Week 4**: Measure completion rates
   - Track % of customers who complete onboarding (target: 70-80%)
   - Iterate on flow (simplify steps where dropoff occurs)

**Time saved**: 15-25 hours/week (CS team capacity reclaimed)

**Cost**: $200-$500/month (Userpilot, Appcues)

**Value**: High — CS team can handle 2-3x more customers by automating routine onboarding

---

## The 20 Metrics Every $1M-$10M ARR Founder Must Track

**Why metrics matter**: You can't scale what you don't measure.

### Revenue Metrics (Track Weekly)

**1. MRR (Monthly Recurring Revenue)**
```
MRR = Sum of all monthly subscription revenue

Target: Growing 20-30% month-over-month ($1M-$3M ARR stage)
```

**2. ARR (Annual Recurring Revenue)**
```
ARR = MRR × 12

Target: $10M ARR within 18-36 months
```

**3. New MRR (from new customers)**
```
New MRR = Sum of new customer subscriptions this month

Target: $50K-$200K new MRR/month (depending on stage)
```

**4. Expansion MRR (from existing customers)**
```
Expansion MRR = Sum of upsells + cross-sells this month

Target: 10-20% of new MRR (healthy expansion motion)
```

**5. Churned MRR (from lost customers)**
```
Churned MRR = Sum of canceled subscriptions this month

Target: <5% of MRR (or <$15K churned MRR if MRR = $300K)
```

---

### Growth Metrics (Track Weekly)

**6. MoM Growth Rate**
```
MoM Growth Rate = ((This month MRR - Last month MRR) ÷ Last month MRR) × 100

Target: 20-30% MoM ($1M-$3M ARR), 15-25% MoM ($3M-$10M ARR)
```

**7. QoQ Growth Rate**
```
QoQ Growth Rate = ((This quarter ARR - Last quarter ARR) ÷ Last quarter ARR) × 100

Target: 60-100% QoQ ($1M-$3M ARR), 40-80% QoQ ($3M-$10M ARR)
```

**8. Net Revenue Retention (NRR)**
```
NRR = ((Starting MRR + Expansion - Churn) ÷ Starting MRR) × 100

Example:
- Starting MRR: $300K
- Expansion MRR: $30K (upsells)
- Churned MRR: $15K (cancellations)
- NRR: (($300K + $30K - $15K) ÷ $300K) × 100 = 105%

Target: >100% (expansion exceeds churn)
```

---

### Customer Metrics (Track Weekly)

**9. Customer Count**
```
Customer Count = Total active paying customers

Track cohorts: New this month, Existing, Churned
```

**10. Average Contract Value (ACV)**
```
ACV = Total ARR ÷ Customer count

Target: Increasing over time (upselling working)
```

**11. Monthly Churn Rate**
```
Monthly Churn Rate = (Customers lost this month ÷ Customers at start of month) × 100

Target: <3% (excellent), 3-5% (acceptable), >5% (problematic)
```

**12. Logo Churn (customer count lost)**
```
Logo Churn = Customers canceled this month

Track reasons: Price, product, competitor, out of business
```

---

### Sales & Marketing Metrics (Track Weekly)

**13. CAC (Customer Acquisition Cost)**
```
CAC = (Sales + Marketing spend) ÷ New customers acquired

Example:
- Sales + Marketing: $50K/month
- New customers: 10
- CAC: $50K ÷ 10 = $5K

Target: Decreasing over time (sales efficiency improving)
```

**14. LTV (Lifetime Value)**
```
LTV = (ARPU × Gross margin %) ÷ Monthly churn rate

Example:
- ARPU: $500/month
- Gross margin: 75%
- Monthly churn: 3%
- LTV: ($500 × 0.75) ÷ 0.03 = $12,500

Target: LTV/CAC ratio >3 (sustainable unit economics)
```

**15. CAC Payback Period**
```
CAC Payback Period = CAC ÷ (ARPU × Gross margin %)

Example:
- CAC: $5,000
- ARPU: $500/month
- Gross margin: 75%
- Payback: $5,000 ÷ ($500 × 0.75) = 13.3 months

Target: <18 months (recover CAC within 18 months)
```

**16. Sales Cycle Length**
```
Sales Cycle Length = Average days from lead → closed-won

Target: <60 days (SMB), <90 days (Mid-market), <180 days (Enterprise)
```

---

### Financial Metrics (Track Monthly)

**17. Gross Margin**
```
Gross Margin % = ((Revenue - COGS) ÷ Revenue) × 100

Where COGS = Hosting + Support + Payment processing

Target: 70-80% for SaaS
```

**18. Burn Rate**
```
Burn Rate = Monthly expenses - Monthly revenue

Example:
- Monthly expenses: $400K
- Monthly revenue: $250K
- Burn rate: $150K/month

Target: 4-6 months of ARR as annual burn (e.g., $3M ARR → $1M-$1.5M annual burn)
```

**19. Runway**
```
Runway = Cash balance ÷ Monthly burn rate

Example:
- Cash: $1.5M
- Burn: $150K/month
- Runway: $1.5M ÷ $150K = 10 months

Target: Never let runway drop below 12 months (start fundraising at 18 months)
```

**20. Cash Balance**
```
Cash Balance = Bank account balance + liquid assets

Track daily (especially if burn is high)
```

---

## The Weekly Operating Rhythm

**Goal**: Keep team aligned without excessive meetings.

### Monday (9am): Metrics Review (30 minutes)

**Attendees**: Leadership team (CEO, COO, CTO, VP Sales, VP CS, CFO)

**Agenda**:
1. **Revenue metrics** (5 min): MRR, New MRR, Churn MRR
   - Green: On track (20%+ MoM growth)
   - Yellow: Off track (10-19% MoM growth)
   - Red: Critical (<10% MoM growth)
2. **Pipeline metrics** (5 min): Deals in pipeline, conversion rates
3. **Customer health** (5 min): NPS, churn risk accounts
4. **Top 3 priorities this week** (10 min): What must get done by Friday?
5. **Blockers** (5 min): What's preventing progress?

**Deliverable**: Priorities doc (shared with team in Slack/email after meeting).

---

### Wednesday (3pm): Cross-Functional Standup (15 minutes)

**Attendees**: Department heads (or rotating representatives)

**Agenda**:
1. **Round-robin updates** (2 min each):
   - What we shipped this week
   - What we're shipping next week
   - Any blockers?
2. **Cross-team dependencies** (5 min): Does Sales need something from Product? Does CS need something from Eng?

**Format**: Stand-up (literally stand, keeps it short).

---

### Friday (4pm): Wins Recap (15 minutes)

**Attendees**: Entire company (all-hands)

**Agenda**:
1. **Revenue wins** (3 min): Deals closed this week (celebrate)
2. **Product wins** (3 min): Features shipped, bugs fixed
3. **Customer wins** (3 min): Customer success stories, positive feedback
4. **Team shoutouts** (3 min): Recognize employees who went above and beyond
5. **Next week preview** (3 min): What to expect next week

**Format**: Informal, celebratory (not metrics-heavy).

---

## Navigating the 40-Person Wall

**The Problem**: At 40-60 employees, communication breaks down, decision-making slows, culture dilutes.

**Why it happens**:
- **Too big for flat hierarchy**: Founder can't manage 40 direct reports
- **Too small for corporate structure**: Don't have middle management yet
- **Information silos**: Teams don't know what other teams are doing

### Fix 1: Introduce Middle Management (at 30-40 employees)

**Hire managers before chaos hits** (don't wait until 60 employees).

**Manager roles to add**:
- **Sales Manager** (manages 5-10 AEs, reports to VP Sales)
- **Engineering Manager** (manages 5-8 engineers, reports to CTO)
- **Customer Success Manager** (manages 3-5 CSMs, reports to VP CS)

**Manager responsibilities**:
- 1-on-1s with direct reports (weekly, 30 min each)
- Performance reviews (quarterly)
- Hiring (interview, onboard new team members)
- Process improvement (identify bottlenecks, implement fixes)

**Cost**: $80K-$120K per manager (SEA salaries)

---

### Fix 2: Formalize Communication (at 40+ employees)

**Problem**: At <30 employees, informal communication works (everyone knows everything). At 40+, information silos form.

**Fix: Written Communication Defaults**

**Replace "let's have a meeting" with "let me write a doc":**
- **Decision docs**: Major decisions written down (problem, options, chosen solution, rationale)
- **Project updates**: Weekly written updates (what we shipped, what's next, blockers)
- **Team announcements**: All-company updates via Slack or email (not just verbal at all-hands)

**Tools**:
- **Notion**: Company wiki, decision docs, project updates
- **Slack**: Real-time comms (but default to async docs for non-urgent)
- **Loom**: Video updates (5-10 min videos for complex topics)

---

### Fix 3: Define Values & Culture (before 40 employees)

**Problem**: At 10 employees, culture is organic (everyone knows the vibe). At 40+, culture dilutes (new hires don't absorb values).

**Fix: Codify Culture Early**

**Step 1: Define 5-7 core values**
- Example: "Customer-first", "Move fast", "Ownership", "Transparency", "Learn & iterate"
- Ask: "What behaviors do we reward? What behaviors do we fire for?"

**Step 2: Operationalize values**
- **Hiring**: Add values to interview scorecard ("Does candidate embody 'Move fast'?")
- **Performance reviews**: Evaluate employees against values (not just KPIs)
- **Recognition**: Publicly recognize employees who exemplify values (Slack shoutouts, all-hands mentions)

**Step 3: Reinforce through rituals**
- **Weekly all-hands**: Share customer stories that demonstrate values
- **Onboarding**: First day includes "Culture 101" session (founder presents values)
- **Culture deck**: Netflix-style culture doc (share with new hires, candidates)

---

## Common Scaling Mistakes (And How to Avoid Them)

### Mistake #1: Premature Hiring

**Problem**: Hire 20-30 people before $2M ARR, burn $300K-$500K/month, run out of cash before finding product-market fit.

**Red flags**:
- Revenue per employee <$100K (overhired)
- Burn rate >6 months of ARR (burning too fast)
- Hiring "ahead of growth" (hire 10 sales reps before sales process is repeatable)

**Fix**:
- Stay lean until $2M-$3M ARR (8-15 employees max at $1M ARR)
- Hire only when revenue justifies it (proven need, not anticipated need)
- Sales reps: Don't hire until quota is proven (first 2-3 reps hit quota consistently)

---

### Mistake #2: Not Firing Fast Enough

**Problem**: Keep C-players too long (drag team down, cost $100K-$300K/year in opportunity cost).

**Red flags**:
- Employee consistently misses goals (below 80% of quota for 2+ quarters)
- Negative team impact (others avoid working with them)
- Requires constant management (can't self-direct)

**Fix**:
- Performance improvement plan (PIP): Give 30-60 days to improve
- Document everything (missed targets, feedback given)
- If no improvement: Terminate (don't keep C-players "forever")

**Cost of keeping C-player**: $100K-$300K/year (salary + opportunity cost + team morale drag)

---

### Mistake #3: Ignoring Tech Debt

**Problem**: Let MVP code rot until shipping velocity drops 70%, customer complaints spike, downtime increases.

**Red flags**:
- Engineers complain daily ("codebase is a mess")
- Shipping velocity drops 50-70% (features take 2-3x longer)
- Bugs increase 3-5x (brittle codebase, regressions)

**Fix**:
- Allocate 20-30% of eng capacity to tech debt reduction (not 100% features)
- Plan rebuild at $2M-$5M ARR (before crisis hits)
- Budget $500K-$2M for 6-12 month rebuild

---

### Mistake #4: Manual Processes Forever

**Problem**: Never invest in automation ("we'll do it later"), team capacity waste stays at 40-60% forever.

**Red flags**:
- Team spending >40% of time on manual/admin work
- Revenue per employee <$150K (low productivity)
- Employees complain "I don't have time for real work" (stuck in admin hell)

**Fix**:
- Run operations audit NOW (identify top 10 bottlenecks)
- Automate top 3 bottlenecks in next 30-60 days (quick wins)
- Target 15-25% team capacity waste (not 40-60%)

---

## Operations Checklist by ARR Stage

### $1M ARR (15 employees)

- [ ] Set up basic metrics dashboard (track MRR, churn, pipeline weekly)
- [ ] Implement weekly leadership meeting (Monday metrics review)
- [ ] Document core processes (sales, onboarding, support — 1-page docs)
- [ ] Automate 1-2 bottlenecks (reporting, data entry)

**Team capacity waste target**: <30%

---

### $3M ARR (30-40 employees)

- [ ] Run comprehensive operations audit (identify top 10 bottlenecks)
- [ ] Automate top 5 bottlenecks (reporting, onboarding, data entry, invoicing, ticket triage)
- [ ] Hire first managers (sales manager, eng manager)
- [ ] Formalize communication (written updates, decision docs, Notion wiki)
- [ ] Define company values (5-7 core values, operationalize in hiring/reviews)

**Team capacity waste target**: <25%

---

### $5M ARR (50-60 employees)

- [ ] Implement full weekly operating rhythm (Monday metrics, Wednesday standup, Friday wins)
- [ ] Expand metrics tracking (all 20 metrics tracked automatically)
- [ ] Hire COO (if founder is overwhelmed with operations)
- [ ] Document all processes (100+ processes, owned by DRIs)
- [ ] Automate 80% of manual work (only strategic work remains manual)

**Team capacity waste target**: <20%

---

### $10M ARR (80-100 employees)

- [ ] Professionalize operations (hire VP Ops, implement OKRs, quarterly planning)
- [ ] Implement BI stack (Looker, Snowflake, automated dashboards)
- [ ] Scale automation (custom internal tools, APIs, integrations)
- [ ] Document all tribal knowledge (nothing lives only in someone's head)
- [ ] Measure operational excellence (NPS, cycle time, CSAT for internal processes)

**Team capacity waste target**: <15%

---

## Summary: The Operations Scaling Playbook

**Phase 1: Audit** (Week 1-2)
- Map all processes (50-100 processes)
- Calculate team capacity waste (target: identify 40-60% waste)
- Prioritize bottlenecks by ROI (automate top 10)

**Phase 2: Quick Wins** (Month 1-2)
- Automate top 3 bottlenecks (save 20-40 hours/week)
- Set up metrics dashboard (track 20 core metrics)
- Implement weekly operating rhythm (Monday metrics, Friday wins)

**Phase 3: Scale** (Month 3-6)
- Automate next 5-10 bottlenecks (save 60-80 hours/week)
- Hire middle managers (sales manager, eng manager)
- Formalize communication (written docs, Notion wiki)
- Define company values (codify culture before dilution)

**Phase 4: Professionalize** (Month 6-12)
- Hire COO (free up founder for strategy/fundraising)
- Document all processes (100% coverage, every process has DRI)
- Achieve 15-25% team capacity waste (world-class operational efficiency)

**Expected outcome**: Reach $10M ARR with 80-100 employees (not 150-200), maintain $150K-$200K revenue per employee, scale without chaos.

---

## Next Steps

**Step 1**: Run operations audit using [Process Mapping Template](../templates/automation-playbooks.md#process-mapping-template)

**Step 2**: Set up metrics dashboard using [20 Metrics Template](../templates/metrics-dashboards.md)

**Step 3**: Automate top 3 bottlenecks using [Automation Playbook](../templates/automation-playbooks.md)

**Step 4**: Implement weekly operating rhythm (Monday metrics, Wednesday standup, Friday wins)

**Step 5**: After operations are stable, move to [Hiring Guide](02-hiring.md) to build your team

---

**Ready to scale operations from $1M to $10M ARR?** Start with the [Operations Audit](../templates/automation-playbooks.md). 🚀
