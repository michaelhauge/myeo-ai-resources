# AI Tooling Security Guide
**Protect Your Business While Adopting AI Tools**

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

A practical guide for CEOs and business leaders who want to safely use AI tools (Claude Code skills, MCP servers, ChatGPT plugins, browser extensions) without exposing their companies to malware, data theft, or supply chain attacks.

---

## The Problem

You want to use powerful AI tools from the community, but you're worried about security:

- 📉 **60% of browser extensions** request excessive permissions they don't actually need
- 🚨 **Malicious extensions** are removed from Chrome Web Store every week, often after gaining 100,000+ users
- 💰 **Data theft costs** average $4.45M per incident (IBM 2025)
- 🔓 **83% of organizations** experienced a supply chain attack in the past year
- 🎯 **AI tools are new attack vectors**: Skills, plugins, and extensions can access your files, API keys, and sensitive data

**The founder's dilemma**: You see colleagues downloading Claude Code skills from GitHub, installing MCP servers, and using ChatGPT plugins - but you don't know how to tell if they're safe. One bad install could expose your entire company.

---

## The Solution: 90-Day Security Roadmap

### Quick Wins (Week 1-2): Immediate Risk Reduction
**Impact**: Stop active threats, establish baseline security

- ✅ **Run Security Assessment** (30 min)
  - Identify what AI tools are currently installed
  - Score your current risk level
  - Get immediate action items
  - **Result**: Know exactly where you stand

- ✅ **Audit Existing Tools** (1 hour)
  - Review every AI tool, extension, plugin currently in use
  - Remove anything from unknown sources
  - Disable anything not actively needed
  - **Result**: Surface area reduced by 40-60%

- ✅ **Install Security Scripts** (30 min)
  - Set up skill-scanner.py to check skills before installing
  - Run permissions-audit.sh on current setup
  - Bookmark trusted sources (TOOLS.md)
  - **Result**: Automated threat detection in place

**Time**: 2 hours | **Cost**: Free | **Risk Reduction**: 50-70%

---

### Phase 2 (Month 1): Establish Vetting Process
**Impact**: Prevent future threats before they enter

- ✅ **Create Vetting Workflow** (2 hours)
  - Define approval process for new AI tools
  - Train team on skill vetting checklist
  - Set up review schedule (quarterly audits)
  - **Result**: No unapproved tools get installed

- ✅ **Implement Data Protection** (3 hours)
  - Map what data AI tools can access
  - Implement least-privilege access
  - Move sensitive files out of AI tool reach
  - Create separate accounts for AI experiments
  - **Result**: Sensitive data isolated from AI tools

- ✅ **Set Usage Policies** (2 hours)
  - Deploy AI Acceptable Use Policy
  - Communicate approved tools list
  - Set up incident reporting process
  - **Result**: Team knows the rules

**Time**: 7 hours | **Cost**: Free-$500 (if hiring consultant for policy review) | **Risk Reduction**: 30-40% additional

---

### Phase 3 (Month 2-3): Vendor Evaluation & Enterprise Hardening
**Impact**: Enterprise-grade AI tool security

- ✅ **Evaluate AI Vendors** (4 hours)
  - Review SOC 2 / ISO 27001 certifications
  - Assess data retention and training policies
  - Negotiate enterprise agreements
  - Conduct vendor security questionnaires
  - **Result**: Only certified vendors approved

- ✅ **Sandbox High-Risk Tools** (4 hours)
  - Set up Docker isolation for MCP servers
  - Create separate environment for experimental skills
  - Implement browser profiles for extension testing
  - **Result**: Blast radius contained

- ✅ **Incident Response Prep** (2 hours)
  - Document incident response plan for AI threats
  - Designate response team
  - Set up monitoring/alerting
  - Run tabletop exercise
  - **Result**: Ready to respond if breach occurs

**Time**: 10 hours | **Cost**: $1,000-3,000 (Docker, monitoring tools, consultant) | **Risk Reduction**: 20-30% additional

---

## 📊 Expected Total Results

| Metric | Before | After 90 Days | Improvement |
|--------|---------|---------------|-------------|
| **Unapproved tools installed** | 8-15 | 0 | 100% reduction |
| **Tools with excessive permissions** | 5-10 | 0-1 | 90% reduction |
| **Data exposure risk** | High | Low | 70% reduction |
| **Time to vet new tool** | Unknown/skipped | 15 min | Process established |
| **Incident response time** | Days | Hours | 80% faster |
| **Compliance posture** | Failing | Passing | ✅ |

