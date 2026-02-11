# Meeting-to-Task Pipeline: AI-Powered Action Item Automation

**Last Updated**: 2026-02-07
**Setup Time**: 2-4 hours
**Expected ROI**: Save 3-5 hours/week on meeting follow-up

This guide shows you how to automate the most painful part of meetings: turning discussions into actionable tasks.

---

## The Problem: The Action Item Black Hole

**Typical meeting workflow**:
1. ✅ Meeting happens (1 hour)
2. ✅ Someone takes notes (20 minutes during meeting)
3. ❌ Notes sit in Google Doc
4. ❌ Action items never become tasks
5. ❌ Next meeting: "Wait, who was supposed to do that?"

**The pain**:
- 30-60 minutes/day manually creating tasks from meetings/emails
- Action items fall through the cracks
- Unclear who's responsible for what
- Meetings feel unproductive because nothing gets done

**The cost**: 5-10 hours/week across a 10-person team

---

## The AI Solution: Automated Meeting-to-Task Pipeline

```
Meeting Recording (Zoom/Google Meet/Teams)
    ↓
AI Transcription (Otter.ai, Fireflies, Fathom)
  - Identifies speakers
  - Timestamps key moments
  - Detects questions and decisions
    ↓
AI Extraction (Claude/GPT-4)
  - Decisions made: "We're going with Option B for pricing"
  - Action items: "John will draft proposal by Friday"
  - Follow-ups: "Need to clarify API rate limits with vendor"
    ↓
Auto-Create Tasks (Linear/Notion/Asana via n8n or native)
  - Assigned to right person (John)
  - Due dates set (Friday)
  - Context linked (meeting notes + timestamp)
  - Priority inferred from urgency
    ↓
Task appears in PM tool within 5 minutes of meeting ending
```

**Time saved**: 30-45 minutes of manual task creation → 5 minutes reviewing auto-generated tasks

---

## Implementation Options: Choose Your Path

### Option 1: No-Code (Easiest, Good Enough for Most)

**Tools**: Otter.ai Pro ($20/month) or Fireflies.ai ($10/month)

**What you get**:
- Automatic meeting transcription
- Basic action item detection
- Manual copy-paste to PM tool (or email)

**Pros**:
- Set up in 15 minutes
- No technical skills required
- Works immediately

**Cons**:
- AI extraction is basic (misses context)
- Still requires manual review
- No automatic task creation in PM tool

**Best for**: Solo users or small teams (<5 people) wanting quick wins

