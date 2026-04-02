# Part 5: Security Governance & Policies

**The Reality**: Policies are not optional — SOC 2 auditors will ask for 15+ security policies. Enterprise customers will request your security policies before signing. Regulators will ask for policies after a breach. Yet 70% of startups have zero written policies.

**This guide covers**:
- Building a security program (framework, roadmap, metrics)
- 15 essential security policies (acceptable use, incident response, data classification)
- Security awareness training (what to cover, how often, tools)
- Compliance roadmap (SOC 2, ISO 27001, PDPA)
- Reporting to board/management (metrics that matter)

---

## Step 1: Security Program Framework

**The 5 pillars of a security program**:

1. **Governance** (policies, procedures, compliance)
2. **Asset Management** (inventory, classification, ownership)
3. **Access Control** (authentication, authorization, least privilege)
4. **Threat Management** (vulnerability scanning, incident response)
5. **Resilience** (backups, business continuity, disaster recovery)

**Maturity model** (where are you now?):

**Level 1: Ad-hoc** (0-30 points)
- No written policies
- No security tools
- No dedicated security person
- Reactive (only respond to incidents)

**Level 2: Basic** (30-50 points)
- Some policies written (but not enforced)
- Basic security tools (antivirus, firewall)
- CTO handles security (no dedicated resource)
- Mostly reactive (some proactive patching)

**Level 3: Managed** (50-70 points)
- All policies written and enforced
- Security tools in place (MFA, logging, monitoring)
- Dedicated security person (CISO or Security Engineer)
- Proactive (regular vulnerability scans, annual pentests)

**Level 4: Optimized** (70-90 points)
- Policies reviewed annually
- Advanced security tools (SIEM, EDR, CASB)
- Security team (CISO + 1-2 engineers)
- Continuous improvement (automated scanning, threat hunting)

**Level 5: Leading** (90-100 points)
- Industry-leading security (publish security research)
- Full security team (CISO + 3-5 engineers)
- Continuous monitoring (24/7 SOC)
- Innovation (contribute to open-source security tools)

**Goal by ARR**:
- **<$2M ARR**: Level 2 (Basic) — 30-50 points
- **$2M-$5M ARR**: Level 3 (Managed) — 50-70 points
- **$5M-$15M ARR**: Level 3-4 (Managed to Optimized) — 70-85 points
- **$15M+ ARR**: Level 4-5 (Optimized to Leading) — 85-100 points

---

## Step 2: Security Roadmap (90 Days to SOC 2)

**Month 1: Foundation & Assessment**

**Week 1-2: Security Assessment**
- [ ] Run vulnerability scan (Qualys, Tenable, or Intruder)
- [ ] Complete 100-point security scorecard (Part 1)
- [ ] Identify top 10 risks (prioritize by likelihood × impact)
- [ ] Benchmark against SOC 2 requirements (gap analysis)

**Week 3-4: Quick Wins (10 Core Controls)**
- [ ] Enable MFA on all critical systems (Google Workspace, AWS, GitHub)
- [ ] Implement password manager (1Password, LastPass)
- [ ] Set up endpoint protection (Crowdstrike, SentinelOne, Carbon Black)
- [ ] Enable logging & monitoring (Datadog, Splunk, ELK)
- [ ] Encrypt laptops (BitLocker for Windows, FileVault for Mac)
- [ ] Backup critical data (automated daily backups)
- [ ] Document systems inventory (all apps, services, databases)
- [ ] Create incident response plan (who to call, escalation path)
- [ ] Draft 5 core security policies (acceptable use, password, data handling)
- [ ] Run security awareness training (KnowBe4, SecurityIQ)

**Cost**: $5K-$20K (mostly tools, minimal consulting)
**Impact**: 80% risk reduction with 10 controls

---

**Month 2: Controls & Documentation**

**Week 5-6: Access Controls**
- [ ] Implement RBAC (Role-Based Access Control)
- [ ] Review and document admin access (who has keys to the kingdom?)
- [ ] Set up access request workflow (Jira, ServiceDesk, Slack)
- [ ] Enable session timeouts (auto-logout after 15-30 min)
- [ ] Implement device management (MDM: Jamf, Intune, Kandji)

