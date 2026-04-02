# Frequently Asked Questions: AI-First B2B Sales in SEA

**Last Updated**: 2026-02-07

Common questions about implementing AI-powered sales in Southeast Asian markets.

---

## Getting Started

### Q: Do I need Claude Pro or can I use the free version?

**A**: Depends on usage:

**Claude Free** (claude.ai):
- Good for: Testing workflows, occasional use (<20 messages/day)
- Limitations: Message limits, limited context
- **Recommendation**: Start here to test prompts

**Claude Pro** ($20/month):
- Good for: Daily sales use, unlimited messages, priority access
- **Recommendation**: Upgrade when you hit free limits (usually within first week of serious use)

**Best approach**: Test with Free for 1 week, upgrade to Pro if valuable.

---

### Q: Will prospects know I'm using AI?

**A**: Not if you review and personalize.

**How AI assistance works**:
1. AI drafts response (10 seconds)
2. You review and personalize (20-30 seconds)
3. You send (prospect receives personalized message)

**To prospect**: Feels like fast, thoughtful response
**Reality**: AI gave you a head start, you made it yours

**Never**:
- ❌ Auto-send AI responses (always human review)
- ❌ Copy-paste without reading
- ❌ Let AI set pricing or make commitments

**Always**:
- ✅ Review every AI output
- ✅ Personalize for the relationship
- ✅ Use your judgment on tone and timing

---

### Q: Which AI tool should I start with?

**A**: **Claude Pro** ($20/month) for most people.

**Why Claude over ChatGPT**:
- Better for long-form content (proposals)
- Better cultural nuance (SEA communication styles)
- Longer context (paste entire discovery calls)

**Why ChatGPT might be better for you**:
- Need web browsing (research live companies)
- Want image generation (presentations)
- Prefer OpenAI ecosystem

**Budget option**: Start with free tiers of both, see which you prefer.

---

## SEA-Specific Questions

### Q: Does AI work for relationship-based selling in Indonesia/Malaysia?

**A**: Yes, but AI **augments** relationship building, doesn't replace it.

**What AI does**:
- ✅ Drafts warm WhatsApp messages (you personalize)
- ✅ Researches prospects before meetings (saves time)
- ✅ Suggests rapport-building questions
- ✅ Helps you remember context across long sales cycles

**What AI can't do**:
- ❌ Build trust (only you can do this)
- ❌ Read cultural cues (your human judgment)
- ❌ Decide when to be patient vs. persistent

**Reality**: AI saves you 2-3 hours/day on busywork, giving you MORE time for relationship building.

---

### Q: Can I use this in markets where English isn't primary (Indonesia, Thailand, Vietnam)?

**A**: Yes, with translation + cultural awareness.

**Approach 1: English with Cultural Adaptation**
- Many Indonesian/Thai/Vietnamese businesses use English in B2B
- Use AI to adjust tone for culture (even in English)
- Example: AI makes English communication more indirect for Indonesia

**Approach 2: Local Language Translation**
- AI translates your English prompt → Local language
- **CRITICAL**: Have native speaker review (AI misses nuance)
- Use for written content (WhatsApp, emails)

**Approach 3: Hybrid**
- Discovery calls in local language (human only)
- AI helps with English follow-up content
- Proposals can be bilingual (English + local language summary)

**What works**:
- Jakarta/Bangkok/HCMC corporate: English AI works well
- Local SMBs: Need translation + human review

---

### Q: Will AI make my responses sound robotic or impersonal?

**A**: Not if you personalize (which takes 20 seconds).

**Bad** (robotic AI copy-paste):
```
"Thank you for your inquiry. Our solution offers comprehensive capabilities
that may align with your organizational objectives. Please advise on
your availability for further discussion."
```

**Good** (AI draft + human personalization):
```
"Hi Sarah, thanks for reaching out!

Based on what you shared about the merchant onboarding challenges, I think
we could definitely help. Are you free for a quick 20-minute call this week
to discuss?

Looking forward to chatting!"
```

**The difference**: 20 seconds of human touch (name, specific reference, warm tone).

**Rule**: Never send AI output verbatim. Always add personal touch.

---

## WhatsApp & Messaging