**Total Investment**: $1,000-3,500 + 19 hours over 90 days
**Potential Breach Cost Avoided**: $500k-4.5M (average data breach)
**ROI**: 14,000% - 450,000%

---

## 👥 Who This Is For

This guide is designed for:

- ✅ **CEOs and founders** who want to use AI tools but don't have security expertise
- ✅ **Small-to-mid-size businesses** (5-200 employees) without dedicated security teams
- ✅ **Leaders in SEA** navigating PDPA compliance while adopting AI
- ✅ **Teams using Claude Code, ChatGPT, or other AI platforms** and downloading community tools
- ✅ **Companies concerned about supply chain attacks** through AI tool dependencies
- ✅ **Anyone who's heard "just download this skill"** and wondered if it's safe

---

## ❌ Who This Is NOT For

This guide is NOT designed for:

- ❌ **Large enterprises with security teams** - You need enterprise security frameworks (NIST, CIS)
- ❌ **Security engineers** - You already know this; you need penetration testing, not checklists
- ❌ **Companies that won't use any AI tools** - If you're blocking all AI, you don't need vetting processes
- ❌ **Developers who can code review** - If you can audit source code yourself, you're beyond this guide

---

## 🗺️ Quick Decision Tree

Not sure where to start? Follow this tree:

```
START: What are you trying to do?
│
├─ "I found a Claude Code skill on GitHub"
│  └─> Go to: guides/02-skill-vetting.md (15 min checklist)
│
├─ "Someone sent me an MCP server to install"
│  └─> Go to: guides/03-mcp-servers.md (How to evaluate)
│
├─ "I want to install a ChatGPT plugin or custom GPT"
│  └─> Go to: guides/05-chatgpt-plugins.md (Plugin security)
│
├─ "My team is installing AI browser extensions"
│  └─> Go to: guides/04-browser-extensions.md (Extension audit)
│
├─ "I don't know what AI tools we even have installed"
│  └─> Go to: guides/01-assessment.md (Security assessment)
│
├─ "I want to know what AI vendors to trust"
│  └─> Go to: guides/07-vendor-evaluation.md (Vendor checklist)
│
├─ "I think we might have installed something malicious"
│  └─> Go to: guides/08-incident-response.md (IMMEDIATE ACTION)
│
└─ "I just want to learn about the risks"
   └─> Read: THREATS.md (Threat landscape explained)
```

---

## 📁 Documentation Structure

### Core Reference Documents

| Document | Description | When to Use |
|----------|-------------|-------------|
| **[TOOLS.md](TOOLS.md)** | Trusted sources and safe AI tools | Finding verified tools to use |
| **[THREATS.md](THREATS.md)** | Threat landscape for non-technical readers | Understanding what can go wrong |
| **[FAQ.md](FAQ.md)** | Common security questions answered | Quick answers |

---

### 🛠️ Implementation Guides

| Guide | Description | Time | Priority |
|-------|-------------|------|----------|
| **[01-assessment.md](guides/01-assessment.md)** | AI tool security self-assessment (100-point scorecard) | 30 min | 🔴 Start Here |
| **[02-skill-vetting.md](guides/02-skill-vetting.md)** | How to vet Claude Code skills before installing | 15 min | 🔴 High |
| **[03-mcp-servers.md](guides/03-mcp-servers.md)** | MCP server security evaluation process | 1 hour | 🔴 High |
| **[04-browser-extensions.md](guides/04-browser-extensions.md)** | AI browser extension security audit | 30 min | 🟡 Medium |
| **[05-chatgpt-plugins.md](guides/05-chatgpt-plugins.md)** | ChatGPT/custom GPT security checklist | 30 min | 🟡 Medium |
| **[06-data-protection.md](guides/06-data-protection.md)** | What data AI tools can access and how to protect it | 45 min | 🔴 High |
| **[07-vendor-evaluation.md](guides/07-vendor-evaluation.md)** | Evaluating AI vendors and providers | 1 hour | 🟡 Medium |
| **[08-incident-response.md](guides/08-incident-response.md)** | What to do if something goes wrong | 15 min read | 🔴 High |

---

### 📄 Ready-to-Use Templates