**Week 7-8: Policy & Process Documentation**
- [ ] Complete 15 security policies (use templates in this guide)
- [ ] Document security procedures (how to grant access, revoke access)
- [ ] Create employee security handbook (5-10 pages, plain English)
- [ ] Set up policy review process (annual review, version control)

**Cost**: $5K-$10K (mostly time, some consulting)
**Impact**: Pass enterprise security reviews

---

**Month 3: Audit Preparation & Certification**

**Week 9-10: Vendor & Audit Prep**
- [ ] Hire SOC 2 auditor (Prescient, Thoropass, Vanta partner auditor)
- [ ] Set up evidence collection (Vanta, Secureframe, Drata)
- [ ] Complete vendor security assessments (SaaS tools you use)
- [ ] Run penetration test (optional but recommended, $5K-$15K)

**Week 11-12: Audit Execution**
- [ ] Provide evidence to auditor (logs, policies, screenshots)
- [ ] Fix audit findings (typically 5-10 remediation items)
- [ ] Receive SOC 2 Type 1 report
- [ ] Publish security page (security.yourcompany.com)

**Cost**: $15K-$40K (auditor + pentest + tools)
**Impact**: SOC 2 certified, enterprise-ready

**Total 90-Day Cost**: $25K-$70K
**ROI**: Unlock $500K-$5M in enterprise deals (5-100x ROI)

---

## Step 3: 15 Essential Security Policies

**Policy structure** (use this template for all policies):

```markdown
# [Policy Name]

**Version**: 1.0
**Effective Date**: [DATE]
**Owner**: [CISO/CTO]
**Reviewed**: [Annual review date]

## Purpose
[Why this policy exists]

## Scope
[Who this policy applies to: all employees, contractors, vendors]

## Policy
[The actual rules]

## Procedures
[How to implement this policy]

## Exceptions
[When exceptions are allowed]

## Enforcement
[Consequences of violating this policy]

## Review
This policy will be reviewed annually by [Owner].
```

### 1. Acceptable Use Policy

**Purpose**: Define acceptable use of company systems and data

**Key requirements**:
- [ ] Company systems are for business use only (personal use limited)
- [ ] No illegal activity (piracy, hacking, harassment)
- [ ] No installing unauthorized software (shadow IT)
- [ ] No sharing passwords or credentials
- [ ] Report security incidents to security@yourcompany.com

**Example rule**:
> Employees may use company devices for reasonable personal use (email, web browsing) but must not install unauthorized software, access illegal content, or share confidential information outside the company.

---

### 2. Password Policy

**Purpose**: Ensure strong passwords and proper credential management

**Key requirements**:
- [ ] Minimum 12 characters (or 8 with MFA)
- [ ] Use password manager (1Password, LastPass)
- [ ] No password reuse across systems
- [ ] MFA required for critical systems (Google Workspace, AWS, GitHub)
- [ ] Passwords changed after breach or suspicious activity

**Example rule**:
> All employees must use unique passwords of at least 12 characters for all company systems. Passwords must be stored in a company-approved password manager (1Password). Multi-factor authentication (MFA) is required for all critical systems including email, cloud infrastructure, and code repositories.

---

### 3. Data Classification Policy

**Purpose**: Label data by sensitivity level to determine protection requirements

**4 levels**:
- **Public**: Marketing materials, blog posts (no protection required)
- **Internal**: Internal wikis, project plans (encryption in transit)
- **Confidential**: Customer PII, financial data (encryption at rest + in transit)
- **Restricted**: Credit cards, passwords, health data (encryption + field-level encryption + minimal access)

**Example rule**:
> All data must be classified as Public, Internal, Confidential, or Restricted. Confidential and Restricted data must be encrypted at rest and in transit. Access to Restricted data requires MFA and is logged.

---

### 4. Data Retention & Deletion Policy

**Purpose**: Don't keep data longer than necessary

**Retention periods**:
- Customer account data: 90 days after account closure
- Marketing data: Delete immediately after unsubscribe
- Transaction history: 7 years (tax/accounting requirement)
- Support tickets: 2 years
- Logs: 90 days (application), 1 year (security)

**Example rule**:
> Customer account data will be deleted 90 days after account closure, except transaction history which will be retained for 7 years for accounting purposes. All other personal data will be deleted or anonymized after the retention period.

---

### 5. Access Control Policy

**Purpose**: Grant minimum necessary access (least privilege)

