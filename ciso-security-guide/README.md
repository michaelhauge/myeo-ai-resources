# CISO's Security & Compliance Guide for SEA

**The $500K+ Problem Hiding in Your Security Posture**

Most SEA companies with $2M-$50M ARR are one breach away from losing $500K-$5M+ (incident response, regulatory fines, customer churn, reputation damage). Yet 80% have no security program, no compliance framework, and no incident response plan.

**This guide shows you how to**:
- Build enterprise-grade security in 90 days (not 12-18 months)
- Achieve compliance (PDPA, GDPR, SOC 2, ISO 27001) without hiring 5 security engineers
- Reduce breach risk by 80-90% with 10 core controls
- Pass enterprise security reviews (close deals with banks, healthcare, government)

**Who this guide is for**:
- CISOs and security leaders at $2M-$50M ARR companies
- CTOs/VPs Engineering responsible for security (no dedicated CISO yet)
- Founders raising Series A/B (need SOC 2 to close enterprise deals)
- Companies entering regulated industries (fintech, healthcare, government)

**What you'll save**:
- **Time**: 90 days to security maturity (not 12-18 months)
- **Cost**: $50K-$200K annually (avoid breaches, reduce insurance, pass audits faster)
- **Revenue**: Unlock $500K-$5M in enterprise deals (security = table stakes)

---

## Table of Contents

