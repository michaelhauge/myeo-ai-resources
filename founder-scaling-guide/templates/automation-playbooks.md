# Template: Automation Playbooks — Process Mapping & ROI Calculation

**Purpose**: This template helps you identify, prioritize, and automate repetitive processes to reduce team capacity waste and accelerate growth.

**How to use**:
1. Map all core processes (use process mapping template)
2. Calculate team capacity waste (manual hours ÷ total hours)
3. Prioritize automation opportunities (ROI calculator)
4. Implement top 3 quick wins (90-day automation sprint)
5. Measure impact (before/after hours saved)

---

## Step 1: Process Inventory

**List all repetitive processes** (things your team does weekly or monthly):

### Sales Processes
- [ ] Lead qualification (scoring inbound leads)
- [ ] Outbound prospecting (finding leads, enrichment)
- [ ] Meeting scheduling (back-and-forth emails)
- [ ] Quote generation (creating proposals, contracts)
- [ ] Follow-up sequences (drip emails after demo)
- [ ] CRM data entry (updating Salesforce, HubSpot)

### Customer Success Processes
- [ ] Onboarding (welcome emails, training sessions)
- [ ] Health score calculation (usage data → churn risk)
- [ ] Renewal reminders (email sequences 60/30/7 days before renewal)
- [ ] Upsell identification (usage triggers → expansion opportunity)
- [ ] Support ticket routing (assign to correct team member)

### Marketing Processes
- [ ] Lead scoring (assign points based on behavior)
- [ ] Email campaigns (drip sequences, newsletters)
- [ ] Social media posting (schedule posts)
- [ ] Content distribution (publish blog → share on social)
- [ ] Reporting (weekly metrics email)

### Operations Processes
- [ ] Invoicing (generate invoices, send to customers)
- [ ] Payment collection (follow up on overdue invoices)
- [ ] Expense approvals (review, approve, reimburse)
- [ ] Employee onboarding (IT setup, HR paperwork)
- [ ] Data entry (spreadsheets, database updates)

### Engineering Processes
- [ ] Code review (assign reviewers, merge)
- [ ] Deployments (build, test, deploy to production)
- [ ] Monitoring (alert when errors spike)
- [ ] Testing (run test suite on every commit)
- [ ] Documentation (auto-generate API docs from code)

---

## Step 2: Process Mapping Template

**For each high-priority process, map the current workflow:**

```
PROCESS: [Process Name]

FREQUENCY: [Daily / Weekly / Monthly]
CURRENT OWNER: [Who does this today?]
TIME PER EXECUTION: [X hours/minutes]
TOTAL TIME/MONTH: [Frequency × Time per execution]

CURRENT WORKFLOW (Manual Steps):

Step 1: [Action]
  - Tool: [What tool/system?]
  - Time: [X minutes]
  - Pain points: [What's frustrating/error-prone?]

Step 2: [Action]
  - Tool:
  - Time:
  - Pain points:

Step 3: [Action]
  - Tool:
  - Time:
  - Pain points:

[Continue for all steps...]

TOTAL MANUAL HOURS/MONTH: [Sum of all steps × frequency]

AUTOMATION OPPORTUNITY:
- Which steps can be automated? [List steps]
- Which steps must stay manual? [List steps]
- Estimated time savings: [X hours/month]
```

---

## Step 3: Automation ROI Calculator

**Calculate ROI for each automation opportunity:**

```
AUTOMATION: [Process Name]

CURRENT STATE (Manual):
- Hours spent/month: [X hours]
- Hourly cost: [Average salary ÷ 160 hours/month]
- Monthly cost: [Hours × Hourly cost] = $[Y]
- Annual cost: [Monthly cost × 12] = $[Z]

AUTOMATION COST:
- Tool cost: $[A]/month (e.g., Zapier $20, Make.com $10)
- Setup time: [B hours] × $[hourly rate] = $[C]
- One-time cost: $[C]
- Ongoing cost: $[A]/month × 12 = $[D]/year

SAVINGS:
- Annual savings: $[Z] - $[D] = $[E]
- Payback period: $[C] ÷ ($[Z] - $[D] ÷ 12) = [F] months

ROI: ([E] ÷ [C]) × 100 = [G]%

PRIORITY SCORE: [Calculate below]
```

