# AI-First PM: Frequently Asked Questions

**Last Updated**: 2026-02-07

Common questions about implementing AI-powered project and knowledge management.

---

## Getting Started

### Q: Do I need Claude Pro or can I use the free version?

**A**: Depends on your usage:

**Free Claude** (claude.ai):
- Good for: Testing workflows, occasional use (<20 queries/day)
- Limitations: Message limits, no API access, no MCP
- **Recommendation**: Start here to test AI-PM Assessment and manual prompts

**Claude Pro** ($20/month):
- Good for: Daily AI-PM use, Claude MCP, unlimited messages
- **Recommendation**: Upgrade if you use AI for PM >30 min/day

**Claude API** (pay-per-use, ~$5-10/month):
- Good for: Automated workflows (n8n), high volume
- **Recommendation**: For Meeting-to-Task, Email-to-Task automation

**Best approach**: Start with Free, upgrade to Pro when you hit limits, add API for automation.

---

### Q: Which PM tool should I use?

**A**: Depends on your priorities:

**Choose Linear if**:
- You're a dev team
- You want speed and simplicity
- You use GitHub heavily
- **Claude MCP integration** is important

**Choose Notion if**:
- You want all-in-one (PM + Knowledge + AI)
- Team is non-technical
- You need docs/wiki alongside tasks
- **Claude MCP integration** is important

**Choose ClickUp if**:
- You need maximum customization
- You use lots of n8n/Zapier automation
- MCP not required

**Verdict**: Notion for most teams, Linear for dev teams, ClickUp for power users.

See [Full Comparison](COMPARISON.md) for details.

---

### Q: Do I need to be technical to set this up?

**A**: Depends on which workflows you choose:

**Non-technical (no coding required)**:
- AI-PM Assessment (just fill out form)
- AI Second Brain with Notion AI (point-and-click)
- Meeting-to-Task with Otter.ai (copy-paste)
- AI Weekly Review with manual prompts
- **Time to learn**: 1-2 hours

**Basic technical (can follow tutorials)**:
- n8n workflows (copy-paste our recipes)
- Claude MCP setup (install, configure, restart)
- **Time to learn**: 4-8 hours

**Advanced technical (comfortable with code)**:
- Custom n8n workflows
- API integrations
- Multi-tool automation
- **Time to learn**: 2-3 days

**Recommendation**: Start with no-code workflows, hire help for automation if needed.

---

### Q: How long before I see results?

**A**: Depends on workflow:

**Immediate (Week 1)**:
- AI-PM Assessment → Know which workflow to start
- Manual AI prompts (Claude Pro) → Save time on task creation
- **ROI**: 2-3 hours saved in Week 1

**Short-term (Month 1)**:
- Meeting-to-Task pipeline → 3-5 hours/week saved
- AI Second Brain → 2-4 hours/week saved on searching
- **ROI**: 5-10 hours/week

**Long-term (Month 3)**:
- All workflows integrated → 10-20 hours/week saved
- Team adoption → 50-100 hours/week saved across team
- **ROI**: 50-200x return on tool cost

**Expectation**: Immediate small wins, compounding returns over 3 months.

---

## Specific Workflows

### Q: Can I use this with Asana/Monday.com/Jira?

**A**: Yes, with limitations:

**Works well** (via n8n automation):
- Meeting-to-Task pipeline
- Email-to-Task pipeline
- Voice-to-Task pipeline
- AI Weekly Review (manual prompts)

**Doesn't work** (requires MCP):
- Claude MCP integration (only Linear, Notion, GitHub)
- Interactive task creation with Claude

**Recommendation**: If you use Asana/Monday/Jira, use n8n workflows (Option 2 in guides). If you want Claude MCP, consider migrating to Linear or Notion.

---

### Q: What's the difference between Notion AI and Claude?

**A**: They serve different purposes:

**Notion AI** ($10/user/month):
- Built into Notion workspace
- Best for: Content generation, Q&A over Notion pages
- Limitations: Only works in Notion, no external integrations

