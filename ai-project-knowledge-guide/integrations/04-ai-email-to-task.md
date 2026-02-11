# Email-to-Task Pipeline: Stop Drowning in Email

**Last Updated**: 2026-02-07
**Setup Time**: 3-4 hours
**Expected ROI**: Save 5-8 hours/week on manual task creation from email

This guide shows you how to automatically convert emails into actionable tasks - no more manual copy-pasting or context switching.

---

## The Problem: Email → Task is Manual and Painful

**Typical email workflow**:
1. ✅ Receive email with request: "Can you review the Q1 budget by Friday?"
2. ❌ Read email, mentally note "I should do this"
3. ❌ Leave email in inbox as "reminder"
4. ❌ Inbox has 50 "reminder" emails
5. ❌ 30 min/day manually creating tasks from emails

**The pain**:
- Emails sit in inbox forever (inbox as task list anti-pattern)
- Manual task creation is tedious (copy email content, add to PM tool)
- Context switching between email and PM tool
- Important requests get lost in email flood

**The cost**: 30-60 min/day × 5 days = 2.5-5 hours/week wasted

---

## The AI Solution: Email → Task in 60 Seconds

```
Email arrives: "Can you review the Q1 budget by Friday?"
    ↓
AI detects this is a request (not FYI email)
    ↓
AI extracts:
  - Task: "Review Q1 budget"
  - Due date: Friday (this week)
  - Requester: john@company.com
  - Context: Full email thread
    ↓
Auto-create task in Linear/Notion/Asana
    ↓
Reply to email: "Task created: LIN-123 - I'll review by Friday"
    ↓
Archive email (or label "Task Created")
```

**Time saved**: 3 min manual task creation → 10 seconds AI automation

