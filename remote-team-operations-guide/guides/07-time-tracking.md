# Time Tracking & Timezone Management

**Time to complete**: 1-2 weeks (tool setup + team adoption)
**Cost**: $0-10/user/month
**Prerequisites**: Project management tool, clear goals
**Who owns this**: Operations lead or project manager

---

## Should You Track Time?

### The Controversial Question

**Many remote work guides say**: "Track time to ensure productivity"

**We say**: **Time tracking is appropriate for specific use cases only.**

**When time tracking makes sense**:
- ✅ **Client billing** - Law firms, agencies, consultants billing by the hour
- ✅ **Project estimation** - Understanding how long tasks actually take (for planning)
- ✅ **Personal productivity** - Individuals want to track for themselves
- ✅ **Compliance** - Labor laws in some countries require time tracking

**When time tracking is counterproductive**:
- ❌ **Surveillance** - "Making sure people are working" (destroys trust)
- ❌ **Micromanagement** - Checking if people worked 40 hours
- ❌ **Proxy for performance** - Hours worked ≠ results delivered

**Our recommendation**: **Default to output-based management** (see `guides/05-performance-management.md`). Only add time tracking if you have a specific need (billing, estimation, compliance).

---

## Use Case 1: Time Tracking for Client Billing

### When You Need This
- Law firms
- Consulting firms
- Agencies (design, marketing, development)
- Freelancers
- Any business that bills clients by the hour

### Recommended Tools

| Tool | Cost | Best For | Key Features |
|------|------|----------|--------------|
| **Clockify** | Free - $9.99/user/mo | Budget-conscious, simple | Unlimited users (free), timer, reports |
| **Toggl Track** | Free - $9/user/mo | Individuals & small teams | Beautiful UI, reporting, integrations |
| **Harvest** | $10.80/user/mo | Client billing, invoicing | Time + expenses + invoicing in one tool |
| **Timely** | $9/user/mo | Automatic time tracking | AI auto-tracks time (less manual input) |

**Our recommendation**: **Clockify** (free) or **Toggl Track** ($9/user) for most teams.

### Setup (Clockify Example)

**Step 1: Create Account** (5 min)
1. Go to clockify.me
2. Sign up with work email
3. Create workspace (company name)

**Step 2: Add Projects & Clients** (15 min)
1. Projects → Add projects (e.g., "Acme Corp - Website Redesign")
2. Clients → Add clients (e.g., "Acme Corp")
3. Link projects to clients

**Step 3: Invite Team** (5 min)
1. Settings → Team → Invite users
2. Set permissions (who can edit time, run reports)

**Step 4: Set Billable Rates** (10 min)
1. Settings → Rates
2. Set hourly rate per person or per project
3. Example: $150/hour for senior consultant, $75/hour for junior

**Step 5: Train Team** (30 min)
1. Show how to start/stop timer
2. Demo manual time entry (if forgot to track)
3. Show how to categorize time (project, task, billable/non-billable)

**Step 6: Integrate with Tools**
- Clockify integrates with Asana, ClickUp, Trello, Notion
- Track time directly from project management tool

### Best Practices for Client Billing

**1. Track everything (billable and non-billable)**
- Billable: Client work
- Non-billable: Internal meetings, training, admin

**Why?** Understand true project profitability. If project billed 40 hours but took 60 hours (with non-billable time), you lost money.