**Claude Pro/API** ($20/month or pay-per-use):
- General-purpose AI
- Best for: Automation workflows, Claude MCP, custom prompts
- Works with: Any tool via API, not just Notion

**Best approach**: Use both
- Notion AI for day-to-day Notion work (writing, Q&A)
- Claude API for automation (n8n workflows)
- Claude MCP for interactive PM management

**Cost**: $30/month total (Notion AI $10 + Claude Pro $20)

---

### Q: Can AI completely replace my PM tool?

**A**: No, but it can do 60-80% of busywork:

**AI can**:
- Auto-create tasks from meetings, emails, voice notes
- Suggest priorities based on deadlines and goals
- Generate status updates
- Extract action items
- Q&A over your knowledge base

**AI cannot** (yet):
- Make strategic decisions for you
- Understand nuanced team dynamics
- Replace human judgment on priorities
- Manage stakeholder relationships

**Best approach**: AI handles routine PM overhead, you focus on strategy and relationships.

---

### Q: How does AI Second Brain differ from just using Notion?

**A**: AI Second Brain is about workflows, not just tools:

**Regular Notion use**:
- Create pages manually
- Organize manually
- Search manually
- Update manually

**AI Second Brain** (Notion + AI workflows):
- **Capture**: Voice → AI → Structured note
- **Organize**: AI suggests tags, links related pages
- **Retrieve**: AI Q&A ("What did we decide about pricing?")
- **Create**: AI generates docs from prompts using your company context

**Key difference**: AI automates capture, organization, and retrieval. Notion is the storage layer.

See [AI Second Brain Guide](guides/02-ai-second-brain.md) for full setup.

---

## Cost and ROI

### Q: What's the total cost for a 10-person team?

**A**: Depends on setup:

**Minimal** (Manual workflows):
- Claude Pro for key users: $20 × 3 = $60/month
- Notion Free: $0
- **Total**: $60/month

**Recommended** (Semi-automated):
- Notion Plus + AI: $20 × 10 = $200/month
- Claude API for automation: $10/month
- Otter.ai: $20/month
- n8n (self-hosted): $0
- **Total**: $230/month

**Advanced** (Fully automated):
- Notion Plus + AI: $200/month
- Claude API: $20/month (higher usage)
- Otter.ai: $20/month
- n8n Cloud: $20/month
- Whisper API: $10/month
- **Total**: $270/month

**ROI for 10-person team**:
- Time saved: 5 hours/week/person = 50 hours/week
- Value: 50 hours × $75/hour × 4 weeks = $15,000/month
- Cost: $230-270/month
- **Return**: 55-65x

---

### Q: Is it worth it for a solo founder?

**A**: Absolutely, even more ROI:

**Solo founder costs** (recommended setup):
- Claude Pro: $20/month
- Notion Plus + AI: $20/month
- Otter.ai: $20/month (optional)
- **Total**: $40-60/month

**Solo founder benefits**:
- Time saved: 10-15 hours/week (vs hiring VA)
- Value: 12 hours × $100/hour × 4 weeks = $4,800/month
- Cost: $60/month
- **Return**: 80x

**Alternative**: Hire VA for $500/month → AI costs $60/month for similar work

---

### Q: Can I start for free?

**A**: Yes, limited free tier:

**Free tools**:
- Claude Free (limited messages)
- Notion Free (solo use only)
- n8n self-hosted (free)
- Fathom meeting transcription (free Zoom)

**Free workflows**:
- AI-PM Assessment
- Manual AI prompts for task extraction
- AI Weekly Review (manual)
- Basic AI Second Brain (Notion Free)

**Limitations**:
- No automation (all manual)
- No team collaboration
- Message limits on Claude Free

**Recommendation**: Test with free tier for 2 weeks, upgrade if valuable.

---

## Technical Questions

### Q: What programming languages do I need to know?

**A**: Depends on workflow:

**No coding required**:
- Notion AI setup
- Claude MCP (config file, no code)
- Manual AI prompts