**Benefit**: Inbox Zero (emails don't pile up as task reminders)

---

## Implementation Options

### Option 1: Manual (Gmail + Claude Pro)

**Tools**: Gmail + Claude Pro

**Workflow**:
1. Read email
2. Copy email content
3. Paste into Claude Pro
4. Claude extracts task
5. Manually create in PM tool

**Time**: 2-3 min per email

**Best for**: Low email volume (<10 task-emails/week)

---

### Option 2: Semi-Automated (Recommended)

**Tools**: Gmail API + n8n + Claude API + PM tool

**Workflow**:
1. Gmail receives email
2. n8n monitors Gmail for new emails with specific label (e.g., "Create Task")
3. AI extracts task from email
4. Auto-create in PM tool
5. Reply to email with task link
6. Archive email

**Time**: Label email → Task created in 60 seconds

**Best for**: Regular email users (10-50 task-emails/week)

---

### Option 3: Fully Automated (Advanced)

**Tools**: Gmail API + n8n + Claude API + PM tool (no manual labeling)

**Workflow**:
1. AI analyzes ALL incoming emails
2. Detects which emails are requests (vs FYI, spam, newsletters)
3. Auto-creates tasks for requests
4. Sends email reply with task link
5. Archives task-emails

**Time**: Zero manual intervention

**Best for**: High email volume (50+ emails/day), executives, support teams

---

## Quick Comparison

| Feature | Manual | Semi-Automated | Fully Automated |
|---------|--------|---------------|----------------|
| **Setup Time** | 5 min | 3-4 hours | 6-8 hours |
| **Time per Email** | 3 min | 30 sec (just label) | 0 sec |
| **Monthly Cost** | $20 (Claude Pro) | $10 (Claude API) | $20 (Claude API + compute) |
| **Accuracy** | 100% (you decide) | 95% (you label emails) | 85% (AI decides) |
| **Best For** | Low volume | Regular users | High volume, executives |

**Recommendation**: Start with Option 1 to test, upgrade to Option 2 for automation.

---

## Option 1: Manual Setup (Gmail + Claude Pro)

### Step 1: Create Claude Prompt Template (5 min)

**Prompt** (save in notes for reuse):

```
Extract a task from this email:

---
[paste email content]
---

Context:
- Today's date: [current date]
- My team: John (engineer), Sarah (PM), Mike (CEO)

Extract:
1. Task title (concise, actionable)
2. Description (context from email)
3. Due date (if mentioned or infer from urgency)
4. Priority (high/medium/low based on language)
5. Requester (who sent the email)

Output as:
Task: [title]
Description: [details]
Due: [date or "No deadline"]
Priority: [high/medium/low]
Requester: [name or email]
```

---

### Step 2: Test with Real Email (5 min)

**Example email**:

```
From: john@company.com
Subject: Q1 Budget Review
Body:

Hi,

Can you review the Q1 budget spreadsheet before our Friday meeting?
It's in the shared drive under "Finance/2026 Q1".

Let me know if you have any questions.

John
```

**Paste into Claude with prompt**:

```
Extract a task from this email:

---
From: john@company.com
Subject: Q1 Budget Review

Can you review the Q1 budget spreadsheet before our Friday meeting?
It's in the shared drive under "Finance/2026 Q1".
---

Context:
- Today: Feb 7, 2026
```

**Claude output**:

```
Task: Review Q1 budget spreadsheet
Description: Review Q1 budget in shared drive (Finance/2026 Q1) before Friday meeting. Requester: John
Due: Feb 14, 2026 (Friday)
Priority: Medium (deadline mentioned, no urgency keywords)
Requester: john@company.com
```

---

### Step 3: Create Task in PM Tool (1 min)

Copy details from Claude → Create task in Linear/Notion/Asana.

**Total time**: 3 min (read email, extract, create task)

---

## Option 2: Semi-Automated Setup (Gmail + n8n)

### Prerequisites (30 min)

- Gmail account
- n8n installed (see [n8n SEA Guide](../../n8n-sea-guide/))
- Claude API key ($5-10/month)
- PM tool API key (Linear, Notion, Asana)

---

### Step 1: Set Up Gmail API Access (30 min)

**1.1 Create Google Cloud Project**:
1. Go to console.cloud.google.com
2. Create new project: "Email-to-Task Automation"
3. Enable Gmail API for project

**1.2 Create OAuth Credentials**:
1. APIs & Services → Credentials → Create credentials → OAuth client ID
2. Application type: Web application
3. Authorized redirect URIs: Your n8n webhook URL
4. Copy Client ID and Client Secret

**1.3 Authenticate n8n with Gmail**:
1. In n8n, add "Gmail" node
2. Configure with Client ID and Client Secret
3. Authorize access (allows n8n to read/send emails)

---

### Step 2: Create Gmail Label "Create Task" (2 min)

1. In Gmail, click "Create new label"
2. Name it "Create Task"
3. This label triggers the automation

---

### Step 3: Build n8n Workflow (2-3 hours)

**Workflow structure**:

```
1. Gmail Trigger: Watch for emails with "Create Task" label
    ↓
2. Gmail: Fetch full email content
    ↓
3. Code Node: Clean email (remove signatures, forward chains)
    ↓
4. Claude API: Extract task from email
    ↓
5. Linear/Notion: Create task
    ↓
6. Gmail: Reply to email with task link
    ↓
7. Gmail: Remove "Create Task" label, archive email
```

---

**Node 1: Gmail Trigger**

```
Event: Message Received
Label: Create Task
Poll Interval: Every 1 minute
```

**Explanation**: n8n checks Gmail every minute for new emails with "Create Task" label.

---

**Node 2: Fetch Email Content**

```
Operation: Get
Message ID: {{$json.id}}
Format: Full (get body, headers, thread)
```

---

**Node 3: Clean Email**

```javascript
const email = $input.item.json;

// Extract sender
const from = email.payload.headers.find(h => h.name === 'From').value;

// Extract subject
const subject = email.payload.headers.find(h => h.name === 'Subject').value;

// Extract body (handle plain text and HTML)
let body = '';
if (email.payload.body.data) {
  body = Buffer.from(email.payload.body.data, 'base64').toString('utf-8');
} else if (email.payload.parts) {
  const textPart = email.payload.parts.find(p => p.mimeType === 'text/plain');
  if (textPart) {
    body = Buffer.from(textPart.body.data, 'base64').toString('utf-8');
  }
}

// Remove email signatures (everything after "-- \n" or "Sent from my iPhone")
body = body.split('--')[0];
body = body.split('Sent from')[0];

// Remove quoted replies (lines starting with >)
body = body.split('\n').filter(line => !line.startsWith('>')).join('\n');

return [{
  json: {
    from,
    subject,
    body: body.trim(),
    emailId: email.id,
    threadId: email.threadId
  }
}];
```

---

**Node 4: Claude API (Extract Task)**

```
Method: POST
URL: https://api.anthropic.com/v1/messages
Headers:
  - x-api-key: YOUR_CLAUDE_API_KEY
  - anthropic-version: 2023-06-01

Body:
{
  "model": "claude-3-5-sonnet-20241022",
  "max_tokens": 1024,
  "messages": [{
    "role": "user",
    "content": "Extract a task from this email:\n\nFrom: {{$json.from}}\nSubject: {{$json.subject}}\nBody:\n{{$json.body}}\n\nContext:\n- Today: {{$now.toISODate()}}\n- When email says \"by Friday\", due date is next Friday\n- When email says \"ASAP\" or \"urgent\", priority is High\n\nOutput JSON:\n{\n  \"title\": \"string\",\n  \"description\": \"string (include requester context)\",\n  \"dueDate\": \"YYYY-MM-DD or null\",\n  \"priority\": \"high|medium|low\",\n  \"requester\": \"email or name\"\n}"
  }]
}
```

---

**Node 5: Create Task in Linear**

```
Method: POST
URL: https://api.linear.app/graphql
Headers:
  - Authorization: Bearer YOUR_LINEAR_API_KEY

Body:
{
  "query": "mutation { issueCreate(input: { title: \"{{$json.title}}\", description: \"Requested by: {{$json.requester}}\n\n{{$json.description}}\n\nEmail: {{$('Clean Email').item.json.subject}}\", priority: {{priority_number}}, dueDate: \"{{$json.dueDate}}\" }) { success issue { id url } } }"
}
```

**Priority mapping** (in Code node before this):
```javascript
const priorityMap = { high: 1, medium: 2, low: 3 };
const priorityNumber = priorityMap[$json.priority] || 2;
```

---

**Node 6: Reply to Email**

```
Operation: Send
To: {{$('Clean Email').item.json.from}}
Subject: Re: {{$('Clean Email').item.json.subject}}
Body:
Task created: {{$json.title}}

I've created Linear issue {{$('Linear').item.json.issue.id}} for this request.
I'll complete this by {{$('Claude API').item.json.dueDate || "TBD"}}.

View task: {{$('Linear').item.json.issue.url}}
```

---

**Node 7: Archive Email**

```
Operation: Update
Message ID: {{$('Clean Email').item.json.emailId}}
Remove Labels: Create Task
Add Labels: Tasks Created
```

---

### Step 4: Test Workflow (15 min)

1. **Send test email** to yourself:
   ```
   Subject: Test Task Creation
   Body: Can you review the pricing proposal by Thursday? It's high priority.
   ```

2. **In Gmail**: Apply "Create Task" label to email

3. **Verify**:
   - n8n triggers within 1 minute
   - Claude extracts task
   - Task created in Linear
   - Email reply sent
   - Email archived

4. **Check Linear task**:
   - Title: "Review pricing proposal"
   - Due: Thursday
   - Priority: High
   - Description includes requester context

---

### Step 5: Optimize and Refine (30 min)

**Common issues**:

**Issue 1: AI creates task for FYI emails**

Example: Newsletter email labeled "Create Task" accidentally

**Fix**: Add filtering in Claude prompt:
```
Only create a task if:
1. Email contains a clear request ("can you", "please", "could you")
2. There's a specific deliverable (not just "let me know your thoughts")
3. It's not an automated email (newsletter, notification)

If this email is FYI only, return: { "isTask": false }
```

---

**Issue 2: Due dates are wrong**

Example: "Review by end of week" → AI sets wrong date

**Fix**: Be more explicit in Claude prompt:
```
Date parsing:
- "end of week" = This Friday ({{$now.endOf('week').toISODate()}})
- "by Friday" = Next Friday if today is Sat-Thu, or Friday after if today is Fri
- "ASAP" = Tomorrow
- "next week" = Next Monday
```

---

## Option 3: Fully Automated Setup (No Manual Labeling)

### How It Works

**Instead of manually labeling emails**, AI decides which emails are tasks.

**Workflow**:

```
1. Gmail Trigger: ALL new emails
    ↓
2. Filter: Exclude spam, newsletters, automated emails
    ↓
3. Claude API: "Is this email a request that requires action?"
    ↓
4. IF yes → Extract task, create in PM tool, reply
5. IF no → Do nothing, leave in inbox
```

---

### Key Difference: AI Task Detection

**Node 3: Claude API (Detect if Email is Task)**

```
Prompt:
"Analyze this email and determine if it requires me to take action.

From: {{$json.from}}
Subject: {{$json.subject}}
Body: {{$json.body}}

Is this email:
A) A request for action (e.g., 'can you review', 'please send', 'need you to')
B) FYI only (e.g., newsletter, update, automated notification)

If A (request), extract task details.
If B (FYI), return: { \"isTask\": false }

Output JSON:
{
  \"isTask\": true/false,
  \"title\": \"string or null\",
  \"description\": \"string or null\",
  \"dueDate\": \"YYYY-MM-DD or null\",
  \"priority\": \"high|medium|low or null\",
  \"confidence\": 0-100 (how confident are you this is a task?)
}"
```

---

**Node 4: Filter by Confidence**

```javascript
const result = JSON.parse($input.item.json.content[0].text);

// Only create task if:
// 1. AI says it's a task
// 2. Confidence > 80%
if (result.isTask && result.confidence > 80) {
  return [$input.item];
} else {
  return []; // Skip, not a task
}
```

---

### Pros and Cons

**Pros**:
- Zero manual work (no labeling emails)
- Truly "set and forget"
- Captures 100% of task-emails

**Cons**:
- 10-15% false positives (FYI emails become tasks)
- 5-10% false negatives (real tasks missed)
- Requires weekly review to delete low-value tasks

**Recommendation**: Start with Option 2 (manual labeling) to build trust, then upgrade to Option 3 after refining AI prompts.

---

## Advanced: Multi-Inbox Support

### SEA Context: WhatsApp + Email

**Problem**: In Southeast Asia, work communication happens via WhatsApp, email, AND messaging apps.

**Solution**: Unified Inbox → Task pipeline

**Workflow**:

```
Email → n8n → AI extraction → Linear
WhatsApp → n8n → AI extraction → Linear
Telegram → n8n → AI extraction → Linear
Slack DM → n8n → AI extraction → Linear
```

**Key**: Same AI extraction logic works for all message types.

---

### WhatsApp Integration

**Prerequisites**: Twilio WhatsApp API (see [Voice-to-Task Guide](03-ai-voice-to-task.md))

**Workflow**:
1. Receive WhatsApp message
2. Extract text
3. Use same Claude API prompt as email
4. Create task
5. Reply on WhatsApp: "Task created: [link]"

---

## Measuring Success

### Baseline (Before Email-to-Task)

**Track for 2 weeks**:
- Emails requiring tasks: _____ per week
- Time spent creating tasks from emails: _____ hours/week
- Emails sitting in inbox as "reminders": _____ emails

**Typical baseline**:
- 30-50 task-emails/week
- 2-5 hours/week on manual task creation
- 20-50 "reminder" emails in inbox

---

### With Email-to-Task (Semi-Automated)

**Track for 2 weeks**:
- Emails labeled "Create Task": _____ per week
- Time spent: _____ min/week (just labeling)
- Emails in inbox: _____ (should approach zero)

**Expected**:
- 30-50 emails/week
- 10 min/week (30 sec per email to label)
- 0-5 emails in inbox (Inbox Zero achieved)

---

### ROI Calculation

**Time saved**:
- Before: 3 min/email × 40 emails/week = 120 min/week = 2 hours/week
- After: 30 sec/email × 40 emails/week = 20 min/week
- **Saved**: 1 hour 40 min/week

**Value**:
- Time saved: 1.67 hours/week × $100/hour = $167/week
- Cost: $10/month (Claude API) = ~$2.50/week
- **ROI**: 67x return

**Bonus**: Inbox Zero → Reduced stress, improved focus (hard to quantify but valuable)

---

## Troubleshooting

### Issue: Gmail API Rate Limits

**Symptom**: n8n workflow fails with "Rate limit exceeded"

**Cause**: Gmail API has quota limits (250 quota units per user per second)

**Fix**:
1. Add rate limiting in n8n (delay between emails)
2. Process emails in batches (not all at once)
3. Request quota increase from Google Cloud Console

---

### Issue: False Positives (FYI Emails Become Tasks)

**Symptom**: 20% of auto-created tasks are not real tasks

**Cause**: AI prompt too broad

**Fix**: Refine Claude prompt with stricter criteria:
```
Only create task if:
1. Email explicitly asks for action ("can you", "please", "need you to")
2. Email is from a real person (not automated system)
3. Email requires deliverable (not just "let me know")

Examples of FYI emails to skip:
- Newsletters
- Calendar invites (these are already in calendar)
- Automated notifications (GitHub, Jira, monitoring alerts)
- CC emails where action is not for you
```

---

### Issue: Missing Context in Tasks

**Symptom**: Task created but description is vague

**Cause**: AI only used email body, not full thread

**Fix**: Include email thread in extraction:
```javascript
// In Clean Email node
const fullThread = email.thread.messages.map(m => ({
  from: m.from,
  body: m.body
}));

// Send to Claude
```

---

## Common Mistakes

### Mistake 1: Creating Task for Every Email

**Problem**: Auto-create task for 100% of emails

**Impact**: Task list bloated with low-value items

**Solution**: Use confidence threshold (only create if >80% confident it's a real task)

---

### Mistake 2: Not Replying to Email

**Problem**: Create task but don't reply to requester

**Impact**: Requester doesn't know you saw the request

**Solution**: Always send email reply confirming task creation (builds trust)

---

### Mistake 3: Forgetting to Archive

**Problem**: Create task but leave email in inbox

**Impact**: Defeats purpose (still using inbox as task list)

**Solution**: Auto-archive after creating task (or move to "Tasks Created" folder)

---

## Next Steps

### This Week

1. **Test Option 1** (manual email → Claude → task)
2. **Try with 5-10 emails**
3. **Track time saved**
4. **Decide**: Is automation worth setup time?

### Next Month

1. **Set up Option 2** (Gmail + n8n) if you get >10 task-emails/week
2. **Refine AI prompts** to reduce false positives
3. **Track Inbox Zero achievement** (goal: <5 emails in inbox)
4. **Share workflow with team** if beneficial

### Month 3

1. **Upgrade to Option 3** (fully automated) if proven valuable
2. **Add multi-inbox support** (WhatsApp, Slack, Telegram)
3. **Weekly review** of auto-created tasks (delete low-value)
4. **Measure ROI** and optimize

---

## Related Guides

- [Meeting-to-Task Pipeline](../guides/03-meeting-to-task-pipeline.md) - Similar extraction workflow
- [Voice-to-Task Pipeline](03-ai-voice-to-task.md) - Capture ideas from voice notes
- [AI Weekly Review](../guides/04-ai-weekly-review.md) - Review all auto-created tasks
- [n8n SEA Guide](../../n8n-sea-guide/) - Workflow automation platform

---

**Last Updated**: 2026-02-07
**Maintained by**: [MyEO AI](https://myeo.ai)