### Q: Can I automate WhatsApp responses with AI?

**A**: Technically yes, but **don't do it without human review**.

**Why auto-response is risky**:
- WhatsApp has strict anti-spam policies
- Prospects can tell if it's automated (damages relationship)
- AI might make commitments you can't keep
- Cultural sensitivity requires human judgment

**Safe approach**:
1. AI drafts response (10 seconds)
2. You review and personalize (20 seconds)
3. You manually send from WhatsApp (5 seconds)
4. Total: 35 seconds vs 5-10 minutes manual

**Only auto-respond for**:
- Greeting message ("Thanks for contacting us, we'll respond within 2 hours")
- Away message (outside business hours)
- **Never** for sales conversations

---

### Q: What if I get a voice message on WhatsApp (common in Indonesia)?

**A**: Two options:

**Option 1: Manual** (free, simple)
- Listen to voice message
- Summarize key points in text
- Feed to AI for response draft
- You send text reply (text-to-voice reply is fine)

**Option 2: Automated** (advanced, requires setup)
- Use Whisper API (OpenAI) to transcribe voice message
- Feed transcription to Claude for response
- You review and send
- **Setup**: Requires n8n workflow (see [n8n SEA Guide](../n8n-sea-guide/))

**Cultural note**: In ID/MY, voice messages are normal. You don't need to send voice back - text reply is ok.

---

### Q: Can AI handle LINE messages (Thailand)?

**A**: Yes, same workflow as WhatsApp.

**Process**:
1. Copy LINE message
2. Paste into Claude/ChatGPT
3. AI drafts response (specify: "Thailand business culture, respectful tone")
4. Review and personalize
5. Send via LINE

**Thailand-specific**:
- Use "khrap" (male) or "kha" (female) polite particles
- AI can suggest this if you prompt: "Add appropriate Thai polite particles"
- Have Thai colleague review first few times

---

## Proposals & Content

### Q: Won't AI-generated proposals all sound the same?

**A**: Not if you customize inputs (which you should).

**Generic AI proposal** (all look alike):
```
AI Input: "Write a proposal for a CRM"
AI Output: Generic proposal that could be for anyone
```

**Personalized AI proposal** (unique):
```
AI Input:
- Prospect: Tokopedia Indonesia
- Contact: Sarah, Head of Merchant Operations
- Pain: Merchant onboarding takes 2-3 weeks (losing 30-40% to competitors)
- Stakeholders: Sarah (champion), GrabFood Head (boss), Finance
- Discovery quotes: [PASTE ACTUAL QUOTES]

AI Output: Highly personalized proposal that references their specific situation
```

**The difference**: Quality of inputs. Garbage in = garbage out. Good context in = personalized proposal.

---

### Q: Should I let AI set pricing in proposals?

**A**: **Absolutely not. Never let AI create pricing.**

**AI can**:
- ✅ Format pricing tables
- ✅ Calculate ROI based on numbers you provide
- ✅ Draft payment terms structure (you verify)

**AI cannot**:
- ❌ Determine price point
- ❌ Decide discount strategy
- ❌ Set contract terms
- ❌ Assess what market will bear

**Human-only pricing decisions**:
- Price positioning (premium vs competitive)
- Discount percentages
- Payment terms (net 30 vs 60)
- Multi-year commit discounts

**If AI suggests a price**: Ignore it. Set price based on your strategy.

---

## Cultural & Ethical

### Q: Is it ethical to use AI in sales without telling prospects?

**A**: Yes, with these guidelines:

**Ethical AI use**:
- ✅ AI helps you draft (you review and personalize)
- ✅ AI researches publicly available information
- ✅ AI suggests responses (you decide to send)
- ✅ Human reviews all AI outputs

**Unethical AI use**:
- ❌ Auto-responding without human review
- ❌ Pretending AI output is fully your work (claiming you spent hours when AI did it in minutes)
- ❌ Using AI to manipulate or deceive
- ❌ Letting AI make commitments you won't keep

**Disclosure**: You don't need to say "I used AI" (just like you don't say "I used spell-check"). AI is a tool, you're responsible for output.

**Exception**: If customer explicitly asks "Did you write this?", be honest.

