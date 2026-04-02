# Async Documentation Culture

**Time to complete**: 4-6 weeks (foundational culture change)
**Cost**: $10-15/user/month (Notion or Confluence)
**Prerequisites**: Communication platform setup, team buy-in
**Who owns this**: Operations lead or documentation champion

---

## Why Async Documentation Matters

Remote work fails when:
- ❌ Knowledge lives in people's heads
- ❌ Decisions happen in Slack threads (then get lost)
- ❌ New hires ask the same questions repeatedly
- ❌ Team spends hours in meetings because nothing is written down

Remote work succeeds when:
- ✅ **Single Source of Truth** - One place for all company knowledge
- ✅ **Async by default** - Team reads and comments instead of meeting
- ✅ **Searchable history** - Find any decision in 30 seconds
- ✅ **Self-service onboarding** - New hires learn by reading

**The formula**: Write once, read by hundreds. A 30-minute doc saves 100 hours of repeated explanations.

**ROI Example (30-person company)**:
- 10 key processes documented (3 hours each) = 30 hours upfront investment
- Each process asked 2x/week × 30 people = 60 interruptions/week prevented
- Time saved: 60 interruptions × 10 min each = **10 hours/week** = **520 hours/year**
- At $50/hour: **$26,000/year value** for 30 hours of work (867x ROI)

---

## Phase 1: Choose Your Documentation Platform

### The Decision: Notion vs Confluence vs SharePoint

| Feature | Notion | Confluence | SharePoint |
|---------|--------|------------|-----------|
| **Monthly cost/user** | $10 | $5.75 (Standard) | Included with M365 |
| **Best for** | Startups, all-in-one workspace | Enterprise, Atlassian users | Microsoft-heavy orgs |
| **Learning curve** | Easy | Medium | Hard |
| **Search quality** | Good | Excellent | Medium |
| **Templates** | Excellent | Good | Limited |
| **Databases** | Yes (flexible) | Limited | No |
| **Collaboration** | Excellent (real-time) | Good | Medium |
| **Mobile app** | Excellent | Good | Poor |
| **AI features** | Notion AI ($10/user add-on) | Atlassian Intelligence | Copilot ($30/user) |
| **Integrations** | 100+ | 3,000+ | Microsoft ecosystem |

### Quick Recommendation

| Company Profile | Recommended Tool | Why |
|----------------|------------------|-----|
| **Tech/Startup (5-50)** | Notion | Best UX, all-in-one, flexible databases |
| **Enterprise (100+) using Jira** | Confluence | Deep Jira integration, enterprise search |
| **Microsoft 365 heavy** | SharePoint | Included, integrates with Teams/Outlook |
| **Budget-conscious** | Notion free → Paid later | Free up to 10 users, full features |

**Our recommendation for most SEA SMBs**: **Notion**
- Easiest to learn and adopt
- All-in-one (docs, wikis, databases, project management)
- Excellent mobile app (important for SEA teams)
- Free tier is generous (10 users, unlimited pages)

---

## Phase 2: Structure Your Documentation

### The Information Architecture

**The 80/20 structure** (works for most 5-50 person companies):

```
📁 Company Handbook
├─ About Us (mission, values, history)
├─ How We Work (remote work policy, communication norms)
├─ People Ops (PTO, benefits, performance reviews)
└─ Locations (office info, by country if applicable)

📁 Team Wikis
├─ Engineering Wiki (architecture, technical docs, how-tos)
├─ Sales Wiki (pitch decks, objection handling, deal process)
├─ Marketing Wiki (brand guidelines, content calendar, campaigns)
└─ Operations Wiki (vendor info, admin procedures)

📁 Processes & Runbooks
├─ Onboarding (30-60-90 day plans by role)
├─ Recurring Processes (month-end close, quarterly planning)
├─ How-To Guides (expense reports, IT setup, tool access)
└─ Emergency Runbooks (security incident, system outage)

📁 Meeting Notes
├─ All-Hands (weekly or monthly company updates)
├─ Leadership Team (exec decisions)
├─ Team Meetings (by team or project)
└─ 1:1s (private pages per person or manager)

📁 Projects
├─ Active Projects (one page per project)
├─ Completed Projects (archived for reference)
└─ Project Templates (copy for new projects)

📁 Decisions (RFCs / ADRs)
├─ Technical Decisions (architecture decision records)
├─ Business Decisions (major strategic choices)
└─ Product Decisions (feature prioritization, roadmap)
```

