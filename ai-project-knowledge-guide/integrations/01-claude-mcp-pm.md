# Claude MCP for Project Management: Deep Integration Guide

**Last Updated**: 2026-02-07
**Setup Time**: 1-2 hours
**Expected ROI**: Use Claude as your PM assistant instead of just a chatbot

This guide shows you how to set up Claude MCP (Model Context Protocol) to directly interact with your PM tools - creating tasks, querying status, and managing projects through natural language conversation.

---

## What is Claude MCP?

**Claude MCP (Model Context Protocol)** is a protocol that allows Claude to directly access and interact with external tools and services.

**For PM tools, this means**:
- **Before MCP**: "Claude, I need to create these tasks" → You manually copy-paste to Linear
- **After MCP**: "Claude, create these tasks in Linear" → Claude creates them directly

**Current MCP Support** (Feb 2026):
- ✅ **Linear** - Full support (issues, projects, cycles, comments)
- ✅ **Notion** - Full support (pages, databases, search)
- ✅ **GitHub** - Full support (issues, PRs, repositories)
- ❌ **Asana** - Not yet (API exists, no MCP connector)
- ❌ **ClickUp** - Not yet
- ❌ **Monday.com** - Not yet

**This guide covers**: Linear, Notion, and GitHub MCP setup

---

## Why Use Claude MCP for PM?

### Without MCP (Manual Workflow)

```
You describe task to Claude
    ↓
Claude drafts task description
    ↓
You copy Claude's output
    ↓
You open Linear/Notion
    ↓
You manually create task
    ↓
You paste description, set assignee, due date, priority
```

**Time**: 2-3 min per task

---

### With MCP (AI-Powered Workflow)

```
You: "Create a task for fixing the login bug John reported"
    ↓
Claude:
  - Queries Linear for project context
  - Creates issue with smart defaults
  - Assigns to appropriate person
  - Sets priority based on keywords ("bug" = high priority)
  - Links to related issues if found
```

**Time**: 10 seconds

**Time saved**: 2 min/task × 10 tasks/day = 20 min/day = 1.5 hours/week

---

## What Claude MCP Can Do

### Linear MCP

**Read**:
- List your issues (with filters)
- Search issues by text
- Get issue details
- List projects, cycles, teams
- Query issue history

**Write**:
- Create issues
- Update issues (status, assignee, priority, description)
- Add comments
- Create projects
- Link issues (dependencies)

**Smart Features**:
- Auto-assign based on team structure
- Infer priority from keywords ("urgent", "bug", "nice-to-have")
- Find duplicate issues before creating
- Suggest projects based on context

---

### Notion MCP

**Read**:
- Search pages by title or content
- List databases
- Query database items (with filters)
- Read page content
- Get page metadata

**Write**:
- Create pages
- Create database items
- Update page content
- Update properties
- Archive pages

**Smart Features**:
- Auto-link related pages
- Suggest tags based on content
- Format content from natural language
- Create templates

---

### GitHub MCP

**Read**:
- List repositories
- Search issues and PRs
- Get issue/PR details
- List commits, branches, tags
- Read file contents

**Write**:
- Create issues
- Comment on issues/PRs
- Create PRs
- Update issue labels
- Close/reopen issues

**Smart Features**:
- Auto-label issues based on content
- Find related issues/PRs
- Suggest reviewers
- Link commits to issues

---

## Prerequisites

**Required**:
- Claude Desktop (free) or Claude Code (free)
- API keys for your PM tools (Linear, Notion, or GitHub)
- Node.js installed (for MCP servers)

**Time**: 1-2 hours total setup

**NOT required**:
- You don't need Claude Pro subscription (works with free Claude Desktop)
- You don't need to write code
- You don't need a paid PM tool (Linear/Notion have free tiers)

---

## Setup: Linear MCP

### Step 1: Get Linear API Key (5 min)

1. Go to **Linear** → Settings → API
2. Click "Create Personal API Key"
3. Name it "Claude MCP"
4. Copy the key (starts with `lin_api_...`)

**Security note**: This key gives full access to your Linear workspace. Keep it secure, never share publicly.

---

### Step 2: Install Linear MCP (10 min)

**On macOS/Linux**:

```bash
# Install the MCP server globally
npm install -g @anthropic/mcp-linear
```

**On Windows**:

```powershell
npm install -g @anthropic/mcp-linear
```

**Verify installation**:

```bash
which mcp-linear
# Should output: /usr/local/bin/mcp-linear (or similar path)
```

---

### Step 3: Configure Claude (15 min)

**Locate Claude config file**:

- **macOS**: `~/Library/Application Support/Claude/claude.json`
- **Linux**: `~/.config/Claude/claude.json`
- **Windows**: `%APPDATA%\Claude\claude.json`

**If file doesn't exist**, create it:

```bash
# macOS/Linux
mkdir -p ~/Library/Application\ Support/Claude/
touch ~/Library/Application\ Support/Claude/claude.json

# Edit with your preferred editor
code ~/Library/Application\ Support/Claude/claude.json
```

**Add Linear MCP configuration**:

```json
{
  "mcpServers": {
    "linear": {
      "command": "mcp-linear",
      "env": {
        "LINEAR_API_KEY": "lin_api_YOUR_KEY_HERE"
      }
    }
  }
}
```

**Replace** `lin_api_YOUR_KEY_HERE` with your actual Linear API key from Step 1.

**Important**: The `claude.json` file must be valid JSON. Use a JSON validator if unsure.

---

### Step 4: Restart Claude (1 min)

1. **Quit Claude Desktop** completely (not just close window - quit application)
2. **Reopen Claude Desktop**
3. MCP servers load on startup

**Verify MCP is loaded**:

Ask Claude: "List my Linear issues"

If MCP is working, Claude will respond with actual issues from your Linear workspace.

If not working, Claude will say: "I don't have access to your Linear workspace. Please set up Linear MCP first."

---

### Step 5: Test Linear MCP (10 min)

**Test 1: Query Issues**

```
You: "List my open Linear issues"

Claude: [Queries Linear]
"You have 12 open issues:

High Priority:
- LIN-234: Fix payment processing bug (assigned to you)
- LIN-256: Customer onboarding improvements (assigned to Sarah)

Medium Priority:
- LIN-289: Update API documentation (assigned to you)
- LIN-301: Pricing page redesign (in progress)
..."
```

**Test 2: Create Issue**

```
You: "Create a Linear issue for fixing the mobile responsive layout on the pricing page"

Claude: "I'll create that issue for you."

[Claude creates issue in Linear]

Claude: "Created LIN-345: Fix mobile responsive layout on pricing page
- Status: To Do
- Priority: Medium
- Project: Pricing Redesign
- No assignee (you can assign it if needed)"
```

**Test 3: Update Issue**

```
You: "Assign LIN-345 to John and set priority to high"

Claude: "Updated LIN-345:
- Assigned to John Smith
- Priority changed to High"
```

**If all 3 tests work**: MCP is set up correctly!

---

## Setup: Notion MCP

### Step 1: Create Notion Integration (10 min)

1. Go to **Notion Settings** → Integrations
2. Click "Develop your own integrations"
3. Click "New integration"
4. Settings:
   - Name: "Claude MCP"
   - Associated workspace: Your workspace
   - Capabilities: Read content, Update content, Insert content
5. Click "Submit"
6. Copy the "Internal Integration Token" (starts with `secret_...`)

---

### Step 2: Share Databases with Integration (5 min)

**Important**: Notion integrations don't auto-access all pages. You must explicitly share databases.

For each database you want Claude to access:

1. Open the database in Notion
2. Click "..." (top right)
3. Click "Add connections"
4. Select "Claude MCP" integration
5. Click "Confirm"

**Databases to share** (recommended):
- Tasks database
- Projects database
- Meeting Notes database
- Any other databases Claude should access

---

### Step 3: Install Notion MCP (10 min)

```bash
npm install -g @anthropic/mcp-notion
```

**Configure in `claude.json`**:

```json
{
  "mcpServers": {
    "linear": {
      "command": "mcp-linear",
      "env": {
        "LINEAR_API_KEY": "lin_api_YOUR_KEY_HERE"
      }
    },
    "notion": {
      "command": "mcp-notion",
      "env": {
        "NOTION_API_KEY": "secret_YOUR_NOTION_KEY_HERE"
      }
    }
  }
}
```

**Replace** `secret_YOUR_NOTION_KEY_HERE` with your Notion integration token from Step 1.

---

### Step 4: Test Notion MCP (10 min)

**Test 1: Search Pages**

```
You: "Search my Notion for pages about pricing"

Claude: [Searches Notion]
"Found 3 pages:
1. Pricing Strategy v2 (last edited 2 days ago)
2. Competitor Pricing Analysis (last edited 1 week ago)
3. Q1 Pricing Roadmap (last edited 3 weeks ago)"
```

**Test 2: Create Page**

```
You: "Create a Notion page for documenting the Redis setup process"

Claude: [Creates page in Notion]
"Created page 'Redis Setup Process' in your Notion workspace.
Would you like me to add content to it?"
```