**2. Add task descriptions**
- ✅ "Reviewed marketing strategy doc and provided feedback" (specific)
- ❌ "Meeting" (vague, clients won't pay for this)

**3. Review time before invoicing**
- Weekly review: Check time entries for accuracy
- Edit errors before sending invoice to client
- Round time appropriately (e.g., 2.3 hours → 2.5 hours)

**4. Set minimums** (optional)
- Some firms bill in 15-minute increments (0.25 hours minimum)
- 5-min call = Billed as 15 min

**5. Use templates for recurring tasks**
- "Weekly status meeting with [Client]" (reuse description)
- Saves time on admin

### Reporting & Invoicing

**Weekly/Monthly Reports**:
1. Clockify → Reports → Summary
2. Filter by client/project
3. Export to PDF or Excel
4. Send to client as time breakdown

**Invoicing** (if tool supports it, e.g., Harvest):
1. Select unbilled time entries
2. Generate invoice
3. Send to client
4. Mark as invoiced

---

## Use Case 2: Time Tracking for Project Estimation

### Why This Matters

**The problem**: You estimate 2 weeks for a project. It takes 6 weeks. Why?

**Time tracking for estimation** helps you:
- ✅ Understand actual time spent (vs estimated)
- ✅ Improve future estimates (historical data)
- ✅ Identify inefficiencies (where is time going?)

**Use case**: Internal projects (not client billing). Example: "Build new website" project.

### Simplified Approach

**You don't need detailed tracking**. Just:
1. **Estimate time** at project start (e.g., "This project will take 80 hours")
2. **Track actual time** as team works
3. **Compare at end**: Actual vs Estimated

**Tool**: Use project management tool's built-in time tracking (ClickUp, Asana) or simple Clockify (free).

### Workflow

**Step 1: Estimate at Project Start**
- Break project into tasks
- Estimate hours per task (rough estimates are fine)
- Example: "Design homepage mockup: 8 hours"

**Step 2: Track Time as You Work**
- Start timer when working on task
- Stop timer when done or switching tasks
- Log time daily (end of day review)

**Step 3: Review at Project End**
- Compare total actual time vs estimated time
- Identify where estimates were off
- Example: "Estimated 80 hours, actual 120 hours. Design took 2x longer than expected."

**Step 4: Improve Future Estimates**
- Next similar project: Use historical data
- "Last homepage design took 16 hours, not 8. Estimate 16 for next one."

### Simplified Reporting

**Don't need fancy reports**. Just track:
- Total hours per project
- Total hours per phase (Design, Development, QA)
- Actual vs Estimated

**Example summary**:
```
Project: Website Redesign
Estimated: 80 hours
Actual: 118 hours
Variance: +38 hours (48% over estimate)

Breakdown:
- Design: Estimated 20h, Actual 32h (+60%)
- Development: Estimated 40h, Actual 50h (+25%)
- QA: Estimated 20h, Actual 36h (+80%)

Lesson: QA took way longer than expected. Budget more time for QA next project.
```

---

## Use Case 3: Personal Productivity Tracking

### When Individuals Want to Track

**Some people like tracking time** to:
- Understand where their day goes
- Identify time wasters
- Improve focus (Pomodoro technique)
- See patterns (e.g., "I'm most productive 9-11am")

**This is optional and personal**. Let individuals track if they want, but don't require it company-wide.

### Recommended Tools for Individuals

| Tool | Cost | Best For |
|------|------|----------|
| **RescueTime** | Free - $12/mo | Automatic tracking (no manual input) |
| **Toggl Track** | Free - $9/mo | Manual tracking with beautiful UI |
| **Clockify** | Free | Free manual tracking |
| **Forest** | $2 one-time | Gamified focus (grow trees when focused) |

**RescueTime** is best for "set it and forget it" - it auto-tracks which apps/websites you use and generates productivity reports.

### How to Use (RescueTime Example)

1. Install RescueTime app
2. It runs in background, tracking which apps/sites you use
3. Weekly report: "You spent 25 hours on productive work, 5 hours on distracting sites"
4. Use insights to improve (e.g., "I spend 2 hours/day on email, let's batch email to 1 hour")

**Privacy note**: If your company requires RescueTime, this can feel invasive. Use only as an optional personal tool.

---

## Timezone Management

### The Remote Work Challenge

**With office work**: Everyone is in same timezone (or 1-2 hour difference).

**With remote work**: Team can be in Singapore (GMT+8), Philippines (GMT+8), India (GMT+5:30), Vietnam (GMT+7).

**The problem**:
- ❌ Meetings scheduled at 11pm for some, 7am for others
- ❌ Sync communication is hard (no overlap hours)
- ❌ Context switches ("I'll wait 8 hours for their response")

**The solution**: **Async-first communication** + **defined overlap hours**.

### Step 1: Calculate Timezone Overlap

**Use the script** provided in `scripts/timezone-overlap.py`.

**Example**:
```bash
python scripts/timezone-overlap.py \
  --timezones "Asia/Singapore,Asia/Manila,Asia/Kolkata,America/Los_Angeles" \
  --work-hours 9-18
```

**Output**:
```
Overlap hours (all timezones):
- 1pm-5pm Singapore Time (4 hours)

This is when all team members are working.
Schedule synchronous meetings during this window.
```

**If no overlap**: Team is fully async (no real-time meetings).

### Step 2: Define Core Overlap Hours

**Core overlap hours** = Time when everyone is expected to be available for sync communication.

**Example policy**:
```markdown
## Core Overlap Hours

**When**: 1pm-5pm Singapore Time (GMT+8) on weekdays

**During overlap hours**:
- Available for urgent questions (respond within 30 min)
- Attend scheduled meetings
- Synchronous collaboration (pair programming, brainstorms)

**Outside overlap hours**:
- Async communication only (no expectation of immediate response)
- Work on deep work tasks
- Flexible schedule (work when you're most productive)
```

**Add this to your handbook** (see `guides/04-async-documentation.md`).

### Step 3: Display Timezones Everywhere

**Make timezones visible**:
- ✅ Slack profile: Add timezone to name (e.g., "Mike (SGT)")
- ✅ Slack status: Show local time automatically (built-in feature)
- ✅ Google Calendar: Show multiple timezones
- ✅ Notion page: "Team Directory" with everyone's timezone

**Slack timezone setup**:
1. Slack profile → Edit → Timezone → Select your timezone
2. Slack auto-shows local time next to messages ("3:45pm for them")

**Google Calendar multi-timezone**:
1. Settings → General → Time zone → Add secondary timezone
2. Calendar shows both timezones side-by-side

### Step 4: Schedule Meetings Considerately

**Best practices**:
- ✅ Schedule meetings during overlap hours
- ✅ Rotate meeting times if overlap is small (fair to all timezones)
- ✅ Record all meetings (for those who can't attend live)
- ✅ Default to async (Loom video, written RFC) instead of meeting

**Tools**:
- **World Time Buddy** (worldtimebuddy.com) - Compare timezones visually
- **Calendly** - Let people book time in their own timezone
- **Google Calendar** - Auto-converts meeting times to invitee's timezone

**Example**: Meeting scheduled "3pm Singapore Time" appears as:
- 3pm for Singapore team
- 12:30pm for India team
- 8am for Europe team
- Midnight previous day for US West Coast team ← ❌ Bad, reschedule

### Step 5: Async-First Communication

**If timezones don't overlap well**, use async communication:
- ✅ Written updates instead of standups
- ✅ Loom videos instead of live presentations
- ✅ RFC documents instead of brainstorm meetings
- ✅ Slack threads instead of real-time chat

See `CULTURE.md` for detailed async communication practices.

---

## Compliance: When Time Tracking is Required

### Labor Law Requirements

Some countries require employers to track work hours:

**Singapore**:
- Employees must keep records of hours worked (Employment Act)
- Especially for overtime calculation

**Malaysia**:
- Employers must maintain records of attendance
- Required for Employment Act compliance

**Philippines**:
- Time records required (Labor Code)
- Important for calculating 13th month pay, overtime

**Indonesia**:
- Time records required for calculating THR (holiday allowance), overtime

**EU countries** (if you have European team):
- GDPR-compliant time tracking required in some countries (e.g., Germany, Spain)

**What you need**:
- System to track work hours (doesn't need to be sophisticated)
- Options: Timesheet (Google Sheets), Clockify, attendance system
- Self-reported hours are usually acceptable (employees log start/end times)

**Consult local employment lawyer** for your specific country requirements. See `COMPLIANCE.md` for country-by-country details.

### Simple Compliance Solution

**If you need compliance** but not detailed tracking:

**Use Google Sheets timesheet**:
```
Date | Employee | Start Time | End Time | Total Hours | Notes
2026-02-07 | Mike | 9:00am | 6:00pm | 8 hours | Regular day
2026-02-08 | Mike | 9:00am | 8:00pm | 10 hours | Worked late on deadline
```

**Process**:
1. Each employee logs daily hours (self-reported)
2. Manager reviews weekly
3. Keep records for 2-5 years (depending on local law)

**Tool**: Google Sheets (free) or Clockify (free, easier than spreadsheet).

---

## Anti-Pattern: Surveillance Software

### What to Avoid

**Surveillance/monitoring software** (Hubstaff, Time Doctor with screenshot mode, ActivTrak):
- Takes screenshots every few minutes
- Tracks mouse/keyboard activity
- Monitors which websites/apps you use
- Flags "unproductive" time

**Why we don't recommend this**:
1. ❌ **Destroys trust** - Assumes employees are lazy/dishonest
2. ❌ **Top performers leave** - High performers don't want to be surveilled like children
3. ❌ **Doesn't measure actual productivity** - Someone can move their mouse every 2 minutes while doing nothing
4. ❌ **Privacy concerns** - Especially if employees use personal devices

**Exception**: Some highly regulated industries (finance, government) may require monitoring for compliance. If so, be transparent with employees and use least invasive tools necessary.

### The Better Alternative

**Instead of surveillance**:
- ✅ Set clear goals (OKRs, see `guides/05-performance-management.md`)
- ✅ Measure output (did they achieve goals?)
- ✅ Regular check-ins (weekly 1:1s)
- ✅ Transparent work (visible in project management tool)
- ✅ Trust by default (assume people are working unless evidence shows otherwise)

**If someone is underperforming**:
- Address it directly (specific feedback in 1:1)
- Set performance improvement plan (PIP)
- If no improvement, exit
- **Don't** impose surveillance on entire team because one person underperforms

---

## Budget Breakdown

### 10-person company (Client Billing)

| Tool | Monthly Cost | Annual Cost | Notes |
|------|--------------|-------------|-------|
| **Clockify Free** | $0 | $0 | Unlimited users, good enough for most |
| **Toggl Track** | $90 ($9/user) | $1,080 | Better reporting, UI |
| **Harvest** | $108 ($10.80/user) | $1,296 | Time + invoicing in one |

**Recommendation**: **Clockify Free** (start here) or **Toggl Track** ($90/month if you need better reports).

### 10-person company (No Client Billing)

**Cost**: $0

**Recommendation**: Don't track time. Use output-based management (see `guides/05-performance-management.md`).

**If you need project estimation**: Use ClickUp or Asana's built-in time tracking (included in PM tool, no extra cost).

---

## Timezone Overlap Script

See `scripts/timezone-overlap.py` for a Python script to calculate team timezone overlaps.

**Usage**:
```bash
python scripts/timezone-overlap.py \
  --timezones "Asia/Singapore,Asia/Manila,America/New_York" \
  --work-hours 9-18
```

**Output**:
```
Team timezones:
- Asia/Singapore (GMT+8)
- Asia/Manila (GMT+8)
- America/New_York (GMT-5)

Overlap hours:
- 9pm-11pm Singapore Time (2 hours overlap)

Recommendation: Schedule meetings during 9-11pm SGT (9-11am NYC).
Or default to async communication (13-hour time difference is difficult for sync work).
```

---

## Success Metrics

### For Client Billing

**Month 1**:
- ✅ All team members tracking time
- ✅ 90%+ of billable hours logged
- ✅ First invoice generated from time tracking

**Month 3**:
- ✅ Project profitability visible (billable vs actual hours)
- ✅ Client invoicing is streamlined (30 min/month instead of 4 hours)
- ✅ Improved project estimates (historical data used)

### For Project Estimation

**Month 1**:
- ✅ Time estimates added to projects
- ✅ Actual time tracked

**Month 3**:
- ✅ Estimate accuracy improved by 30% (using historical data)
- ✅ Reduced project overruns

### For Timezone Management

**Month 1**:
- ✅ Core overlap hours defined and documented
- ✅ Team timezones visible (Slack profiles, Notion directory)
- ✅ Meetings scheduled during overlap hours

**Month 3**:
- ✅ 80% of meetings during overlap hours (or async)
- ✅ Reduced "waiting for response" time (async communication norms established)
- ✅ Team reports fair meeting times (no one consistently has 11pm meetings)

---

## Next Steps

After time tracking setup (if needed):

1. ✅ **Decide if you need time tracking** - Client billing, estimation, or compliance only
2. ✅ **Choose tool** - Clockify (free) or Toggl Track ($9/user)
3. ✅ **Set up projects/clients** - In tool
4. ✅ **Train team** - How to track time (30 min training)
5. ✅ **Calculate timezone overlap** - Use `scripts/timezone-overlap.py`
6. ✅ **Define core overlap hours** - Document in handbook
7. ➡️ **Set up cross-border employment** (if applicable) - See `guides/08-sea-employment.md`
8. ➡️ **Implement security measures** - See `guides/09-security-remote.md`

**Questions?** See `FAQ.md` section "Performance & Productivity" for time tracking questions.