---

### Q: Will AI replace salespeople?

**A**: No. AI **transforms** the sales role, doesn't eliminate it.

**What AI replaces**:
- ❌ 2-3 hours/day of busywork (proposal writing, research, note-taking)
- ❌ Manual data entry
- ❌ Drafting generic emails/messages

**What AI can't replace**:
- ✅ Building trust and relationships (especially in SEA)
- ✅ Reading cultural cues and body language
- ✅ Negotiating complex deals
- ✅ Making strategic decisions
- ✅ Asking follow-up questions in real-time
- ✅ Adapting to unexpected objections

**The future salesperson**: Spends less time on admin, more time on strategy and relationships. AI is their assistant, not their replacement.

---

## Cost & ROI

### Q: What's the minimum I need to spend to get started?

**A**: $20-40/month for solo, $200-300/month for 5-person team.

**Solo Founder Minimum**:
- Claude Pro: $20/month (or Free to test)
- Otter.ai: $10/month (or Zoom free transcription)
- **Total**: $30/month (or $20 if using free tools)

**5-Person Team Minimum**:
- Claude Pro (3-5 key reps): $60-100/month
- Fireflies.ai Pro: $50-95/month (or Otter: $50)
- Zoho CRM Standard (with basic AI): $70/month
- **Total**: $180-265/month

**Can start for free**: Claude Free, ChatGPT Free, Zoom transcription (test before buying)

---

### Q: What's the ROI? When will I break even?

**A**: Typical ROI is 10-50x monthly cost.

**Solo Founder Example**:
- Cost: $30/month (Claude + Otter)
- Time saved: 10-15 hours/month (proposal writing, research, call notes)
- Value: 12 hours × $100/hour = $1,200/month
- **ROI**: 40x

**5-Person Team Example**:
- Cost: $250/month (full stack)
- Time saved: 50-75 hours/month across team (15 hours/rep)
- Value: 60 hours × $75/hour = $4,500/month
- **ROI**: 18x

**Payback period**: Immediate (first month time savings exceeds cost)

**Non-time ROI**:
- Better proposal quality → higher win rate (+10-20%)
- Faster response times → more deals closed
- Consistent qualification → less time on bad leads

---

### Q: Is it worth it for a solo founder?

**A**: **Absolutely**. Even better ROI than teams.

**Why solo founders benefit most**:
- No team to delegate to (all admin is on you)
- Time is your most scarce resource
- 10-15 hours/week saved = significant capacity increase

**Solo founder before AI**:
- 40 hours/week total time
- 20-25 hours on sales admin (proposals, research, follow-up)
- 15-20 hours actually selling (calls, meetings)
- Manage 10-15 active deals

**Solo founder with AI**:
- 40 hours/week total time
- 10-12 hours on sales admin (AI does first drafts)
- 28-30 hours actually selling
- Manage 20-30 active deals (2x pipeline with same effort)

**Alternative**: Hire VA for $500-1000/month. AI costs $30-60/month for similar output.

---

## Technical Questions

### Q: Do I need to know how to code?

**A**: No coding required for basic AI sales workflows.

**No-code workflows**:
- ✅ Copy-paste prompts to Claude/ChatGPT
- ✅ WhatsApp message drafting
- ✅ Proposal generation
- ✅ Call transcription (Otter/Fireflies)
- ✅ Manual CRM logging

**Basic technical (helpful but not required)**:
- WhatsApp Business setup (30 min, no-code)
- CRM configuration (point-and-click)
- Claude/ChatGPT prompt customization (just text editing)

**Advanced (requires developer or n8n knowledge)**:
- WhatsApp Business API automation
- CRM-AI integrations
- Custom workflows
- **Solution**: Hire developer for $200-500 one-time setup

**Recommendation**: Start no-code, hire help for automation if needed.

---

### Q: What if AI makes a mistake?

**A**: That's why you review before sending.

**Common AI mistakes**:
- Makes up numbers (always verify metrics)
- Misunderstands context (if you give poor inputs)
- Too formal or too casual (tone needs adjustment)
- Includes features you don't have (fact-check)