**Key requirements**:
- [ ] Role-Based Access Control (RBAC) for all systems
- [ ] New employee access requests via Jira/ServiceDesk
- [ ] Quarterly access reviews (remove unnecessary access)
- [ ] Immediate access revocation upon termination
- [ ] No shared accounts (each person has unique login)

**Example rule**:
> Access to company systems will be granted based on job role (RBAC). All access requests must be approved by manager and provisioned by IT. Access will be reviewed quarterly and revoked immediately upon employee termination.

---

### 6. Remote Access Policy

**Purpose**: Secure remote work (VPN, MDM, encryption)

**Key requirements**:
- [ ] VPN required for accessing internal systems
- [ ] Laptop encryption required (BitLocker, FileVault)
- [ ] MDM for company devices (Jamf, Intune, Kandji)
- [ ] No public WiFi without VPN
- [ ] Auto-lock after 5 minutes of inactivity

**Example rule**:
> Employees working remotely must connect via company VPN to access internal systems. All company laptops must have full-disk encryption enabled. Public WiFi connections require VPN. Devices must auto-lock after 5 minutes.

---

### 7. Incident Response Policy

**Purpose**: Define how to respond to security incidents

**Key requirements**:
- [ ] Report incidents to security@yourcompany.com
- [ ] Incident Response Team (CISO, Tech Lead, Legal, PR, CEO)
- [ ] Incident classification (P0/P1/P2/P3 severity)
- [ ] 72-hour breach notification (GDPR requirement)
- [ ] Post-mortem after every P0/P1 incident

**Example rule**:
> All security incidents must be reported to security@yourcompany.com immediately. The Incident Response Team will be activated for P0/P1 incidents. Customer data breaches will be notified within 72 hours per GDPR requirements. All incidents will be documented in a post-mortem report.

---

### 8. Vendor Security Policy

**Purpose**: Assess and manage third-party vendor risk

**Key requirements**:
- [ ] Tier 1 vendors (customer data access) require SOC 2 Type 2
- [ ] Security questionnaire before onboarding
- [ ] Data Processing Agreement (DPA) required
- [ ] Annual vendor reviews (re-run security questionnaire)
- [ ] Immediate vendor offboarding (revoke access, delete data)

**Example rule**:
> All Tier 1 vendors (those with access to customer data) must have SOC 2 Type 2 certification and sign a Data Processing Agreement (DPA) before being granted access. Vendors will be reassessed annually and offboarded immediately upon contract termination.

---

### 9. Backup & Recovery Policy

**Purpose**: Ensure data can be restored after incident

**Key requirements**:
- [ ] 3-2-1 backup rule (3 copies, 2 media, 1 offsite)
- [ ] Hourly backups for production databases
- [ ] Daily backups for files/documents
- [ ] Monthly backup testing (restore from backup)
- [ ] Backups encrypted and stored in separate AWS account

**Example rule**:
> Production databases will be backed up hourly to a separate AWS account. Backups will be encrypted at rest (AES-256). Backup restores will be tested monthly. Backups will be retained for 90 days.

---

### 10. Change Management Policy

**Purpose**: Prevent production outages from unreviewed changes

**Key requirements**:
- [ ] All production changes require pull request (PR) review
- [ ] At least 1 engineer approval before merge
- [ ] Automated tests must pass before merge
- [ ] Staging deployment before production
- [ ] Rollback plan documented before major changes

**Example rule**:
> All code changes to production require a pull request reviewed by at least one other engineer. Automated tests must pass. Changes must be deployed to staging before production. Major changes require documented rollback plans.

---

### 11. Physical Security Policy

**Purpose**: Protect physical devices (laptops, servers, offices)

**Key requirements**:
- [ ] Laptop encryption required (BitLocker, FileVault)
- [ ] Screen lock after 5 minutes (auto-lock)
- [ ] No unattended laptops in public places
- [ ] Report stolen/lost devices immediately
- [ ] Office access badges (if physical office)

**Example rule**:
> All company laptops must have full-disk encryption enabled and auto-lock after 5 minutes. Employees must not leave laptops unattended in public places. Lost or stolen devices must be reported to IT immediately for remote wipe.

---

### 12. BYOD (Bring Your Own Device) Policy

**Purpose**: Secure personal devices used for work

