# Voice-to-Task Pipeline: Capture Ideas Anywhere, Anytime

**Last Updated**: 2026-02-07
**Setup Time**: 2-3 hours
**Expected ROI**: Capture 100% of ideas (vs 20% that you forget)

This guide shows you how to turn voice notes into actionable tasks automatically - no typing, no manual entry.

---

## The Problem: Ideas Disappear

**Typical scenario**:
1. ✅ You're driving and have a brilliant idea
2. ❌ You think "I'll remember this later"
3. ❌ You forget
4. ❌ Idea is lost forever

**OR**:
1. ✅ You record voice note on phone
2. ❌ Voice note sits in app, never transcribed
3. ❌ You listen later, manually create task
4. ❌ 10 min lost on manual data entry

**The pain**:
- 80% of ideas never become tasks
- Voice notes pile up, creating guilt
- Manual transcription is tedious
- Ideas aren't actionable (just a rambling audio file)

---

## The AI Solution: Voice → Task in 60 Seconds

```
You speak: "Remind me to follow up with John about the pricing proposal by Friday"
    ↓
Phone records (Voice Memos, WhatsApp voice message, or dedicated app)
    ↓
Whisper API transcribes
  "Remind me to follow up with John about the pricing proposal by Friday"
    ↓
Claude extracts structure
  - Task: "Follow up with John about pricing proposal"
  - Assignee: Me (implied)
  - Due date: Friday (this week)
  - Priority: Medium
    ↓
Auto-create in Linear/Notion/Asana
    ↓
Notification: "Task created: Follow up with John (due Friday)"
```

**Time**: 60 seconds total (speak → task appears)

**Capture rate**: 100% of ideas (vs 20% manual)

---

## Implementation Options

### Option 1: No-Code (Easiest, Manual)

**Tools**: Phone + Voice Memos + Claude Pro

**Workflow**:
1. Record voice note on phone
2. Transcribe with phone's built-in transcription (iOS/Android)
3. Copy transcript, paste into Claude Pro
4. Claude structures it
5. Manually create task in PM tool

**Time**: 2-3 min per voice note

**Best for**: Solo users, occasional voice notes (<5/week)

---

### Option 2: Semi-Automated (Recommended)

**Tools**: Otter.ai ($20/month) or Rev.ai + Claude API + n8n

**Workflow**:
1. Record voice note on Otter.ai mobile app
2. Otter auto-transcribes
3. n8n webhook triggered when transcription complete
4. Claude API structures voice note
5. Auto-create task in PM tool
6. Notification sent

**Time**: Speak for 30 seconds → Task appears in 60 seconds

**Best for**: Regular voice note users (5-20/week)

---

### Option 3: Fully Automated (Advanced)

**Tools**: Whisper API + Claude API + n8n + Twilio (or WhatsApp Business API)

**Workflow**:
1. Call a phone number or send WhatsApp voice message
2. Twilio/WhatsApp receives audio
3. Whisper API transcribes
4. Claude API structures and creates task
5. Reply with confirmation: "Task created: [title]"

**Time**: Speak → Instant task creation

**Best for**: Power users, executives, field workers

---

## Quick Comparison

| Feature | No-Code | Semi-Automated | Fully Automated |
|---------|---------|---------------|----------------|
| **Setup Time** | 5 min | 2-3 hours | 4-6 hours |
| **Time per Voice Note** | 3 min | 60 sec | 30 sec |
| **Monthly Cost** | $20 (Claude Pro) | $30 (Otter + Claude API) | $50 (Twilio + Whisper + Claude API) |
| **Technical Skill** | None | Basic (follow tutorial) | Intermediate |
| **Best For** | Solo, occasional | Regular users | Power users, teams |

**Recommendation**: Start with Option 1 to test the workflow, upgrade to Option 2 if you use it daily.

---

## Option 1: No-Code Setup (Manual)

### Step 1: Enable Phone Transcription (5 min)

**iOS (iPhone)**:
1. Open Voice Memos app
2. Record a test voice note
3. Tap on recording
4. Tap "..." → "Transcribe"
5. iPhone transcribes automatically (requires iOS 17+)

**Android**:
1. Open Recorder app (Google Pixel) or install Google Recorder
2. Record voice note
3. Transcription happens automatically

**Verify**: You should see text transcript below audio

---

### Step 2: Voice Note → Task Workflow (Manual)

**Every time you have an idea**:

1. **Record voice note** on phone (30 seconds)
   - Example: "I need to follow up with Sarah about the customer feedback by Thursday. It's high priority because the client is waiting."

2. **Review transcript** in Voice Memos or Recorder

