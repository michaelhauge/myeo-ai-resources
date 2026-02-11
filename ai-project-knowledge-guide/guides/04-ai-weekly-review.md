# AI Weekly Review: Transform Planning from Chore to Insight

**Last Updated**: 2026-02-07
**Setup Time**: 1-2 hours
**Expected ROI**: Save 2-3 hours/week on planning

This guide shows you how to use AI to turn weekly planning from a tedious manual process into an insightful strategic session.

---

## The Problem: Weekly Planning Feels Like Busywork

**Typical weekly review** (2-3 hours):
1. Open PM tool, stare at list of 50+ tasks
2. Manually check what got done, what didn't
3. Guess which tasks to prioritize next week
4. Write vague status update for team
5. Feel like you accomplished nothing

**The pain**:
- Planning takes 2-3 hours but feels unproductive
- Never sure what to work on first
- Status updates are time-consuming and boring
- No clear connection between what you did and what matters
- Team doesn't have visibility into progress

**The cost**: 2-3 hours/week × 10 people = 20-30 hours/week across team

---

## The AI Solution: Data-Driven Weekly Reviews

**AI-powered weekly review** (30 minutes):

```
AI analyzes your PM tool
    ↓
Completed: 12 tasks (vs 10 planned - good!)
In Progress: 5 tasks (2 are overdue - need attention)
Blocked: 2 tasks (dependencies not clear)
    ↓
AI identifies patterns
    ↓
"You completed mostly bug fixes this week.
Only 2 of 12 tasks were feature work.
Is this aligned with your Q1 goals?"
    ↓
AI suggests priorities
    ↓
"Overdue: Client onboarding (3 days late - high impact)
Blocked: API integration (waiting on vendor - follow up)
Next week: Focus on 'Pricing page redesign' (due Feb 15)"
    ↓
AI generates status update
    ↓
"This week: Fixed 8 critical bugs, shipped email integration.
Next week: Launch pricing page, finalize Q1 roadmap.
At risk: Client onboarding delayed 3 days."
```

**Time saved**: 2 hours manual review → 30 minutes with AI insights

---

## What AI Can Do for Weekly Reviews

### 1. Quantify Progress (Without Manual Counting)

**Without AI**: Count completed tasks manually, calculate percentages in spreadsheet

**With AI**:
```
Prompt: "Analyze my Linear completed tasks from last week"

Claude: "Last week (Jan 30 - Feb 6):
- Completed: 12 tasks (75% of planned 16)
- In progress: 5 tasks (2 rolled over from previous week)
- Overdue: 2 tasks (both high priority)

Breakdown by type:
- Bugs: 8 tasks (67%)
- Features: 3 tasks (25%)
- Chores: 1 task (8%)

You completed 4 more tasks than previous week (↑50%)."
```

---

### 2. Surface Patterns You'd Miss

**Without AI**: You see tasks, not trends

**With AI**:
```
Prompt: "What patterns do you see in my completed work this month?"

Claude: "Patterns in February work:
1. Bug-heavy: 65% of tasks were bug fixes (vs 30% in January)
2. Reactive work: Most tasks created mid-week, not planned
3. Context switching: Worked on 12 different projects (vs 5 in January)
4. Blocked dependencies: 40% of delays due to vendor/external blockers

Recommendation: Block focus time for feature work, reduce project count."
```

---

### 3. Prioritize Based on Impact, Not Urgency

**Without AI**: "Everything feels urgent, not sure what matters"

**With AI**:
```
Prompt: "What should I focus on next week? Consider my Q1 goals:
1. Launch new pricing page, 2. Reduce churn by 20%"

Claude: "Recommended priorities for next week:

High Priority (aligns with Q1 goals):
1. Finish pricing page (Goal 1, due Feb 15) - 8h estimated
2. Customer feedback calls (Goal 2, churn insights) - 4h estimated

Medium Priority (important but not urgent):
3. API integration (blocks future work) - 6h estimated

Low Priority (can defer):
4. Internal tooling improvements - 4h estimated

Suggested focus: 70% on pricing (Goal 1), 30% on churn research (Goal 2).
Defer internal tooling to March."
```

---

### 4. Generate Team Status Updates

**Without AI**: Write update from scratch, take 30 min