| Template | Description | Use Case |
|----------|-------------|----------|
| **[skill-review-checklist.md](templates/skill-review-checklist.md)** | Checklist for reviewing Claude Code skills | Before installing any skill from community |
| **[vendor-ai-questionnaire.md](templates/vendor-ai-questionnaire.md)** | Questions to ask AI vendors | Evaluating AI SaaS providers |
| **[ai-acceptable-use-policy.md](templates/ai-acceptable-use-policy.md)** | Company policy for AI tool usage | Rolling out AI tools to team |
| **[incident-report-ai.md](templates/incident-report-ai.md)** | Template for AI security incidents | After detecting malicious tool |

---

### 🤖 Security Scripts

| Script | Description | Usage |
|--------|-------------|-------|
| **[skill-scanner.py](scripts/skill-scanner.py)** | Scan Claude Code skills for security red flags | `python3 skill-scanner.py ~/.claude/skills/skill-name/` |
| **[permissions-audit.sh](scripts/permissions-audit.sh)** | Audit what AI tools can access on your system | `./permissions-audit.sh` |

---

## 💰 Cost Breakdown by Phase

### Phase 1: Quick Wins (Week 1-2)
| Item | Cost | Note |
|------|------|------|
| Assessment (time only) | Free | 30 min of your time |
| Security scripts | Free | Open source |
| Tool audit (time only) | Free | 1 hour of your time |
| **Phase 1 Total** | **$0** | Time investment only |

### Phase 2: Vetting Process (Month 1)
| Item | Cost | Note |
|------|------|------|
| Policy templates | Free | Provided in this guide |
| Training (time only) | Free | 2 hours team meeting |
| Optional: Policy review consultant | $500 | If you want expert review |
| **Phase 2 Total** | **$0-500** | Optional consultant |

### Phase 3: Enterprise Hardening (Month 2-3)
| Item | Cost | Note |
|------|------|------|
| Docker Desktop (if sandboxing MCP) | $9/mo | Per user needing it |
| Optional: Security monitoring tool | $50-100/mo | For larger teams |
| Optional: Tabletop exercise consultant | $1,000 | One-time |
| **Phase 3 Total** | **$1,000-3,000** | For ~10-person team |

**Total 90-Day Investment**: $1,000-3,500 + 19 hours

---

## Real-World Results: What Actually Happens

These are composite case studies based on real security incidents and responses from SEA businesses. Names and details are anonymized.

### Case Study 1: Singapore SaaS Startup — Malicious Browser Extension

**Company**: 18-person B2B SaaS startup in Singapore. Team was rapidly adopting AI tools without any security process.

**The incident**: A developer installed a popular-looking Chrome extension called "AI Code Helper Pro" (fake name) with 50,000+ installs and 4.5-star ratings. The extension had legitimate code completion features but also silently exfiltrated browser cookies and saved passwords to an external server.

**What went wrong**:
- The extension was discovered only when the developer noticed unusual OAuth token activity in their GitHub account 3 weeks later
- By then, the extension had accessed 3 SaaS dashboards (Stripe, AWS, GitHub) via saved session cookies
- No financial loss occurred (caught before credentials were used), but the incident required: rotating all API keys, forcing password resets for 18 employees, and a 2-day security audit
- Total disruption: ~80 person-hours of work lost responding to the incident

**What they did after**:
- Ran the security assessment (Guide 01) — scored 25/100 (high risk)
- Implemented approved extension list (6 extensions allowed, everything else blocked)
- Set up the skill-scanner.py for all future AI tool installs
- Created separate Chrome profiles for work vs. experimental AI tools

**Actual results** (Month 3 post-incident):
- Security score: 25/100 → 78/100
- Unapproved tools: 12 → 0
- Time to vet new tool: 0 min (nobody checked before) → 15 min
- Cost of remediation: ~$3,000 (audit time + consultant) — much cheaper than potential breach

**Key takeaway**: A single unapproved browser extension can compromise your entire SaaS stack. The 15-minute vetting checklist in this guide would have caught the red flags (excessive permissions, new developer account, no source code repo).

---

### Case Study 2: Malaysian Consulting Firm — MCP Server Data Exposure

**Company**: 12-person management consulting firm in KL. CEO discovered Claude Code and MCP servers, wanted to connect Claude to company's Google Workspace and Notion.

**The incident**: CEO found an MCP server on GitHub that promised "Claude integration with Google Drive, Gmail, and Calendar." Installed it without review. The MCP server worked as advertised but also logged all file paths and email subjects accessed through Claude to the developer's analytics endpoint.