**Test 3: Query Database**

```
You: "List my open tasks in Notion"

Claude: [Queries your Tasks database]
"You have 8 open tasks:
- Finish pricing page (due Feb 15)
- Customer churn analysis (due Feb 20)
- API integration (blocked)
..."
```

---

## Setup: GitHub MCP

### Step 1: Create GitHub Personal Access Token (5 min)

1. Go to **GitHub** → Settings → Developer settings → Personal access tokens → Fine-grained tokens
2. Click "Generate new token"
3. Settings:
   - Token name: "Claude MCP"
   - Expiration: 90 days (or custom)
   - Repository access: All repositories (or select specific)
   - Permissions:
     - Issues: Read and write
     - Pull requests: Read and write
     - Contents: Read
     - Metadata: Read
4. Click "Generate token"
5. Copy the token (starts with `github_pat_...`)

**Security**: This token has broad access. Treat it like a password.

---

### Step 2: Install GitHub MCP (10 min)

```bash
npm install -g @anthropic/mcp-github
```

**Configure in `claude.json`**:

```json
{
  "mcpServers": {
    "linear": {
      "command": "mcp-linear",
      "env": {
        "LINEAR_API_KEY": "lin_api_YOUR_KEY_HERE"
      }
    },
    "notion": {
      "command": "mcp-notion",
      "env": {
        "NOTION_API_KEY": "secret_YOUR_NOTION_KEY_HERE"
      }
    },
    "github": {
      "command": "mcp-github",
      "env": {
        "GITHUB_TOKEN": "github_pat_YOUR_TOKEN_HERE"
      }
    }
  }
}
```

---

### Step 3: Test GitHub MCP (10 min)

**Test 1: List Issues**

```
You: "List open issues in my repo 'my-project'"

Claude: [Queries GitHub]
"You have 5 open issues in my-project:

Bugs:
- #12: Login page crashes on mobile Safari (opened 2 days ago)
- #15: Payment API returns 500 error (opened 1 week ago)

Features:
- #18: Add dark mode support (opened 3 weeks ago)
..."
```

**Test 2: Create Issue**

```
You: "Create a GitHub issue in my-project for adding email verification to signup"

Claude: [Creates issue]
"Created issue #23 in my-project:
Title: Add email verification to signup flow
Body: [Claude generates description based on context]
Labels: enhancement"
```

---

## Real-World Workflows with Claude MCP

### Workflow 1: Daily Standup with Claude

**Every morning**:

```
You: "What did I work on yesterday? Check Linear and GitHub"

Claude:
[Queries Linear for completed tasks]
[Queries GitHub for merged PRs]

"Yesterday (Feb 6):

Linear tasks completed:
- LIN-234: Fixed payment processing bug
- LIN-256: Updated API documentation

GitHub activity:
- Merged PR #45: Add Redis caching
- Opened PR #46: Update pricing page UI

Currently in progress:
- LIN-289: Pricing page implementation (80% done)
- PR #46: Waiting on review from Sarah

Blocked:
- LIN-301: API integration (waiting on vendor contract)

Suggestion: Focus on finishing pricing page today (due tomorrow)."
```

---

### Workflow 2: Meeting Notes → Tasks

**After meeting, paste notes to Claude**:

```
You: "Here are notes from today's product meeting:

- John will draft pricing proposal by Friday
- Sarah to review API docs by Thursday
- Mike to follow up with vendor about rate limits

Create Linear tasks for these action items"

Claude:
[Creates 3 Linear issues]

"Created:
1. LIN-350: Draft pricing proposal
   - Assigned to John
   - Due: Feb 14 (Friday)
   - Priority: High

2. LIN-351: Review API documentation for rate limits
   - Assigned to Sarah
   - Due: Feb 13 (Thursday)
   - Priority: High

3. LIN-352: Follow up with vendor about API rate limits
   - Assigned to Mike
   - Priority: Medium

All added to 'Pricing Redesign' project."
```

---

### Workflow 3: Weekly Review with Claude

```
You: "Run my weekly review. Show completed tasks, blockers, and suggest priorities for next week"

Claude:
[Queries Linear for completed, in-progress, and backlog]

"Weekly Review (Jan 31 - Feb 7):

📊 Progress:
- Completed: 12 tasks (67% bugs, 33% features)
- In progress: 5 tasks
- Overdue: 2 tasks

✅ Highlights:
- Fixed 8 critical bugs
- Shipped email integration
- Pricing page 80% complete

⚠️ At Risk:
- Pricing page due Feb 15 (7 days away, 20% remaining)
- Customer onboarding blocked 4 days (waiting on design)
- API integration blocked (legal review)

📅 Next Week Priorities:
1. Complete pricing page (Q1 goal, due soon)
2. Customer churn analysis (Q1 goal)
3. Unblock customer onboarding and API integration

Recommendation: Dedicate 70% of time to pricing page, 30% to unblocking dependencies."
```