3. **Copy transcript**, paste into Claude Pro

4. **Prompt Claude**:
   ```
   Extract a task from this voice note:
   "[paste transcript]"

   Provide:
   - Task title (concise, actionable)
   - Description (context from voice note)
   - Due date (if mentioned or infer urgency)
   - Priority (high/medium/low based on urgency keywords)
   - Assignee (if mentioned)
   ```

5. **Claude response**:
   ```
   Task:
   - Title: Follow up with Sarah about customer feedback
   - Description: Client is waiting for response. Need to discuss customer feedback with Sarah.
   - Due date: Thursday (Feb 13, 2026)
   - Priority: High (client waiting)
   - Assignee: You
   ```

6. **Create task in Linear/Notion** (manually copy details)

**Time**: 2-3 min total

---

### Step 3: Optimize Prompts

**Add context to your Claude prompt** for better extraction:

```
Extract a task from this voice note.

Context:
- Today's date: Feb 7, 2026
- My team: John (engineer), Sarah (product manager), Mike (CEO)
- When I say "this week", due date is Friday of current week
- When I say "ASAP", set priority to High and due date to tomorrow

Voice note:
"[paste transcript]"

Output as:
- Title: [actionable task]
- Description: [context]
- Due: [YYYY-MM-DD or null]
- Priority: [high/medium/low]
- Assignee: [person or "me"]
```

---

## Option 2: Semi-Automated Setup (Otter.ai + n8n)

### Prerequisites (30 min)

- Otter.ai Pro ($20/month) with API access
- n8n installed (see [n8n SEA Guide](../../n8n-sea-guide/))
- Claude API key ($5-10/month)
- PM tool API key (Linear, Notion, Asana)

---

### Step 1: Set Up Otter.ai (15 min)

**1.1 Sign up for Otter.ai Pro**:
1. Go to otter.ai
2. Sign up and upgrade to Pro ($20/month)
3. Download mobile app (iOS/Android)

**1.2 Enable API access**:
1. Otter.ai → Settings → Integrations → API
2. Generate API key
3. Copy key (starts with `otter_api_...`)

---

### Step 2: Build n8n Workflow (2 hours)

**Workflow structure**:

```
1. Webhook Trigger (Otter.ai sends new transcription)
    ↓
2. HTTP Request: Fetch full transcript from Otter API
    ↓
3. Code Node: Prepare data
    ↓
4. Claude API: Structure voice note as task
    ↓
5. Linear/Notion API: Create task
    ↓
6. Slack/Email: Send confirmation
```

---

**Node 1: Webhook Trigger**

1. In n8n, add "Webhook" node
2. Set to "GET" or "POST"
3. Copy webhook URL (e.g., `https://your-n8n.com/webhook/voice-to-task`)
4. In Otter.ai settings, add this webhook URL
   - Otter will call it whenever transcription completes

---

**Node 2: Fetch Transcript**

```
Method: GET
URL: https://otter.ai/forward/api/v1/speeches/{{$json.speech_id}}
Headers:
  - Authorization: Bearer YOUR_OTTER_API_KEY
```

---

**Node 3: Prepare Data**

```javascript
const transcript = $input.item.json.transcript;
const todayDate = new Date().toISOString().split('T')[0];

// Detect if transcript is a task (vs just a rambling note)
const isTask = transcript.toLowerCase().includes("remind") ||
               transcript.toLowerCase().includes("need to") ||
               transcript.toLowerCase().includes("follow up") ||
               transcript.toLowerCase().includes("task");

if (!isTask) {
  return []; // Skip if not a task
}

return [{
  json: {
    transcript,
    todayDate
  }
}];
```

---