**Key requirements**:
- [ ] Company data only on company devices (no BYOD for customer data)
- [ ] If BYOD allowed: MDM required, encryption required, remote wipe capability
- [ ] Email access via mobile app (not browser)
- [ ] No storing customer data on personal devices

**Example rule**:
> Company data must only be accessed from company-issued devices. Personal devices (BYOD) may access company email via mobile app but must not store customer data. If BYOD is required, devices must be enrolled in MDM and have encryption enabled.

---

### 13. Cryptography Policy

**Purpose**: Define encryption standards

**Key requirements**:
- [ ] TLS 1.2 or higher for data in transit
- [ ] AES-256 for data at rest
- [ ] No storing credit card numbers (use tokenization)
- [ ] No storing passwords in plaintext (use bcrypt, scrypt, argon2)
- [ ] Secrets stored in Secrets Manager (AWS, HashiCorp Vault)

**Example rule**:
> All data in transit must use TLS 1.2 or higher. Data at rest must be encrypted with AES-256. Passwords must be hashed with bcrypt (minimum 10 rounds). API keys and secrets must be stored in AWS Secrets Manager, not hardcoded.

---

### 14. Security Awareness Training Policy

**Purpose**: Educate employees on security best practices

**Key requirements**:
- [ ] Annual security awareness training (all employees)
- [ ] New hire security training (within 7 days of start)
- [ ] Quarterly phishing simulations (KnowBe4, SecurityIQ)
- [ ] Incident response training (IR team only)
- [ ] Training completion tracked (HR system)

**Example rule**:
> All employees must complete annual security awareness training covering phishing, password security, data handling, and incident reporting. New hires must complete training within 7 days of start. Quarterly phishing simulations will be conducted.

---

### 15. Asset Management Policy

**Purpose**: Track all devices and systems

**Key requirements**:
- [ ] Asset inventory (all laptops, servers, SaaS tools)
- [ ] Asset ownership (who owns each system)
- [ ] Asset classification (critical, important, non-critical)
- [ ] Asset disposal (secure wipe before decommissioning)
- [ ] Quarterly asset inventory review (add/remove assets)

**Example rule**:
> All company assets (laptops, servers, SaaS tools) will be tracked in an asset inventory. Each asset will have an owner and classification level. Assets will be securely wiped before disposal. Inventory will be reviewed quarterly.

---

## Step 4: Security Awareness Training

**Goal**: Train employees to recognize and report security threats

### What to Cover (Annual Training)

**Module 1: Phishing (30 minutes)**
- How to recognize phishing emails (urgency, suspicious links, grammar errors)
- Real examples (recent phishing campaigns)
- What to do if you click (report to security@yourcompany.com)
- Demo: Inspect email headers, hover over links

**Module 2: Password Security (15 minutes)**
- Why passwords matter (credential stuffing attacks)
- How to create strong passwords (12+ characters, unique)
- Password managers (1Password demo)
- MFA setup (Google Authenticator, 1Password)

**Module 3: Data Handling (20 minutes)**
- Data classification (Public, Internal, Confidential, Restricted)
- Where to store sensitive data (not Slack, not personal email)
- Encryption (when to use, how to use)
- Data breach examples (cost, impact)