---

## Step 4: Automation Priority Matrix

**Score each automation opportunity (1-10 scale):**

| Process | Time Saved (hrs/mo) | Setup Effort | Annual Savings | Payback (months) | **Priority Score** |
|---------|---------------------|--------------|----------------|------------------|--------------------|
| [Process 1] | [X] | [Low/Med/High] | $[Y] | [Z] | **[Score]** |
| [Process 2] | | | | | |
| [Process 3] | | | | | |

**Priority Score Formula**:
```
Priority Score = (Time Saved × 2) + (10 - Setup Effort) + (Annual Savings ÷ 1000)

Time Saved: Hours saved per month (1-10 scale)
Setup Effort: 1 = High effort (weeks), 5 = Medium (days), 10 = Low (hours)
Annual Savings: Dollars saved per year ÷ 1000
```

**Example**:
- Time Saved: 20 hrs/month → 10 points
- Setup Effort: Low (can do in 2-4 hours) → 10 points
- Annual Savings: $12,000 → 12 points
- **Priority Score**: (10 × 2) + 10 + 12 = **42**

**Prioritization**:
- **>40**: Do immediately (high impact, low effort)
- **30-40**: Do next quarter
- **20-30**: Do when you have time
- **<20**: Not worth automating (manual is fine)

---

## Automation Quick Wins (Top 10)

### 1. Email Sequences (Drip Campaigns)

**Process**: Manual follow-up emails after demo, trial signup, or meeting

**Current state** (Manual):
- Sales rep manually sends 3-5 follow-up emails over 2 weeks
- 5 minutes per email × 5 emails × 20 leads/week = 8 hours/week
- Annual cost: 8 hrs/week × 50 weeks × $50/hr = $20,000

**Automation**:
- Tool: Mailchimp, HubSpot, or Loops ($50-$200/month)
- Setup: 2-4 hours (write email templates, set up sequences)
- Ongoing: 0 hours (fully automated)

**Savings**: $20,000/year - $2,400/year (tool) = **$17,600/year saved**
**Payback**: 1 month

**How to automate**:
1. Write 5 email templates (use template below)
2. Set up sequence in email tool (Day 1, 3, 7, 14, 21)
3. Trigger: When lead signs up for demo/trial
4. Auto-send emails until lead responds or converts

---

### 2. Lead Scoring & Assignment

**Process**: Manually review inbound leads, score them, assign to sales reps

**Current state** (Manual):
- SDR spends 2 hours/day qualifying leads (100 leads/day)
- 2 hrs/day × 20 days/month = 40 hrs/month
- Annual cost: 40 hrs/month × 12 × $30/hr = $14,400

**Automation**:
- Tool: HubSpot, Clearbit, or Zapier + Airtable ($50-$200/month)
- Setup: 4-6 hours (define scoring rules, set up routing)
- Ongoing: 0 hours

**Savings**: $14,400/year - $2,400/year = **$12,000/year saved**
**Payback**: 2 months

**How to automate**:
1. Define lead scoring rules (points for company size, industry, behavior)
2. Set up automation: Score >80 → assign to AE, Score 40-80 → assign to SDR, Score <40 → nurture
3. Auto-assign based on round-robin or territory

---

### 3. Meeting Scheduling

**Process**: Back-and-forth emails to schedule meetings ("Are you free Tuesday at 2pm?")

**Current state** (Manual):
- Average 5 emails per meeting scheduled
- 3 minutes per email × 5 emails × 50 meetings/month = 12.5 hours/month
- Annual cost: 12.5 hrs/month × 12 × $50/hr = $7,500