**Node 4: Claude API (Structure Task)**

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
    "content": "Extract a task from this voice note:\n\n\"{{$json.transcript}}\"\n\nContext:\n- Today's date: {{$json.todayDate}}\n- If \"this week\" mentioned, due date is next Friday\n- If \"ASAP\" or \"urgent\", priority is High and due tomorrow\n- If assignee not mentioned, assume \"me\"\n\nOutput JSON:\n{\n  \"title\": \"string\",\n  \"description\": \"string\",\n  \"dueDate\": \"YYYY-MM-DD or null\",\n  \"priority\": \"high|medium|low\",\n  \"assignee\": \"string or null\"\n}"
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
  "query": "mutation { issueCreate(input: { title: \"{{$json.title}}\", description: \"{{$json.description}}\", priority: {{$json.priority}}, dueDate: \"{{$json.dueDate}}\" }) { success issue { id url } } }"
}
```

---

**Node 6: Send Confirmation**

```
Channel: #tasks or DM yourself
Message:
✅ Task created from voice note:
"{{$json.title}}"
Due: {{$json.dueDate}}
Priority: {{$json.priority}}
Link: {{$json.issue.url}}
```

---

### Step 3: Test Workflow (15 min)

1. **Record test voice note** in Otter.ai mobile app:
   "Remind me to review the Q1 budget by end of week. It's important."

2. **Verify**:
   - Otter transcribes within 30 seconds
   - n8n webhook triggered
   - Task appears in Linear/Notion
   - Slack confirmation sent

3. **Check task details**:
   - Title: "Review Q1 budget"
   - Due: Friday of current week
   - Priority: High (keyword "important")

---

### Step 4: Optimize and Refine (30 min)

**Common issues and fixes**:

**Issue: AI misinterprets task**

Example: "I was thinking we should probably review the budget sometime" → AI creates task with no urgency

**Fix**: Update Claude prompt to filter vague statements:
```
Only create a task if:
- There's a clear action ("remind me", "I need to", "make sure to")
- Includes a specific deliverable (not "think about" or "maybe")
```

---

**Issue: Date parsing is wrong**

Example: "Review budget by end of week" → AI sets due date to wrong week

**Fix**: Be more specific in Claude prompt:
```
Date parsing rules:
- "end of week" = This Friday ({{$now.endOf('week').toISODate()}})
- "next week" = Next Friday
- "tomorrow" = {{$now.plus({days: 1}).toISODate()}}
- If no date mentioned, set to null (don't guess)
```

---

## Option 3: Fully Automated Setup (WhatsApp + Whisper)

### Architecture

```
You send WhatsApp voice message → Twilio receives
    ↓
Twilio webhook → n8n
    ↓
n8n: Download audio from Twilio
    ↓
Whisper API: Transcribe audio
    ↓
Claude API: Structure as task
    ↓
Linear/Notion: Create task
    ↓
WhatsApp reply: "Task created: [title]"
```

---

### Prerequisites (1 hour)

- Twilio account ($0 setup, pay-as-you-go ~$0.01/voice note)
- WhatsApp Business API (via Twilio)
- Whisper API (OpenAI, ~$0.006/min of audio)
- n8n, Claude API, PM tool API

**Total cost**: ~$10/month for 100 voice notes

---

### Step 1: Set Up Twilio WhatsApp (30 min)

**1.1 Create Twilio account**:
1. Go to twilio.com
2. Sign up (free trial includes $15 credit)
3. Verify phone number

**1.2 Set up WhatsApp sandbox** (for testing):
1. Twilio Console → Messaging → Try it out → WhatsApp
2. Follow instructions to join sandbox (send "join [code]" to Twilio WhatsApp number)
3. You can now send/receive WhatsApp messages via Twilio

**1.3 Configure webhook**:
1. Twilio → Messaging → Settings → WhatsApp Sandbox
2. Set "When a message comes in": Your n8n webhook URL
3. Save

---

### Step 2: Build n8n Workflow (2-3 hours)

**Workflow**:

```
1. Webhook (receives WhatsApp message from Twilio)
    ↓
2. Filter: Only process voice messages (not text)
    ↓
3. HTTP Request: Download audio file from Twilio
    ↓
4. Whisper API: Transcribe audio
    ↓
5. Claude API: Structure as task
    ↓
6. Linear/Notion: Create task
    ↓
7. Twilio API: Send WhatsApp reply with confirmation
```

---

**Node 3: Download Audio**

```
Method: GET
URL: {{$json.MediaUrl0}}
Authentication: Basic Auth
  - Username: YOUR_TWILIO_ACCOUNT_SID
  - Password: YOUR_TWILIO_AUTH_TOKEN

Output: Binary file
```

---

**Node 4: Whisper API (Transcribe)**

```
Method: POST
URL: https://api.openai.com/v1/audio/transcriptions
Headers:
  - Authorization: Bearer YOUR_OPENAI_API_KEY
  - Content-Type: multipart/form-data

Body (multipart):
  - file: {{$binary.data}}
  - model: whisper-1
  - language: en
```

---

**Node 7: Send WhatsApp Reply**

```
Method: POST
URL: https://api.twilio.com/2010-04-01/Accounts/YOUR_ACCOUNT_SID/Messages.json
Authentication: Basic Auth

Body (form-urlencoded):
  - From: whatsapp:+14155238886 (Twilio WhatsApp number)
  - To: whatsapp:{{$('Webhook').item.json.From}}
  - Body: "✅ Task created: {{$json.title}}\nDue: {{$json.dueDate}}\nView in Linear: {{$json.taskUrl}}"
```

---

### Step 3: Test End-to-End (15 min)

1. **Send WhatsApp voice message** to Twilio number:
   "Remind me to follow up with the vendor about the API contract by tomorrow"

2. **Verify**:
   - Twilio receives message
   - n8n transcribes with Whisper
   - Claude structures as task
   - Task created in Linear
   - WhatsApp reply received with confirmation

**Total time**: 30-60 seconds from voice → task

---

## Advanced: Multi-Modal Voice Notes

### Voice Note with Context

**Example**: "Add task: Review pricing proposal. Context: John mentioned competitive pricing was an issue in last meeting. Priority high, due Friday."

**AI extraction**:
```
Title: Review pricing proposal
Description: Context from John: competitive pricing was an issue in last meeting
Priority: High
Due: Friday
```

**Benefit**: Richer context captured in voice note, structured by AI

---

### Voice Note for Multiple Tasks

**Example**: "Three tasks: First, follow up with Sarah about design. Second, review API documentation. Third, schedule meeting with Mike."

**AI extraction**:
```
[
  { title: "Follow up with Sarah about design", assignee: "Sarah" },
  { title: "Review API documentation" },
  { title: "Schedule meeting with Mike", assignee: "Mike" }
]
```

**n8n**: Loop through array, create 3 separate tasks

---

## Measuring Success

### Baseline (Before Voice-to-Task)

**Track for 2 weeks**:
- Ideas you have while away from computer: _____ per week
- Ideas you actually turn into tasks: _____ per week
- Capture rate: _____ %

**Typical baseline**:
- 20-30 ideas/week
- 5-6 actually become tasks
- Capture rate: 20-30%

---

### With Voice-to-Task

**Track for 2 weeks**:
- Voice notes recorded: _____ per week
- Tasks auto-created: _____ per week
- Capture rate: _____ %

**Expected**:
- 20-30 voice notes/week
- 18-25 tasks created (filtering out non-tasks)
- Capture rate: 80-90%

---

### ROI Calculation

**Value of captured ideas**:
- Assume 1 in 10 voice notes leads to $1,000 value (feature, sale, cost saving)
- Before: Capture 5 ideas/week → 0.5 valuable ideas/week → $500/week value
- After: Capture 20 ideas/week → 2 valuable ideas/week → $2,000/week value
- **Increased value**: $1,500/week

**Cost**: $30/month (Otter + Claude API) = ~$7/week

**ROI**: 214x return (not counting time saved on manual entry)

---

## Common Mistakes

### Mistake 1: Recording Everything as Voice Notes

**Problem**: "Let me record my entire meeting as a voice note"

**Impact**: 60-min audio file → Expensive to transcribe, hard to structure

**Solution**: Voice-to-Task is for quick ideas (30-60 seconds), not full meeting transcription

---

### Mistake 2: Not Filtering Non-Tasks

**Problem**: Every rambling thought becomes a task

**Impact**: 50 low-value tasks created per week

**Solution**: Add filtering in n8n to only create tasks if clear action is detected

---

### Mistake 3: Forgetting to Review Tasks

**Problem**: Auto-created tasks pile up, never reviewed

**Impact**: Bloated task list, lose signal in noise

**Solution**: Weekly review of auto-created tasks (delete/defer low-priority)

---

## Next Steps

### This Week

1. **Test Option 1** (manual voice → Claude → task)
2. **Record 5-10 voice notes** over 3 days
3. **Track capture rate** and time saved
4. **Decide**: Is this valuable enough to automate?

### Next Month

1. **Set up Option 2** (Otter.ai + n8n) if you use voice notes regularly
2. **Refine AI prompts** based on quality of tasks created
3. **Integrate with Weekly Review** (review auto-created tasks each Friday)
4. **Share with team** if multi-user beneficial

### Month 3

1. **Upgrade to Option 3** (WhatsApp + Whisper) if power user
2. **Multi-modal voice notes** (voice + context)
3. **Advanced filtering** (only create high-value tasks)
4. **Measure ROI** and optimize

---

## Related Guides

- [Meeting-to-Task Pipeline](../guides/03-meeting-to-task-pipeline.md) - Similar transcription → task workflow
- [AI Second Brain](../guides/02-ai-second-brain.md) - Capture voice notes as knowledge, not just tasks
- [Email-to-Task Pipeline](04-ai-email-to-task.md) - Similar extraction workflow for email
- [n8n SEA Guide](../../n8n-sea-guide/) - Workflow automation platform

---

**Last Updated**: 2026-02-07
**Maintained by**: [MyEO AI](https://myeo.ai)