**Module 4: Incident Reporting (15 minutes)**
- What counts as an incident (phishing, malware, data leak)
- How to report (security@yourcompany.com, Slack #security)
- Who to contact (Incident Response Team)
- Recent incident examples (anonymized)

**Module 5: Physical Security (10 minutes)**
- Laptop security (encryption, screen lock, no unattended laptops)
- Lost/stolen device reporting (IT hotline, remote wipe)
- Office security (badges, visitors, tailgating)

**Total**: 90 minutes (can split into 5×18-minute sessions)

### Training Tools

**Free**:
- Google Workspace Security Center (built-in training)
- SANS Security Awareness (free posters, newsletters)
- NIST Cybersecurity Training (free online courses)

**Paid** ($10-$50/employee/year):
- **KnowBe4** ($25-$45/user/year): Industry leader, phishing simulation + training
- **SecurityIQ** ($20-$40/user/year): Similar to KnowBe4, more affordable
- **Proofpoint Security Awareness** ($30-$50/user/year): Enterprise-grade
- **Hook Security** ($15-$25/user/year): Modern UI, gamified

**SEA-specific considerations**:
- Translate training to local languages (Bahasa Indonesia, Thai, Vietnamese)
- Use local examples (SEA phishing campaigns, local regulations)
- Adjust for cultural differences (direct vs indirect communication)

### Phishing Simulations

**Run quarterly**:
- [ ] Q1: Basic phishing (urgent email from "CEO")
- [ ] Q2: Spear phishing (targeted email with real names)
- [ ] Q3: Link-based (fake Office 365 login)
- [ ] Q4: Attachment-based (fake invoice PDF)

**Metrics to track**:
- Click rate (% who clicked link): Target <5%
- Open rate (% who opened email): Informational only
- Report rate (% who reported as phishing): Target >50%

**Example results**:
- Baseline (Q1): 25% click rate, 10% report rate
- After training (Q4): 3% click rate, 60% report rate

---

## Step 5: Compliance Roadmap

### SOC 2 Type 1 (90 Days, $25K-$70K)

**What it is**:
- Point-in-time audit of security controls
- Required by 80% of enterprise customers
- Covers 5 Trust Services Criteria (Security, Availability, Confidentiality, Processing Integrity, Privacy)

**Timeline**:
- Month 1: Implement controls, document policies
- Month 2: Evidence collection, vendor assessments
- Month 3: Audit execution, remediation, report issuance

**Cost**:
- GRC tool (Vanta, Secureframe): $1K-$3K/month = $3K-$9K for 3 months
- Auditor: $15K-$30K (depends on company size, complexity)
- Penetration test (optional): $5K-$15K
- Tools (MFA, logging, endpoint protection): $3K-$10K
- **Total**: $25K-$70K

**ROI**: Unlock $500K-$5M in enterprise deals (5-100x ROI)

---

### SOC 2 Type 2 (12 Months, $50K-$150K)

**What it is**:
- Audit of security controls over 12-month period (not point-in-time)
- More rigorous than Type 1 (auditor reviews logs, tickets, incidents)
- Required by some large enterprises

**Timeline**:
- Months 1-12: Continuous compliance (quarterly evidence collection)
- Month 13: Audit execution, report issuance

**Cost**:
- GRC tool: $1K-$3K/month × 12 = $12K-$36K
- Auditor: $30K-$80K (higher than Type 1)
- Tools: $5K-$15K
- Internal time (CISO, engineers): $10K-$30K
- **Total**: $50K-$150K

**When to do**: After achieving Type 1, when >$10M ARR

---

### ISO 27001 (12-18 Months, $50K-$200K)

**What it is**:
- International standard for information security management
- Broader than SOC 2 (covers 114 controls vs SOC 2's ~60)
- Preferred by European customers, government, large enterprises

**Timeline**:
- Months 1-6: Gap assessment, policy development
- Months 7-12: Control implementation, internal audit
- Months 13-18: Certification audit (Stage 1 + Stage 2)

**Cost**:
- Consultant (optional): $20K-$80K
- Certification body: $15K-$50K
- Tools: $10K-$30K
- Internal time: $15K-$50K
- **Total**: $50K-$200K

**When to do**: When targeting European customers or government contracts

---

### PDPA Compliance (Singapore)

**What it is**:
- Singapore's data protection law (Personal Data Protection Act)
- Required if you collect personal data in Singapore
- Enforced by PDPC (Personal Data Protection Commission)

**Requirements**:
- [ ] Consent for data collection (opt-in or opt-out)
- [ ] Privacy policy published
- [ ] Data protection measures (encryption, access controls)
- [ ] Data breach notification (no mandatory timeline, but "as soon as practicable")
- [ ] Data subject rights (access, correction, deletion)

**Cost**: $5K-$20K (mostly internal time, legal review)
**Timeline**: 30-60 days

**When to do**: Immediately (if not already compliant)

---

### GDPR Compliance (EU Customers)

**What it is**:
- EU's data protection regulation (General Data Protection Regulation)
- Applies to any company processing EU residents' personal data
- Stricter than PDPA (72-hour breach notification, explicit consent)

**Requirements**:
- [ ] Privacy policy (GDPR-compliant)
- [ ] Cookie consent (explicit opt-in for analytics, marketing)
- [ ] Data subject rights (access, correction, deletion, portability, restriction, objection)
- [ ] Data breach notification (72 hours to supervisory authority)
- [ ] Data Processing Agreements (DPAs) with vendors
- [ ] Data Protection Officer (if large-scale processing)

**Cost**: $10K-$40K (legal review, DPAs, cookie consent tool)
**Timeline**: 60-90 days

**When to do**: Before launching in EU or if >10% of customers are in EU

---

## Step 6: Reporting to Board/Management

**Goal**: Communicate security posture to executives and board

### Quarterly Security Report

**Slide 1: Executive Summary**
- Security score (100-point scorecard): 78/100 (Q1: 65)
- Open vulnerabilities: 3 Critical, 5 High, 12 Medium
- Incidents: 1 P3 (phishing attempt, no impact)
- Compliance: SOC 2 Type 1 achieved (Jan 2026)

**Slide 2: Risk Overview**
- Top 3 risks:
  1. Unpatched vulnerability in payment gateway (Critical, ETA fix: Jan 20)
  2. 5% of employees without MFA enabled (High, ETA fix: Jan 25)
  3. Backup restore not tested this quarter (Medium, ETA fix: Jan 30)
- Risk trend: ↓ (down from 5 Critical last quarter)

**Slide 3: Progress on Roadmap**
- Q4 goals: 4/5 completed (80%)
  - ✅ SOC 2 Type 1 certification
  - ✅ MFA rollout (95% adoption)
  - ✅ Endpoint protection deployed
  - ✅ Security awareness training completed
  - ❌ Penetration test (delayed to Q1)

**Slide 4: Incidents & Near-Misses**
- 1 incident: Phishing email to 20 employees, 2 clicked, 0 credentials compromised
- Remediation: Additional phishing training scheduled
- Lessons learned: Improve email filtering (SPF, DMARC)

**Slide 5: Metrics**
- Mean Time to Detect (MTTD): 2 hours (target: <4 hours)
- Mean Time to Respond (MTTR): 8 hours (target: <24 hours)
- Phishing click rate: 5% (target: <5%) ✅
- MFA adoption: 95% (target: 100%)

**Slide 6: Upcoming Priorities (Next Quarter)**
- SOC 2 Type 2 kickoff (12-month audit period)
- Penetration test (Jan)
- DLP implementation (prevent data leaks)
- Security automation (SOAR platform)

### Metrics That Matter

**Security posture**:
- 100-point security scorecard (from Part 1)
- Open vulnerabilities (Critical/High/Medium)
- Patching SLA (% patched within 7/30/90 days)

**Incident metrics**:
- Number of incidents (P0/P1/P2/P3)
- Mean Time to Detect (MTTD)
- Mean Time to Respond (MTTR)

**Compliance**:
- SOC 2 status (Type 1/Type 2, expiration date)
- ISO 27001 status (certified Y/N, expiration)
- Audit findings (open/closed)

**User behavior**:
- MFA adoption (% of employees)
- Phishing click rate (% who clicked simulation)
- Security training completion (% completed)

**Vendor risk**:
- Vendor security assessments (completed/pending)
- Vendors without DPA (count)
- High-risk vendors (count)

---

## Summary

**Key takeaways**:
1. **Security program**: 5 pillars (Governance, Asset Management, Access Control, Threat Management, Resilience)
2. **90-day roadmap**: Month 1 (quick wins), Month 2 (documentation), Month 3 (SOC 2 audit)
3. **15 policies**: Acceptable Use, Password, Data Classification, Retention, Access Control, Remote Access, Incident Response, Vendor Security, Backup, Change Management, Physical Security, BYOD, Cryptography, Security Training, Asset Management
4. **Security training**: Annual training (90 minutes), quarterly phishing simulations (target <5% click rate)
5. **Compliance roadmap**: SOC 2 Type 1 (90 days, $25K-$70K), Type 2 (12 months, $50K-$150K), ISO 27001 (18 months, $50K-$200K)
6. **Reporting**: Quarterly security report to board (security score, risks, incidents, metrics)

**Quick wins**:
- Score your security posture (100-point scorecard from Part 1)
- Write 5 core policies (Acceptable Use, Password, Data Classification, Retention, Incident Response)
- Run first security awareness training (90 minutes, all employees)
- Hire SOC 2 auditor (if >$5M ARR)

**Next steps**:
- Complete 100-point security scorecard
- Write 15 security policies (use templates in this guide)
- Run security awareness training (KnowBe4, SecurityIQ)
- Hire SOC 2 auditor for 90-day sprint
- Read Templates section for copy-paste policies and checklists