**Automation**:
- Tool: Calendly, Cal.com (free or $10-$20/month)
- Setup: 30 minutes (connect calendar, set availability)
- Ongoing: 0 hours

**Savings**: $7,500/year - $240/year = **$7,260/year saved**
**Payback**: <1 week

**How to automate**:
1. Sign up for Calendly or Cal.com
2. Set availability (Monday-Friday 9am-5pm, buffer 15 min between meetings)
3. Share booking link in email signature, website
4. Customer books time → auto-added to calendar → reminder sent

---

### 4. CRM Data Entry

**Process**: Manually update CRM after every call, meeting, email

**Current state** (Manual):
- 5 minutes per update × 10 updates/day × 20 days/month = 16.7 hours/month
- Annual cost: 16.7 hrs/month × 12 × $50/hr = $10,000

**Automation**:
- Tool: HubSpot + Gmail integration or Zapier ($20-$100/month)
- Setup: 2 hours (connect email, set up sync rules)
- Ongoing: 0 hours

**Savings**: $10,000/year - $1,200/year = **$8,800/year saved**
**Payback**: 1.5 months

**How to automate**:
1. Connect email to CRM (HubSpot, Salesforce)
2. Auto-log emails, calls, meetings to CRM
3. AI-generated summaries (Gong, Chorus)

---

### 5. Invoice Generation & Payment Collection

**Process**: Manually create invoices, send to customers, follow up on overdue payments

**Current state** (Manual):
- 10 minutes per invoice × 100 invoices/month = 16.7 hours/month
- Follow-ups: 5 minutes × 20 overdue/month = 1.7 hours/month
- Total: 18.4 hours/month
- Annual cost: 18.4 hrs/month × 12 × $30/hr = $6,624

**Automation**:
- Tool: Stripe Invoicing (free) or QuickBooks ($30/month)
- Setup: 2 hours (set up templates, payment methods)
- Ongoing: 0 hours

**Savings**: $6,624/year - $360/year = **$6,264/year saved**
**Payback**: 1 month

**How to automate**:
1. Set up Stripe Invoicing or QuickBooks
2. Auto-generate invoices on billing date
3. Auto-send via email
4. Auto-follow-up on overdue (Day 3, 7, 14)
5. Auto-charge credit card (if on file)

---

### 6. Customer Onboarding

**Process**: Manually send welcome emails, schedule training, set up account

**Current state** (Manual):
- 30 minutes per new customer × 40 customers/month = 20 hours/month
- Annual cost: 20 hrs/month × 12 × $30/hr = $7,200

**Automation**:
- Tool: Intercom, Userflow, or Zapier + email ($50-$200/month)
- Setup: 4-6 hours (create email sequences, in-app guides)
- Ongoing: 0 hours

**Savings**: $7,200/year - $2,400/year = **$4,800/year saved**
**Payback**: 3 months

**How to automate**:
1. Create welcome email sequence (Day 1, 3, 7, 14)
2. Add in-app onboarding checklist (Intercom, Userflow)
3. Auto-schedule training session (Calendly link in welcome email)
4. Auto-provision account (API integration)

---

### 7. Support Ticket Routing

**Process**: Manually read support tickets, assign to correct team member

**Current state** (Manual):
- 2 minutes per ticket × 200 tickets/month = 6.7 hours/month
- Annual cost: 6.7 hrs/month × 12 × $30/hr = $2,400

**Automation**:
- Tool: Zendesk, Intercom, or Help Scout ($50-$200/month)
- Setup: 2 hours (define routing rules)
- Ongoing: 0 hours

**Savings**: $2,400/year - $1,200/year = **$1,200/year saved**
**Payback**: 8 months (but also improves response time)

**How to automate**:
1. Set up routing rules (keywords, customer tier, product)
2. Auto-assign to correct team member
3. Auto-prioritize (P1: <1 hour, P2: <4 hours, P3: <24 hours)

---

### 8. Social Media Posting

**Process**: Manually post to Twitter, LinkedIn, Facebook daily