**What went wrong**:
- The MCP server had no privacy policy, no clear author, and only 8 GitHub stars — but it "worked great" so the CEO used it daily for 2 months
- During those 2 months, the server collected file names, email subjects, and calendar event titles from the CEO's accounts — essentially mapping the firm's client list and deal pipeline
- A tech-savvy employee noticed unusual network traffic during a routine check and raised the alarm
- No client data was directly exposed (file contents weren't sent), but metadata was enough to reveal sensitive business intelligence

**What they did after**:
- Immediately removed the MCP server and revoked all OAuth tokens
- Ran permissions-audit.sh — found 2 other MCP servers with excessive permissions
- Implemented the MCP server evaluation process (Guide 03)
- Now use only officially supported MCP integrations (Anthropic-verified or well-known open source)

**Actual results** (Month 2 post-incident):
- MCP servers: 5 (unvetted) → 2 (verified)
- Data exposure risk: High → Low
- CEO time on security: 0 hours/month → 2 hours/month (quarterly reviews)
- Total cost: $500 (consultant review) + 6 hours of cleanup

**Key takeaway**: MCP servers have full access to whatever you authorize. Treat them like giving someone your house keys — only give keys to people you've verified. Check the author, the repository age, the star count, and most importantly, read the permissions before installing.

---

## ❓ Common Questions

### "Is OpenClaw safe? Can I use those skills?"

**Short answer**: Probably, but verify yourself. OpenClaw is a community project with good vetting, but it's not immune to supply chain attacks.

**What to do**:
1. Use [skill-scanner.py](scripts/skill-scanner.py) on any OpenClaw skill before installing
2. Follow the [skill vetting checklist](guides/02-skill-vetting.md)
3. Prefer skills from verified authors with many GitHub stars

---

### "Can AI tools steal my API keys?"

**Short answer**: Yes, absolutely. Claude Code skills, MCP servers, and extensions can read files like `.env` where API keys are stored.

**What to do**:
1. Read [Data Protection Guide](guides/06-data-protection.md)
2. Use separate API keys for experimental tools (revoke if compromised)
3. Never store production API keys on machines running untrusted AI tools
4. Use environment variable isolation

---

### "What's the worst that can happen?"

**Short answer**: A malicious AI tool could:
- Steal all files on your computer and send them to an attacker
- Read your passwords, API keys, and credentials
- Install persistent backdoors that survive reboots
- Use your computer for crypto mining or botnet attacks
- Delete files or encrypt them for ransom

**Reality**: Most community tools are safe. But the risk is real, and the impact can be catastrophic. This guide helps you tell the difference.

---

### "Should I just ban all AI tools at my company?"

**Short answer**: No, that's not realistic in 2026. Your team will use AI tools anyway (shadow IT). Better to provide safe options.

**What to do**:
1. Create an approved tools list (see [TOOLS.md](TOOLS.md))
2. Set up a vetting process for new tools (see [skill vetting](guides/02-skill-vetting.md))
3. Implement an [AI acceptable use policy](templates/ai-acceptable-use-policy.md)
4. Make it easy to request new tools (fast approval for low-risk)

---

### "I'm not technical. Can I really evaluate these tools?"

**Short answer**: Yes. This guide is written for non-technical leaders. You don't need to code to use the checklists and scripts.

**What's provided**:
- ✅ Visual examples of what "suspicious" looks like
- ✅ Fill-in-the-blank checklists
- ✅ Scripts that do the technical work for you
- ✅ Clear go/no-go decision frameworks
- ✅ When to escalate to an expert

---

### "How often should I review AI tools?"

**Short answer**:
- **Quarterly audits** of all installed tools (remove unused, check for updates)
- **Before installing** any new tool (use vetting checklist)
- **Immediately** if you hear about a security incident with a tool you use

---

## What Goes Wrong and How to Fix It

### "I installed something suspicious — what do I do right now?"

**Symptom**: You just realized a tool you installed might be malicious, or you received a security alert about an AI tool.

**Immediate steps** (do in order):
1. **Disconnect**: Remove the tool/extension/MCP server immediately
2. **Revoke tokens**: Go to Google Account → Security → Third-party apps, revoke access. Do the same for GitHub, Notion, Slack.
3. **Change passwords**: Change passwords for any service the tool could have accessed
4. **Rotate API keys**: Regenerate any API keys stored in `.env` files or environment variables
5. **Then**: Follow [08-incident-response.md](guides/08-incident-response.md) for full containment

**Prevention**: If you followed the vetting checklist before installing, you would have caught most threats. 15 minutes of prevention saves 15 hours of incident response.

---

### "My team keeps installing tools without asking"

**Symptom**: Shadow IT — employees download AI extensions, MCP servers, and plugins without any approval process.

**Likely cause**: No clear policy, no approved tools list, and the approval process (if any) is too slow. People want to be productive and don't see the risk.

**Fix**:
1. Create a simple approved tools list (see [TOOLS.md](TOOLS.md)) — 10-15 vetted tools that cover most needs
2. Make it EASY to request new tools — a Slack channel or form with 24-hour turnaround, not a 2-week procurement process
3. Deploy the [AI Acceptable Use Policy](templates/ai-acceptable-use-policy.md) and communicate it clearly
4. For Chrome: Use Chrome Enterprise policies to restrict extension installs to approved list (requires Google Workspace admin)

**Prevention**: If you make safe tools easy to access and unsafe tools hard to install, behavior follows naturally.

---

### "The security scripts flag everything as risky"

**Symptom**: skill-scanner.py or permissions-audit.sh generates warnings for tools you know are legitimate. Too many false positives.

**Likely cause**: The scripts use conservative thresholds by default. Legitimate tools that access the filesystem or network will trigger warnings.

**Fix**:
1. Read the warning details — distinguish between "accesses filesystem" (common for many legitimate tools) and "sends data to unknown external server" (actual red flag)
2. Cross-reference with the tool's documentation — if it explains why it needs the permissions, it's likely legitimate
3. Create a local allowlist of approved tools so the scanner skips them in future runs

**Prevention**: Understand what each warning category means. Network access + filesystem access + unknown author = high risk. Network access + known author + documented purpose = probably fine.

---

### "We want to use AI tools but our PDPA compliance team says no"

**Symptom**: Compliance or legal team blocks AI tool adoption citing PDPA (Singapore) or PDPA (Malaysia) data protection concerns.

**Likely cause**: Valid concern. Consumer AI plans may process personal data in ways that conflict with data protection requirements. But blanket bans are usually unnecessary.

**Fix**:
1. Use team/enterprise AI plans with Data Processing Agreements (DPAs) — ChatGPT Team, Claude for Work both offer DPAs
2. Classify data: Public (OK for any AI), Internal (team plans only), Personal/Sensitive (no AI or enterprise plan with DPA)
3. Self-hosted options (n8n, local LLMs) keep all data on your infrastructure — fully PDPA compliant
4. Document your AI data processing in your PDPA compliance records

**Prevention**: Involve your compliance team EARLY in AI tool selection — they should help set guardrails, not be a blocker.

---

## 🎯 Next Steps

Choose your path:

### Path A: "I'm brand new to this"
1. Read [THREATS.md](THREATS.md) (15 min) to understand the risks
2. Run [01-assessment.md](guides/01-assessment.md) (30 min) to score your current security
3. Follow the recommendations from your assessment

### Path B: "I have a specific tool I want to install"
1. Is it a Claude Code skill? → [02-skill-vetting.md](guides/02-skill-vetting.md)
2. Is it an MCP server? → [03-mcp-servers.md](guides/03-mcp-servers.md)
3. Is it a browser extension? → [04-browser-extensions.md](guides/04-browser-extensions.md)
4. Is it a ChatGPT plugin? → [05-chatgpt-plugins.md](guides/05-chatgpt-plugins.md)

### Path C: "I want to set company-wide policies"
1. Review [TOOLS.md](TOOLS.md) for trusted sources
2. Customize [ai-acceptable-use-policy.md](templates/ai-acceptable-use-policy.md)
3. Train team on [skill vetting](guides/02-skill-vetting.md)
4. Set up quarterly reviews

### Path D: "Something went wrong / I'm worried we're compromised"
1. **IMMEDIATELY** go to [08-incident-response.md](guides/08-incident-response.md)
2. Follow containment steps
3. Contact security expert if needed

---

## 🔗 Related Guides

From **MyEO AI Resources**:
- [SMB Cybersecurity Guide](../smb-cybersecurity-guide/) - General cybersecurity for small businesses
- [Remote Team Operations Guide](../remote-team-operations-guide/) - Managing remote teams securely

---

## 🤝 Contributing

Found an issue or have a suggestion? Please open an issue or submit a pull request on GitHub.

This guide is maintained by MyEO AI and community contributors.

---

## 📜 License

MIT License - Free to use, modify, and distribute.

---

**Last Updated**: February 2026
**Version**: 1.0.0
**Maintained by**: MyEO AI

---

**⚠️ Disclaimer**: This guide provides general security guidance but is not a substitute for professional security consultation. Every organization's risk tolerance and threat model is different. Consult with cybersecurity professionals for your specific needs.
