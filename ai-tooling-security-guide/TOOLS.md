# Trusted AI Tool Sources & Safe Practices

**Quick Reference**: Where to find AI tools you can (probably) trust, and how to evaluate them.

---

## 📖 How to Use This Guide

This document helps you answer:
1. **Where can I safely find AI tools?** (Trusted sources by category)
2. **What makes a source "trusted"?** (Vetting criteria)
3. **What tools are recommended?** (Specific safe options)

**Important**: "Trusted" doesn't mean "100% safe." It means "lower risk with community vetting." You should still review tools yourself using the [skill vetting guide](guides/02-skill-vetting.md).

---

## 🎯 Trusted Sources by AI Tool Category

### Claude Code Skills

| Source | URL | Risk Level | Vetting | Best For |
|--------|-----|------------|---------|----------|
| **Anthropic Official** | [Anthropic Docs](https://docs.anthropic.com) | 🟢 Low | First-party | Official capabilities |
| **OpenClaw** | [github.com/cline/openClaw](https://github.com/cline/openclaw) | 🟡 Medium | Community review | Community skills with vetting |
| **Verified Authors** | GitHub profiles with >1000 stars | 🟡 Medium | Reputation-based | Well-known developers |
| **Random GitHub** | One-off repositories | 🔴 High | None | ⚠️ Review carefully |
| **Discord/Slack shares** | Direct file shares | 🔴 Very High | None | ❌ Avoid unless you know the author |

**Recommendation**:
- ✅ **Prefer**: Anthropic official skills, OpenClaw verified skills
- ⚠️ **Review carefully**: Individual GitHub repos (use skill-scanner.py)
- ❌ **Avoid**: Direct file shares from unknown people

---

### MCP (Model Context Protocol) Servers

| Source | URL | Risk Level | Vetting | Best For |
|--------|-----|------------|---------|----------|
| **Anthropic Examples** | [github.com/anthropics/mcp-examples](https://github.com/anthropics/mcp-examples) | 🟢 Low | First-party | Reference implementations |
| **npm (Verified Publishers)** | [npmjs.com](https://www.npmjs.com) | 🟡 Medium | Package signing | Popular packages |
| **npm (Unverified)** | npmjs.com | 🟡 Medium-High | Community downloads | Check downloads + last update |
| **GitHub (Official Org)** | Repos under known organizations | 🟡 Medium | Organization reputation | Enterprise-backed |
| **GitHub (Individual)** | Personal repositories | 🔴 High | None | ⚠️ Review source code |
| **Docker Hub** | Pre-built containers | 🔴 Very High | None | ❌ High supply chain risk |

**Recommendation**:
- ✅ **Prefer**: Anthropic examples, npm packages with >10k weekly downloads
- ⚠️ **Review carefully**: GitHub repos (check stars, contributors, recent updates)
- ❌ **Avoid**: Pre-built Docker images from unknown sources (build yourself)

**npm Package Safety Checks**:
1. Weekly downloads: >5,000 is safer
2. Last update: Within 6 months
3. Dependencies: Fewer is better (<10 dependencies)
4. Organization: Known company or verified publisher
5. GitHub repo: Linked and active

---

### ChatGPT Plugins & Custom GPTs

| Source | URL | Risk Level | Vetting | Best For |
|--------|-----|------------|---------|----------|
| **OpenAI GPT Store (Featured)** | [chat.openai.com/gpts](https://chat.openai.com/gpts) | 🟢 Low | OpenAI review | Popular, vetted GPTs |
| **OpenAI GPT Store (All)** | GPT Store browse | 🟡 Medium | Community ratings | Niche use cases |
| **Third-Party Plugins** | Various websites | 🔴 High | None | ⚠️ Review permissions |
| **Custom GPT Links** | Direct links from forums | 🔴 Very High | None | ❌ Verify creator |

**Recommendation**:
- ✅ **Prefer**: Featured GPTs, GPTs with >1,000 conversations
- ⚠️ **Review carefully**: New GPTs, GPTs requesting web browsing + actions
- ❌ **Avoid**: GPTs asking for login credentials or payment info

**GPT Safety Checks**:
1. Creator: Verified badge or known organization
2. Conversations: >1,000 shows popularity
3. Permissions: Only what's needed (no unnecessary web browsing)
4. Reviews: Read 1-star reviews for red flags
5. Actions: Be very careful with GPTs that can execute actions

---

### AI Browser Extensions

| Source | Risk Level | Vetting | Best For |
|--------|------------|---------|----------|
| **Chrome Web Store (10k+ users)** | 🟡 Medium | Google review + scale | Popular extensions |
| **Chrome Web Store (<10k users)** | 🔴 High | Google review only | ⚠️ New/niche extensions |
| **Firefox Add-ons (Recommended)** | 🟢 Low-Medium | Mozilla review | Privacy-focused |
| **Edge Add-ons** | 🟡 Medium | Microsoft review | Windows users |
| **Safari Extensions** | 🟡 Medium | Apple review | Mac users |
| **Direct download (.crx files)** | 🔴 Very High | None | ❌ Never install |

**Recommendation**:
- ✅ **Prefer**: Extensions with >10,000 users, recent updates, good reviews
- ⚠️ **Review carefully**: Permissions requested (see [browser extension guide](guides/04-browser-extensions.md))
- ❌ **Avoid**: Extensions requesting "Read and change all your data on all websites" unless absolutely necessary

**Extension Safety Checks**:
1. Users: >10,000 is safer
2. Last update: Within 3 months
3. Reviews: >4.0 stars, read recent negative reviews
4. Permissions: Minimal (e.g., "active tab only" is safer than "all websites")
5. Developer: Known company or individual with multiple extensions

---

## 🔍 What Makes a Source "Trusted"?

### High-Trust Indicators (🟢 Green)
- ✅ First-party / official (Anthropic, OpenAI, etc.)
- ✅ Open source with >1,000 GitHub stars
- ✅ Regular updates (within 3-6 months)
- ✅ Multiple contributors (not just one person)
- ✅ Backed by known organization
- ✅ Community vetting (OpenClaw, featured in GPT Store)
- ✅ >10,000 users/downloads

### Medium-Trust Indicators (🟡 Yellow)
- ⚠️ Open source but <1,000 stars
- ⚠️ npm package with >1,000 weekly downloads
- ⚠️ Chrome extension with >1,000 users
- ⚠️ Last updated within 6-12 months
- ⚠️ Single reputable author
- ⚠️ Some community discussion (Reddit, Discord mentions)

### Low-Trust Indicators (🔴 Red)
- ❌ No source code available
- ❌ No updates in >12 months
- ❌ Single unknown author
- ❌ <100 downloads/users
- ❌ No reviews or all 5-star reviews (suspicious)
- ❌ Shared via file transfer (not official store)
- ❌ Requests excessive permissions
- ❌ Poor English in documentation (often sign of quick malware port)

---

## 🛠️ Recommended Safe Tools by Use Case

### For Claude Code Productivity

| Use Case | Tool/Skill | Source | Why Safe |
|----------|-----------|--------|----------|
| Code review | Anthropic official skills | First-party | Built by Anthropic |
| Documentation | OpenClaw verified skills | Community vetted | Reviewed by OpenClaw maintainers |
| File operations | Built-in Read/Write tools | First-party | Part of Claude Code |

**Avoid**: Random "productivity" skills that request filesystem access without clear need.

---

### For ChatGPT Enhancement

| Use Case | Tool | Source | Why Safe |
|----------|------|--------|----------|
| Web search | ChatGPT Plus (built-in) | First-party | Official OpenAI feature |
| Data analysis | Code Interpreter (built-in) | First-party | Sandboxed by OpenAI |
| Image generation | DALL-E (built-in) | First-party | Official integration |
| Summarization | Featured GPTs in GPT Store | OpenAI-featured | Reviewed for quality |

**Avoid**: Third-party plugins promising "unlock ChatGPT's full power" - usually unnecessary.

---

### For Browser Automation

| Use Case | Extension | Users | Why Safe |
|----------|-----------|-------|----------|
| General AI assistance | [Extension name redacted] | 500k+ | Popular, frequent updates |
| Grammar checking | Grammarly | 10M+ | Enterprise-grade, SOC 2 |
| Translation | Google Translate | Built-in | First-party |

**Avoid**: Extensions that "auto-fill forms with AI" - high data exposure risk.

---

## 🚫 Red Flags: When to Reject a Tool

Immediately reject if:

1. ❌ **Requests admin/root access** without clear justification
2. ❌ **Obfuscated code** (base64 encoding, minified without source maps)
3. ❌ **Asks for credentials** that the tool shouldn't need
4. ❌ **No source code available** for review
5. ❌ **Anonymous author** with no online presence
6. ❌ **Excessive permissions** (e.g., "access all files" for a calculator)
7. ❌ **Suspicious urgency** ("Install now before it's banned!")
8. ❌ **Too good to be true** ("Unlimited GPT-4 for free!")

---

## 📊 Source Comparison Matrix

| Criteria | First-Party (Anthropic/OpenAI) | OpenClaw / Featured | npm (Popular) | GitHub (Individual) | Direct Share |
|----------|-------------------------------|---------------------|---------------|---------------------|--------------|
| **Code Review** | Not needed (trust) | Recommended | Required | Required | **Required** |
| **Update Frequency** | Regular | Varies | Varies | Varies | Unknown |
| **Support Available** | Yes | Community | Community | Unlikely | No |
| **Supply Chain Risk** | Very Low | Low | Medium | High | **Very High** |
| **Recommended for CEOs** | ✅ Yes | ✅ Yes | ⚠️ With review | ⚠️ With review | ❌ No |

---

## 🎯 Source Selection Decision Tree

```
START: Where did you find this tool?
│
├─ "Official Anthropic / OpenAI docs"
│  └─> ✅ SAFE - Install with confidence
│
├─ "OpenClaw or GPT Store (Featured)"
│  └─> ✅ PROBABLY SAFE - Quick review with skill-scanner.py
│
├─ "npm package with >10k weekly downloads"
│  └─> ⚠️ REVIEW CAREFULLY - Check dependencies, last update, reputation
│
├─ "GitHub repo with >1,000 stars"
│  └─> ⚠️ REVIEW CAREFULLY - Use skill-scanner.py, read source
│
├─ "Chrome extension with >10k users"
│  └─> ⚠️ REVIEW PERMISSIONS - Check what it can access
│
├─ "Random GitHub repo / <100 downloads"
│  └─> ❌ HIGH RISK - Only if you can audit source code
│
├─ "Shared file from Discord/Slack/email"
│  └─> ❌ VERY HIGH RISK - Reject unless you personally know and trust the author
│
└─ "Pirated / cracked / 'unlocked' version"
   └─> ❌ NEVER INSTALL - Guaranteed malware risk
```

---

## 📋 Quick Checklist: Evaluating a New Source

Before installing from a new source, ask:

- [ ] Is this an official/first-party source? (Anthropic, OpenAI, Google, etc.)
- [ ] If not, does it have >1,000 users/downloads/stars?
- [ ] Is the source code publicly available?
- [ ] Has it been updated in the last 6 months?
- [ ] Are there positive reviews from real users?
- [ ] Does the author/org have a reputation to protect?
- [ ] Can I find independent discussions about this tool?
- [ ] Are the permissions requested reasonable?
- [ ] Did I scan it with skill-scanner.py or similar?
- [ ] Would I be comfortable explaining this install to my board?

**If you answer "No" to more than 3 questions**: High risk, escalate to security review.

---

## 🔄 When to Re-Evaluate a Source

Even trusted sources can become compromised. Re-evaluate if:

1. ⚠️ **Ownership changes** - Tool sold to new company
2. ⚠️ **Permissions increase** - Update requests new access
3. ⚠️ **Security incident** - Source had a breach
4. ⚠️ **Long gap in updates** - Abandoned project
5. ⚠️ **Community warnings** - Reddit/Twitter reports issues
6. ⚠️ **Quarterly reviews** - Standard re-assessment cadence

---

## 🌏 Southeast Asia Specific Considerations

### Localized AI Tools
- ⚠️ **SEA-specific tools** often have smaller user bases (harder to vet)
- ✅ **Regional leaders**: Grab, Shopee, GoTo may release AI tools (more trustworthy)
- ⚠️ **Language barriers**: Poor English docs = red flag for international tools

### Data Residency
- Check if tool stores data in SEA region (PDPA compliance)
- Singapore-based vendors generally higher trust for SEA companies
- Ask vendors: "Where is data processed and stored?"

---

## 📞 When to Escalate

Contact a security professional if:

- 🚨 Tool requests admin access but you're unsure why
- 🚨 Tool has mixed reviews (some very positive, some "it stole my data")
- 🚨 Source seems legitimate but your gut says something's off
- 🚨 You're installing for company-wide use (high blast radius)
- 🚨 Tool will access sensitive customer or financial data

**Better safe than sorry**: A $500 security consultation beats a $500k breach.

---

## 🔗 Related Resources

- [Skill Vetting Guide](guides/02-skill-vetting.md) - How to review individual Claude Code skills
- [MCP Server Security](guides/03-mcp-servers.md) - Evaluating MCP servers specifically
- [Browser Extension Security](guides/04-browser-extensions.md) - Extension-specific guidance
- [Data Protection](guides/06-data-protection.md) - What data tools can access

---

## 📚 External Resources

- [npm Security Best Practices](https://docs.npmjs.com/packages-and-modules/securing-your-code)
- [Chrome Extension Security](https://developer.chrome.com/docs/extensions/mv3/security/)
- [OWASP Supply Chain Security](https://owasp.org/www-project-dependency-check/)

---

**Last Updated**: February 2026
**Next Review**: May 2026 (quarterly)

---

**Remember**: No source is 100% safe forever. Trust, but verify. Use the scripts provided, follow the checklists, and when in doubt, ask for help.