**Current state** (Manual):
- 15 minutes per post × 5 posts/week = 1.25 hours/week
- 5 hours/month
- Annual cost: 5 hrs/month × 12 × $50/hr = $3,000

**Automation**:
- Tool: Buffer, Hootsuite, or Later ($10-$50/month)
- Setup: 1 hour (connect accounts, schedule posts)
- Ongoing: 1 hour/week (write posts in batches)

**Savings**: $3,000/year - $600/year - $3,000/year (ongoing) = **-$600/year** (NOT WORTH IT)

**Note**: Social media automation saves time but still requires content creation. Only automate scheduling, not content creation.

---

### 9. Expense Approvals

**Process**: Manually review expense reports, approve, reimburse

**Current state** (Manual):
- 5 minutes per expense × 50 expenses/month = 4.2 hours/month
- Annual cost: 4.2 hrs/month × 12 × $50/hr = $2,520

**Automation**:
- Tool: Expensify, Ramp, or Brex (free or $10/month per user)
- Setup: 2 hours (set up approval workflows, card limits)
- Ongoing: 0 hours

**Savings**: $2,520/year - $600/year = **$1,920/year saved**
**Payback**: 6 months

**How to automate**:
1. Issue corporate cards (Ramp, Brex)
2. Set spending limits ($500/month per employee)
3. Auto-approve expenses <$100
4. Auto-flag expenses >$500 for manager approval
5. Auto-categorize (hotels → Travel, software → SaaS)

---

### 10. Weekly Metrics Reporting

**Process**: Manually pull data from multiple tools, create report, email to team

**Current state** (Manual):
- 1 hour/week to pull data, create report = 4 hours/month
- Annual cost: 4 hrs/month × 12 × $50/hr = $2,400

**Automation**:
- Tool: Geckoboard, Databox, or Metabase ($50-$200/month)
- Setup: 4-6 hours (connect data sources, build dashboards)
- Ongoing: 0 hours

**Savings**: $2,400/year - $1,200/year = **$1,200/year saved**
**Payback**: 6 months

**How to automate**:
1. Connect data sources (Stripe, Google Analytics, CRM)
2. Build dashboard (MRR, churn, new customers, etc.)
3. Auto-email report (every Monday morning)

---

## 90-Day Automation Sprint

**Month 1: Quick Wins (3 automations)**

**Week 1-2**: Meeting scheduling (Calendly)
- Setup time: 30 minutes
- Savings: $7,260/year

**Week 3-4**: Email sequences (Mailchimp/HubSpot)
- Setup time: 4 hours
- Savings: $17,600/year

**Month 2: High-Impact (2 automations)**

**Week 5-6**: Lead scoring & assignment
- Setup time: 6 hours
- Savings: $12,000/year

**Week 7-8**: CRM data entry (auto-logging)
- Setup time: 2 hours
- Savings: $8,800/year

**Month 3: Operations (2 automations)**

**Week 9-10**: Invoice generation & collection
- Setup time: 2 hours
- Savings: $6,264/year

**Week 11-12**: Customer onboarding
- Setup time: 6 hours
- Savings: $4,800/year

**Total Savings**: $56,724/year
**Total Setup Time**: 20.5 hours
**ROI**: $56,724 ÷ (20.5 hrs × $50) = **5,533%**

---

## Automation Tools by Category

### Email Automation
- **Mailchimp** ($20-$300/month): Email marketing, drip campaigns
- **HubSpot** ($50-$500/month): Full marketing automation, CRM
- **Loops** ($30-$200/month): Developer-friendly email API

### Workflow Automation
- **Zapier** ($20-$600/month): Connect 5,000+ apps, no code
- **Make** (formerly Integromat) ($10-$300/month): Visual automation builder
- **n8n** (Free, self-hosted): Open-source Zapier alternative

### Scheduling
- **Calendly** (Free or $10-$20/month): Meeting scheduling
- **Cal.com** (Free or $12/month): Open-source Calendly alternative

