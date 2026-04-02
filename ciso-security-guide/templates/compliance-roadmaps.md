# Compliance Roadmaps

**Purpose**: Step-by-step timelines for achieving SOC 2, ISO 27001, PDPA, and GDPR compliance.

---

## Roadmap 1: SOC 2 Type 1 (90 Days, $25K-$70K)

**What it is**: Point-in-time audit of security controls
**Why you need it**: 80% of enterprise customers require SOC 2 before signing
**Timeline**: 90 days
**Cost**: $25K-$70K (tools + auditor + pentest)

### Month 1: Foundation & Assessment (Days 1-30)

**Week 1-2: Security Assessment**
- [ ] **Day 1-3**: Run vulnerability scan
  - Tool: Qualys ($2K-$5K/year), Tenable ($3K-$5K/year), or Intruder ($100-$500/month)
  - Scan: Production systems, staging, APIs
  - Output: List of vulnerabilities (Critical/High/Medium/Low)

- [ ] **Day 4-5**: Complete 100-point security scorecard (Part 1 template)
  - Score yourself honestly
  - Target: 50+ points (50% = basic security)

- [ ] **Day 6-10**: Identify top 10 risks
  - Prioritize by: Likelihood × Impact × 10 = Risk Score
  - Create remediation plan (Jira tickets for each risk)

- [ ] **Day 11-14**: Benchmark against SOC 2 requirements
  - Tool: Vanta ($2K-$3K/month) or Secureframe ($2K-$3K/month)
  - Gap analysis: Which SOC 2 controls are you missing?
  - Output: List of 20-30 gaps to fix

**Week 3-4: Quick Wins (10 Core Controls)**
- [ ] **Day 15**: Enable MFA on all critical systems
  - Google Workspace, AWS, GitHub, production databases
  - Enforce at org level (no exceptions)
  - Cost: $0 (MFA is free)

- [ ] **Day 16**: Implement password manager
  - Tool: 1Password ($8/user/month), LastPass ($6/user/month)
  - Rollout to all employees (mandatory)
  - Cost: $500-$2K/year (for 20-50 employees)

- [ ] **Day 17-18**: Set up endpoint protection
  - Tool: CrowdStrike ($80-$150/device/year), SentinelOne ($50-$100/device/year)
  - Deploy to 100% of laptops/desktops
  - Cost: $2K-$5K/year (for 20-50 devices)

- [ ] **Day 19-20**: Enable logging & monitoring
  - Tool: Datadog ($15-$50/host/month), Splunk (expensive), or ELK (free but complex)
  - Centralize logs from all production systems
  - Set up alerts (failed logins, unusual API calls)
  - Cost: $500-$2K/month

- [ ] **Day 21**: Encrypt laptops
  - Windows: BitLocker (free, built-in)
  - Mac: FileVault (free, built-in)
  - Enforce via MDM (Jamf, Intune)
  - Cost: $0

