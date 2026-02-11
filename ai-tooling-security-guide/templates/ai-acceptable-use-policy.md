# AI Tools Acceptable Use Policy
**Company policy template for AI tool usage**

---

## Instructions

**Purpose**: Establish clear rules for employee use of AI tools (ChatGPT, Claude, Copilot, skills, plugins, etc.) to protect company data and ensure compliance.

**When to use**: Implement this policy BEFORE rolling out AI tools company-wide.

**How to customize**:
1. Replace all `[COMPANY NAME]` placeholders with your company name
2. Replace all `[DEPARTMENT/ROLE]` placeholders with appropriate team names
3. Check boxes in Section 3 for tools you approve
4. Fill in specific data classification examples from your company
5. Add your company's reporting contacts in Section 8
6. Have legal review before distribution
7. Require employee sign-off (digital or physical)

---

## Policy Information

**Company**: [COMPANY NAME] _______________________________________________

**Policy Version**: 1.0

**Effective Date**: ____________________ (YYYY-MM-DD)

**Last Reviewed**: ____________________ (YYYY-MM-DD)

**Policy Owner**: ____________________ (Name/Title - e.g., CTO, IT Director)

**Review Frequency**: [ ] Quarterly [ ] Semi-annually [ ] Annually

**Approved By**: ____________________ (CEO/Executive)

**Approval Date**: ____________________ (YYYY-MM-DD)

---

## Section 1: Policy Scope

### 1.1 Who This Policy Applies To

This policy applies to:
- [ ] All employees (full-time, part-time, contractors)
- [ ] Only specific departments: _______________________________________
- [ ] Only roles with access to sensitive data: _______________________

### 1.2 What Tools This Policy Covers

This policy governs the use of:
- [ ] **AI chatbots**: ChatGPT, Claude, Gemini, Perplexity, etc.
- [ ] **AI coding assistants**: GitHub Copilot, Claude Code, Cursor, Replit AI, etc.
- [ ] **AI writing assistants**: Grammarly, Jasper, Copy.ai, Notion AI, etc.
- [ ] **AI browser extensions**: Any extension using AI/ML
- [ ] **AI plugins/integrations**: ChatGPT plugins, Claude MCP servers, Slack AI, etc.
- [ ] **Custom AI tools**: Internally developed or third-party AI SaaS
- [ ] **AI-powered features**: In existing tools (Microsoft Copilot, Google Duet, Salesforce Einstein, etc.)

### 1.3 Environments Covered

This policy applies to use of AI tools:
- [ ] On company-owned devices (laptops, desktops, phones)
- [ ] On personal devices used for work (BYOD)
- [ ] On company networks/VPNs
- [ ] Using company accounts (email, SSO)
- [ ] Processing company data (regardless of device)

---

## Section 2: Policy Principles

**Core Principle**: AI tools are powerful productivity aids, but they introduce security and compliance risks. This policy balances innovation with protection.

**Key Principles**:
1. **Data Protection First**: Never share customer PII, credentials, or trade secrets with AI tools
2. **Approved Tools Only**: Use only vetted, approved AI tools for work
3. **Transparency**: Disclose AI usage where required (contracts, customer deliverables)
4. **Accountability**: Employees are responsible for AI-generated content accuracy
5. **Continuous Learning**: As AI evolves, so will this policy

---

## Section 3: Approved AI Tools

### 3.1 Pre-Approved Tools (Use Freely)

Employees may use these tools for work without additional approval:

**AI Chatbots**:
- [ ] ChatGPT Team (company account required)
- [ ] Claude for Work (company account required)
- [ ] Other: ____________________________________________________________

**AI Coding Assistants**:
- [ ] GitHub Copilot for Business (company license)
- [ ] Claude Code (with approved skills only)
- [ ] Other: ____________________________________________________________

**AI Writing Assistants**:
- [ ] Grammarly Business (company account)
- [ ] Notion AI (company workspace)
- [ ] Other: ____________________________________________________________

**AI Features in Existing Tools**:
- [ ] Microsoft Copilot (Microsoft 365 E3/E5)
- [ ] Google Duet AI (Google Workspace)
- [ ] Salesforce Einstein
- [ ] Other: ____________________________________________________________