### CRM
- **HubSpot** ($50-$500/month): Full CRM + marketing automation
- **Salesforce** ($25-$300/user/month): Enterprise CRM
- **Pipedrive** ($15-$100/user/month): Sales-focused CRM

### Customer Support
- **Intercom** ($74-$395/month): Live chat + support tickets + email
- **Zendesk** ($55-$115/agent/month): Support ticket system
- **Help Scout** ($20-$65/user/month): Email-based support

### Invoicing & Payments
- **Stripe** (Free, 2.9% + $0.30 per transaction): Payments + invoicing
- **QuickBooks** ($30-$200/month): Accounting + invoicing
- **Xero** ($13-$70/month): Accounting + invoicing

---

## Process Documentation Template

**Copy this for each automated process:**

```
PROCESS: [Process Name]

BEFORE AUTOMATION:
- Manual steps: [List steps]
- Time per execution: [X hours]
- Frequency: [Y times per month]
- Total time/month: [X × Y hours]
- Annual cost: $[Z]

AFTER AUTOMATION:
- Tool: [Tool name]
- Setup time: [A hours]
- Setup cost: $[B]
- Ongoing cost: $[C]/month
- Time saved: [D hours/month]
- Annual savings: $[E]

AUTOMATION WORKFLOW:
1. [Trigger]: [What starts the automation?]
2. [Action 1]: [What happens first?]
3. [Action 2]: [What happens next?]
4. [Output]: [What's the final result?]

EXCEPTION HANDLING:
- What still requires manual intervention? [List cases]
- Who handles exceptions? [Person/role]
- How to escalate? [Process]

MONITORING:
- How to check if automation is working? [Dashboard, alerts]
- Alert if: [Conditions that trigger alert]
- Owner: [Who monitors this automation?]
```

---

## Common Automation Mistakes

### Mistake 1: Automating Broken Processes

**The mistake**: Automating a process that's already inefficient

**Example**: Sales process takes 10 manual steps → automate all 10 steps

**Why it's bad**: You've just made a bad process faster (still 10 steps, just automated)

**Fix**: Simplify process FIRST (reduce 10 steps → 3 steps), THEN automate

---

### Mistake 2: Over-Engineering

**The mistake**: Building custom automation when off-the-shelf tool exists

**Example**: Build custom email automation with n8n when Mailchimp exists

**Why it's bad**: 20 hours to build custom vs 2 hours to set up Mailchimp

**Fix**: Use SaaS tools (Zapier, HubSpot) until $5M+ ARR (then consider custom)

---

### Mistake 3: No Exception Handling

**The mistake**: Automate 100% of process, no manual fallback

**Example**: Auto-assign leads, but what if lead is VIP and needs immediate attention?

**Why it's bad**: Edge cases break (VIP waits 24 hours for response)

**Fix**: Always have manual override (flag VIP leads for immediate attention)

---

### Mistake 4: Not Measuring Impact

**The mistake**: Automate process, never check if it actually saved time

**Example**: Automate invoice generation, but accountant still spends same amount of time

**Why it's bad**: Automation might not work, or created new work elsewhere

**Fix**: Measure before/after (hours spent, error rate, customer satisfaction)

---

## Summary

**Top 10 Automation Quick Wins**:
1. Email sequences (drip campaigns)
2. Lead scoring & assignment
3. Meeting scheduling
4. CRM data entry
5. Invoice generation & payment collection
6. Customer onboarding
7. Support ticket routing
8. Social media posting (scheduling only)
9. Expense approvals
10. Weekly metrics reporting

**90-Day Sprint**: Automate 7 processes → Save $56K/year with 20 hours of setup

**ROI Calculation**:
```
ROI = (Annual Savings - Annual Tool Cost) ÷ Setup Cost × 100
```

**Prioritization**: Use Priority Score formula (time saved + low effort + high savings)

**Next steps**:
- Review Part 1: Operations at Scale (full automation strategy)
- Map your top 10 manual processes
- Calculate ROI for each
- Automate top 3 this quarter