---

### Workflow 4: Bug Triage with Claude

```
You: "List all open bugs in Linear sorted by priority"

Claude:
[Queries Linear]

"Open bugs (12 total):

🔥 Critical (fix today):
- LIN-401: Payment API returns 500 for Stripe webhook
- LIN-405: User data exposed in error logs

⚠️ High (fix this week):
- LIN-412: Mobile app crashes on signup
- LIN-420: Email notifications not sending

Medium (next week):
- LIN-425: Profile image upload slow
..."

You: "Create a GitHub issue for the payment API bug and link it to LIN-401"

Claude:
[Creates GitHub issue]
[Adds comment to Linear issue with GitHub link]

"Created GitHub issue #67 for the payment API bug.
Updated LIN-401 with link to GitHub issue."
```

---

### Workflow 5: Project Planning with Claude

```
You: "I want to launch a new pricing page by Feb 15. Break this down into tasks and create them in Linear"

Claude:
[Analyzes current Linear projects and team structure]

"I'll break down the pricing page project. Based on your team:

Phase 1: Design (2 days)
- Research competitors (2h)
- Define pricing tiers (3h)
- Create Figma mockups (5h)

Phase 2: Implementation (4 days)
- Set up pricing database (3h)
- Build pricing page UI (8h)
- Integrate Stripe (6h)
- Write tests (4h)

Phase 3: Launch (1 day)
- QA on staging (2h)
- Deploy to production (1h)

Total: 7 days, 34 hours

Should I create these 9 tasks in Linear with:
- Staggered due dates (Feb 8-15)
- Dependencies linked
- Assigned to appropriate team members
- Grouped in 'Pricing Redesign' project?"

You: "Yes, create them"

Claude: [Creates 9 Linear issues with dependencies, assignments, due dates]

"Created 9 tasks. First task 'Research competitor pricing' is assigned to you, due Feb 8."
```

---

## Advanced: Custom Claude Skills for PM

Create reusable skills for common PM workflows.

### Skill: Sprint Planning

**File**: `~/.claude/skills/sprint-planning/SKILL.md`

```markdown
---
name: sprint-planning
description: Help plan the next sprint by analyzing backlog and team capacity
---

# Sprint Planning Skill

When the user says "plan next sprint" or "sprint planning", help them plan.

Steps:
1. Query Linear for:
   - Current sprint status (what's in progress, what's done)
   - Backlog items (ordered by priority)
   - Team members and their capacity
2. Analyze:
   - Velocity from last sprint (how many points/tasks completed)
   - Upcoming deadlines
   - Team availability (account for PTO, meetings)
3. Recommend:
   - How many tasks to pull into next sprint
   - Which tasks to prioritize (based on goals, dependencies)
   - Suggested assignments
4. Offer to create sprint and add tasks

Output:
- Current sprint summary
- Recommended tasks for next sprint
- Estimated capacity vs workload
```

**Usage**: "Claude, plan next sprint"

---

### Skill: Bug Report

**File**: `~/.claude/skills/bug-report/SKILL.md`

```markdown
---
name: bug-report
description: Create well-formatted bug reports from casual descriptions
---

# Bug Report Skill

When user describes a bug casually, create a structured bug report.

Template:
- Summary (one-line description)
- Steps to Reproduce
- Expected Behavior
- Actual Behavior
- Environment (browser, OS, version)
- Priority (critical, high, medium, low)
- Labels (bug, regression, mobile, etc.)

Ask clarifying questions if needed, then create issue in Linear/GitHub.
```

**Usage**: "The login page is broken on mobile" → Claude asks questions → Creates detailed bug report

---

## Troubleshooting

### Issue: "I don't have access to Linear/Notion"

**Cause**: MCP not loaded or API key invalid

**Debug**:
1. Check `claude.json` exists and is valid JSON
2. Verify API key is correct (copy-paste again)
3. Restart Claude Desktop (fully quit and reopen)
4. Check console logs (Help → Developer Tools)

**Fix**: Double-check API key, ensure `claude.json` is in correct location

---

### Issue: "Created task but can't find it in Linear"

**Cause**: Task created in wrong workspace or project

