# Communication Platform Setup

**Time to complete**: 1-2 weeks (setup + team adoption)
**Cost**: $7-15/user/month
**Prerequisites**: Remote readiness assessment completed
**Who owns this**: Business owner or operations lead

---

## Why This Matters

Communication infrastructure is the foundation of remote work. Get this wrong and:
- ❌ Information gets lost in email threads
- ❌ Decisions happen in side conversations (no record)
- ❌ Remote workers feel excluded
- ❌ Context switches cost 10-15 hours/week per person

Get it right and:
- ✅ Transparent communication (everyone sees what's happening)
- ✅ Async by default (fewer meetings)
- ✅ Searchable history (no repeated questions)
- ✅ Integrations automate busy work

**ROI**: Teams save 5-10 hours/week per person by reducing email, duplicated questions, and meeting overhead.

---

## The Decision: Slack vs Microsoft Teams vs Google Chat

### Quick Recommendation by Company Type

| Company Profile | Recommended Tool | Why |
|----------------|------------------|-----|
| **Tech/Startup (5-50 people)** | Slack Pro | Best integrations, preferred by tech workers, excellent UX |
| **Corporate/Enterprise (50+ people)** | Microsoft Teams | Included with M365, enterprise features, compliance |
| **Budget-Conscious (5-20 people)** | Slack free → Slack Pro or Google Chat | Start free, upgrade when needed |
| **Google Workspace users** | Google Chat | Included, good enough, deep Gmail/Drive integration |

### Detailed Comparison

| Feature | Slack Pro | Microsoft Teams | Google Chat |
|---------|-----------|-----------------|-------------|
| **Monthly cost/user** | $7.25 USD | Included with M365 ($12.50) | Included with Workspace ($12) |
| **SEA pricing** | ~$8-9 (regional) | Same | Same |
| **Message history** | Unlimited (Pro) | Unlimited | Unlimited |
| **File storage** | 10GB/user | 1TB/user (OneDrive) | 15GB (Google Drive) |
| **Video conferencing** | Via Huddles (basic) | Teams Video (excellent) | Google Meet (excellent) |
| **Integrations** | 2,600+ apps | 1,000+ apps | Limited (Google ecosystem) |
| **Search** | Excellent | Good | Good |
| **Mobile app** | Excellent | Good | Good |
| **Learning curve** | Easy | Medium | Very easy |
| **Best for** | Tech teams, startups | Enterprises, M365 users | Google Workspace users |

### When to Choose Each

**Choose Slack if**:
- ✅ Tech/startup culture
- ✅ Need best-in-class integrations (Asana, Linear, GitHub, etc.)
- ✅ Team prioritizes communication UX
- ✅ Willing to pay for dedicated tool
- ✅ Not heavily invested in Microsoft ecosystem

**Choose Microsoft Teams if**:
- ✅ Already use Microsoft 365
- ✅ Enterprise with compliance requirements
- ✅ Need tightly integrated video + chat + documents
- ✅ Team is already familiar with Microsoft tools
- ✅ 50+ employees (makes bundled cost worthwhile)

**Choose Google Chat if**:
- ✅ Already use Google Workspace
- ✅ Budget-conscious (it's included)
- ✅ Simple communication needs (don't need 2,600 integrations)
- ✅ Team lives in Gmail and Google Drive
- ✅ "Good enough" philosophy (not seeking best-in-class)

---

## Implementation Timeline

### Week 1: Setup & Configuration

#### Day 1: Create Account and Workspace

**For Slack**:
1. Go to slack.com/create
2. Use company email (e.g., mike@yourcompany.com)
3. Choose workspace name (usually company name: "Acme Corp")
4. Invite 1-2 people initially (don't invite everyone yet)

**For Microsoft Teams**:
1. Included with M365 - no separate signup
2. Admin enables Teams in M365 admin center
3. Create first team (usually "Company-wide" or department name)

**For Google Chat**:
1. Included with Workspace - already active
2. Admin enables Chat in Workspace admin console
3. Create first space (Google's term for channels)

#### Day 2-3: Create Channel Structure

**The 80/20 channel structure** (works for most 5-50 person companies):

**Slack/Teams terminology**: "Channels"
**Google Chat terminology**: "Spaces"

**Tier 1: Company-wide channels** (everyone auto-joins):
- `#general` or `#announcements` - Company-wide announcements only (low volume)
- `#random` or `#watercooler` - Non-work chat, memes, personal updates
- `#wins` or `#celebrations` - Team wins, customer success, milestones

**Tier 2: Team/department channels**:
- `#engineering` - Engineering team discussion
- `#sales` - Sales team discussion
- `#marketing` - Marketing team discussion
- `#operations` or `#ops` - Operations, HR, finance discussions

**Tier 3: Project/topic channels**:
- `#project-website-redesign` - Specific project discussion
- `#client-acme-corp` - Client-specific communication
- `#help-it` - IT questions and support
- `#help-hr` - HR questions (PTO, benefits, etc.)

**Tier 4: Social/optional channels**:
- `#books` - Book recommendations
- `#fitness` - Workout accountability
- `#food` - Restaurant recommendations, recipes
- `#location-singapore` - For teams in specific cities

**Naming conventions**:
- Use lowercase, hyphens: `#project-name` not `#ProjectName`
- Prefix by type: `#project-`, `#client-`, `#help-`, `#location-`
- Archive old channels when project completes

**How many channels?**:
- 5-10 person company: 8-12 channels
- 10-30 person company: 15-25 channels
- 30-50 person company: 25-40 channels
- 50+ person company: 40-60 channels

Too few = noise in every channel. Too many = no one knows where to post.

#### Day 4: Configure Settings

**Slack settings to configure**:

1. **Notification defaults** (Workspace Settings → Notifications):
   - Default: Notify for @mentions and DMs only (not all messages)
   - Quiet hours: 7pm - 8am local time (automatically configured by user timezone)

2. **Message retention** (Workspace Settings → Retention & Exports):
   - Slack Pro: Unlimited retention (keep everything)
   - Free: 90-day limit (upgrade to Pro to keep history)

3. **Permissions** (Workspace Settings → Permissions):
   - Who can create channels: Everyone (encourage self-service)
   - Who can invite guests: Admins only
   - Who can post in #general: Everyone (but set expectations for low volume)

4. **Custom emoji** (Optional but fun):
   - Add company logo as emoji
   - Add frequently-used reactions (`:done:`, `:eyes:` for "reviewing", etc.)

**Microsoft Teams settings**:

1. **Notifications** (Settings → Notifications):
   - Default: @mentions and replies only
   - Quiet hours: 7pm - 8am

2. **Teams policies** (Admin Center → Teams → Teams policies):
   - Allow members to create channels: On
   - Allow guests: Off (or On if you collaborate with clients)

3. **Meeting policies**:
   - Allow scheduling: On
   - Require meeting recordings: Recommended

**Google Chat settings**:

1. **Notifications** (Settings → Notifications):
   - Direct messages: All
   - Spaces: @mentions only

2. **Space creation** (Workspace Admin → Chat → Settings):
   - Allow users to create spaces: On

#### Day 5: Integrations (Slack Only - Teams/Chat have fewer)

**Essential Slack integrations**:

1. **Google Drive** or **OneDrive**:
   - Shares files directly in Slack
   - Notifications when files are shared
   - Install: Slack App Directory → "Google Drive"

2. **Calendar** (Google Calendar or Outlook):
   - Daily agenda posted automatically
   - Meeting reminders in Slack
   - Update status automatically when in meetings

3. **Project management** (if you use Asana, Monday, ClickUp, Linear):
   - Task updates posted to relevant channels
   - Create tasks directly from Slack messages
   - Example: `/asana create task [name]` from any message

4. **GitHub** (for engineering teams):
   - Pull request notifications
   - Build status updates
   - Code review reminders

**Don't over-integrate**: Start with 3-5 integrations. Add more later if needed.

---

### Week 2: Team Onboarding & Adoption

#### Day 6-7: Pilot Group Training

**Before inviting entire company**, train a pilot group:
- 3-5 people who are tech-savvy and influential
- 30-minute training session (live or recorded video)
- Give them 2-3 days to use it and provide feedback

**What to cover in training**:

1. **Channels vs DMs** (5 min):
   - "When in doubt, post in a channel (transparency)"
   - "DMs are for 1:1 conversations, sensitive topics, or off-topic chats"
   - "If 2+ people need to know, use a channel"

2. **How to @mention** (3 min):
   - `@person` - Notify specific person
   - `@channel` - Notify everyone in channel (use sparingly!)
   - `@here` - Notify only people currently online (better than @channel)

3. **Threads** (5 min):
   - Reply in thread to keep conversation organized
   - Don't reply to thread in main channel (creates noise)
   - Example: Show messy non-threaded conversation vs clean threaded one

4. **Reactions** (2 min):
   - Use emoji reactions instead of "Okay" "Thanks" "Got it" messages
   - ✅ = Acknowledged
   - 👀 = I'm looking at this
   - ✔️ = Done
   - Reduces notification noise

5. **Status** (3 min):
   - Set status when in meeting, on PTO, out sick, focused
   - `/status [message]` to update quickly
   - Helps team know your availability

6. **Search** (2 min):
   - `Cmd/Ctrl + K` to jump to channel or person
   - `Cmd/Ctrl + F` to search all messages
   - Example search: "in:#engineering from:@mike has:link" (find links Mike posted in engineering)

7. **Mobile app** (5 min):
   - Download iOS/Android app
   - Configure push notifications (DMs + @mentions only recommended)
   - No expectation to respond after hours

8. **Do Not Disturb** (2 min):
   - `/dnd 1 hour` or `/dnd until tomorrow 8am`
   - Respect others' DND status
   - Configure automatic DND schedule (Settings → Notifications → Notification Schedule)

9. **Examples of good/bad usage** (3 min):
   - ❌ Bad: "Can someone help me?" (vague, no context, could be in DM or channel)
   - ✅ Good: "In #help-it: My VPN isn't connecting. Screenshot attached. Already tried restarting."

#### Day 8-10: Company-wide Rollout

**Send rollout email**:

```
Subject: We're moving to [Slack/Teams/Chat] for team communication 🚀

Hi team,

Starting [DATE], we're using [Slack/Teams/Google Chat] for all team communication.

Why the change?
- Faster communication (no more email chains)
- Better transparency (everyone sees what's happening)
- Easier to find information (searchable history)
- Remote team members stay connected

What you need to do:
1. Accept the invitation email from [Slack/Teams/Google]
2. Download the mobile app (optional but recommended)
3. Watch this 5-minute tutorial: [link to recorded training]
4. Post an introduction in #general

Where to start:
- Join #general and #random (you'll be added automatically)
- Join channels for your team (e.g., #engineering, #sales)
- Ask questions in #help-it

What about email?
- Email is still for: External communication, formal announcements, legal/HR matters
- Slack/Teams is for: Daily work, quick questions, team discussions

Questions? Ask in #help-it or reply to this email.

Thanks,
[Your Name]
```

#### Day 11-14: Adoption & Habit Formation

**Tactics to drive adoption**:

1. **Lead by example**:
   - Executives/managers use it actively
   - Respond to Slack/Teams messages quickly
   - Discourage email for internal communication: "Let's move this to #channel-name"

2. **Daily standup in Slack/Teams** (async):
   - Replace standup meeting with async written update
   - Template: "Yesterday: [accomplishments] / Today: [plans] / Blockers: [if any]"
   - Post in team channel (e.g., #engineering) every morning

3. **Fun engagement**:
   - Post wins in #wins
   - Share memes in #random
   - Celebrate milestones with emoji reactions
   - Weekly "Question of the Day" in #random (e.g., "What's your favorite productivity hack?")

4. **Make email painful** (optional, if team is resistant):
   - Add auto-reply to internal emails: "For faster response, message me on Slack: [link]"
   - Set email-checking to 2x/day (morning, afternoon)
   - This forces team to try Slack/Teams

**Success metrics (Week 2)**:
- ✅ 80%+ of team has logged in at least once
- ✅ 50%+ of team is active daily
- ✅ 20+ messages/day in channels (not DMs)
- ✅ Fewer internal emails sent

---

## Communication Norms to Document

After setup, **document communication norms** in your handbook or Notion/Confluence.

### Response Time Expectations

Create a written policy (post in #general and handbook):

```markdown
## Communication Response Times

**Channel messages** (e.g., #engineering, #marketing):
- Response expected: Within 4-6 hours during working hours
- No response needed if question was answered by someone else
- Use threads to keep conversations organized

**Direct messages (DMs)**:
- Response expected: Within 2 hours during working hours
- For urgent matters, call or text (phone number in profile)

**@mentions**:
- Response expected: Within 2 hours during working hours
- Treat @mentions as "I need your input"

**@channel or @here**:
- Use rarely (true urgency or time-sensitive announcements)
- Reserve for: System outages, urgent deadlines, company announcements

**After hours / weekends**:
- No expectation to respond until next working day
- Use "Do Not Disturb" mode freely
- If truly urgent: Phone call (not Slack)

**Different timezones**:
- Default to async communication
- Schedule meetings during overlap hours [specify your overlap hours]
- Use recorded video messages (Loom) for detailed explanations
```

### Working Hours & Availability

```markdown
## Working Hours & Availability

**Core overlap hours**: [e.g., 10am-3pm Singapore Time]
- These are hours when team can expect responses
- Schedule synchronous meetings during these hours only

**Flexible schedules**:
- Team members can work when they're most productive
- Update your Slack/Teams status to show availability
- Set calendar working hours (shows in Google Calendar / Outlook)

**Time off**:
- Update Slack/Teams status: "🏖️ On PTO until [date]"
- Set auto-reply on email
- Assign backup coverage for urgent matters
```

### Channel Usage Guidelines

```markdown
## Channel Usage Guidelines

**When to create a channel**:
✅ New project lasting >1 month
✅ Client communication requiring multiple people
✅ Topic generating 10+ messages/week (create dedicated channel)

**When NOT to create a channel**:
❌ Quick question (ask in existing channel)
❌ 1:1 conversation (use DM)
❌ Short-lived topic (just use thread in existing channel)

**Channel naming**:
- `#project-[name]` - For projects
- `#client-[name]` - For client work
- `#help-[topic]` - For questions (e.g., #help-it, #help-hr)
- `#location-[city]` - For office-specific discussions

**Archiving channels**:
- When project completes, archive the channel
- Archived channels are searchable but no longer active
- Don't delete (you'll lose history)
```

### Meeting Culture

```markdown
## Meeting Culture

**Every meeting must have**:
1. Calendar invite with clear title
2. Agenda shared 24 hours before (or async)
3. Zoom/Meet link
4. Notes document (shared Google Doc or Notion page)

**Meeting notes include**:
- Decisions made
- Action items (with owner + due date)
- Key discussion points
- Recording link (if recorded)

**Default to async**:
- Can this be a document instead of a meeting?
- Can this be a recorded Loom instead of live meeting?
- Does everyone need to attend? (Make some participants optional)

**No agenda = no meeting**:
- If meeting organizer doesn't share agenda 24 hours before, attendees can decline
```

---

## Common Pitfalls & Solutions

### Pitfall 1: "Too many notifications"

**Symptoms**:
- People mute channels
- Constant interruptions
- Complaints about noise

**Solutions**:
1. Set default notification setting to "@mentions only" (not all messages)
2. Encourage threads (keeps main channel clean)
3. Teach `@channel` vs `@here` (and use rarely)
4. Archive low-activity channels
5. Personal: Set Do Not Disturb schedule (auto-quiet 7pm-8am)

**Slack-specific**: Settings → Notifications → "Notify me about..." → "Direct messages, mentions, and keywords"

### Pitfall 2: "Information overload / FOMO"

**Symptoms**:
- Reading every message in every channel
- Anxiety about missing something
- Spending 2+ hours/day in chat

**Solutions**:
1. Tell team: "You don't need to read everything"
2. Star important channels (Slack: right-click channel → "Star")
3. Check starred channels 2-3x/day; others 1x/day
4. Use search when you need information
5. Trust that @mentions will notify you if input is needed

**Mantra**: "If it's important and needs my input, I'll be @mentioned."

### Pitfall 3: "DM culture" (everything in private DMs)

**Symptoms**:
- Channels are quiet
- Repeated questions (no searchable history)
- Remote workers feel excluded

**Solutions**:
1. Leaders model public communication (post in channels, not DMs)
2. When someone DMs a question: "Let's move this to #channel-name so others can benefit"
3. Discourage DMs for work topics: "Default to public channels unless it's sensitive/personal"
4. Make channels the default, DMs the exception

**When DMs are appropriate**:
- 1:1 personal conversations
- Sensitive feedback
- HR/personal matters
- Off-topic casual chat

### Pitfall 4: "Replacing email with... more email" (bad migration)

**Symptoms**:
- Team uses both email and Slack/Teams (double work)
- Confusion about where to communicate
- Adoption stalls

**Solutions**:
1. Be explicit: "Email is for external communication and formal records. Slack is for everything internal."
2. Set auto-reply on internal emails: "For faster response, message me on Slack"
3. Gradually reduce email checking to 2x/day
4. After 2 weeks, make it a norm: "We don't use internal email anymore"

**What stays in email**:
- External communication (clients, vendors, partners)
- Legal/compliance documentation
- Formal announcements (terminations, policy changes)
- Anything requiring formal record

### Pitfall 5: "Meeting overload" (video fatigue)

**Symptoms**:
- 5+ hours of meetings/day
- No time for deep work
- Team exhaustion

**Solutions**:
1. Default to async: "Can this be a Loom recording?" (see `guides/03-ai-productivity.md` for AI meeting summaries)
2. Shorter meetings: 25 min instead of 30, 50 min instead of 60
3. Meeting-free days (e.g., "No meeting Thursdays")
4. Require agendas (no agenda = no meeting)
5. Record meetings for async viewing (Zoom auto-recording)

**Async alternatives**:
- Status updates → Written update in channel (5 min to write, 2 min to read)
- Brainstorm → Shared doc for async input (24-48 hour window)
- Decision → RFC process (see `templates/async-decision-doc.md`)

---

## Integrations & Workflows

### Essential Workflows

#### Workflow 1: Task Management Integration

**If you use Asana, Monday, ClickUp, or Linear**:

1. Install Slack/Teams integration
2. Connect project management tool
3. Configure notifications:
   - New tasks → Posted to relevant channel
   - Task completed → Reaction in thread
   - Blocked tasks → @mention owner

**Example**: Task created in Asana appears in `#project-website-redesign` Slack channel. Team discusses in thread. Status updates post automatically.

#### Workflow 2: Meeting Notes Integration

**If you use Notion or Confluence**:

1. Install Slack/Teams integration
2. Create meeting notes template
3. Workflow:
   - Schedule meeting → Auto-create notes doc
   - Meeting ends → Post notes link in relevant channel
   - AI summarizes (see `guides/03-ai-productivity.md`)

#### Workflow 3: Daily Standup (Async)

**Replace standup meeting with async written update**:

1. Use Slack workflow or Geekbot (Slack app)
2. Configure questions:
   - "What did you complete yesterday?"
   - "What are you working on today?"
   - "Any blockers?"
3. Bot asks questions at 9am (each person's local time)
4. Responses post to team channel (e.g., #engineering)
5. Team reads asynchronously (5 min instead of 15-min meeting)

**Savings**: 15-min meeting × 5 people × 5 days/week = **6.25 hours saved/week**

---

## Budget Breakdown

### 10-person company

| Tool | Monthly Cost | Annual Cost | Notes |
|------|--------------|-------------|-------|
| **Slack Pro** | $72.50 ($7.25 × 10) | $870 | Recommended for tech teams |
| **Microsoft Teams** | Included | Included | If already on M365 (~$125/mo) |
| **Google Chat** | Included | Included | If already on Workspace (~$120/mo) |
| **Zoom Pro** | $133.30 ($13.33 × 10) | $1,600 | If not using Teams/Meet video |

**Recommendation for 10-person company**:
- Slack Pro + Zoom Pro = **$205.80/month** ($2,470/year)
- Or Microsoft Teams (M365) = **$125/month** ($1,500/year) - saves $970/year
- Or Google Chat (Workspace) = **$120/month** ($1,440/year) - saves $1,030/year

### 30-person company

| Tool | Monthly Cost | Annual Cost | Notes |
|------|--------------|-------------|-------|
| **Slack Pro** | $217.50 ($7.25 × 30) | $2,610 | |
| **Microsoft Teams** | Included | Included | M365 ~$375/mo |
| **Google Chat** | Included | Included | Workspace ~$360/mo |
| **Zoom Pro** | $399.90 ($13.33 × 30) | $4,799 | If not using Teams/Meet |

**Recommendation for 30-person company**:
- Slack Pro + Zoom Pro = **$617.40/month** ($7,409/year)
- Or Microsoft Teams (M365) = **$375/month** ($4,500/year) - saves $2,909/year

At 30+ people, bundled solutions (M365 or Google Workspace) become more cost-effective.

---

## Migration from Email/WhatsApp

### Current State: Email + WhatsApp

Many SEA SMBs use:
- Email for "formal" communication
- WhatsApp groups for "informal" communication

**Problems with this setup**:
- ❌ Duplicated conversations (same topic in email + WhatsApp)
- ❌ No search (WhatsApp history is terrible for finding old messages)
- ❌ Information trapped in personal devices (if someone leaves, knowledge is gone)
- ❌ No integrations (can't connect to project management, calendars, etc.)
- ❌ Unprofessional for external communication

### Migration Steps

**Week 1: Announce transition**
- Email explaining why we're moving to Slack/Teams
- Set expectations: "In 2 weeks, we'll stop using WhatsApp for work"

**Week 2: Parallel usage**
- Slack/Teams + WhatsApp both active
- Encourage posting in Slack/Teams first, then notify in WhatsApp: "Posted details in #channel-name"
- This builds habit of checking Slack/Teams

**Week 3: Deprecate WhatsApp**
- WhatsApp groups become "social only" (no work discussion)
- Auto-reply in WhatsApp: "For work topics, message me on Slack: [link]"

**Week 4: WhatsApp archived**
- Archive work WhatsApp groups
- Keep personal/social groups active

**For email**: Continue using for external communication, but move all internal communication to Slack/Teams.

---

## Success Metrics

### Week 2 (Initial Adoption)
- ✅ 80% of team has logged in
- ✅ 50% active daily
- ✅ 20+ messages/day in channels

### Month 1 (Habit Formation)
- ✅ 80% active daily
- ✅ 100+ messages/day in channels
- ✅ 50% reduction in internal emails
- ✅ Key conversations happen in public channels (not DMs)

### Quarter 1 (Maturity)
- ✅ 90%+ active daily
- ✅ 500+ messages/day (for 30-person company)
- ✅ 80% reduction in internal emails
- ✅ New hires onboard through searchable Slack/Teams history
- ✅ Team reports faster communication and less context switching

### Leading Indicators of Success
- High percentage of communication in public channels vs DMs (target: 70% public)
- Questions answered quickly (<2 hours average)
- New hires find answers via search (not just asking)
- Reduced meeting time (status updates done async)

---

## Next Steps

After completing communication setup:

1. ✅ **Document communication norms** - Post in handbook and #general channel
2. ✅ **Train team** - Run 30-min training session or record video
3. ✅ **Set integrations** - Connect calendar, project management (if applicable)
4. ✅ **Measure adoption** - Track daily active users weekly
5. ➡️ **Move to async documentation** - See `guides/04-async-documentation.md`
6. ➡️ **Add AI productivity tools** - See `guides/03-ai-productivity.md` to boost efficiency

**Questions?** See `FAQ.md` section "Tools & Technology" or ask in your company's #help-it channel.