- [ ] **Day 22-23**: Backup critical data
  - Automated daily backups (RDS snapshots, S3 versioning)
  - Store in separate AWS account (attacker can't delete)
  - Test restore monthly
  - Cost: $100-$500/month (storage)

- [ ] **Day 24-25**: Document systems inventory
  - Spreadsheet: All apps, services, databases, SaaS tools
  - Include: Name, owner, classification (critical/important/non-critical)
  - Update quarterly

- [ ] **Day 26**: Create incident response plan
  - Use template from Part 4 (this guide)
  - Document: Who to call, escalation path, breach notification process
  - Print and keep offline (not only on Slack)

- [ ] **Day 27-28**: Draft 5 core security policies
  - Acceptable Use, Password, Data Classification, Retention, Incident Response
  - Use templates from Part 5 (this guide)
  - Publish to internal wiki (Notion, Confluence)

- [ ] **Day 29-30**: Run security awareness training
  - Tool: KnowBe4 ($25-$45/user/year), SecurityIQ ($20-$40/user/year)
  - 90-minute training: Phishing, passwords, data handling, incident reporting
  - Track completion (100% required)
  - Cost: $1K-$2K/year (for 20-50 employees)

**Month 1 Cost**: $5K-$20K (mostly tools, minimal consulting)
**Month 1 Output**: 80% risk reduction, 50-70 points on security scorecard

---

### Month 2: Controls & Documentation (Days 31-60)

**Week 5-6: Access Controls**
- [ ] **Day 31-35**: Implement RBAC (Role-Based Access Control)
  - Define roles: Developer, Support, Admin, Superadmin
  - Assign permissions per role (least privilege)
  - Document in spreadsheet or GRC tool

- [ ] **Day 36-38**: Review and document admin access
  - Who has keys to the kingdom? (AWS admin, database admin, GitHub admin)
  - Reduce admin access (only 2-3 people should be superadmin)
  - Document reasons for admin access

- [ ] **Day 39-40**: Set up access request workflow
  - Tool: Jira, ServiceDesk, or Slack
  - Process: Employee requests → Manager approves → IT provisions → Log access
  - Document in runbook

- [ ] **Day 41**: Enable session timeouts
  - Auto-logout after 15-30 minutes of inactivity
  - Enforce in AWS, Google Workspace, production systems

- [ ] **Day 42-45**: Implement device management (MDM)
  - Tool: Jamf ($10-$20/device/month), Intune ($6-$12/device/month), Kandji ($10-$15/device/month)
  - Enroll all company laptops
  - Remote wipe capability enabled
  - Cost: $2K-$5K/year (for 20-50 devices)

**Week 7-8: Policy & Process Documentation**
- [ ] **Day 46-52**: Complete 15 security policies
  - Use templates from Part 5 (this guide)
  - Policies: Acceptable Use, Password, Data Classification, Retention, Access Control, Remote Access, Incident Response, Vendor Security, Backup, Change Management, Physical Security, BYOD, Cryptography, Security Training, Asset Management

- [ ] **Day 53-55**: Document security procedures
  - How to grant access, revoke access, reset password
  - How to onboard employee, offboard employee
  - How to deploy code, roll back deployment

- [ ] **Day 56-58**: Create employee security handbook
  - 5-10 pages, plain English (not legal jargon)
  - Cover: Passwords, MFA, phishing, data handling, incident reporting
  - Publish to internal wiki

- [ ] **Day 59-60**: Set up policy review process
  - Annual review (set calendar reminder)
  - Version control (track changes to policies)
  - Employee acknowledgment (new hires sign policies)

**Month 2 Cost**: $5K-$10K (mostly time, some consulting)
**Month 2 Output**: Pass enterprise security reviews, 70-85 points on security scorecard

---

### Month 3: Audit Preparation & Certification (Days 61-90)

**Week 9-10: Vendor & Audit Prep**
- [ ] **Day 61-65**: Hire SOC 2 auditor
  - Options: Prescient ($15K-$25K), Thoropass partner auditor ($15K-$30K), Vanta partner auditor ($20K-$35K)
  - Get 3 quotes, compare pricing and timeline
  - Sign engagement letter

- [ ] **Day 66-70**: Set up evidence collection
  - Tool: Vanta ($2K-$3K/month) or Secureframe ($2K-$3K/month)
  - Connect to: AWS, Google Workspace, GitHub, Jira, HR system
  - Automated evidence: Logs, screenshots, policy acknowledgments

- [ ] **Day 71-73**: Complete vendor security assessments
  - Top 10 vendors: Stripe, AWS, Google Workspace, GitHub, Zendesk, etc.
  - Send security questionnaire (use template from this guide)
  - Request SOC 2 reports, sign DPAs

- [ ] **Day 74-80**: Run penetration test (optional but recommended)
  - Cost: $5K-$15K
  - Hire: Local pentest firm (search "pentest firm Singapore")
  - Output: Report with vulnerabilities + remediation steps
  - Fix Critical/High findings before audit

**Week 11-12: Audit Execution**
- [ ] **Day 81-85**: Provide evidence to auditor
  - Policies (15 policies)
  - Logs (centralized logs from Datadog, Splunk)
  - Screenshots (MFA enabled, endpoint protection deployed)
  - Vendor DPAs, SOC 2 reports

- [ ] **Day 86-88**: Fix audit findings
  - Auditor identifies 5-10 gaps (typically)
  - Create Jira tickets for each finding
  - Fix within 48 hours (before auditor finalizes report)

- [ ] **Day 89**: Receive SOC 2 Type 1 report
  - Auditor issues report (clean opinion = passed)
  - Report valid for 12 months (renew annually)

- [ ] **Day 90**: Publish security page
  - Create: security.yourcompany.com
  - Content: SOC 2 Type 1 certified, link to request report, security contact email
  - Announce on blog, LinkedIn, Twitter

**Month 3 Cost**: $15K-$40K (auditor + pentest + tools)
**Month 3 Output**: SOC 2 Type 1 certified, enterprise-ready

---

### **Total 90-Day Cost**: $25K-$70K

**Cost breakdown**:
- GRC tool (Vanta, Secureframe): $6K-$9K (3 months)
- Auditor: $15K-$30K
- Penetration test: $5K-$15K (optional)
- Tools (MFA, endpoint protection, logging, MDM, training): $3K-$10K
- Consulting (optional): $5K-$20K

**ROI**: Unlock $500K-$5M in enterprise deals (5-100x ROI)

---

## Roadmap 2: SOC 2 Type 2 (12 Months, $50K-$150K)

**What it is**: Audit of security controls over 12-month period (not point-in-time)
**Why you need it**: Large enterprises require Type 2 (more rigorous than Type 1)
**Timeline**: 12 months + 1 month audit
**Cost**: $50K-$150K

### Months 1-3: Achieve SOC 2 Type 1
- Follow Roadmap 1 above (90-day sprint)

### Months 4-12: Continuous Compliance (Observation Period)

**Quarterly activities** (Months 4, 7, 10):
- [ ] **Evidence collection**:
  - Collect logs (access logs, audit logs, security alerts)
  - Collect screenshots (MFA enabled, endpoint protection status)
  - Collect tickets (access requests, incident response tickets)
  - Tool: Vanta or Secureframe (automates this)

- [ ] **Access reviews**:
  - Review who has admin access (remove unnecessary permissions)
  - Review who left company (verify access revoked)
  - Document in spreadsheet or Jira

- [ ] **Vulnerability scans**:
  - Run weekly vulnerability scans (Qualys, Tenable, Intruder)
  - Fix Critical/High vulnerabilities within 7-30 days
  - Document remediation in Jira

- [ ] **Policy reviews**:
  - Review 15 security policies (update if needed)
  - Track policy changes (version control)
  - Notify employees of changes

**Monthly activities** (Months 4-12):
- [ ] **Backup testing**:
  - Test restore from backup (monthly)
  - Document results in Jira ticket

- [ ] **Security training**:
  - Quarterly phishing simulations (KnowBe4, SecurityIQ)
  - Track click rate (target <5%)

- [ ] **Incident tracking**:
  - Document all security incidents (P0/P1/P2/P3)
  - Write post-mortems for P0/P1 incidents

### Month 13: Final Audit

- [ ] **Auditor reviews 12 months of evidence**:
  - Logs, tickets, policies, training completion, backup testing
  - Auditor interviews employees (CISO, engineers, support)

- [ ] **Receive SOC 2 Type 2 report**:
  - Clean opinion = passed
  - Report valid for 12 months (renew annually)

---

### **Total 12-Month Cost**: $50K-$150K

**Cost breakdown**:
- GRC tool: $24K-$36K (12 months × $2K-$3K/month)
- Auditor: $30K-$80K (higher than Type 1)
- Tools: $10K-$20K (endpoint protection, logging, etc.)
- Internal time (CISO, engineers): $10K-$30K
- Consulting (optional): $10K-$30K

**ROI**: Unlock large enterprise deals ($500K-$5M ACVs)

---

## Roadmap 3: ISO 27001 (12-18 Months, $50K-$200K)

**What it is**: International standard for information security management (114 controls)
**Why you need it**: Preferred by European customers, government, large enterprises
**Timeline**: 12-18 months
**Cost**: $50K-$200K

### Months 1-6: Gap Assessment & Policy Development

**Month 1-2: Gap Assessment**
- [ ] **Hire consultant** (optional but recommended):
  - Cost: $20K-$50K (for full implementation)
  - Consultant maps your current state to ISO 27001 requirements
  - Output: Gap analysis (which of 114 controls are missing)

- [ ] **Conduct gap assessment**:
  - Review ISO 27001 Annex A (114 controls)
  - Check which controls you already have (from SOC 2)
  - Identify 20-40 gaps (typically)

**Month 3-6: Policy Development**
- [ ] **Write policies & procedures**:
  - ISO 27001 requires 20-30 policies (more than SOC 2's 15)
  - Additional policies: Business Continuity, Disaster Recovery, Human Resources, Legal, Compliance
  - Use templates from ISO 27001 toolkit (available online)

- [ ] **Document processes**:
  - Risk assessment process (annual)
  - Change management process (code deployments)
  - Vendor management process (onboarding, offboarding)
  - Incident response process (6-phase framework)

### Months 7-12: Control Implementation & Internal Audit

**Month 7-9: Control Implementation**
- [ ] **Implement missing controls** (20-40 gaps):
  - Examples: Network segregation, intrusion detection, log monitoring, backup encryption
  - Create Jira tickets for each gap
  - Assign owners and due dates

**Month 10-11: Internal Audit**
- [ ] **Hire internal auditor**:
  - Cost: $5K-$15K
  - Auditor reviews controls (before certification audit)
  - Output: Pre-audit report with findings

- [ ] **Fix internal audit findings**:
  - Typically 5-10 gaps found
  - Fix within 30 days

**Month 12: Management Review**
- [ ] **Management review meeting**:
  - CISO presents security program to CEO/board
  - Review: Incidents, risks, audit findings, improvements
  - Document in meeting minutes

### Months 13-18: Certification Audit

**Month 13-14: Stage 1 Audit (Documentation Review)**
- [ ] **Hire certification body**:
  - Options: BSI, SGS, TÜV, DNV
  - Cost: $15K-$30K (Stage 1 + Stage 2)
  - Auditor reviews documentation (policies, procedures)

- [ ] **Fix Stage 1 findings**:
  - Auditor identifies documentation gaps (typically 5-10)
  - Update policies/procedures
  - Resubmit to auditor

**Month 15-17: Stage 2 Audit (On-Site Audit)**
- [ ] **On-site audit** (3-5 days):
  - Auditor visits office (or remote audit)
  - Auditor interviews employees (CISO, engineers, HR, legal)
  - Auditor reviews evidence (logs, tickets, screenshots)

- [ ] **Fix Stage 2 findings**:
  - Auditor identifies control gaps (typically 5-15)
  - Create corrective action plan
  - Implement fixes within 90 days

**Month 18: Certification Issued**
- [ ] **Receive ISO 27001 certificate**:
  - Valid for 3 years (with annual surveillance audits)
  - Publish certificate on website (security.yourcompany.com)

---

### **Total 12-18 Month Cost**: $50K-$200K

**Cost breakdown**:
- Consultant: $20K-$80K (optional but recommended)
- Certification body: $15K-$50K (Stage 1 + Stage 2 + annual surveillance)
- Tools: $10K-$30K (network segregation, intrusion detection, etc.)
- Internal time (CISO, engineers, project manager): $15K-$50K

**ROI**: Win European customers, government contracts ($500K-$10M deals)

---

## Roadmap 4: PDPA Compliance (Singapore) (30-60 Days, $5K-$20K)

**What it is**: Singapore's data protection law (Personal Data Protection Act)
**Why you need it**: Required if you collect personal data in Singapore, avoid $1M fines
**Timeline**: 30-60 days
**Cost**: $5K-$20K (mostly internal time, legal review)

### Week 1-2: Data Mapping

- [ ] **Day 1-5**: Map all personal data
  - What data do you collect? (names, emails, phone numbers, addresses, credit cards)
  - Where is it stored? (production database, analytics, CRM, support, backups)
  - Why do you collect it? (service delivery, marketing, analytics)
  - Who has access? (engineers, support, sales)

- [ ] **Day 6-10**: Classify data
  - Use 4-level classification (Public, Internal, Confidential, Restricted)
  - Apply labels to databases, S3 buckets, SaaS tools

### Week 3-4: Consent & Privacy Policy

- [ ] **Day 11-15**: Implement consent mechanism
  - Opt-in or opt-out (opt-in recommended)
  - Cookie banner (for analytics, marketing cookies)
  - Signup checkbox ("I agree to Privacy Policy")
  - Track consent (timestamp, version, scope)

- [ ] **Day 16-20**: Write privacy policy
  - Use template from Part 2 (this guide)
  - Sections: What data we collect, why, how we use it, who we share with, how we protect it, your rights, retention, contact
  - Legal review ($2K-$5K)

- [ ] **Day 21-25**: Publish privacy policy
  - Website footer (link: "Privacy Policy")
  - Signup flow (checkbox: "I agree to Privacy Policy")
  - App settings (link in "About" or "Legal")

### Week 5-6: Data Subject Rights & Retention

- [ ] **Day 26-30**: Implement data subject rights
  - Access request process (email privacy@yourcompany.com)
  - Correction request process (update account)
  - Deletion request process (delete account + all data)
  - Portability request process (export data in JSON/CSV)
  - Response timeline: 30 days

- [ ] **Day 31-40**: Implement data retention policy
  - Retention periods: Customer data (90 days after closure), marketing data (30 days after unsubscribe), support tickets (2 years), logs (90 days - 1 year)
  - Automated deletion scripts (weekly cron job)
  - Test deletion (verify data actually deleted)

### Week 7-8: Vendor DPAs & Final Review

- [ ] **Day 41-50**: Sign vendor DPAs
  - Top 10 vendors: Stripe, AWS, Google Workspace, Zendesk, etc.
  - Request DPAs from each vendor
  - Review DPAs with legal ($1K-$3K)
  - Sign before granting access

- [ ] **Day 51-60**: Final compliance review
  - Checklist: Consent ✓, Privacy policy ✓, Data subject rights ✓, Retention ✓, Vendor DPAs ✓
  - Legal sign-off ($2K-$5K)
  - Announce compliance (blog post, LinkedIn)

---

### **Total 30-60 Day Cost**: $5K-$20K

**Cost breakdown**:
- Legal review (privacy policy + DPAs): $5K-$15K
- Tools (cookie consent, data export): $1K-$3K (optional)
- Internal time (CISO, engineers, product): $2K-$5K

**ROI**: Avoid $1M fines, comply with law (required, not optional)

---

## Roadmap 5: GDPR Compliance (EU Customers) (60-90 Days, $10K-$40K)

**What it is**: EU's data protection regulation (stricter than PDPA)
**Why you need it**: Required if you process EU residents' data, avoid €20M fines
**Timeline**: 60-90 days
**Cost**: $10K-$40K

### Week 1-3: Data Mapping & Lawful Basis

- [ ] **Day 1-10**: Map all personal data (same as PDPA)
  - What data, where stored, why collected, who has access

- [ ] **Day 11-20**: Document lawful basis
  - GDPR requires lawful basis for each processing activity
  - Options: Consent, Contract, Legitimate interest, Legal obligation, Vital interest, Public task
  - Most common: Consent (marketing), Contract (service delivery)

### Week 4-6: Consent & Privacy Policy

- [ ] **Day 21-30**: Implement explicit consent
  - Opt-in only (no pre-checked boxes)
  - Freely given (not bundled with terms of service)
  - Specific (separate consent for analytics, marketing)
  - Consent records (timestamp, version, scope)

- [ ] **Day 31-40**: Write GDPR-compliant privacy policy
  - Additional sections: Lawful basis, Data Protection Officer (if required), Data transfers (EU to non-EU), Rights (access, correction, erasure, portability, restriction, objection)
  - Legal review ($5K-$10K, GDPR-specific)

### Week 7-9: Data Subject Rights & Breach Notification

- [ ] **Day 41-50**: Implement GDPR data subject rights
  - Same as PDPA, plus:
  - Right to erasure (delete all data, not just anonymize)
  - Right to portability (machine-readable format, JSON or CSV)
  - Right to restriction (stop processing temporarily)
  - Right to object (opt out of marketing, profiling)
  - Response timeline: 30 days (same as PDPA)

- [ ] **Day 51-60**: Implement breach notification process
  - 72-hour notification to supervisory authority (GDPR requirement, stricter than PDPA)
  - Document process: Detect breach → Assess scope → Notify authority → Notify customers
  - Template: Breach notification email (use template from Part 4)

### Week 10-12: Vendor DPAs & Data Transfers

- [ ] **Day 61-70**: Sign vendor DPAs (GDPR version)
  - DPAs must include: Data transfer mechanisms (SCCs if outside EU), Sub-processors list, Breach notification (24-72 hours), Data deletion (30-90 days)
  - Top 10 vendors: Stripe, AWS, Google Workspace, Zendesk, Mailchimp, etc.

- [ ] **Day 71-80**: Implement data transfer safeguards
  - If data leaves EU: Use Standard Contractual Clauses (SCCs)
  - SCCs available from: EU Commission website
  - Sign SCCs with vendors (AWS, Google Cloud, Stripe already have SCCs)

### Week 13: Final Review & DPO

- [ ] **Day 81-90**: Appoint Data Protection Officer (DPO)
  - Required if: Large-scale processing, Sensitive data (health, race, religion), Public authority
  - DPO can be: Internal employee, External consultant
  - Cost: $10K-$30K/year (external DPO)

- [ ] **Day 90**: Final compliance review
  - Checklist: Lawful basis ✓, Explicit consent ✓, Privacy policy ✓, Data subject rights ✓, Breach notification ✓, Vendor DPAs ✓, Data transfers ✓, DPO (if required) ✓

---

### **Total 60-90 Day Cost**: $10K-$40K

**Cost breakdown**:
- Legal review (GDPR-specific): $5K-$15K
- Tools (cookie consent, data export, breach detection): $2K-$5K
- DPO (if required): $10K-$30K/year (external), $0 (internal)
- Internal time (CISO, engineers, product, legal): $5K-$10K

**ROI**: Avoid €20M fines, comply with law (required if EU customers)

---

## Summary

**5 roadmaps provided**:
1. SOC 2 Type 1 (90 days, $25K-$70K) — Point-in-time audit
2. SOC 2 Type 2 (12 months, $50K-$150K) — 12-month audit
3. ISO 27001 (12-18 months, $50K-$200K) — International standard
4. PDPA Compliance (30-60 days, $5K-$20K) — Singapore data protection
5. GDPR Compliance (60-90 days, $10K-$40K) — EU data protection

**How to use**:
1. Choose roadmap based on your goals (SOC 2 for enterprise customers, ISO 27001 for EU/government, PDPA/GDPR for compliance)
2. Follow timeline day-by-day
3. Check off tasks as you complete them
4. Track budget (actual vs estimated)
5. Adjust timeline if needed (90 days is aggressive, 120 days more realistic)

**Recommended order**:
1. Start with PDPA/GDPR (if required by law) — 30-90 days
2. Then SOC 2 Type 1 (for enterprise deals) — 90 days
3. Then SOC 2 Type 2 (for large enterprises) — 12 months
4. Then ISO 27001 (for EU/government) — 12-18 months

**Total time**: 18-24 months to achieve full compliance maturity
**Total cost**: $80K-$280K over 18-24 months

**ROI**: Unlock $1M-$10M+ in enterprise deals, avoid $1M-$20M in regulatory fines