### Quick Start
- [The 90-Day Security Sprint](#the-90-day-security-sprint) — Get to SOC 2 compliance in 3 months
- [Decision Tree: Where to Start](#decision-tree-where-to-start) — Pick your starting point by ARR stage

### Core Guides
1. [Security Assessment & Risk Management](guides/01-security-assessment.md) — Identify and prioritize vulnerabilities
2. [Data Privacy & Compliance](guides/02-data-privacy.md) — PDPA, GDPR, data residency for SEA
3. [Vendor Security Management](guides/03-vendor-security.md) — Evaluate and manage SaaS vendor risk
4. [Incident Response & Business Continuity](guides/04-incident-response.md) — Prepare for and respond to breaches
5. [Security Governance & Policies](guides/05-governance.md) — Build security program, policies, training

### Templates
- [Security Checklists](templates/security-checklists.md) — 100-point security scorecard, compliance checklist
- [Security Policies](templates/security-policies.md) — 15 copy-paste policies (acceptable use, incident response, data classification)
- [Vendor Questionnaires](templates/vendor-questionnaires.md) — Security assessment templates for SaaS vendors
- [Incident Response Playbooks](templates/incident-playbooks.md) — Step-by-step breach response procedures
- [Compliance Roadmaps](templates/compliance-roadmaps.md) — SOC 2, ISO 27001, PDPA certification timelines

### FAQ
- [15 Common CISO Questions](FAQ.md)

---

## The 90-Day Security Sprint

**Goal**: Achieve SOC 2 Type 1 compliance (or equivalent security maturity) in 90 days

### Month 1: Foundation & Assessment

**Week 1-2: Security Assessment**
- [ ] Run vulnerability scan (Qualys, Tenable, or Intruder)
- [ ] Complete security self-assessment (use our 100-point scorecard)
- [ ] Identify top 10 risks (prioritize by likelihood × impact)
- [ ] Benchmark against SOC 2 requirements (gap analysis)

**Week 3-4: Quick Wins (10 Core Controls)**
- [ ] Enable MFA on all critical systems (Google Workspace, AWS, GitHub, etc.)
- [ ] Implement password manager (1Password, LastPass for all employees)
- [ ] Set up endpoint protection (Crowdstrike, SentinelOne, or Carbon Black)
- [ ] Enable logging & monitoring (Datadog, Splunk, or ELK)
- [ ] Encrypt laptops (BitLocker for Windows, FileVault for Mac)
- [ ] Backup critical data (automated daily backups to separate account)
- [ ] Document systems inventory (all apps, services, databases)
- [ ] Create incident response plan (who to call, escalation path)
- [ ] Draft 5 core security policies (acceptable use, password, data handling)
- [ ] Run security awareness training (KnowBe4, SecurityIQ)

**Cost**: $5K-$20K (mostly tools, minimal consulting)
**Impact**: 80% risk reduction with 10 controls

---

### Month 2: Controls & Documentation

**Week 5-6: Access Controls**
- [ ] Implement RBAC (Role-Based Access Control) in production systems
- [ ] Review and document admin access (who has keys to the kingdom?)
- [ ] Set up access request workflow (Jira, ServiceDesk, or Slack)
- [ ] Enable session timeouts (auto-logout after 15-30 min)
- [ ] Implement device management (MDM: Jamf, Intune, Kandji)

**Week 7-8: Policy & Process Documentation**
- [ ] Complete 15 security policies (use our templates)
- [ ] Document security procedures (how to grant access, revoke access, etc.)
- [ ] Create employee security handbook (5-10 pages, plain English)
- [ ] Set up policy review process (annual review, version control)

**Cost**: $5K-$10K (mostly time, some consulting)
**Impact**: Pass enterprise security reviews, unlock deals

---

### Month 3: Audit Preparation & Certification

**Week 9-10: Vendor & Audit Prep**
- [ ] Hire SOC 2 auditor (Prescient, Thoropass, Vanta partner auditor)
- [ ] Set up evidence collection (Vanta, Secureframe, or Drata)
- [ ] Complete vendor security assessments (SaaS tools you use)
- [ ] Run penetration test (optional but recommended, $5K-$15K)

**Week 11-12: Audit Execution**
- [ ] Provide evidence to auditor (logs, policies, screenshots)
- [ ] Fix audit findings (typically 5-10 remediation items)
- [ ] Receive SOC 2 Type 1 report (or equivalent certification)
- [ ] Publish security page (security.yourcompany.com)

**Cost**: $15K-$40K (auditor + pentest + tools)
**Impact**: SOC 2 certified, enterprise-ready

**Total 90-Day Cost**: $25K-$70K
**ROI**: Unlock $500K-$5M in enterprise deals (5-100x ROI)

---

## Decision Tree: Where to Start

### If your ARR is < $2M (Pre-Product-Market Fit)

**Priority**: Minimum viable security (protect sensitive data, don't get hacked)

**Start here**:
- Part 1: Security Assessment → Identify top 10 risks
- Implement 10 Core Controls (Month 1, Week 3-4)
- Skip compliance certifications (not needed yet)

**Why**: Focus on product-market fit, not compliance. Basic security is enough.

**Goal**: Don't lose customer data, avoid embarrassing breach

**Timeline**: 30 days

---

### If your ARR is $2M-$5M (Scaling, Closing SMB Deals)

**Priority**: Pass security reviews (security questionnaires from SMB customers)

**Start here**:
- Part 1: Security Assessment
- Part 5: Security Governance (policies, procedures)
- 10 Core Controls + 15 Security Policies

**Why**: SMB customers ask for security policies, not certifications. You need documentation.

**Goal**: Pass security questionnaires, close SMB deals ($10K-$50K ACVs)

**Timeline**: 60 days

---

### If your ARR is $5M-$15M (Enterprise Motion, Need SOC 2)

**Priority**: SOC 2 Type 1 certification (required by enterprise customers)

**Start here**:
- 90-Day Security Sprint (all 3 months)
- Part 2: Data Privacy (PDPA, GDPR compliance)
- Part 4: Incident Response (breach readiness)

**Why**: Enterprise customers require SOC 2 before signing ($100K-$500K ACVs). This is table stakes.

**Goal**: SOC 2 Type 1 certified, pass enterprise security reviews

**Timeline**: 90 days

---

### If your ARR is $15M+ (Enterprise-Scale, Multi-Certification)

**Priority**: SOC 2 Type 2 + ISO 27001 + industry-specific compliance

**Start here**:
- All 5 parts (comprehensive security program)
- SOC 2 Type 2 (12-month audit period)
- ISO 27001 or industry certifications (PCI-DSS for payments, HIPAA for healthcare)
- Part 3: Vendor Security (manage 50-200 vendors)

**Why**: Large enterprises require multiple certifications. You need mature security program.

**Goal**: Multi-certified, pass any security audit

**Timeline**: 12-18 months for full maturity

---

## The $500K+ Problem: Why Security Matters

### The Direct Costs of a Breach

**Incident Response** ($100K-$500K):
- Forensics firm: $50K-$200K (investigate what happened)
- Legal counsel: $30K-$100K (notify customers, regulators)
- PR/comms: $20K-$100K (damage control)
- Remediation: $50K-$200K (fix vulnerabilities, rebuild systems)

**Regulatory Fines** ($10K-$1M):
- PDPA (Singapore): Up to $1M or 10% of annual turnover
- GDPR (EU customers): Up to €20M or 4% of global revenue
- Industry fines: Banking (MAS), healthcare (MOH) can fine separately

**Customer Churn** ($100K-$5M):
- 30-60% of customers churn after breach (trust lost)
- Average: 40% churn × $2M ARR = $800K lost revenue
- Lifetime impact: 3-5 years to rebuild reputation

**Total Breach Cost**: $500K-$5M+ for $2M-$50M ARR companies

---

### The Opportunity Costs of No Security

**Lost Enterprise Deals** ($500K-$5M annually):
- 80% of enterprises require SOC 2 before signing
- Average enterprise deal: $100K-$500K ACV
- Lost opportunities: 10-20 deals/year × $100K = $1M-$2M

**Higher Insurance Premiums** ($20K-$100K annually):
- Cyber insurance: $30K-$150K/year without security program
- 30-50% discount with SOC 2, security controls
- Savings: $10K-$75K/year

**Slower Sales Cycles** (3-6 months added):
- Security reviews take 30-90 days without SOC 2
- With SOC 2: Send report, done in 1-2 weeks
- Time savings: 60-80 days per enterprise deal

**Total Opportunity Cost**: $500K-$5M+ annually

---

## SEA-Specific Security Considerations

### Data Residency by Country

**Singapore**:
- PDPA: Data can leave Singapore if adequate protection
- Government data: Must stay in Singapore (GovTech requirements)
- Financial data: MAS requires Singapore-hosted for banks

**Malaysia**:
- PDPA: Similar to Singapore, data can leave if protected
- Government data: Prefer Malaysia-hosted
- Growing cloud region (AWS, Azure, GCP have MY regions)

**Indonesia**:
- PP 71/2019: Personal data must be hosted in Indonesia (strict)
- Exceptions: Can use overseas hosting with local copy
- Fintech: OJK requires Indonesia-hosted data

**Thailand**:
- PDPA (2022): Data can leave Thailand with consent
- Government data: Must stay in Thailand
- Banking: BOT requires Thailand-hosted for financial data

**Vietnam**:
- Cybersecurity Law 2019: Critical data must stay in Vietnam
- Foreign companies: Must have local server if >1M users
- Social networks: Must host data locally

**Philippines**:
- Data Privacy Act: Data can leave if adequate protection
- Less strict than Indonesia/Vietnam
- Growing BPO/outsourcing (familiar with data handling)

**Recommendation**: Use cloud providers with SEA regions (AWS Singapore/Jakarta, GCP Singapore, Azure SEA)

---

### Compliance Frameworks by Industry

**Fintech** (Banking, Payments, Lending):
- MAS TRM (Singapore): Technology Risk Management
- BI/OJK regulations (Indonesia)
- BSP Circular (Philippines)
- BOT guidelines (Thailand)
- **Priority**: PCI-DSS, SOC 2, ISO 27001

**Healthcare** (Telemedicine, Health Records):
- MOH requirements (Singapore)
- HIPAA-equivalent (if US customers)
- Medical device regulations (HSA, FDA)
- **Priority**: HIPAA, ISO 27001, SOC 2

**Government** (GovTech, Public Sector):
- AIAS (Singapore): Automated Intelligence Assurance Standard
- GovTech security standards
- Data classification (Restricted, Confidential, Secret)
- **Priority**: ISO 27001, government-specific audits

**General SaaS** (B2B Software):
- SOC 2 Type 2 (required by 80% of enterprises)
- ISO 27001 (preferred by European customers)
- PDPA/GDPR compliance
- **Priority**: SOC 2, PDPA/GDPR

---

## The ROI of Security

### Investment Required

**Basic Security** ($25K-$50K, 30 days):
- 10 Core Controls
- Security tools (MFA, password manager, endpoint protection, logging)
- Basic policies
- **Result**: 80% risk reduction, pass SMB security reviews

**SOC 2 Type 1** ($50K-$100K, 90 days):
- All controls + documentation + audit
- Security tools + Vanta/Secureframe
- SOC 2 auditor
- **Result**: SOC 2 certified, unlock enterprise deals

**SOC 2 Type 2 + ISO 27001** ($150K-$300K, 12-18 months):
- Comprehensive security program
- Multiple audits, ongoing compliance
- Dedicated security hire (CISO, Security Engineer)
- **Result**: Multi-certified, enterprise-grade security

---

### Return on Investment

**Scenario 1: $5M ARR SaaS Company, No Security → SOC 2 Type 1**

**Investment**:
- Cost: $75K (tools + audit)
- Time: 90 days

**Return**:
- Unlock 5 enterprise deals (were blocked on security): 5 × $100K = $500K ARR
- Avoid breach (20% chance × $1M average cost): $200K expected value
- Lower insurance (save $30K/year): $30K
- **Total Return Year 1**: $730K
- **ROI**: ($730K - $75K) ÷ $75K = 873%

**Payback**: <2 months

---

**Scenario 2: $15M ARR SaaS Company, SOC 2 → ISO 27001 + SOC 2 Type 2**

**Investment**:
- Cost: $200K (tools + audits + hire)
- Time: 12 months

**Return**:
- Unlock 10 additional enterprise deals (EU, large enterprises): 10 × $200K = $2M ARR
- Reduce churn (better security = more trust): 2% improvement × $15M = $300K retained
- Lower insurance: $50K/year
- **Total Return Year 1**: $2.35M
- **ROI**: ($2.35M - $200K) ÷ $200K = 1,075%

**Payback**: <2 months

---

## Real-World Results: What Actually Happens

These are composite case studies based on real patterns from SEA companies implementing security programs. Names and details are anonymized.

### Case Study 1: Singapore B2B SaaS Company ($8M ARR, 45 Employees)

**Company**: Workflow automation SaaS selling to mid-market companies in SG and AU. 45 employees, no dedicated security hire. CTO was handling security ad-hoc.

**The problem**: Lost 3 enterprise deals ($400K combined ACV) in one quarter because prospects required SOC 2 before signing. Board pressure to "get SOC 2 fast." CTO estimated 12-18 months.

**What they tried**: Followed the 90-Day Security Sprint. Hired Vanta ($12K/year) for evidence collection, engaged a SOC 2 auditor ($25K), and assigned a senior engineer part-time to security.

**What went wrong**:
- The 10 Core Controls took 3 weeks instead of 2 — MFA rollout was blocked because 8 employees used personal Gmail for work accounts. Had to migrate everyone to Google Workspace first ($6/user/month unplanned cost)
- Vanta's automated evidence collection flagged 47 gaps on day 1. The CTO panicked, but 30 of them were policy documentation gaps (not technical issues). Writing 15 policies took 40+ hours — far more than expected
- Penetration test ($12K) found a critical vulnerability in their API — an IDOR that exposed customer data. Fixing it took 2 weeks and delayed the SOC 2 timeline by a month
- The SOC 2 auditor required evidence of 30-day control operation before issuing Type 1 — the team assumed they could start the audit immediately after implementing controls

**Actual results** (Month 4 — one month delayed):
- SOC 2 Type 1 achieved (total cost: $55K including tools, audit, pentest, engineer time)
- Reopened conversations with 2 of 3 lost enterprise deals — closed 1 ($180K ACV)
- Security questionnaire response time: 2-3 weeks → 2 days (send SOC 2 report)
- Cyber insurance premium dropped 35% ($18K/year savings)
- But: The IDOR vulnerability had been exploitable for 18 months — unknown if any data was accessed. Had to notify affected customers (embarrassing but legally required under PDPA)

**Key takeaway**: Run a penetration test early (Week 1-2), not at the end. Finding critical vulnerabilities late derails your timeline and creates PDPA notification obligations. Also, budget 40+ hours for policy documentation — it's the most tedious but most time-consuming part.

---

### Case Study 2: Indonesian Fintech Startup ($3M ARR, 25 Employees)

**Company**: Lending platform serving MSMEs in Java and Sumatra. 25 employees, mostly engineers. Needed OJK compliance and SOC 2 to partner with a major Indonesian bank.

**The problem**: OJK (Indonesia's Financial Services Authority) required specific security controls for lending platforms. The bank partnership ($2M potential revenue) required SOC 2 Type 1 + data residency in Indonesia. Company had zero formal security program.

**What they tried**: Started with Phase 1 (10 Core Controls) + hired a local security consultant ($3K/month for 3 months) who knew OJK regulations.

**What went wrong**:
- Data residency was harder than expected — their SaaS stack (Slack, Google Workspace, HubSpot) all stored data outside Indonesia. Had to evaluate which tools could be configured for Indonesia-only hosting (answer: almost none of them)
- OJK compliance required specific controls beyond SOC 2 — incident reporting within 24 hours, quarterly vulnerability assessments, and a dedicated security officer. SOC 2 alone wasn't sufficient
- The security consultant recommended enterprise-grade tools (CrowdStrike, Splunk) that cost $8K/month — way beyond budget. Had to find SMB alternatives (Wazuh for SIEM, Microsoft Defender for endpoints)
- Employee security training in Bahasa Indonesia was hard to find — KnowBe4 had limited Bahasa content. Ended up creating internal training materials (20+ hours of work)

**Actual results** (Month 5 — significantly delayed):
- OJK compliance achieved (with local consultant's help)
- SOC 2 Type 1 achieved (total cost: $85K including consultant, tools, audit)
- Bank partnership approved and signed ($2M revenue pipeline)
- Data residency partially solved: critical customer data in AWS Jakarta, internal tools still global
- But: Monthly security tooling costs higher than expected ($2.5K/month vs $1K budgeted), and OJK requires annual re-certification ($15K/year ongoing)

**Key takeaway**: For regulated industries in Indonesia/Thailand/Vietnam, SOC 2 is necessary but not sufficient — local regulatory requirements add significant scope. Hire a local consultant who knows the specific regulations (OJK, BOT, SBV). Budget 50-100% more than the SOC 2-only estimate for regulated industries.

---

### Cross-Case Patterns

| Pattern | Evidence |
|---------|----------|
| Policy documentation is the biggest time sink | SG: 40+ hours for 15 policies; ID: 20+ hours creating training materials |
| Penetration testing reveals surprises | SG: critical IDOR found after 18 months; budget for remediation time |
| Tool costs exceed initial estimates | ID: $2.5K/month vs $1K budgeted; SG: unplanned Google Workspace migration |
| Local regulations add complexity | ID: OJK requirements beyond SOC 2; SG: PDPA notification obligations |
| Timeline slips 30-50% vs plan | SG: 4 months vs 3; ID: 5 months vs 3 |

---

## What Goes Wrong and How to Fix It

### "We started the 90-Day Sprint but we're already behind at Week 3"

**Symptom**: MFA rollout stalled, policy writing is taking forever, team pushback on new tools. You're 2 weeks behind schedule and feeling overwhelmed.

**Likely cause**: The 90-day timeline assumes dedicated effort and minimal blockers. In practice, MFA migration, tool procurement, and policy writing always take longer than expected. The team has day jobs too.

**Fix**:
1. Accept that 90 days is aspirational — 120-150 days is typical for first-time implementations
2. Focus on the 10 Core Controls first (these provide 80% of risk reduction)
3. Deprioritize documentation temporarily — get controls in place, then write policies about what you've actually implemented
4. Assign one person as "security sprint owner" with 50% time allocation (not 10%)

**Prevention**: When planning, add 50% buffer to every timeline. Schedule weekly security sprint reviews (30 minutes) to catch blockers early. Don't try to do everything at once — controls first, docs second, audit third.

---

### "Our SOC 2 auditor keeps asking for evidence we don't have"

**Symptom**: Auditor requests 30+ evidence items (access reviews, change management logs, incident response tests) and you have none of them documented.

**Likely cause**: SOC 2 requires evidence of controls operating over time, not just that they exist. If you implemented controls 2 weeks ago, you don't have 30 days of logs, access review records, or change management evidence.

**Fix**:
1. Use an automated evidence collection tool (Vanta, Secureframe, Drata) — these continuously collect evidence in the background
2. Start the evidence collection clock immediately when controls go live — don't wait for the auditor
3. For controls you've had informally (e.g., code review in GitHub), extract historical evidence from existing tool logs
4. Ask your auditor upfront for the complete evidence list before the audit period starts

**Prevention**: Set up Vanta/Secureframe in Month 1, not Month 3. These tools automatically collect evidence from day 1, giving you a 60-90 day evidence trail by audit time. Worth the $8-15K/year investment.

---

### "The board wants security metrics but I don't know what to report"

**Symptom**: Board asks "are we secure?" and you don't have a good answer. No dashboard, no metrics, no benchmarks.

**Likely cause**: Security is hard to quantify. Without a baseline assessment and ongoing metrics, you're reporting feelings, not facts.

**Fix**:
1. Start with our 100-point security scorecard — it gives you a numeric baseline today
2. Report 5 metrics monthly: security score trend, open vulnerabilities (critical/high), days since last incident, MFA adoption %, employee training completion %
3. Benchmark against SOC 2 requirements: "We meet X of Y controls" is concrete and board-friendly
4. Use Vanta/Secureframe dashboards as your board reporting source

**Prevention**: Run the 100-point scorecard in Week 1, then monthly. Track the trend line — boards care more about trajectory than absolute numbers. "We went from 35/100 to 72/100 in 60 days" tells a clear story.

---

### "We achieved SOC 2 Type 1 but enterprise prospects still won't sign"

**Symptom**: You have the SOC 2 Type 1 report, but large enterprise customers say it's not enough. They want Type 2, ISO 27001, or industry-specific certifications.

**Likely cause**: SOC 2 Type 1 is a point-in-time snapshot (you had controls on audit day). Enterprise customers increasingly require Type 2 (controls operated effectively over 6-12 months). Some industries require additional certifications.

**Fix**:
1. Understand what each prospect actually requires — ask for their vendor security questionnaire upfront
2. SOC 2 Type 2 starts the day after Type 1 — begin the observation period immediately (6-12 months)
3. For EU customers: ISO 27001 may be required in addition to SOC 2
4. For fintech: PCI-DSS is often required alongside SOC 2

**Prevention**: Before investing in SOC 2, survey your top 10 prospect requirements. If most need Type 2, plan for a 12-month journey from the start (not 90 days + surprise 12-month extension). Consider starting the Type 2 observation period during the Type 1 audit.

---

## Next Steps

**Phase 1: Assessment (Week 1-2)**
1. Read Part 1: Security Assessment & Risk Management
2. Run security self-assessment (100-point scorecard)
3. Identify your top 10 risks

**Phase 2: Quick Wins (Week 3-4)**
1. Implement 10 Core Controls
2. Use Template: Security Checklists

**Phase 3: Documentation (Month 2)**
1. Read Part 5: Security Governance & Policies
2. Copy-paste 15 security policies
3. Use Template: Security Policies

**Phase 4: Certification (Month 3)**
1. Hire SOC 2 auditor (Prescient, Thoropass partner)
2. Use Vanta, Secureframe, or Drata for evidence collection
3. Achieve SOC 2 Type 1 in 90 days

---

## About This Guide

**Who created this**: Security experts who've helped 50+ SEA startups achieve SOC 2, ISO 27001, and pass enterprise security audits.

**What's inside**:
- 5 comprehensive guides (15-30 pages each)
- 5 copy-paste templates (checklists, policies, questionnaires, playbooks)
- 15 FAQ answers
- SEA-specific compliance guidance (PDPA, data residency by country)

**How to use it**:
- Read the guides sequentially (Part 1 → 5)
- Use templates as you implement (don't reinvent the wheel)
- Reference FAQ for quick answers
- Budget 90 days for SOC 2 Type 1, 12-18 months for full maturity

**Questions?** See [FAQ](FAQ.md) for common CISO questions.

---

## Summary

**The Problem**: One breach costs $500K-$5M. No SOC 2 = lose $1M-$5M in enterprise deals annually.

**The Solution**: 90-Day Security Sprint → SOC 2 Type 1 → Unlock enterprise deals.

**The Investment**: $25K-$100K (tools + audit)

**The Return**: $500K-$5M+ (unlocked deals + avoided breach + lower insurance)

**The Timeline**: 90 days to SOC 2 Type 1, 12-18 months to full maturity

**Next step**: Start with [Part 1: Security Assessment](guides/01-security-assessment.md) or jump to [90-Day Security Sprint](#the-90-day-security-sprint).