**Conditions for Pre-Approved Tools**:
- Must use **company account** (not personal account)
- Must follow data classification rules (Section 4)
- Must not opt in to training on company data (verify settings)
- Must enable audit logging if available

### 3.2 Tools Requiring IT Approval

The following require IT/Security approval BEFORE use:

**Requires approval**:
- [ ] Claude Code skills from GitHub (must be vetted - see [Skill Vetting Guide](../guides/02-skill-vetting.md))
- [ ] MCP servers (must be sandboxed - see [MCP Servers Guide](../guides/03-mcp-servers.md))
- [ ] Browser extensions with AI features
- [ ] Third-party AI SaaS not on approved list
- [ ] AI APIs/SDKs for development
- [ ] Custom GPTs with external integrations

**Approval Process**:
1. Submit request to: [IT@company.com / Security@company.com]
2. Include: Tool name, vendor, use case, data it will access
3. IT will evaluate per [Vendor Evaluation Guide](../guides/07-vendor-evaluation.md)
4. Approval timeline: __________ business days
5. Approval valid for: __________ months (then re-review)

### 3.3 Prohibited Tools

The following are **NEVER permitted** for company work:

**Prohibited**:
- [ ] Free tier AI chatbots for customer data (ChatGPT Free, Claude Free, etc.)
- [ ] AI tools from unknown/unverified sources
- [ ] AI browser extensions from random developers (no reviews, new accounts)
- [ ] AI tools that don't provide Data Processing Agreements (DPAs)
- [ ] AI image generators for customer-facing work without rights verification
- [ ] Open-source AI models hosted on unvetted infrastructure
- [ ] "Jailbroken" or modified AI tools bypassing safety features

**Rationale**: These tools lack security controls, compliance certifications, or contractual protections needed for business use.

---

## Section 4: Data Classification & Handling

### 4.1 Data Classification Levels

[COMPANY NAME] classifies data into four levels. **Know what you're sharing before using AI.**

| Level | Examples | AI Tool Policy |
|-------|----------|----------------|
| **Public** | Published blog posts, marketing materials, public product specs | ✅ OK to share with any approved AI tool |
| **Internal** | Internal processes, meeting notes (non-sensitive), draft documents | ✅ OK with approved enterprise AI tools only |
| **Confidential** | Customer PII, contracts, financials, unreleased product plans | ⚠️ Anonymize before sharing, or use only DPA-backed enterprise AI |
| **Secret** | API keys, passwords, credentials, trade secrets, M&A plans | ❌ **NEVER share with AI tools** |

### 4.2 Specific Examples for [COMPANY NAME]

**Public** (safe for any approved AI):
- [ ] Example: [Published blog posts on our website]
- [ ] Example: [Public product documentation]
- [ ] Example: [Marketing copy for social media]
- [ ] Other: ____________________________________________________________

**Internal** (enterprise AI only):
- [ ] Example: [Internal wiki articles]
- [ ] Example: [Team meeting notes without customer details]
- [ ] Example: [Draft proposals without pricing]
- [ ] Other: ____________________________________________________________

**Confidential** (anonymize first or DPA-required):
- [ ] Example: [Customer contracts with names/emails]
- [ ] Example: [Sales pipeline data]
- [ ] Example: [Financial reports]
- [ ] Example: [Employee performance reviews]
- [ ] Other: ____________________________________________________________

**Secret** (NEVER in AI):
- [ ] Example: [Production database credentials]
- [ ] Example: [AWS/GCP API keys]
- [ ] Example: [Source code for proprietary algorithms]
- [ ] Example: [M&A target company names]
- [ ] Other: ____________________________________________________________

### 4.3 Anonymization Requirements

When sharing Confidential data with AI tools, **anonymize first**:

**Remove or redact**:
- [ ] Names (replace with "[NAME]" or "Customer A")
- [ ] Email addresses
- [ ] Phone numbers
- [ ] Account IDs, usernames
- [ ] IP addresses
- [ ] Financial amounts (or round to ranges: "$100k-$500k")
- [ ] Dates (or make relative: "Q3 2025" → "last quarter")
- [ ] Geographic identifiers (cities, addresses)