**Basic JavaScript** (for n8n):
- Code nodes in n8n (we provide examples you can copy)
- Customizing AI prompts
- Data transformation

**Not required**:
- Python
- Backend development
- Database knowledge

**Best approach**: Start no-code, hire developer for complex n8n workflows if needed.

---

### Q: Do I need to host n8n myself?

**A**: No, 3 options:

**1. n8n Cloud** ($20/month):
- Easiest, managed hosting
- No setup required
- Limited to 5,000 executions/month
- **Best for**: Non-technical users, testing

**2. Self-hosted (free)**:
- Install on Railway, Render, or your server
- Unlimited executions
- Requires basic technical setup (30 min)
- **Best for**: Budget-conscious, high volume

**3. Outsource to developer**:
- Pay developer $200-500 to set up
- They host and maintain
- **Best for**: Non-technical teams who want automation

**Recommendation**: Start with n8n Cloud, self-host if you hit limits.

See [n8n SEA Guide](../n8n-sea-guide/) for self-hosting.

---

### Q: What if I don't want to use n8n?

**A**: Alternatives:

**Zapier** ($20-50/month):
- Easier UI than n8n
- More integrations
- More expensive

**Make.com** (formerly Integromat) ($9/month):
- Similar to n8n
- Visual workflow builder
- Good middle ground

**No automation** (manual):
- Use Claude Pro with manual copy-paste
- Slower but zero technical setup

**Recommendation**: n8n for best cost/power ratio, Zapier if you prefer ease of use.

---

## Security and Privacy

### Q: Is my data safe with AI?

**A**: Depends on how you use AI:

**Claude Pro/API** (Anthropic):
- Does NOT train on your data
- Data encrypted in transit and at rest
- Enterprise contracts available for compliance

**Notion AI**:
- Processes data to provide AI features
- Does NOT train on your workspace data
- SOC 2 Type II certified

**Best practices**:
- Don't paste sensitive data (passwords, PII, financial info) into AI prompts
- Use enterprise contracts if you have compliance requirements (HIPAA, SOC 2)
- Review Anthropic and Notion privacy policies

**Recommendation**: Safe for general business use, get enterprise plan for regulated industries.

---

### Q: Can I use this in a regulated industry (healthcare, finance)?

**A**: Yes, with precautions:

**Required**:
- Enterprise contracts with AI providers (Anthropic, Notion)
- BAA (Business Associate Agreement) if HIPAA
- SOC 2 compliance verification
- Data residency guarantees (if needed)

**Safe to automate**:
- Non-sensitive PM tasks (meeting notes, task creation)
- Internal workflows (not customer-facing)

**NOT safe** (without legal review):
- Patient health information (HIPAA)
- Financial transactions (PCI-DSS)
- Personally identifiable information (GDPR)

**Recommendation**: Consult legal/compliance team before implementing in regulated industries.

---

## Team Adoption

### Q: How do I get my team to use AI-PM workflows?

**A**: Proven adoption strategies:

**1. Start small (solo first)**:
- Implement one workflow yourself
- Prove ROI with real data
- Show team your time savings