**Setup**: [Jump to No-Code Setup](#option-1-no-code-setup-otter-ai-or-fireflies)

---

### Option 2: Low-Code (Recommended, Best ROI)

**Tools**: n8n (free) + Claude/OpenAI API ($5-10/month) + Your PM tool

**What you get**:
- Automatic transcription (via Otter.ai/Fireflies webhook)
- Custom AI extraction with your prompts
- Auto-create tasks in Linear/Notion/Asana
- Rich context (meeting notes, decisions, questions)

**Pros**:
- Fully automated end-to-end
- Customize AI extraction for your needs
- Integrates with any PM tool
- One-time setup, runs forever

**Cons**:
- Requires 3-4 hours setup
- Need to learn n8n basics
- Maintain API credentials

**Best for**: Teams 5-20 people, intermediate technical comfort

**Setup**: [Jump to Low-Code Setup](#option-2-low-code-setup-n8n--ai)

---

### Option 3: Advanced (Claude MCP)

**Tools**: Claude Desktop/Code with MCP + Linear/Notion MCP

**What you get**:
- Natural language task creation via Claude
- Deep integration with PM tool
- Context-aware (Claude knows your backlog)
- Most flexible and powerful

**Pros**:
- Chat with Claude to create tasks: "Add the pricing discussion items from today's meeting"
- Claude can query your PM tool for context
- Best for complex projects with dependencies

**Cons**:
- Requires Claude Desktop/Code (not just web)
- Only works with Linear, Notion, GitHub (MCP limitation)
- More manual (not fully automated like Option 2)

**Best for**: Power users, dev teams, companies using Linear/Notion

**Setup**: [Jump to Advanced Setup](#option-3-advanced-setup-claude-mcp)

---

## Quick Comparison

| Feature | No-Code (Otter.ai) | Low-Code (n8n) | Advanced (Claude MCP) |
|---------|-------------------|----------------|----------------------|
| **Setup Time** | 15 min | 3-4 hours | 1-2 hours |
| **Monthly Cost** | $20 | $10-20 | $20 (Claude Pro) |
| **Automation Level** | Manual copy-paste | Fully automated | Semi-automated |
| **PM Tool Support** | Any (manual) | Any (via n8n) | Linear, Notion, GitHub only |
| **Customization** | Low | High | Highest |
| **Technical Skill** | None | Basic (can follow tutorial) | Intermediate |
| **Best For** | Solo/small teams | Teams 5-20 | Power users, dev teams |

**Recommendation**: Start with Option 1 (Otter.ai) this week, upgrade to Option 2 (n8n) after seeing value.

---

## Option 1: No-Code Setup (Otter.ai or Fireflies)

### Step 1: Choose Transcription Tool (15 min)

**Otter.ai Pro** ($20/month):
- Best transcription accuracy
- Speaker identification
- Mobile app (record in-person meetings)
- Action items feature built-in
- **Best for**: General meetings, all-in-one solution

**Fireflies.ai** ($10/month):
- Good transcription
- More integrations (Slack, Notion, Asana)
- Lower cost
- **Best for**: Budget-conscious, already use Slack/Notion

**Fathom** (Free):
- Free transcription for Zoom
- Basic action items
- Limited features
- **Best for**: $0 budget, Zoom-only

**Recommendation**: Otter.ai Pro if budget allows, Fireflies.ai if budget-conscious

---

### Step 2: Set Up Otter.ai (30 min)

**2.1 Sign up and connect calendar**:
1. Go to otter.ai
2. Sign up with Google account
3. Connect Google Calendar or Outlook
4. Enable "Auto-join meetings" in settings

**2.2 Configure meeting settings**:
- Go to Settings → Meetings
- Enable: "Auto-join scheduled meetings"
- Enable: "Record and transcribe"
- Enable: "Identify speakers" (if known participants)

**2.3 Test with a meeting**:
1. Schedule test meeting (Google Meet or Zoom)
2. Otter bot joins automatically
3. After meeting, check transcript in Otter app

**Verification**: You should see meeting transcript with speaker labels within 5 minutes of meeting ending.

---

### Step 3: Extract Action Items (Manual for Now)

**After each meeting**:

1. **Open Otter.ai transcript**
2. **Review "Action Items" tab** - Otter auto-detects some action items
3. **Manual cleanup** - Add missed items, fix misidentifications
4. **Copy to PM tool** - Create tasks in Linear/Notion/Asana manually

**Example workflow** (5 min/meeting):

**Otter transcript snippet**:
```
John: I'll draft the pricing proposal and send it to the team by Friday.
Sarah: Sounds good. I'll review the API documentation and get back to you by Thursday.
Mike: Perfect. Can someone follow up with the vendor about rate limits?
```

**Action items detected by Otter**:
- [ ] John - Draft pricing proposal (by Friday)
- [ ] Sarah - Review API documentation (by Thursday)
- [ ] Someone - Follow up with vendor about rate limits

**You manually create in Linear/Notion**:
1. Create task "Draft pricing proposal" → Assign to John → Due Friday → Link to meeting notes
2. Create task "Review API documentation" → Assign to Sarah → Due Thursday → Link to meeting notes
3. Create task "Follow up with vendor re: API rate limits" → Assign to Mike (since he asked) → Due this week

**Time**: 5 minutes vs 30 minutes writing from memory

---

### Step 4: Weekly Review (10 min)

**Every Friday**:
1. Review Otter.ai "Action Items" page
2. Check if any items weren't turned into tasks
3. Add any stragglers to PM tool

**Metrics to track**:
- How many meetings per week?
- How many action items per meeting?
- How long does manual task creation take?

**When to upgrade**: If you're spending >30 minutes/week on manual task creation, upgrade to Option 2 (automated)

---

## Option 2: Low-Code Setup (n8n + AI)

This is the **recommended approach** for most teams. Fully automated, works with any PM tool, one-time setup.

### Architecture Overview

```
Meeting ends
    ↓
Otter.ai/Fireflies webhook → n8n workflow
    ↓
n8n: Fetch transcript via API
    ↓
n8n: Send to Claude/OpenAI with custom prompt
    ↓
Claude: Extract structured action items
  Output: [
    {
      "task": "Draft pricing proposal",
      "assignee": "John",
      "due_date": "2026-02-14",
      "priority": "high",
      "context": "Meeting discussed Option B for pricing tier"
    },
    {...}
  ]
    ↓
n8n: Create tasks in Linear/Notion/Asana
    ↓
Notification: Slack message "3 new tasks from Product Meeting"
```

**Total automation time**: ~2 minutes after meeting ends

---

### Prerequisites (1 hour)

**1. n8n Setup**:
- Install n8n (see [n8n SEA Guide](../../n8n-sea-guide/))
- Self-hosted (free) or n8n Cloud ($20/month)
- **Recommendation**: Self-host on free Railway tier

**2. API Keys**:
- Otter.ai API key (or Fireflies API key)
- Claude API key ($5-10/month) or OpenAI API key ($5-10/month)
- Your PM tool API key (Linear, Notion, Asana, etc.)

**3. Knowledge**:
- Basic n8n workflow creation (10 min tutorial)
- API key setup in n8n credentials

---

### Step 1: Set Up Transcription Webhooks (30 min)

**Option A: Otter.ai Webhook**

Otter.ai Pro doesn't have native webhooks, so we'll poll the API:

1. **Get Otter.ai API key**: Settings → Integrations → API
2. **In n8n**: Create new workflow
3. **Add "Schedule Trigger" node**: Run every 5 minutes
4. **Add "HTTP Request" node**:
   ```
   Method: GET
   URL: https://otter.ai/forward/api/v1/speeches
   Authentication: Bearer Token (your API key)
   ```
5. **Filter**: Only process meetings from last 10 minutes

**Option B: Fireflies.ai Webhook** (Easier)

Fireflies has native webhooks:

1. **Fireflies settings**: Integrations → Webhooks
2. **Add webhook URL**: Your n8n webhook URL
3. **Events**: Select "Meeting transcription completed"
4. **In n8n**: Add "Webhook" node, copy URL to Fireflies

**Recommendation**: Use Fireflies if you're setting this up from scratch (easier webhook support)

---

### Step 2: Build AI Extraction Workflow (1 hour)

**n8n workflow structure**:

```
1. Webhook/Schedule Trigger
    ↓
2. HTTP Request: Fetch transcript
    ↓
3. Code Node: Prepare data for AI
    ↓
4. OpenAI/Claude Node: Extract action items
    ↓
5. Split Out: Separate each action item
    ↓
6. PM Tool Node: Create task (Linear/Notion/Asana)
    ↓
7. Slack Notification: "3 tasks created from Product Meeting"
```

**Detailed setup**:

**Node 3: Code Node (Prepare Transcript)**

```javascript
// Extract meeting title and transcript
const meetingTitle = $input.item.json.title;
const transcript = $input.item.json.transcript;
const participants = $input.item.json.participants || [];

// Format for AI
return [{
  json: {
    meetingTitle,
    transcript,
    participants,
    date: new Date().toISOString()
  }
}];
```

**Node 4: Claude API Node (Extract Action Items)**

Configure HTTP Request node:
```
Method: POST
URL: https://api.anthropic.com/v1/messages
Headers:
  - x-api-key: YOUR_CLAUDE_API_KEY
  - anthropic-version: 2023-06-01
  - content-type: application/json

Body (JSON):
{
  "model": "claude-3-5-sonnet-20241022",
  "max_tokens": 4096,
  "messages": [{
    "role": "user",
    "content": "Extract action items from this meeting transcript. For each action item, provide: task description, assignee (if mentioned), due date (if mentioned or infer from urgency), priority (high/medium/low), and relevant context.\n\nMeeting: {{$json.meetingTitle}}\n\nTranscript:\n{{$json.transcript}}\n\nOutput as JSON array:\n[\n  {\n    \"task\": \"string\",\n    \"assignee\": \"string or null\",\n    \"due_date\": \"YYYY-MM-DD or null\",\n    \"priority\": \"high|medium|low\",\n    \"context\": \"string\"\n  }\n]"
  }]
}
```

**Node 5: Code Node (Parse AI Response)**

```javascript
// Parse Claude's response
const response = JSON.parse($input.item.json.content[0].text);

// Validate and clean up
const actionItems = response.map(item => ({
  task: item.task,
  assignee: item.assignee || "Unassigned",
  dueDate: item.due_date || null,
  priority: item.priority || "medium",
  context: item.context || "",
  meetingTitle: $('Code').item.json.meetingTitle,
  meetingDate: $('Code').item.json.date
}));

return actionItems.map(item => ({ json: item }));
```

**Node 6: Linear/Notion Node (Create Tasks)**

For **Linear**:
```
Operation: Create Issue
Project: {{$json.project || "Inbox"}}
Title: {{$json.task}}
Description: Context: {{$json.context}}\n\nFrom meeting: {{$json.meetingTitle}}
Assignee: {{$json.assignee}}
Due Date: {{$json.dueDate}}
Priority: {{$json.priority}}
```

For **Notion**:
```
Operation: Create Database Item
Database: Your Tasks Database ID
Properties:
  - Name: {{$json.task}}
  - Assignee: {{$json.assignee}}
  - Due Date: {{$json.dueDate}}
  - Priority: {{$json.priority}}
  - Meeting: {{$json.meetingTitle}}
  - Notes: Context: {{$json.context}}
```

**Node 7: Slack Notification**

```
Channel: #team-updates
Message:
📋 *{{$('Split Out').itemsLength}} new tasks from {{$('Code').first().json.meetingTitle}}*

Created in [Linear/Notion] - check your PM tool!
```

---

### Step 3: Test the Workflow (30 min)

**3.1 Manual test**:
1. In n8n, click "Execute Workflow"
2. Use sample transcript (paste a real meeting transcript)
3. Verify AI extraction is accurate
4. Check tasks appear in PM tool

**Sample test transcript**:

```
Product Meeting - Feb 7, 2026

John: Alright team, let's discuss the pricing changes. I think we should go with the three-tier model.

Sarah: Agreed. Can you draft a proposal by end of week?

John: Sure, I'll have it ready by Friday.

Mike: Great. Sarah, can you review the API documentation before we finalize? We need to understand rate limits.

Sarah: No problem, I'll review it by Thursday.

Mike: Perfect. Also, someone needs to follow up with the vendor about those rate limit questions.

John: I can do that. I'll reach out tomorrow.
```

**Expected AI output**:

```json
[
  {
    "task": "Draft three-tier pricing proposal",
    "assignee": "John",
    "due_date": "2026-02-14",
    "priority": "high",
    "context": "Team agreed on three-tier pricing model"
  },
  {
    "task": "Review API documentation (rate limits)",
    "assignee": "Sarah",
    "due_date": "2026-02-13",
    "priority": "high",
    "context": "Need to understand rate limits before finalizing pricing"
  },
  {
    "task": "Follow up with vendor about API rate limits",
    "assignee": "John",
    "due_date": "2026-02-08",
    "priority": "medium",
    "context": "Questions about rate limits for API usage"
  }
]
```

**3.2 Live test**:
1. Schedule a real meeting
2. Let Otter.ai/Fireflies record it
3. Verify webhook triggers n8n workflow
4. Check tasks appear in PM tool within 5 minutes

---

### Step 4: Refine AI Extraction (30 min)

Your first AI extraction won't be perfect. Refine the prompt:

**Common issues and fixes**:

**Issue 1: AI misses action items**

**Original prompt**: "Extract action items from this transcript"

**Better prompt**: "Extract ALL commitments, decisions, and follow-ups from this meeting. Include even vague statements like 'we should look into that' as potential action items with low priority."

---

**Issue 2: AI assigns tasks to wrong person**

**Fix**: Provide participant context in prompt:

```
Meeting participants:
- John Smith (Product Manager)
- Sarah Lee (Engineer)
- Mike Johnson (CEO)

When extracting assignees, use these names. If unclear who should do the task, assign to the person who raised the topic.
```

---

**Issue 3: AI can't infer due dates**

**Fix**: Add date context and urgency rules:

```
Today's date: {{$now}}

Due date rules:
- "by end of week" → Friday of current week
- "next week" → Next Friday
- "ASAP" or "urgent" → Tomorrow
- "this week" → This Friday
- If no timeframe mentioned, set to null (don't guess)
```

---

**Issue 4: Too many low-value tasks created**

**Fix**: Add filtering criteria:

```
Only extract action items that:
1. Have a clear owner (or can be reasonably inferred)
2. Are specific and actionable (not "think about X")
3. Were explicitly committed to in the meeting

Do NOT extract:
- Vague ideas without commitment ("maybe we should...")
- General discussion points
- Questions that were answered in the meeting
```

---

### Step 5: Automate and Monitor (15 min)

**5.1 Enable workflow**:
- In n8n, toggle "Active" on workflow
- Workflow now runs automatically after every meeting

**5.2 Set up error notifications**:
- Add "Error Trigger" node in n8n
- Send to Slack/email if workflow fails
- Monitors: "Meeting transcribed but no tasks created"

**5.3 Weekly metrics** (track in spreadsheet):
- Meetings per week: _____
- Action items extracted: _____
- False positives (wrong tasks): _____
- False negatives (missed tasks): _____
- Time saved: _____ hours

**Target metrics after 2 weeks**:
- 90%+ accuracy on action items
- <5% false positives
- 3-5 hours/week saved on manual task creation

---

## Option 3: Advanced Setup (Claude MCP)

For power users and dev teams using Linear or Notion.

### What is Claude MCP?

Claude MCP (Model Context Protocol) allows Claude Desktop/Code to directly interact with your PM tool.

**What this enables**:
- Chat with Claude: "Create tasks from today's product meeting"
- Claude queries your PM tool: "What tasks are overdue?"
- Context-aware: "Add this to the pricing project in Linear"
- Natural language: No need to structure data

**vs Option 2 (n8n)**:
- Option 2: Fully automated, zero-touch
- Option 3: Semi-automated, more control and flexibility
- **Best combined**: Use Option 2 for routine meetings, Option 3 for complex projects

---

### Prerequisites

- Claude Desktop or Claude Code (not Claude web)
- Linear, Notion, or GitHub account
- 1-2 hours for setup

---

### Step 1: Install Claude MCP (30 min)

**For Linear**:

1. **Install Linear MCP**:
   ```bash
   npm install -g @anthropic/mcp-linear
   ```

2. **Get Linear API key**: Linear Settings → API → Create Personal API Key

3. **Configure in Claude**:
   Edit `~/.claude.json` (or `~/Library/Application Support/Claude/claude.json` on Mac):
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

4. **Restart Claude Desktop/Code**

**For Notion**:

1. **Install Notion MCP**:
   ```bash
   npm install -g @anthropic/mcp-notion
   ```

2. **Get Notion integration key**: Notion Settings → Integrations → Create Internal Integration

3. **Share databases with integration**: For each Notion database (Tasks, Projects), click Share → Add your integration

4. **Configure in Claude** (`~/.claude.json`):
   ```json
   {
     "mcpServers": {
       "notion": {
         "command": "mcp-notion",
         "env": {
           "NOTION_API_KEY": "your-notion-api-key"
         }
       }
     }
   }
   ```

5. **Restart Claude**

**Verification**: Ask Claude "List my Linear issues" or "Search my Notion tasks database". If it works, MCP is set up correctly.

---

### Step 2: Create Tasks from Meeting Notes (5 min/meeting)

**Workflow**:

1. **Meeting ends** → You have notes (Otter.ai transcript or manual notes)

2. **Copy relevant excerpt to Claude**:
   ```
   From today's product meeting:

   John: I'll draft the pricing proposal and send it to the team by Friday.
   Sarah: Sounds good. I'll review the API documentation and get back to you by Thursday.
   Mike: Perfect. Can someone follow up with the vendor about rate limits?
   ```

3. **Ask Claude**:
   ```
   Create Linear issues from these action items. Set appropriate due dates and priorities.
   ```

4. **Claude responds**:
   ```
   I'll create these Linear issues:

   1. "Draft pricing proposal"
      - Assignee: John
      - Due: Feb 14, 2026 (Friday)
      - Priority: High
      - Created ✓

   2. "Review API documentation (rate limits)"
      - Assignee: Sarah
      - Due: Feb 13, 2026 (Thursday)
      - Priority: High
      - Created ✓

   3. "Follow up with vendor about API rate limits"
      - Assignee: Mike (you mentioned someone should do this)
      - Priority: Medium
      - Created ✓

   All issues created in your Linear Inbox. Would you like me to add them to a specific project?
   ```

**Time**: 1 minute copying notes + Claude creates tasks instantly

---

### Step 3: Advanced Claude MCP Workflows

**Workflow 1: Context-Aware Task Creation**

```
You: "Add these action items to the Pricing Redesign project in Linear"

Claude: [Queries Linear for "Pricing Redesign" project]
Claude: [Creates issues and assigns to that project]
Claude: "Added 3 issues to Pricing Redesign project (PRJ-24)"
```

**Workflow 2: Backlog Grooming with Claude**

```
You: "What tasks from today's meeting should be prioritized?"

Claude: [Analyzes your existing Linear backlog]
Claude: "Based on your current sprint (8 issues in progress, 2 overdue), I recommend:
- High priority: 'Draft pricing proposal' (blocks other work)
- Medium priority: 'Review API docs' (dependency for pricing)
- Low priority: 'Vendor follow-up' (can wait until next week)"
```

**Workflow 3: Meeting Prep**

```
You: "What did we decide about pricing in the last 3 meetings?"

Claude: [Searches Linear issues and Notion pages with "pricing" tag]
Claude: "Here's what was decided:
- Jan 28: Agreed on 3-tier model (Issue LIN-234)
- Feb 1: Pricing range $20-50/month (Issue LIN-256)
- Feb 7: John to draft proposal by Friday (Issue LIN-289)"
```

---

### Step 4: Combine with n8n for Full Automation

**Best of both worlds**: Use Option 2 (n8n) for routine meetings, Option 3 (Claude MCP) for complex projects

**n8n workflow** (automated):
- Daily standups → Auto-create tasks in Linear
- Weekly team syncs → Auto-create tasks
- Client calls → Auto-create tasks

**Claude MCP** (manual, high-value):
- Strategic planning meetings → Chat with Claude to create project structure
- Brainstorming sessions → Claude helps organize ideas into tasks with dependencies
- Quarterly reviews → Claude analyzes what was completed vs planned

**Workflow**:
1. n8n handles 80% of routine meetings
2. You use Claude MCP for the 20% that need deeper context

---

## Measuring Success

### Week 1-2: Baseline (Before AI)

**Track manually**:
- Time spent creating tasks after meetings: _____ hours/week
- Number of action items that fall through cracks: _____
- Meetings per week: _____

**Typical baseline**:
- 5-10 hours/week on manual task creation
- 20-30% of action items never become tasks
- 10-15 meetings/week

---

### Week 3-4: With AI Pipeline

**Track same metrics**:
- Time spent reviewing auto-created tasks: _____ hours/week (should be <1 hour)
- False positives (wrong tasks created): _____
- False negatives (missed action items): _____

**Target results**:
- 90% reduction in time (10 hours → 1 hour)
- <5% false positives after refinement
- <10% false negatives

**ROI Calculation**:
- Time saved: 9 hours/week
- Value: 9 hours × $75/hour = $675/week
- Cost: $30/month (tools)
- **ROI**: 225x return

---

## Troubleshooting

### Issue: AI Creates Too Many Irrelevant Tasks

**Symptoms**: 20 tasks created, only 5 are real action items

**Cause**: AI prompt too broad, extracting discussion points as tasks

**Fix**: Refine prompt with strict criteria:

```
Only extract action items where:
1. Someone explicitly commits: "I'll do X by Y"
2. Task is specific and actionable (not "think about X")
3. There's a clear owner

Do NOT extract:
- General discussion points
- Questions that were answered
- "Maybe we should..." statements without commitment
```

---

### Issue: AI Assigns Tasks to Wrong Person

**Symptoms**: John's task assigned to Sarah

**Cause**: AI can't distinguish speakers or roles

**Fix**: Provide participant context:

```
Meeting participants and roles:
- John Smith (Product Manager) - handles product strategy, pricing
- Sarah Lee (Engineer) - handles technical implementation, APIs
- Mike Johnson (CEO) - handles high-level decisions, vendor relationships

Assign tasks based on who explicitly committed OR who's role best fits the task.
```

---

### Issue: No Tasks Created After Meeting

**Symptoms**: Workflow runs but no tasks appear in PM tool

**Debug steps**:
1. Check n8n execution log - did workflow run?
2. Check AI response - did it extract action items?
3. Check PM tool API key - is it valid?
4. Check PM tool node - any error messages?

**Common causes**:
- API key expired → Regenerate
- PM tool database/project not found → Update database ID
- AI returned empty array → No action items detected (check prompt)

---

### Issue: Duplicate Tasks Created

**Symptoms**: Same task created multiple times

**Cause**: Workflow triggered multiple times for same meeting

**Fix**: Add deduplication logic in n8n:

```javascript
// In Code node, before creating tasks
const meetingId = $input.item.json.meeting_id;

// Check if we've already processed this meeting
const processedMeetings = $('Store').item.json.processedMeetings || [];

if (processedMeetings.includes(meetingId)) {
  return []; // Skip, already processed
}

// Mark as processed
processedMeetings.push(meetingId);
$('Store').set('processedMeetings', processedMeetings);

// Continue with task creation
```

---

## Advanced: Custom AI Prompts for Your Team

Every team has unique needs. Customize the AI prompt for your context:

### Example 1: Engineering Team

```
Extract action items from this engineering standup.

Context:
- Sprint: 2-week sprints, currently Sprint 24
- Team: 5 engineers (names: John, Sarah, Mike, Lisa, Tom)
- Focus: Bug fixes take priority over features

Extraction rules:
- Bugs mentioned → High priority, due within sprint
- Features mentioned → Medium priority, assign to next sprint
- "Blocked by" statements → Create dependency note
- Technical debt → Low priority unless explicitly committed to

Output format: [same JSON structure]
```

### Example 2: Sales Team

```
Extract action items from this sales pipeline review.

Context:
- Team roles:
  - Account Executives (AEs): John, Sarah - handle demos, deals
  - Sales Engineers (SEs): Mike, Lisa - handle technical questions
  - Customer Success: Tom - handles onboarding

Extraction rules:
- Demo requests → Assign to AE who mentioned it
- Technical questions → Assign to SE
- Contract/pricing questions → Assign to Sales Manager
- Follow-ups → Due within 2 business days (urgent)
- Proposals → Due by end of week

Output format: [same JSON structure]
```

### Example 3: Executive Team

```
Extract action items and decisions from this executive meeting.

Context:
- C-level meeting (CEO, CTO, CFO, COO)
- Focus on high-level strategic decisions

Extraction rules:
- Strategic decisions → Create "Decision" tag in Notion
- Action items → Only extract items with explicit ownership
- "Let's discuss later" → Create "Follow-up" tag, no due date
- Financial items → Always assign to CFO unless specified
- Technical items → Always assign to CTO unless specified

Also extract:
- Key decisions made (even if no action item)
- Open questions for next meeting

Output format: [JSON with both action items and decisions]
```

---

## Integration with Other Workflows

### Meeting-to-Task + AI Second Brain

**Combined workflow**:
1. Meeting ends → Tasks auto-created in Linear (Meeting-to-Task pipeline)
2. Meeting transcript + decisions → Auto-saved to Notion (AI Second Brain)
3. Future: "What did we decide about pricing?" → AI Second Brain finds answer

**Setup**: Use same n8n workflow, add Notion node after task creation:

```
After creating tasks in Linear:
    ↓
Create Notion page:
  - Database: "Meeting Notes"
  - Title: {{meeting.title}}
  - Content: {{transcript}}
  - Decisions: {{ai.decisions}}
  - Action Items: Links to Linear tasks
```

---

### Meeting-to-Task + AI Weekly Review

**Combined workflow**:
1. All week: Tasks auto-created from meetings
2. Friday: AI reviews all tasks created this week
3. AI suggests priorities for next week

**See**: [AI Weekly Review](04-ai-weekly-review.md) for full setup

---

## Common Mistakes

### Mistake 1: Trying to Automate Everything Week 1

**Problem**: Set up n8n workflow for all 10 meeting types on Day 1

**Impact**: Overwhelmed by debugging, workflows break, abandon project

**Solution**: Start with ONE meeting type (e.g., weekly team sync), get it working, then expand

---

### Mistake 2: Not Reviewing Auto-Generated Tasks

**Problem**: "AI creates tasks automatically, I never review them"

**Impact**: Wrong tasks pile up, team loses trust in system

**Solution**: First month, manually review all auto-generated tasks. After refinement, spot-check weekly.

---

### Mistake 3: Using Wrong Tool for Team Size

**Problem**: Solo founder sets up full n8n pipeline

**Impact**: Overkill, wasted 4 hours for 2 meetings/week

**Solution**: Solo/small teams → Start with Otter.ai (Option 1), upgrade if you do >5 meetings/week

---

### Mistake 4: Forgetting to Link Meeting Context

**Problem**: Tasks created but no link back to meeting notes

**Impact**: Team asks "Why are we doing this?" with no context

**Solution**: Always include:
- Meeting title
- Date
- Link to meeting notes/transcript
- Relevant decisions or context

---

## Next Steps

### This Week

1. **Choose your option** (No-Code, Low-Code, or Advanced)
2. **Set up transcription** (Otter.ai or Fireflies)
3. **Test with 2-3 meetings**
4. **Track time saved**

### Next Month

1. **Refine AI prompts** based on accuracy
2. **Expand to more meeting types**
3. **Integrate with AI Second Brain** (optional)
4. **Train team** on new workflow

### Month 3

1. **Review ROI** (time saved vs cost)
2. **Consider upgrading** to more automated option
3. **Add AI Weekly Review** workflow
4. **Optimize based on team feedback**

---

## Related Guides

- [AI Second Brain](02-ai-second-brain.md) - Where to store meeting knowledge
- [AI Weekly Review](04-ai-weekly-review.md) - Review and prioritize tasks
- [Claude MCP for PM](../integrations/01-claude-mcp-pm.md) - Deep integration setup
- [n8n SEA Guide](../../n8n-sea-guide/) - Workflow automation platform

---

**Last Updated**: 2026-02-07
**Maintained by**: [MyEO AI](https://myeo.ai)