**Naming conventions**:
- **Use dates**: "2026-02-07 All-Hands Meeting Notes"
- **Be descriptive**: "How to Submit Expense Reports" not "Expenses"
- **Use emoji sparingly**: 📘 for handbooks, 📊 for reports (optional, Notion makes this easy)

**How deep to nest**:
- **2-3 levels max** for most pages
- Deeper nesting = harder to find information
- Use search and tags instead of deep hierarchies

---

## Phase 3: Create Foundational Documents

### Week 1-2: Company Handbook (High Priority)

**Why start here**: New hires need this on Day 1.

**Pages to create**:

1. **About Us** (30 min)
   - Mission and values
   - Company history (brief)
   - Team structure (org chart or list)
   - How to use this handbook

2. **How We Work** (1-2 hours) - **Most important page**
   - Remote work policy (where can people work? hybrid/full remote?)
   - Working hours (core overlap hours, flexible schedule policy)
   - Communication norms (response times, meeting culture)
     - See `CULTURE.md` for detailed norms to include
   - Tools we use (Slack, Notion, Zoom, project management)
   - How decisions are made (RFC process, who approves what)

3. **People Operations** (2-3 hours)
   - PTO policy (how much, how to request, approval process)
   - Benefits (by country if cross-border)
   - Performance reviews (frequency, format)
   - Compensation philosophy (pay bands, bonuses, equity)
   - Expense policy (what's reimbursable, limits, process)
   - See `COMPLIANCE.md` for country-specific requirements

4. **Onboarding** (1-2 hours)
   - First day checklist (accounts, access, equipment)
   - First week checklist (meetings, introductions, training)
   - 30-60-90 day goals by role
   - See `templates/onboarding-remote.md` for full template

**Template structure for each page**:
```markdown
# [Page Title]

**Last updated**: [Date]
**Owner**: [Person responsible for keeping this updated]
**Questions?** Ask in [#channel or @person]

## Overview
[2-3 sentence summary of what this page covers]

## [Section 1]
[Content with bullet points, examples, screenshots]

## [Section 2]
[Content]

## FAQs
- **Question**: Answer
- **Question**: Answer

## Related Pages
- [Link to related docs]
```

**Pro tip**: Use AI to draft these pages (see `guides/03-ai-productivity.md`). Write bullet points, have Claude/ChatGPT turn them into polished docs.

### Week 3-4: Process Documentation (Medium Priority)

**Why document processes**: Reduces repeated questions, enables self-service.

**Which processes to document first** (choose 5-10):

**For all companies**:
- ✅ How to request PTO
- ✅ How to submit expense reports
- ✅ How to get IT support (VPN, equipment, access)
- ✅ How to onboard a new hire
- ✅ How to schedule meetings (room booking, timezone etiquette)

**For specific teams**:
- Engineering: How to deploy code, how to review pull requests, incident response
- Sales: How to qualify leads, how to demo the product, deal approval process
- Marketing: How to request design work, content approval process
- Operations: Month-end close, vendor management, contract renewals

**Process doc template**:
```markdown
# [Process Name]

**Owner**: [Person]
**Frequency**: [Daily / Weekly / As-needed]
**Time required**: [Estimate]
**Last updated**: [Date]

## When to use this process
[When does someone need to do this?]

## Prerequisites
[What do you need before starting? Access, information, approvals?]

## Steps

### Step 1: [Action]
[Detailed description with screenshots if helpful]

**Example**: [Show a real example]

**Common mistakes**: [What goes wrong?]

### Step 2: [Action]
[Continue...]

## Verification
[How do you know it worked?]

## Troubleshooting
- **Problem**: [Common issue]
  **Solution**: [How to fix]

## FAQs
[Common questions]

## Related Processes
[Links to related docs]
```

**Pro tip**: Document as you go. When someone asks "How do I [X]?", write the answer once in a doc, then share the link.

### Week 5-6: Team Wikis (Lower Priority)

**Team wikis** = Team-specific knowledge (not company-wide).

**Engineering wiki** (if you have eng team):
- System architecture diagrams
- API documentation
- Development environment setup
- Coding standards and style guides
- Technical decision records (TDRs/ADRs)

**Sales wiki**:
- Pitch deck and demo scripts
- Pricing and packaging
- Competitive battlecards
- Objection handling guide
- Sales process (lead to close)

**Marketing wiki**:
- Brand guidelines (logo usage, colors, fonts)
- Content style guide
- Campaign playbooks
- Content calendar
- SEO and growth experiments

**Operations wiki**:
- Vendor contracts and contacts
- Administrative procedures
- Office management (if applicable)
- Tool access and admin credentials (use password manager, link to it)

**Start small**: Each team creates 3-5 key pages. Expand over time.

---

## Phase 4: Drive Adoption & Habits

### The Documentation Culture Challenge

**The problem**: You build the wiki. No one uses it.

**Why people don't use documentation**:
1. ❌ "Faster to ask someone than search"
2. ❌ "Documentation is always outdated"
3. ❌ "I don't know what's documented"
4. ❌ "Writing docs takes too much time"

**How to build documentation culture**:

### Tactic 1: "RTFM" (Read The Friendly Manual) Response Pattern

**When someone asks a documented question**:

❌ **Bad response** (breeds helplessness):
```
"PTO policy is 15 days/year, just submit in BambooHR"
```

✅ **Good response** (teaches self-service):
```
"Great question! That's documented here: [link to PTO policy page]

TL;DR: 15 days/year, submit in BambooHR. Let me know if anything in the doc is unclear!"
```

**Why this works**:
- Reinforces that docs exist and are useful
- Teaches people to search first next time
- Gives feedback on doc quality ("if anything is unclear")

**Make it easy**: Slack/Teams command for quick links
- Notion: Type `/notion` in Slack, search page name, paste link
- Confluence: `/confluence [page name]`

### Tactic 2: "Doc or It Didn't Happen" Rule

**The rule**: Important decisions must be documented to be official.

**Examples**:
- 🚫 "We decided in the meeting" → ❌ Not documented, not official
- ✅ "Here's the RFC with the decision: [link]" → Official

**How to enforce**:
1. After meetings, assign someone to document decisions (rotate this role)
2. Post meeting notes within 24 hours (or meeting outcomes don't count)
3. Use AI to speed this up (see `guides/03-ai-productivity.md`)

**Template** (post in Slack after meeting):
```
Meeting: [Topic]
Date: [YYYY-MM-DD]
Attendees: [Names]

📝 Notes: [Link to full notes]

**Key decisions**:
- [Decision 1]
- [Decision 2]

**Action items**:
- [ ] [Person] will [task] by [date]
- [ ] [Person] will [task] by [date]

**Open questions**:
- [Question requiring follow-up]
```

### Tactic 3: Onboarding as Documentation Test

**The test**: Can a new hire onboard using only written docs (minimal live help)?

**What to measure**:
- How many questions do new hires ask? (Goal: <10 in first week)
- What questions are asked? (These are documentation gaps)
- Can they complete tasks independently? (IT setup, tool access, etc.)

**Process**:
1. New hire joins → Given link to Onboarding page
2. They follow written steps
3. Track questions asked (in dedicated Slack channel: `#new-hire-questions`)
4. After first week, review questions
5. Add answers to onboarding doc
6. Next hire has fewer questions → Iterate

**Goal**: After 5-10 hires, onboarding is 90% self-service.

### Tactic 4: Weekly Documentation Time

**The problem**: "I don't have time to write docs"

**Solution**: Block 1 hour/week for documentation (every Friday 4-5pm).

**What to do in this hour**:
- Update 1-2 outdated pages
- Document 1 new process or FAQ
- Review unanswered questions in Slack → Add to docs
- Clean up orphaned pages (delete or archive old content)

**Make it a ritual**: Leadership does this visibly, team follows.

### Tactic 5: Documentation Ownership

**The problem**: Documentation gets stale because "someone else will update it."

**Solution**: Every page has an **owner** (DRI - Directly Responsible Individual).

**Owner responsibilities**:
- Keep page up-to-date (review quarterly minimum)
- Answer questions about the topic
- Update when process changes

**How to assign ownership**:
- Company Handbook pages → People Ops lead
- Engineering wiki → Tech lead
- Process docs → Person who runs that process
- Meeting notes → Meeting organizer

**Add owner to page metadata**:
```markdown
**Owner**: @Mike (CEO)
**Last reviewed**: 2026-02-07
**Next review**: 2026-05-07 (quarterly)
```

**Notion tip**: Use person properties and reminders to notify owners when review is due.

---

## The RFC Process (Request for Comments)

### Why RFCs?

**The problem**: Decisions made in meetings or side conversations.
- ❌ No written record
- ❌ People not in the meeting miss context
- ❌ Async team members (different timezones) excluded

**The solution**: RFC = Asynchronous decision-making process.

**What is an RFC?**
- Written proposal for a decision
- Shared with stakeholders for comments
- Comments happen async (no meeting required)
- Decision documented with rationale

**When to use RFCs**:
- ✅ Technical architecture decisions
- ✅ Process changes affecting multiple people
- ✅ Policy updates (remote work, PTO, etc.)
- ✅ Major project kickoffs
- ❌ Urgent decisions (use for important, not urgent)
- ❌ Trivial decisions (don't over-formalize)

### RFC Template

See full template in `templates/async-decision-doc.md`. Summary:

```markdown
# RFC: [Title]

**Status**: [Draft / Open for Comments / Decided / Implemented]
**Author**: [Name]
**Date**: [YYYY-MM-DD]
**Comment deadline**: [Date - usually 3-5 days from draft]
**Decision maker**: [Who makes final call?]

## Summary (TL;DR)
[2-3 sentence summary of the proposal]

## Background
[Why are we considering this? What problem are we solving?]

## Proposal
[What are we proposing to do?]

**Success criteria**: [How will we know this worked?]

## Alternatives Considered
[What else did we consider? Why not those?]

## Risks & Downsides
[What could go wrong? What are the costs?]

## Open Questions
[What don't we know yet?]

## Comments
[Team adds comments here - or use Notion comments]

## Decision
[After comment period: What did we decide? Why?]
```

### RFC Workflow

**Day 0: Draft**
1. Author writes RFC (use template)
2. Status: "Draft"
3. Share with 1-2 close colleagues for feedback

**Day 1: Publish for Comments**
1. Status: "Open for Comments"
2. Post in relevant Slack channel: "New RFC for [topic], comments due by [date]: [link]"
3. Tag stakeholders: @eng-team, @leadership, etc.

**Day 1-5: Comment Period**
1. Team reads and comments asynchronously
2. Author responds to questions, updates RFC based on feedback
3. Discussions happen in Notion comments or threaded Slack

**Day 5: Decision**
1. Decision maker reviews comments
2. Makes final decision (yes/no/modified version)
3. Documents decision with rationale in RFC
4. Status: "Decided"
5. Post in Slack: "RFC decided: [summary], see: [link]"

**Day 6+: Implementation**
1. If approved, create action items
2. Implement the proposal
3. Update RFC status: "Implemented"
4. Link to RFC in related docs

**Time saved vs meetings**: RFC process takes 30 min to write + 10 min to review per person = No synchronous meeting required.

**Example RFCs**:
- "RFC: Implement 4-day work week pilot"
- "RFC: Migrate from AWS to Railway"
- "RFC: Change PTO policy from accrual to fixed days"
- "RFC: Adopt React for frontend (vs Vue)"

---

## Documentation Best Practices

### Writing Style

**1. Write for busy people**:
- ❌ Long paragraphs
- ✅ Short paragraphs (2-4 sentences max)
- ✅ Bullet points for lists
- ✅ Bold for key terms
- ✅ TL;DR summary at top for long pages

**2. Use examples**:
- ❌ "Submit expense report in proper format"
- ✅ "Submit expense report with: receipt photo, date, amount, category. Example: [screenshot]"

**3. Show, don't just tell**:
- ✅ Screenshots for UI-heavy processes
- ✅ Code examples for technical docs
- ✅ Templates for forms or documents

**4. Answer "Why?"**:
- ❌ "PTO requests must be submitted 2 weeks in advance"
- ✅ "PTO requests must be submitted 2 weeks in advance (so we can plan coverage)"

**5. Keep it up-to-date**:
- Add "Last updated" date to every page
- Assign owner to review quarterly
- Mark outdated pages clearly: "⚠️ This process changed, see [new page]"

### Organization Tips

**1. Use tags for discoverability** (Notion, Confluence support this):
- Tags: "Engineering", "Sales", "Onboarding", "Process", "Policy"
- Helps search and filtering

**2. Link liberally**:
- Link to related pages
- Don't duplicate content (link instead)
- Example: "See [PTO Policy] for details" instead of rewriting policy

**3. Create a "Start Here" page**:
- Landing page for new hires
- Table of contents with key links
- "How to use this wiki"

**4. Use templates**:
- Create page templates for recurring docs (meeting notes, RFCs, process docs)
- Speeds up creation, ensures consistency
- Notion has built-in template feature

**5. Archive, don't delete**:
- Old projects → Move to "Completed Projects" folder
- Outdated processes → Mark as "⚠️ Deprecated, see [new version]"
- Preserves history, helps future reference

---

## Common Pitfalls & Solutions

### Pitfall 1: "Nobody uses the wiki"

**Symptoms**:
- Same questions asked repeatedly
- Low page views
- Team defaults to asking in Slack

**Causes**:
1. Documentation is hard to find (poor search, bad organization)
2. Team doesn't know docs exist
3. Docs are outdated or incomplete
4. Faster to ask than search

**Solutions**:
1. **Make it easy to find**:
   - Post links frequently in Slack
   - Pin key pages in Slack channels
   - Use Slack commands: `/notion [page name]`
2. **Respond with links** (see Tactic 1 above)
3. **Keep it updated** (assign owners, quarterly reviews)
4. **Make it searchable**:
   - Notion/Confluence have good search
   - Use descriptive titles ("How to Submit Expenses" not "Expenses")
   - Add keywords/tags

### Pitfall 2: "Documentation is always out-of-date"

**Symptoms**:
- Docs say one thing, reality is different
- Team stops trusting docs

**Causes**:
1. No ownership (no one responsible for updates)
2. Processes change but docs don't
3. No review cadence

**Solutions**:
1. **Assign owners to every page** (DRI model)
2. **Set review reminders** (quarterly for most pages)
3. **Make updates easy**:
   - Allow anyone to suggest edits (Notion comments, Confluence suggestions)
   - Approve changes quickly (within 24-48 hours)
4. **Link docs to processes**:
   - When process changes, update doc immediately (or mark as outdated)
   - Make doc updates part of the change process

### Pitfall 3: "Documentation takes too much time"

**Symptoms**:
- Docs don't get written
- Team says "too busy to document"

**Causes**:
1. Perfectionism (waiting for perfect doc instead of good-enough doc)
2. No dedicated time
3. Manual writing is slow

**Solutions**:
1. **Use AI to draft docs** (see `guides/03-ai-productivity.md`):
   - Write bullet points → AI turns into polished doc (5 min instead of 30 min)
2. **Start with "good enough"**:
   - Rough draft > No doc
   - Can always improve later
3. **Block documentation time**:
   - Weekly 1-hour block (Friday 4-5pm)
   - Make it a ritual, not "when I have time"
4. **Document as you go**:
   - Answering a question in Slack? Write it once in the wiki, then link.

### Pitfall 4: "Too many places for documentation"

**Symptoms**:
- Docs in Notion, Google Docs, Confluence, Slack, email
- No one knows where to look

**Causes**:
1. No standard (teams use different tools)
2. Migration from old tools incomplete

**Solutions**:
1. **Pick ONE tool** (Notion or Confluence)
2. **Migrate everything** to the single source of truth
   - Move Google Docs to Notion/Confluence
   - Archive old wikis
3. **Announce the change**:
   - "All company docs are now in Notion: [link]"
   - Update email signatures, Slack pinned messages
4. **Enforce the standard**:
   - "All new docs in Notion, not Google Docs"
   - Link to Notion instead of creating new Google Docs

---

## Measuring Success

### Week 2 (Initial Setup)
- ✅ Notion/Confluence account set up
- ✅ 10-15 core pages created (handbook, key processes)
- ✅ Team has access and intro training completed

### Month 1 (Foundation Built)
- ✅ 30-50 pages created
- ✅ Handbook is complete (About Us, How We Work, People Ops)
- ✅ 5-10 key processes documented
- ✅ Team uses docs 2-3x/week (measured by page views)

### Month 3 (Culture Forming)
- ✅ 100+ pages created
- ✅ Team wikis for each department (Eng, Sales, Marketing, Ops)
- ✅ New hires onboard with <10 questions (vs 50+ before)
- ✅ Team searches docs before asking questions (50% of time)
- ✅ 1-2 RFCs completed (async decisions working)

### Month 6 (Mature Documentation Culture)
- ✅ 200+ pages created
- ✅ 90% of common questions are documented
- ✅ Team searches docs first 80% of time
- ✅ Onboarding is 80-90% self-service
- ✅ Weekly documentation time is a habit
- ✅ Docs are kept up-to-date (owners review quarterly)

**Leading indicators**:
- Declining "how do I...?" questions in Slack
- Increasing page views (team uses docs actively)
- Faster onboarding (new hires ramp up in 2-3 weeks vs 4-6 weeks)
- More async decisions (RFCs replace meetings)

---

## Budget Breakdown

### 10-person company

| Tool | Monthly Cost | Annual Cost | Notes |
|------|--------------|-------------|-------|
| **Notion Plus** | $100 ($10/user) | $1,200 | Or free for <10 users (limited features) |
| **Notion AI** (optional) | $50-100 (5-10 users) | $600-1,200 | Summarization, Q&A on docs |
| **TOTAL** | **$100-200/mo** | **$1,200-2,400/yr** | |

**Alternative**:
- **Confluence Standard**: $58/month ($5.75/user) for 10 users

**ROI**: 10 people × 5 hours saved/week on repeated questions = 50 hours/week = **$130k/year saved** (at $50/hour cost)

**Net savings**: $130k - $2k = **$128k/year** (64x ROI)

### 30-person company

| Tool | Monthly Cost | Annual Cost |
|------|--------------|-------------|
| **Notion Plus** | $300 ($10/user) | $3,600 |
| **Notion AI** (optional) | $150 (15 users) | $1,800 |
| **TOTAL** | **$450/mo** | **$5,400/yr** |

**Alternative**:
- **Confluence Standard**: $173/month ($5.75/user) for 30 users = $2,076/year (saves $3,324)

**ROI**: 30 people × 5 hours saved/week = 150 hours/week = **$390k/year saved**

---

## Next Steps

After building documentation culture:

1. ✅ **Choose platform** - Notion or Confluence (or use existing SharePoint)
2. ✅ **Create structure** - Set up folders and core pages
3. ✅ **Write foundational docs** - Handbook, key processes (4-6 weeks)
4. ✅ **Train team** - Show how to use, search, and contribute
5. ✅ **Drive adoption** - Respond with links, block documentation time
6. ✅ **Implement RFCs** - Start async decision-making
7. ➡️ **Optimize performance management** - See `guides/05-performance-management.md`
8. ➡️ **Set up project management** - See `guides/06-project-management.md`

**Questions?** See `FAQ.md` section "Culture & Communication" for documentation-related FAQs.