**With AI**:
```
Prompt: "Generate a weekly status update for my team based on my Linear tasks"

Claude: "Weekly Update - Product Team (Feb 7, 2026)

🎉 Shipped This Week:
- Email integration now live (fixed 3-day delay for 20% of users)
- Fixed 8 critical bugs (including payment processing issue)
- Completed API documentation

🚀 In Progress:
- Pricing page redesign (80% complete, launching Feb 15)
- Customer onboarding improvements (waiting on design feedback)

⚠️ At Risk:
- Client onboarding delayed 3 days (vendor API issues - following up)
- API integration blocked (need legal approval for vendor contract)

Next Week Focus:
- Launch pricing page
- Complete Q1 roadmap planning"
```

---

## Implementation: 3 Options

### Option 1: Manual Prompts (Easiest, 15 min setup)

**What you do**:
1. Open PM tool (Linear, Notion, Asana)
2. Copy relevant data (completed tasks, in-progress tasks)
3. Paste into Claude Pro with prompts
4. Review AI analysis and recommendations

**Best for**: Solo users, quick start, $0 cost

**Time**: 30 min/week

**Setup**: [Jump to Manual Prompts Setup](#option-1-manual-prompts-setup)

---

### Option 2: Claude MCP (Recommended, 1 hour setup)

**What you do**:
1. Ask Claude to analyze your Linear/Notion directly
2. Claude queries your PM tool, generates insights
3. Review and refine

**Best for**: Teams using Linear or Notion, want deeper integration

**Time**: 15 min/week

**Prerequisites**: Claude Desktop/Code + Linear or Notion MCP

**Setup**: [Jump to Claude MCP Setup](#option-2-claude-mcp-setup)

---

### Option 3: Automated Weekly Report (Advanced, 2-3 hours setup)

**What you do**:
1. n8n workflow runs every Friday at 4pm
2. Fetches data from PM tool
3. Sends to Claude API for analysis
4. Emails you a weekly report + suggested priorities

**Best for**: Teams wanting zero-touch automation

**Time**: 5 min/week (review email)

**Prerequisites**: n8n + Claude/OpenAI API + PM tool API

**Setup**: [Jump to Automated Setup](#option-3-automated-weekly-report-setup)

---

## Quick Comparison

| Feature | Manual Prompts | Claude MCP | Automated Report |
|---------|---------------|-----------|------------------|
| **Setup Time** | 15 min | 1 hour | 2-3 hours |
| **Weekly Time** | 30 min | 15 min | 5 min |
| **Cost** | Claude Pro ($20/mo) | Claude Pro ($20/mo) | Claude API ($5-10/mo) |
| **PM Tool Support** | Any (manual copy) | Linear, Notion, GitHub | Any (via API) |
| **Automation** | Manual | Semi-automated | Fully automated |
| **Best For** | Solo users | Power users | Teams |

**Recommendation**: Start with Option 1 (manual prompts) this week. If you like it, upgrade to Option 2 (Claude MCP) for less manual work.

---

## Option 1: Manual Prompts Setup

### Step 1: Choose Your Review Format (5 min)

Pick a template that fits your workflow:

**Template A: Solo Founder/CEO**

Focus: What got done, what's next, what's blocking progress

**Template B: Team Lead**

Focus: Team progress, blockers, status updates for stakeholders

**Template C: Product Manager**

Focus: Feature progress, roadmap updates, cross-functional dependencies

We'll use **Template A** for this guide (adapt for your needs).

---

### Step 2: Gather Data from PM Tool (5 min)

**What to export from your PM tool**:

**From Linear**:
1. Go to your Linear workspace
2. Filter: "Completed" + "Last 7 days" + "Assigned to me"
3. Copy task list (titles only, or use "Copy as Markdown")
4. Repeat for: "In Progress" and "Backlog"

**Example data to copy**:

```
Completed (Last Week):
- Fix payment processing bug
- Add email verification to signup
- Write API documentation
- Design pricing page mockups
- Customer feedback call with Acme Corp
- Update onboarding flow
- Fix mobile responsive issues
- Implement rate limiting

In Progress:
- Pricing page implementation (80% done)
- Customer onboarding improvements (blocked - waiting on design)
- API integration (legal review needed)

Backlog (Next):
- Q1 roadmap planning
- Customer churn analysis
- Internal admin dashboard
```

**From Notion**:
- Open your Tasks database
- Filter by date range and status
- Export as CSV or copy relevant rows

**From Asana/ClickUp/Monday**:
- Use similar filtering (status + date)
- Export or copy task titles

---

### Step 3: Use AI Prompts for Analysis (10 min)

**Prompt 1: Quantify Progress**

```
I completed these tasks last week:
[paste your completed task list]

Please analyze:
1. How many tasks completed?
2. Breakdown by type (bugs, features, chores, meetings)
3. How does this compare to a typical week? (assume 8-12 tasks is average)
4. Any patterns you notice?
```

**Example AI response**:

```
Analysis of your week:

1. Tasks completed: 8 tasks (on the high end of average)

2. Breakdown by type:
   - Bugs: 3 tasks (38%)
   - Features: 3 tasks (38%)
   - Documentation: 1 task (12%)
   - Customer work: 1 task (12%)

3. Comparison: Above average (8 vs typical 6-8). Good productivity week.

4. Patterns:
   - Balanced mix of bugs and features (healthy)
   - 1 customer-facing task (maintaining relationships)
   - Heavy on execution, light on planning (no roadmap/strategic work)
   - Mobile and payment focus suggests user-reported issues prioritized

Overall: Strong execution week, but may want to carve out time for strategic planning.
```

---

**Prompt 2: Identify Blockers and At-Risk Items**

```
I have these tasks in progress and backlog:
[paste in-progress and backlog lists]

Current date: Feb 7, 2026

Please identify:
1. What's at risk (overdue or approaching deadline)?
2. What's blocked and why?
3. What should be escalated or de-prioritized?
```

**Example AI response**:

```
At-Risk Items:

1. Pricing page implementation (80% done)
   - Status: On track if completed by Feb 15
   - Risk: Medium (depends on no blockers emerging)
   - Action: Prioritize for next week

2. Customer onboarding improvements
   - Status: BLOCKED - waiting on design feedback
   - Risk: High (unclear timeline)
   - Action: Follow up with design team TODAY

3. API integration
   - Status: BLOCKED - legal review needed
   - Risk: High (external dependency, unknown timeline)
   - Action: Check with legal team, set deadline

Escalate:
- Customer onboarding (3 stakeholders waiting, no clear ETA)
- API integration (blocks 2 other projects)

De-prioritize:
- Internal admin dashboard (nice-to-have, no external deadline)
```

---

**Prompt 3: Suggest Next Week Priorities**

```
Context:
- My Q1 goals: 1) Launch new pricing page by Feb 15, 2) Reduce customer churn by 20%
- Completed last week: [paste list]
- In progress: [paste list]
- Backlog: [paste list]

Based on this, what should I focus on next week? Suggest a prioritized list with time estimates.
```

**Example AI response**:

```
Recommended Priorities for Next Week (Feb 8-14):

🔥 Must Complete (aligned with Q1 goals):

1. Finish Pricing Page Implementation (Goal 1)
   - Est: 12 hours
   - Why: Due Feb 15, 80% done, high impact
   - Blocks: Launch marketing campaign

2. Customer Churn Analysis (Goal 2)
   - Est: 4 hours
   - Why: Need insights to inform retention strategy
   - Action: Review last 10 churned customers

⚙️ Important (unblock other work):

3. Unblock Customer Onboarding
   - Est: 2 hours (follow-ups + coordination)
   - Why: Blocking onboarding improvements
   - Action: Get design feedback, set new timeline

4. Unblock API Integration
   - Est: 2 hours (check with legal, escalate if needed)
   - Why: Blocks 2 downstream projects

📋 Nice-to-Have (if time permits):

5. Q1 Roadmap Planning
   - Est: 4 hours
   - Why: Important for alignment, but can be early next week

🚫 Defer to March:

- Internal admin dashboard (no external deadline)

Time Budget Check:
Must: 16 hours (80% of 20-hour work week)
Important: 4 hours (20%)
Total: 20 hours = fully allocated

Recommendation: Focus 100% on pricing page and churn analysis. If you complete these early, tackle unblocking tasks.
```

---

**Prompt 4: Generate Status Update**

```
Write a concise weekly status update for my team based on:

Completed: [paste completed tasks]
In progress: [paste in-progress tasks]
Blockers: [paste blockers from Prompt 2 analysis]

Format:
- What shipped
- What's in progress
- What's at risk
- Next week focus
```

**Example AI response**:

```
Weekly Update - Product Team (Week of Feb 7, 2026)

🎉 Shipped This Week:
- Fixed critical payment processing bug (affected 15% of transactions)
- Launched email verification for new signups
- Completed API documentation (now live for partners)
- Delivered pricing page mockups

🚀 In Progress:
- Pricing page implementation (80% complete, launching Feb 15)
- Customer onboarding flow improvements

⚠️ At Risk / Blockers:
- Customer onboarding blocked (waiting on design feedback - following up today)
- API integration blocked (legal contract review - escalating)

📅 Next Week Focus:
- Complete and launch new pricing page (Q1 Goal 1)
- Customer churn analysis (Q1 Goal 2)
- Unblock onboarding and API integration work
```

---

### Step 4: Take Action (5 min)

**Review AI insights and**:

1. **Adjust your plan**: Move priorities based on AI recommendations
2. **Unblock items**: Take immediate action on blockers (send follow-up emails, escalate)
3. **Share status**: Post AI-generated update to team Slack/email
4. **Time-box next week**: Block calendar for top 2-3 priorities

**Template for calendar blocking**:

```
Monday-Wednesday: Pricing page (12 hours)
Thursday: Customer churn analysis (4 hours)
Friday: Unblock customer onboarding + API integration (4 hours)
```

---

### Step 5: Track ROI (5 min)

**Before AI** (baseline):
- Time spent on weekly review: _____ hours
- Feel prepared for next week: _____ (1-10 scale)
- Team clarity on priorities: _____ (1-10 scale)

**After AI** (Week 3-4):
- Time spent: _____ hours (target: 30 min)
- Feel prepared: _____ (target: 8+)
- Team clarity: _____ (target: 8+)

**ROI**:
- Time saved: 2 hours → 30 min = 1.5 hours/week
- Value: 1.5 hours × $100/hour = $150/week
- Cost: $20/month (Claude Pro)
- **Return**: 30x

---

## Option 2: Claude MCP Setup

For users with Claude Desktop/Code and Linear or Notion.

### Prerequisites

- Claude Desktop or Claude Code
- Linear MCP or Notion MCP installed (see [Claude MCP Guide](../integrations/01-claude-mcp-pm.md))
- 1 hour setup time

---

### Step 1: Install MCP (If Not Already Done)

**Linear MCP**:
```bash
npm install -g @anthropic/mcp-linear
```

Configure in `~/.claude.json`:
```json
{
  "mcpServers": {
    "linear": {
      "command": "mcp-linear",
      "env": {
        "LINEAR_API_KEY": "your-linear-api-key"
      }
    }
  }
}
```

**Notion MCP**: See [Claude MCP Guide](../integrations/01-claude-mcp-pm.md)

---

### Step 2: AI-Powered Weekly Review with MCP (15 min)

Every Friday afternoon, ask Claude:

**Prompt Template for Weekly Review**:

```
Run my weekly review for the week of [date range].

Please:
1. Query my Linear workspace for completed, in-progress, and backlog tasks
2. Analyze my progress (how many tasks, breakdown by type, patterns)
3. Identify blockers and at-risk items
4. Suggest priorities for next week based on:
   - Q1 Goals: [paste your goals]
   - Current date: [today's date]
   - Approaching deadlines
5. Generate a status update for my team

Provide insights and actionable recommendations.
```

**Example Claude MCP Response**:

```
I'll analyze your Linear workspace for this week.

[Claude queries Linear API]

📊 Weekly Progress (Jan 31 - Feb 7):

Completed: 12 tasks
- Bugs: 8 (67%)
- Features: 3 (25%)
- Chores: 1 (8%)

In Progress: 5 tasks
- "Pricing page implementation" (Priority: High, 80% done)
- "Customer onboarding improvements" (Priority: High, blocked)
- "API integration" (Priority: Medium, blocked)
- "Q1 roadmap planning" (Priority: Medium)
- "Mobile responsive fixes" (Priority: Low)

Overdue: 2 tasks
- "Client onboarding for Acme Corp" (3 days overdue)
- "Vendor API follow-up" (1 day overdue)

🔍 Patterns Detected:
1. Bug-heavy week (67% bugs vs 33% in previous week)
2. Two high-priority items blocked (customer onboarding, API integration)
3. Strong execution (12 tasks vs your 4-week average of 9)

⚠️ At Risk:
- Customer onboarding improvements: Blocked 4 days, waiting on design
- API integration: Blocked, legal review unclear timeline
- Pricing page: 80% done but due Feb 15 (7 days away)

📅 Recommended Priorities (Next Week):

Must Complete:
1. Pricing page implementation (Q1 Goal, due Feb 15) - 12h
2. Customer churn analysis (Q1 Goal) - 4h

Unblock:
3. Follow up on customer onboarding design feedback - 1h
4. Escalate API legal review - 1h

Defer:
- Internal admin dashboard (no deadline)

💬 Team Status Update:

Week of Feb 7:
✅ Fixed 8 critical bugs, shipped email integration
🚀 Pricing page 80% complete (launching Feb 15)
⚠️ Customer onboarding and API integration blocked (following up)
📅 Next week: Launch pricing, churn analysis, unblock dependencies
```

---

### Step 3: Drill Down with Follow-Up Questions

Claude MCP allows interactive exploration:

**Follow-up prompts**:

```
Q: "Which bugs took the longest to fix?"
Claude: [Queries Linear] "Payment processing bug took 8 hours (blocked on vendor), email verification bug took 2 hours."

Q: "Show me all tasks related to 'pricing' project"
Claude: [Queries Linear project] "Pricing project has 12 tasks: 3 completed, 1 in progress (pricing page), 8 in backlog"

Q: "What's blocking customer onboarding?"
Claude: [Queries task dependencies] "Blocked by 'Design mockups for onboarding flow' (assigned to Sarah, no updates in 4 days)"

Q: "Create a follow-up task to check with Sarah on onboarding designs"
Claude: [Creates Linear issue] "Created: 'Check with Sarah on onboarding design status' (Priority: High, due tomorrow)"
```

**Advantage of MCP**: Conversational, context-aware, can take action (create tasks, update status)

---

### Step 4: Automate Your Prompts (Optional)

Create a Claude "skill" (saved prompt) for weekly reviews:

**Save as**: `~/.claude/skills/weekly-review/SKILL.md`

```markdown
---
name: weekly-review
description: Run my weekly review and generate insights from Linear
---

# Weekly Review Skill

Run my weekly review for this week.

Steps:
1. Query Linear for tasks completed, in-progress, and backlog
2. Analyze progress and patterns
3. Identify blockers and at-risk items
4. Suggest next week priorities based on Q1 goals:
   - Launch new pricing page by Feb 15
   - Reduce customer churn by 20%
5. Generate team status update

Provide actionable insights.
```

**Usage**: Invoke with `/weekly-review` in Claude Desktop/Code

---

## Option 3: Automated Weekly Report Setup

Fully automated: AI sends you a weekly report every Friday.

### Prerequisites

- n8n installed (see [n8n SEA Guide](../../n8n-sea-guide/))
- PM tool API key (Linear, Notion, Asana, etc.)
- Claude API key or OpenAI API key
- Email or Slack for delivery

---

### Step 1: Build n8n Workflow (1-2 hours)

**Workflow structure**:

```
1. Schedule Trigger (Every Friday at 4pm)
    ↓
2. HTTP Request: Fetch completed tasks (last 7 days)
    ↓
3. HTTP Request: Fetch in-progress tasks
    ↓
4. HTTP Request: Fetch backlog tasks
    ↓
5. Code Node: Prepare data for AI
    ↓
6. Claude API: Analyze and generate report
    ↓
7. Email or Slack: Send weekly report
```

---

**Node 2-4: Fetch Data from PM Tool**

**Linear API** example:

```
Method: POST
URL: https://api.linear.app/graphql
Headers:
  - Authorization: Bearer YOUR_LINEAR_API_KEY
  - Content-Type: application/json

Body:
{
  "query": "query { issues(filter: { completedAt: { gte: \"2026-02-01\" }, assignee: { email: { eq: \"you@example.com\" } } }) { nodes { title, priority, state { name }, completedAt } } }"
}
```

Repeat for in-progress and backlog.

---

**Node 5: Code Node (Prepare for AI)**

```javascript
// Combine all data
const completed = $('Fetch Completed').all().map(item => item.json.data.issues.nodes);
const inProgress = $('Fetch In Progress').all().map(item => item.json.data.issues.nodes);
const backlog = $('Fetch Backlog').all().map(item => item.json.data.issues.nodes);

const summary = {
  weekOf: "Feb 7, 2026",
  completed: completed[0],
  inProgress: inProgress[0],
  backlog: backlog[0],
  q1Goals: "1) Launch new pricing page by Feb 15, 2) Reduce churn by 20%"
};

return [{ json: summary }];
```

---

**Node 6: Claude API (Generate Report)**

```
Method: POST
URL: https://api.anthropic.com/v1/messages
Headers:
  - x-api-key: YOUR_CLAUDE_API_KEY
  - anthropic-version: 2023-06-01
  - content-type: application/json

Body:
{
  "model": "claude-3-5-sonnet-20241022",
  "max_tokens": 4096,
  "messages": [{
    "role": "user",
    "content": "Analyze this weekly data and generate a comprehensive weekly review report.\n\nWeek of: {{$json.weekOf}}\nQ1 Goals: {{$json.q1Goals}}\n\nCompleted tasks:\n{{JSON.stringify($json.completed, null, 2)}}\n\nIn progress:\n{{JSON.stringify($json.inProgress, null, 2)}}\n\nBacklog:\n{{JSON.stringify($json.backlog, null, 2)}}\n\nProvide:\n1. Progress summary (task count, breakdown)\n2. Patterns and insights\n3. Blockers and at-risk items\n4. Recommended priorities for next week\n5. Team status update (concise format)\n\nBe specific and actionable."
  }]
}
```

---

**Node 7: Send Email**

```
To: you@example.com
Subject: Weekly Review - Week of {{$json.weekOf}}
Body:
{{$('Claude API').item.json.content[0].text}}
```

---

### Step 2: Test and Refine (30 min)

1. **Manual trigger**: Run workflow manually first
2. **Review output**: Is AI analysis accurate and helpful?
3. **Refine prompt**: Adjust Claude API prompt based on output quality
4. **Enable schedule**: Set to run every Friday at 4pm

---

### Step 3: Iterate Based on Feedback (Ongoing)

**First month**: Review every weekly report, note what's missing or unhelpful

**Common refinements**:
- Add more context to AI prompt (team structure, project names)
- Filter out low-priority tasks from analysis
- Include upcoming deadlines in recommendations
- Add "wins" section to celebrate team successes

---

## Advanced: Multi-User Team Reviews

For teams, generate reviews for each team member + team rollup.

### Setup in n8n

**Loop through team members**:

```javascript
// Team roster
const team = [
  { name: "John Smith", email: "john@example.com", role: "Product Manager" },
  { name: "Sarah Lee", email: "sarah@example.com", role: "Engineer" },
  { name: "Mike Johnson", email: "mike@example.com", role: "CEO" }
];

return team.map(member => ({ json: member }));
```

**For each member**:
1. Fetch their tasks from PM tool
2. Generate individual weekly report
3. Send to their email

**Team Rollup**:
1. Aggregate all team members' data
2. Generate team-wide report
3. Send to team lead or post in Slack

---

## Custom AI Prompts for Different Roles

### For Product Managers

```
Context:
- Role: Product Manager
- Focus: Roadmap progress, feature delivery, stakeholder updates

Analyze my week and provide:
1. Feature progress (% complete for each epic/feature)
2. Stakeholder commitments (what I promised vs delivered)
3. Cross-functional dependencies (what's blocked and why)
4. Roadmap risks (features at risk of missing deadline)
5. Next week priorities (feature work, stakeholder meetings, planning)

Format as a concise update suitable for executive review.
```

---

### For Engineers

```
Context:
- Role: Software Engineer
- Focus: Code velocity, bug fixing, technical debt

Analyze my week and provide:
1. Code output (PRs merged, lines of code, features vs bugs)
2. Quality metrics (bugs introduced vs fixed, test coverage)
3. Technical debt (time spent on debt vs new features)
4. Blockers (waiting on reviews, external dependencies)
5. Next week focus (feature work, refactoring, learning)

Highlight opportunities to improve velocity or reduce blockers.
```

---

### For CEOs/Founders

```
Context:
- Role: CEO
- Focus: Strategic initiatives, team unblocking, high-leverage work

Analyze my week and provide:
1. Strategic work vs reactive work (% breakdown)
2. High-leverage tasks completed (team unblocking, big decisions)
3. Low-leverage tasks that could be delegated
4. Team blockers I need to address
5. Next week: What are the 1-3 things only I can do?

Help me focus on high-leverage, strategic work.
```

---

## Measuring Success

### Baseline (Before AI)

**Week 1-2**: Track manually
- Time on weekly review: _____ hours
- Clarity on priorities (1-10): _____
- Team alignment on plan (1-10): _____
- Tasks completed vs planned: _____ %

**Typical baseline**:
- 2-3 hours on planning
- Clarity: 5-6/10 (somewhat clear)
- Alignment: 6/10 (team mostly aligned)
- Completion rate: 60-70%

---

### With AI (Week 3-8)

**Track same metrics**:
- Time: _____ hours (target: <30 min)
- Clarity: _____ /10 (target: 8+)
- Alignment: _____ /10 (target: 8+)
- Completion rate: _____ % (target: 75%+)

**Expected improvement**:
- 80% time reduction (2 hours → 30 min)
- Higher clarity (AI surfaces patterns you'd miss)
- Better alignment (data-driven priorities)
- Higher completion (focus on fewer, high-impact tasks)

---

### ROI Calculation

**Solo user**:
- Time saved: 1.5 hours/week × 52 weeks = 78 hours/year
- Value: 78 hours × $100/hour = $7,800/year
- Cost: $20/month × 12 = $240/year
- **ROI**: 32x return

**Team of 10**:
- Time saved: 1.5 hours/week/person × 10 = 15 hours/week
- Value: 15 hours × $75/hour × 52 weeks = $58,500/year
- Cost: $20/month × 10 × 12 = $2,400/year
- **ROI**: 24x return

---

## Common Mistakes

### Mistake 1: Analysis Paralysis

**Problem**: Spend 1 hour analyzing AI report, still not sure what to do

**Impact**: No time savings, just shifted from manual review to over-analyzing AI output

**Solution**: Set 30-min timer. AI gives recommendations → Pick top 3 priorities → Block calendar → Done.

---

### Mistake 2: Ignoring AI Insights

**Problem**: "AI says I should focus on churn, but I want to work on new features"

**Impact**: AI becomes useless if you ignore data-driven recommendations

**Solution**: If you disagree with AI, ask "Why did it recommend this?" Understand the reasoning, then decide.

---

### Mistake 3: Not Updating AI Context

**Problem**: AI doesn't know your Q1 goals changed

**Impact**: Recommendations based on outdated priorities

**Solution**: Update AI context quarterly (goals, team structure, key projects)

---

## Integration with Other AI Workflows

### Weekly Review + Meeting-to-Task Pipeline

**Combined workflow**:
1. All week: Meetings auto-create tasks (Meeting-to-Task)
2. Friday: AI reviews all tasks created this week (Weekly Review)
3. AI flags: "70% of tasks this week were reactive (from meetings). Consider blocking focus time for planned work."

**See**: [Meeting-to-Task Pipeline](03-meeting-to-task-pipeline.md)

---

### Weekly Review + AI Second Brain

**Combined workflow**:
1. AI reviews your completed tasks
2. AI prompts: "Task 'Customer feedback call with Acme' completed. Should I save key insights to your Second Brain?"
3. You confirm → AI extracts insights and saves to Notion/Obsidian

**See**: [AI Second Brain](02-ai-second-brain.md)

---

## Next Steps

### This Week

1. **Try Option 1** (manual prompts with Claude Pro)
2. **Run your first AI weekly review** this Friday
3. **Compare to previous manual review** (time, quality)
4. **Track ROI** (time saved)

### Next Month

1. **Upgrade to Option 2** (Claude MCP) if using Linear/Notion
2. **Refine AI prompts** based on what's helpful vs not
3. **Share AI-generated status** with team, get feedback
4. **Integrate with Meeting-to-Task** pipeline

### Month 3

1. **Automate with Option 3** (n8n) if high ROI proven
2. **Roll out to team** (if team reviews beneficial)
3. **Track team-wide metrics** (completion rates, alignment)
4. **Add advanced workflows** (OKR tracking, roadmap progress)

---

## Related Guides

- [Meeting-to-Task Pipeline](03-meeting-to-task-pipeline.md) - Auto-create tasks from meetings
- [AI Second Brain](02-ai-second-brain.md) - Where to store insights
- [AI Agents for PM](05-ai-agents-workflows.md) - Daily standups, priority assistant
- [Claude MCP for PM](../integrations/01-claude-mcp-pm.md) - Deep Linear/Notion integration

---

**Last Updated**: 2026-02-07
**Maintained by**: [MyEO AI](https://myeo.ai)