**Your job**:
- ✅ Review every AI output
- ✅ Fact-check claims and numbers
- ✅ Adjust tone for relationship/culture
- ✅ Verify commitments are realistic

**If AI hallucinates** (makes up info):
- Don't panic - just don't use that part
- Provide better context in prompt
- Fact-check critical information

**Rule**: AI drafts, human approves. Always.

---

## Privacy & Security

### Q: Is my customer data safe with AI?

**A**: Depends on how you use it.

**Claude Pro/ChatGPT Plus**:
- Data NOT used for training (per Anthropic/OpenAI policies)
- Encrypted in transit and at rest
- Don't paste: passwords, API keys, financial data, PII if avoidable

**Best practices**:
- ✅ Use company/contact names (public info)
- ✅ Paste discovery call notes (business context)
- ✅ Use for draft proposals (business content)
- ❌ Don't paste: credit cards, passwords, SSNs, medical data
- ❌ Don't share customer secrets or confidential data

**For regulated industries** (finance, healthcare):
- Get enterprise contracts with AI providers
- Verify SOC 2 compliance
- Check data residency requirements
- Consult legal team first

**General business use**: Safe with common sense (don't paste secrets).

---

### Q: What about PDPA compliance (Singapore, Malaysia, Thailand)?

**A**: AI tools are PDPA-compliant if used properly.

**PDPA (Personal Data Protection Act)**:
- Singapore: PDPA 2012
- Malaysia: PDPA 2010
- Thailand: PDPA 2019 (similar to GDPR)

**Using AI safely under PDPA**:
- ✅ Use for business contact info (names, companies, job titles)
- ✅ Draft content about business relationships
- ❌ Don't paste customer personal data (NRIC, financial info, etc.) unless necessary
- ❌ Don't use AI to process sensitive personal data without consent

**AI providers (Claude, ChatGPT)**:
- Have privacy policies
- Encrypt data
- Don't sell your data
- Available for enterprise with DPA (Data Processing Agreement)

**If you're unsure**: Anonymize data before pasting to AI ("Company A" instead of "Tokopedia", "Contact X" instead of "Sarah Wijaya").

---

## Team Adoption

### Q: How do I get my sales team to actually use AI?

**A**: Proven adoption path:

**Week 1: Demo Value** (don't mandate yet)
- Show team: "Watch me draft a proposal in 10 minutes instead of 3 hours"
- Pick impressive use case (proposal, research, or WhatsApp)
- Track time saved

**Week 2: Train 1-2 Early Adopters**
- Give them Claude Pro
- Teach prompts
- Let them test and give feedback

**Week 3-4: Expand**
- Early adopters share wins ("I saved 8 hours this week")
- Train rest of team
- Make prompts easily accessible (shared doc)

**Month 2: Make it Easy**
- Create prompt library (copy-paste ready)
- Add to sales process (not optional)
- Track time saved across team

**Common resistance**: "This is too complicated" or "I don't trust AI"

**Solution**: Start with simplest workflow (WhatsApp responses or proposal drafting), prove ROI, then expand.

---

### Q: What if my team doesn't trust AI outputs?

**A**: Build trust gradually with human-in-the-loop.

**Phase 1: Show Don't Tell** (Week 1-2)
- Demo AI live (don't just talk about it)
- Show actual output vs manual work
- Side-by-side comparison

**Phase 2: Review Everything** (Month 1)
- AI suggests, human reviews 100% of outputs
- Team sees AI quality firsthand
- Build confidence

**Phase 3: Track Accuracy** (Month 2)
- "AI-drafted proposals won 85% of the time this month"
- "0 customer complaints about AI-assisted content"
- Data builds trust

**Phase 4: Gradual Autonomy** (Month 3+)
- Team comfortable with AI drafts
- Less review needed for simple tasks
- Still review complex/sensitive content

**Key**: Never force blind trust. Let team validate AI quality themselves.

---

## Troubleshooting

### Q: AI keeps giving me generic responses. How do I get better outputs?

**A**: Improve your prompts with specific context.

**Generic prompt** (bad):
```
"Write a sales email"
```

**Specific prompt** (good):
```
"Write a WhatsApp follow-up message to Sarah Wijaya, Head of Merchant Operations at Tokopedia (Indonesia).

Context:
- We had a discovery call 3 days ago
- Pain: Merchant onboarding takes 2-3 weeks (losing 30-40% to competitors)
- She needs to discuss with her boss (GrabFood Head) before moving forward
- Goal: Warm check-in, not pushy

Tone: Warm, relationship-focused, appropriate for Indonesian business culture
Length: 50-80 words (WhatsApp style)

Include: "Terima kasih" (thank you in Bahasa Indonesia)"
```

**The difference**: Specificity. More context = better output.

---

### Q: What if AI suggests the wrong tone for the culture?

**A**: Add cultural guidance to your prompt.

**Wrong tone** (AI without cultural context):
```
"Following up on our proposal. Are you ready to move forward? This pricing expires Friday."

[Too aggressive for Indonesia/Malaysia/Thailand]
```

**Right tone** (AI with cultural context):
```
Prompt: "Tone: Very warm, relationship-focused, patient. Culture: Indonesia - avoid any pressure or urgency. Never rush decisions."

Output: "Hi Sarah, hope you and your family are well! Just wanted to check if you've had a chance to review the proposal. No rush at all - happy to discuss whenever is convenient. Terima kasih!"
```

**Fix**: Always specify country and tone in prompt.

---

### Q: My workflow keeps failing. How do I debug?

**A**: Common issues and fixes:

**Issue 1: AI gives wrong information**
- **Cause**: Poor input context
- **Fix**: Provide more specific details in prompt

**Issue 2: Tone is off**
- **Cause**: No cultural guidance
- **Fix**: Specify country and communication style

**Issue 3: Output too long/short**
- **Cause**: No length guidance
- **Fix**: Specify word count ("50-80 words for WhatsApp")

**Issue 4: AI makes up facts**
- **Cause**: Hallucination
- **Fix**: Fact-check everything, provide real data in prompt

**General debugging**:
1. Read AI output carefully
2. Identify what's wrong
3. Adjust prompt to fix it
4. Re-run
5. Iterate until good

**Rule**: Prompt quality = output quality. Invest time in good prompts.

---

## What's Next?

### Q: I'm overwhelmed. Where should I start?

**A**: Follow this exact 4-week path:

**Week 1** (2 hours):
1. Take [PAIN-POINTS.md](./PAIN-POINTS.md) diagnostic (15 min)
2. Read guide for your #1 pain point (1 hour)
3. Sign up for Claude Pro ($20) or Free to test
4. Test ONE workflow (proposals, WhatsApp, or discovery prep)

**Week 2** (3-4 hours):
1. Use AI on 5 real deals (practice)
2. Track time saved
3. Refine prompts based on what works

**Week 3-4** (1-2 hours):
1. Calculate ROI (time saved × your hourly rate)
2. Decide: Keep using AI or stop?
3. If valuable: Add second workflow

**Month 2**:
1. Expand to team (if applicable)
2. Add automation tools (call AI, CRM integration)
3. Create team prompt library

**Don't**: Try to implement everything at once (leads to overwhelm and abandonment).

---

### Q: Where can I get help?

**A**: Resources:

**This guide repo**:
- GitHub issues: https://github.com/michaelhauge/myeo-ai-resources/issues
- Label: "b2b-sales-playbook-sea"

**AI tool support**:
- Claude: https://support.anthropic.com
- ChatGPT: https://help.openai.com
- Fireflies: https://fireflies.ai/help
- Otter: https://help.otter.ai

**SEA communities**:
- n8n Southeast Asia: community.n8n.io (for automation)
- Zoho CRM: https://help.zoho.com/portal/en/community

**MyEO AI**:
- Email: hello@myeo.ai
- 1-on-1 setup consulting for SEA businesses
- Custom workflow development

---

## Still Have Questions?

**Not answered here?**
- Open a GitHub issue: https://github.com/michaelhauge/myeo-ai-resources/issues
- Label: "b2b-sales-playbook-sea"

**Want 1-on-1 implementation help?**
- Email: hello@myeo.ai
- MyEO AI offers setup consulting for SEA businesses

---

**Last Updated**: 2026-02-07
**Maintained by**: [MyEO AI](https://myeo.ai)