**2. Pick quick wins**:
- Meeting-to-Task (everyone hates manual task creation)
- AI Q&A (instant value when they can't find something)

**3. Train gradually**:
- Week 1: Show demo
- Week 2: Train 1-2 early adopters
- Week 3-4: Expand to full team

**4. Make it easy**:
- Create templates
- Write simple docs
- Provide support (Slack channel for questions)

**5. Track and share wins**:
- "Sarah saved 5 hours this week with AI"
- Show before/after comparisons
- Celebrate team members using it

**Common resistance**: "AI is too complicated" → Start with simplest workflow (Notion AI Q&A)

---

### Q: What if my team doesn't trust AI?

**A**: Build trust gradually:

**1. Start transparent**:
- Show what AI is doing (not a black box)
- Let team review AI-generated tasks before auto-creating
- Explain AI limitations

**2. Human-in-the-loop**:
- AI suggests, human approves (first month)
- Gradually remove human review as trust builds

**3. Track accuracy**:
- "AI correctly extracted action items 95% of the time this week"
- Show false positive rate decreasing over time

**4. Give control**:
- Team can edit AI-generated tasks
- Can disable AI for specific workflows
- Can provide feedback to improve prompts

**Expectation**: Takes 2-4 weeks for team to trust AI, then adoption accelerates.

---

## Troubleshooting

### Q: AI keeps making mistakes on my tasks. How do I improve accuracy?

**A**: Iterate on prompts:

**1. Collect examples of mistakes**:
- Task: "Review pricing" → AI set priority High (should be Medium)
- Task: "Follow up next week" → AI set due date wrong

**2. Update AI prompt with rules**:
```
Priority rules:
- "ASAP", "urgent", "critical" → High
- "important", "need to" → Medium
- Default → Low

Date parsing:
- "next week" → Next Monday (not this week)
```

**3. Test with past examples**:
- Run 10 emails through updated prompt
- Measure accuracy improvement

**4. Repeat**:
- Refine prompt weekly for first month
- Should reach 90%+ accuracy after refinement

**Expectation**: 70-80% accuracy initially, 90-95% after refinement.

---

### Q: My n8n workflow keeps failing. How do I debug?

**A**: Debugging steps:

**1. Check n8n execution log**:
- n8n → Executions → Click failed execution
- See which node failed and error message

**2. Common errors**:
- "API key invalid" → Regenerate API key
- "Rate limit exceeded" → Add delay between requests
- "Timeout" → Increase timeout in HTTP Request node

**3. Test node-by-node**:
- Run workflow manually
- Check output of each node
- Verify data format matches next node's input

**4. Check API quotas**:
- Gmail API: 250 quota units/second
- Linear API: 2,000 requests/hour
- Claude API: 50,000 tokens/min

**Resources**: [n8n Community Forum](https://community.n8n.io/) for help

---

## Next Steps

### Q: I'm overwhelmed. Where should I start?

**A**: Follow this exact path:

**Week 1** (2 hours):
1. Take [AI-PM Assessment](guides/01-ai-pm-assessment.md)
2. Identify your highest pain point
3. Read the guide for that workflow
4. Set up Claude Pro ($20/month)

**Week 2** (3-4 hours):
1. Implement ONE workflow (whichever scored highest):
   - Meeting pain → [Meeting-to-Task](guides/03-meeting-to-task-pipeline.md)
   - Knowledge pain → [AI Second Brain](guides/02-ai-second-brain.md)
   - Planning pain → [AI Weekly Review](guides/04-ai-weekly-review.md)
2. Use manual/no-code version first
3. Test with 5-10 real examples

**Week 3-4** (1 hour):
1. Track time saved
2. Calculate ROI
3. Decide: Automate or stick with manual?

**Month 2**:
1. Add automation (n8n) if ROI proven
2. Add second workflow
3. Train 1-2 team members

**Don't**: Try to implement everything at once (leads to overwhelm and abandonment)

---

### Q: Where can I get help?

**A**: Resources:

**Official docs**:
- [Claude Documentation](https://docs.anthropic.com/)
- [Notion Help](https://www.notion.so/help)
- [Linear Help](https://linear.app/docs)
- [n8n Documentation](https://docs.n8n.io/)

**Communities**:
- n8n Community: community.n8n.io
- Notion Community: notion.so/community

**MyEO AI**:
- Email: hello@myeo.ai
- 1-on-1 setup consulting for SEA businesses
- Custom workflow development

**This guide repo**:
- Open GitHub issue for questions: github.com/michaelhauge/myeo-ai-resources/issues

---

## Still Have Questions?

**Not answered here?** Open an issue:
- GitHub: https://github.com/michaelhauge/myeo-ai-resources/issues
- Label: "ai-project-knowledge-guide"

**Want 1-on-1 help?**
- Email: hello@myeo.ai
- MyEO AI offers setup consulting for SEA businesses

---

**Last Updated**: 2026-02-07
**Maintained by**: [MyEO AI](https://myeo.ai)