**Debug**:
1. Ask Claude: "Show me the last task you created" (provides URL)
2. Click URL to see where it went
3. Check if you have multiple Linear workspaces

**Fix**: Specify project/workspace when creating: "Create task in 'Pricing' project"

---

### Issue: Notion MCP can't access database

**Cause**: Database not shared with Notion integration

**Fix**:
1. Go to Notion database
2. Click "..." → "Add connections"
3. Select "Claude MCP" integration
4. Try again

---

### Issue: MCP server crashes

**Cause**: Outdated MCP server or Node.js version

**Fix**:
1. Update Node.js to latest LTS version
2. Update MCP server: `npm update -g @anthropic/mcp-linear`
3. Restart Claude

---

## Security Best Practices

### API Key Security

**Do**:
- Store API keys in `claude.json` (not committed to git)
- Use different API keys for dev vs production
- Rotate keys every 90 days
- Revoke immediately if leaked

**Don't**:
- Share API keys in Slack, email, or screenshots
- Commit `claude.json` to git repositories
- Use same key across multiple services

---

### Principle of Least Privilege

**Linear**: Create API key with read-only access if you only need to query (not create/update)

**Notion**: Only share necessary databases with integration (not your entire workspace)

**GitHub**: Use fine-grained tokens with minimal permissions (not classic tokens with full repo access)

---

## Cost Considerations

### Claude MCP Cost

**MCP itself**: Free (open protocol)

**Claude Desktop/Code**: Free (no subscription needed)

**API usage**: MCP uses Claude's API under your Claude Desktop/Code account
- If you have Claude Pro ($20/month): Unlimited MCP usage included
- If you have free Claude: Limited to free tier API limits

**Recommendation**: Claude Pro for heavy MCP usage (worth it if >50 MCP queries/day)

---

### PM Tool API Costs

**Linear**: Free (API included in free and paid plans)

**Notion**: Free (API included)

**GitHub**: Free (API included)

**Total cost**: $0-20/month (Claude Pro optional)

---

## Integration with Other Workflows

### MCP + Meeting-to-Task Pipeline

**Combined workflow**:
1. Meeting ends → n8n creates tasks in Linear (automated)
2. You review tasks with Claude: "Show me tasks created from today's meeting"
3. Claude queries Linear, shows tasks
4. You refine: "Update the pricing task to be high priority and assign to John"

**See**: [Meeting-to-Task Pipeline](../guides/03-meeting-to-task-pipeline.md)

---

### MCP + AI Weekly Review

**Combined workflow**:
1. Friday afternoon: "Claude, run my weekly review"
2. Claude queries Linear for completed, in-progress, backlog
3. Generates insights and recommendations
4. You ask follow-ups: "Why is customer onboarding at risk?"
5. Claude drills down with more Linear queries

**See**: [AI Weekly Review](../guides/04-ai-weekly-review.md)

---

## Next Steps

### This Week

1. **Set up one MCP** (start with your primary PM tool: Linear or Notion)
2. **Test basic queries** ("List my tasks")
3. **Create one task via Claude** to verify write access
4. **Track time saved** on manual task creation

### Next Month

1. **Add second MCP** (e.g., GitHub if you use Linear + GitHub)
2. **Create Claude skills** for common workflows (bug reports, sprint planning)
3. **Integrate with other AI workflows** (Meeting-to-Task, Weekly Review)
4. **Train team** on Claude MCP if multi-user setup

### Month 3

1. **Advanced workflows** (multi-tool queries, complex task creation)
2. **Automate routine PM tasks** with Claude skills
3. **Measure ROI** (time saved vs previous manual workflows)
4. **Expand to team** if proven valuable

---

## Related Guides

- [AI Agents for PM](../guides/05-ai-agents-workflows.md) - Build autonomous PM agents with MCP
- [Meeting-to-Task Pipeline](../guides/03-meeting-to-task-pipeline.md) - Combine MCP with automation
- [AI Weekly Review](../guides/04-ai-weekly-review.md) - Use MCP for weekly planning
- [AI Second Brain](../guides/02-ai-second-brain.md) - Combine PM with knowledge management

---

## Official Documentation

- [Claude MCP Overview](https://modelcontextprotocol.io)
- [Linear MCP](https://github.com/anthropics/anthropic-quickstarts/tree/main/mcp-linear)
- [Notion MCP](https://github.com/anthropics/anthropic-quickstarts/tree/main/mcp-notion)
- [GitHub MCP](https://github.com/anthropics/anthropic-quickstarts/tree/main/mcp-github)

---

**Last Updated**: 2026-02-07
**Maintained by**: [MyEO AI](https://myeo.ai)