**Example of proper anonymization**:
```
❌ BAD (raw Confidential data):
"Customer john.smith@acmecorp.com in Singapore signed a $450,000 annual contract
for our Enterprise plan on Jan 15, 2026. He complained about pricing."

✅ GOOD (anonymized):
"Enterprise customer in APAC region signed ~$400k-$500k annual contract recently.
Feedback indicated pricing concerns during negotiation."
```

---

## Section 5: Prohibited Uses

Employees **may NOT** use AI tools for:

### 5.1 Data Sharing Violations

- [ ] Sharing customer PII (names, emails, phone numbers) without anonymization
- [ ] Sharing credentials (passwords, API keys, tokens, SSH keys)
- [ ] Sharing proprietary source code (unless tool has DPA and code is anonymized)
- [ ] Sharing unreleased product information
- [ ] Sharing financial data (revenue, contracts) without anonymization
- [ ] Sharing employee data (salaries, performance reviews)

### 5.2 Compliance Violations

- [ ] Violating customer Data Processing Agreements (check DPA restrictions on AI)
- [ ] Violating export controls (sharing controlled technical data with foreign AI providers)
- [ ] Violating GDPR/PDPA (using AI on EU/Singapore customer data without legal basis)
- [ ] Creating legal contracts or advice (AI is not a lawyer)
- [ ] Medical diagnoses or health advice for customers (AI is not a doctor)

### 5.3 Misrepresentation

- [ ] Passing off AI-generated work as entirely human-created when disclosure is required
- [ ] Using AI to impersonate individuals (deepfakes, voice clones)
- [ ] Generating fake reviews, testimonials, or social proof
- [ ] Creating misleading financial reports or data visualizations

### 5.4 Operational Risks

- [ ] Deploying AI-generated code to production without human review and testing
- [ ] Using AI to make automated decisions about hiring, firing, or promotions (bias risk)
- [ ] Relying solely on AI for critical security decisions
- [ ] Using AI to generate or audit financial statements without accountant review

---

## Section 6: Employee Responsibilities

### 6.1 Before Using AI

**Every time you use an AI tool for work, ask yourself**:
1. Is this tool on the approved list? (Section 3.1)
2. What data classification level am I sharing? (Section 4.1)
3. Am I following the data handling rules for that level? (Section 4.2)
4. Do I need to anonymize this data first? (Section 4.3)
5. Is this use case prohibited? (Section 5)

**If uncertain**: Don't use the tool. Ask your manager or IT/Security team first.

### 6.2 Account Hygiene

- [ ] **Use company accounts only** (not personal ChatGPT, Claude, etc.)
- [ ] **Enable MFA** on AI tool accounts
- [ ] **Never share accounts** (each employee gets their own login)
- [ ] **Log out on shared devices**
- [ ] **Report suspicious activity** (unexpected prompts, data requests)

### 6.3 Accuracy & Verification

**You are responsible for AI output accuracy.**

- [ ] **Review all AI-generated content** before using in deliverables
- [ ] **Fact-check AI claims** (AI hallucinates - verify facts, statistics, citations)
- [ ] **Test AI-generated code** (don't trust it blindly)
- [ ] **Disclose AI use** when required (client contracts, academic work, regulated industries)

### 6.4 Prompt Hygiene

**Craft prompts carefully**:
- [ ] Don't paste entire files into AI if they contain secrets (check first)
- [ ] Don't include credentials in example code shared with AI
- [ ] Don't use customer names in prompts (anonymize)
- [ ] Be aware that prompts may be logged or reviewed

---

## Section 7: IT/Security Responsibilities

### 7.1 Tool Vetting

IT/Security team will:
- [ ] Maintain approved tools list (Section 3.1) and update quarterly
- [ ] Vet new tools per [Vendor Evaluation Guide](../guides/07-vendor-evaluation.md)
- [ ] Negotiate DPAs with AI vendors
- [ ] Review AI vendor security certifications (SOC 2, ISO 27001)
- [ ] Monitor AI vendor security incidents

### 7.2 Employee Training

IT/Security will provide:
- [ ] Initial AI security training for all employees (completion required)
- [ ] Refresher training annually
- [ ] Updates when new tools are approved or policy changes
- [ ] Resources: [AI Tooling Security Guide](../README.md)

### 7.3 Monitoring & Auditing

IT/Security will:
- [ ] Monitor AI tool usage via SSO/IdP logs
- [ ] Audit AI tool permissions quarterly
- [ ] Review incident reports monthly
- [ ] Conduct spot checks on compliance

---

## Section 8: Incident Reporting

### 8.1 Reportable Incidents

**Report immediately if**:
- [ ] You accidentally shared Secret data with an AI tool
- [ ] You suspect an AI tool may have been compromised
- [ ] An AI tool behaved unexpectedly (asked for unusual data, generated harmful content)
- [ ] You installed an unapproved tool and now regret it
- [ ] You received a security warning about an AI tool you use
- [ ] Customer data may have been exposed via AI

**No penalties for honest mistakes reported promptly.** We want to know quickly so we can respond.

### 8.2 How to Report

**Immediate reporting** (within 1 hour):
- [ ] Email: [security@company.com]
- [ ] Slack: [#security-incidents]
- [ ] Phone: [+XX-XXXX-XXXX] (24/7 security hotline)

**Include**:
1. What happened (be specific)
2. Which AI tool was involved
3. What data was shared (classification level)
4. When it happened (date/time)
5. Your contact info

**Example report**:
```
Subject: AI Incident - Accidental Secret Data Exposure

I accidentally pasted our production AWS credentials into ChatGPT Team
while troubleshooting a deployment issue. This happened today (Feb 7, 2026)
at approximately 2:30 PM SGT.

Tool: ChatGPT Team (company account: john@company.com)
Data: Production AWS access key (SECRET level)
When: Feb 7, 2026, 14:30 SGT
Contact: John Smith, Engineering, john@company.com, ext. 1234

I have deleted the conversation in ChatGPT. Awaiting instructions.
```

### 8.3 Response Process

Upon receiving your report, IT/Security will:
1. **Acknowledge within 15 minutes** (during business hours)
2. **Assess severity** (LOW/MEDIUM/HIGH/CRITICAL)
3. **Take immediate action** (rotate credentials, revoke access, etc.)
4. **Investigate** per [Incident Response Guide](../guides/08-incident-response.md)
5. **Follow up** with you on resolution

**You will NOT be penalized for honest mistakes.** The goal is rapid response, not blame.

---

## Section 9: Enforcement

### 9.1 Violations

**Violations of this policy include**:
- Using prohibited AI tools (Section 3.3)
- Sharing Secret data with AI (Section 4)
- Failing to report incidents (Section 8)
- Intentionally bypassing security controls
- Repeated violations after warnings

### 9.2 Consequences

**First violation** (minor, unintentional):
- Verbal warning and retraining

**Second violation** or **first major violation** (e.g., exposing customer data):
- Written warning
- Mandatory security training
- Temporary restriction from AI tools

**Third violation** or **intentional misconduct**:
- Performance improvement plan
- Possible termination
- Legal action if data breach or compliance violation

### 9.3 Exceptions

Exceptions to this policy require written approval from:
- [ ] CTO/CIO
- [ ] CISO (Chief Information Security Officer)
- [ ] Legal Counsel
- [ ] CEO (for high-risk exceptions)

**Exception request form**: [Link to form or email IT@company.com]

---

## Section 10: Policy Updates

### 10.1 Change Log

| Version | Date | Changes | Author |
|---------|------|---------|--------|
| 1.0 | [Date] | Initial policy | [Name] |
| | | | |
| | | | |

### 10.2 Review Schedule

This policy will be reviewed:
- [ ] Quarterly (every 3 months)
- [ ] Semi-annually (every 6 months)
- [ ] Annually
- [ ] After major AI security incidents
- [ ] When new AI tools are introduced company-wide

**Next scheduled review**: ____________________ (YYYY-MM-DD)

---

## Section 11: Employee Acknowledgment

### 11.1 Acknowledgment Statement

**I acknowledge that I have**:
- [ ] Read and understood this AI Tools Acceptable Use Policy
- [ ] Completed required AI security training
- [ ] Understand the data classification levels and handling rules
- [ ] Know how to report AI security incidents
- [ ] Understand the consequences of policy violations
- [ ] Will use only approved AI tools for company work
- [ ] Will not share Secret data with AI tools
- [ ] Will verify accuracy of AI-generated content before use

**I agree to comply with this policy as a condition of my employment/contract with [COMPANY NAME].**

---

**Employee Signature**: _________________________________________________

**Printed Name**: ______________________________________________________

**Title/Department**: __________________________________________________

**Date**: ____________________ (YYYY-MM-DD)

---

**Manager/Supervisor Acknowledgment** (optional):

**Manager Signature**: _________________________________________________

**Printed Name**: ______________________________________________________

**Date**: ____________________ (YYYY-MM-DD)

---

## Section 12: Resources & Support

### 12.1 Internal Resources

**Questions about this policy**: [IT@company.com]

**Request new AI tool approval**: [Link to approval form]

**Report security incident**: [security@company.com] or [#security-incidents Slack]

**AI security training**: [Link to training portal]

**Data classification guide**: [Link to internal wiki/doc]

### 12.2 External Resources

**AI Tooling Security Guide**: [Link to this guide in company knowledge base]
- [Assessment](../guides/01-assessment.md) - Self-assessment scorecard
- [Skill Vetting](../guides/02-skill-vetting.md) - How to evaluate Claude Code skills
- [Vendor Evaluation](../guides/07-vendor-evaluation.md) - How to evaluate AI SaaS providers

**Vendor security documentation**:
- ChatGPT Team: https://openai.com/enterprise-privacy
- Claude for Work: https://www.anthropic.com/security
- GitHub Copilot: https://docs.github.com/en/copilot/overview-of-github-copilot/about-github-copilot-business

---

## Appendix A: Quick Reference Cheat Sheet

**Before using AI for work, check:**

✅ **Tool is approved** (Section 3.1)
✅ **Using company account** (not personal)
✅ **Data classification is OK** (Section 4)
✅ **Anonymized if Confidential** (Section 4.3)
✅ **Not a prohibited use** (Section 5)

**Data handling rules**:
- 🟢 **Public**: Any approved AI
- 🟡 **Internal**: Enterprise AI only
- 🟠 **Confidential**: Anonymize first
- 🔴 **Secret**: NEVER in AI

**Incident reporting**:
📧 [security@company.com]
📞 [Security hotline: +XX-XXXX-XXXX]
💬 [#security-incidents Slack]

**When in doubt, ASK first.**

---

## Template Version

**Template version**: 1.0.0
**Last updated**: February 2026
**Source**: AI Tooling Security Guide (MyEO AI Resources)

---

## Notes for Policy Administrators

### Customization Checklist

Before distributing this policy:
- [ ] Replace all [COMPANY NAME] placeholders
- [ ] Fill in approved tools list (Section 3.1)
- [ ] Add company-specific data classification examples (Section 4.2)
- [ ] Set approval process contacts and timelines (Section 3.2)
- [ ] Add incident reporting contacts (Section 8.2)
- [ ] Define enforcement consequences appropriate for company culture (Section 9.2)
- [ ] Have legal counsel review (especially Sections 5, 9, 11)
- [ ] Obtain executive approval (CEO/CTO signature)
- [ ] Set review frequency (Section 10.2)
- [ ] Create employee training materials (Section 7.2)
- [ ] Set up incident reporting channels (Section 8.2)

### Rollout Recommendations

1. **Soft launch** (Week 1): Share policy with managers/leadership for feedback
2. **Training** (Week 2-3): Conduct AI security training for all employees
3. **Acknowledgment** (Week 4): Require signed acknowledgment from all employees
4. **Enforcement begins** (Week 5): Policy is now active
5. **First review** (Month 3): Assess policy effectiveness, gather feedback, update

### Common Questions to Prepare For

**Q: Can I use ChatGPT Free for work?**
A: No, only ChatGPT Team (company account) is approved. Free tier doesn't have DPA or business protections.

**Q: What if I already installed a skill before this policy?**
A: Submit it for retroactive approval (Section 3.2). If rejected, uninstall it.

**Q: Can I use AI for personal tasks on my work laptop?**
A: Personal use on company devices should follow company device policy. If using personal AI accounts, never paste work data.

**Q: What if a customer asks if we used AI?**
A: Be honest. "We used AI tools to assist with [task], but all work was reviewed and verified by our team."

### Metrics to Track

Monitor policy effectiveness:
- Number of AI tool approval requests per month
- Number of incidents reported per quarter
- Employee training completion rate
- Policy violations (by severity)
- Time to resolve approval requests (aim for <5 business days)
