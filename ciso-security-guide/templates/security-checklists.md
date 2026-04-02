# Security Checklists

**Purpose**: Copy-paste checklists for security assessments, compliance audits, and ongoing monitoring.

---

## Checklist 1: 100-Point Security Scorecard

**Use this**: Monthly security assessment, track progress toward SOC 2

### Identity & Access (25 points)

- [ ] **MFA on all critical systems** (10 pts)
  - Google Workspace, AWS, GitHub, production databases
  - No exceptions, enforce at org level

- [ ] **Password manager for all employees** (5 pts)
  - 1Password, LastPass, Bitwarden
  - Track adoption: >95% = full points

- [ ] **Regular access reviews** (5 pts)
  - Quarterly review of admin access
  - Remove unnecessary permissions
  - Document review in Jira/spreadsheet

- [ ] **Least privilege access (RBAC)** (5 pts)
  - Role-based access control implemented
  - Developers don't have production admin access
  - Support has read-only database access

**Your score**: ___/25

---

### Data Protection (20 points)

- [ ] **Encryption at rest** (7 pts)
  - Databases encrypted (RDS encryption, MongoDB encryption)
  - File storage encrypted (S3 encryption, Google Cloud encryption)

- [ ] **Encryption in transit** (5 pts)
  - TLS 1.2+ for all web traffic
  - TLS for database connections
  - No plaintext HTTP allowed

- [ ] **Automated daily backups** (5 pts)
  - Production database backed up hourly
  - Files backed up daily
  - Backups stored in separate AWS account/region

- [ ] **Backup testing** (3 pts)
  - Monthly backup restore test
  - Quarterly full disaster recovery drill
  - Document results

**Your score**: ___/20

---

### Endpoint Security (15 points)

- [ ] **Endpoint protection on all devices** (7 pts)
  - CrowdStrike, SentinelOne, Carbon Black, or Microsoft Defender
  - Deployed to 100% of laptops/desktops
  - Real-time scanning enabled

- [ ] **Laptop encryption** (5 pts)
  - BitLocker (Windows) or FileVault (Mac)
  - Enforced via MDM (no exceptions)

- [ ] **MDM for company devices** (3 pts)
  - Jamf, Intune, Kandji, or Google Workspace MDM
  - Remote wipe capability
  - Device compliance checks

**Your score**: ___/15

---

### Network Security (10 points)

- [ ] **Firewall rules (least privilege)** (5 pts)
  - Only necessary ports open (22, 80, 443)
  - Whitelist IPs where possible
  - Block all by default

- [ ] **VPN for remote access** (5 pts)
  - AWS Client VPN, OpenVPN, or Tailscale
  - Required for accessing internal systems
  - MFA on VPN login

**Your score**: ___/10

---

### Logging & Monitoring (10 points)

- [ ] **Centralized logging** (5 pts)
  - CloudWatch, Datadog, Splunk, or ELK
  - Logs from all production systems
  - Retention: 90 days minimum

- [ ] **Security alerts configured** (5 pts)
  - Failed login attempts (>10 in 5 min)
  - Unusual API calls (spike in data exports)
  - Admin access granted/revoked
  - Alerts go to Slack #security + PagerDuty

**Your score**: ___/10

---

### Vulnerability Management (10 points)

- [ ] **Weekly vulnerability scans** (5 pts)
  - Qualys, Tenable, Intruder, or Nuclei
  - Scans production systems + staging
  - Automated, not manual

- [ ] **Patch management process** (5 pts)
  - Critical: 7 days
  - High: 30 days
  - Medium: 90 days
  - Track in Jira/Linear

**Your score**: ___/10

---

### Policies & Training (10 points)

- [ ] **Security policies documented** (5 pts)
  - 15 policies written (see templates)
  - Published to internal wiki
  - Employees acknowledge on hire

- [ ] **Annual security awareness training** (5 pts)
  - KnowBe4, SecurityIQ, or equivalent
  - 100% completion tracked
  - Quarterly phishing simulations

**Your score**: ___/10

---

### **Total Score**: ___/100

**Scoring**:
- **90-100**: Excellent (enterprise-grade security)
- **70-89**: Good (ready for SOC 2)
- **50-69**: Fair (basic security, needs improvement)
- **<50**: Poor (high risk, urgent action needed)

---

## Checklist 2: SOC 2 Type 1 Readiness

**Use this**: Before hiring SOC 2 auditor, gap analysis

### Trust Services Criteria: Security (Core)

**CC1: Control Environment**
- [ ] Security policies documented (15 policies)
- [ ] Organizational chart with roles/responsibilities
- [ ] Background checks for employees (where legally allowed)
- [ ] Employee handbook includes security section

**CC2: Communication & Information**
- [ ] Security policies communicated to employees
- [ ] New hire security training (within 7 days)
- [ ] Annual security awareness training
- [ ] Security incidents reported via defined process

**CC3: Risk Assessment**
- [ ] Annual risk assessment completed
- [ ] Risks prioritized (likelihood × impact)
- [ ] Remediation plan for high risks

**CC4: Monitoring Activities**
- [ ] Weekly vulnerability scans
- [ ] Quarterly access reviews
- [ ] Monthly review of security logs
- [ ] Annual penetration test

**CC5: Control Activities**
- [ ] MFA on all critical systems
- [ ] RBAC implemented
- [ ] Encryption at rest + in transit
- [ ] Automated backups

**CC6: Logical & Physical Access**
- [ ] Password policy (12+ characters, MFA)
- [ ] Laptop encryption (BitLocker, FileVault)
- [ ] VPN for remote access
- [ ] Session timeouts (15-30 min)

**CC7: System Operations**
- [ ] Change management process (PR reviews, staging)
- [ ] Incident response plan documented
- [ ] Backup testing (monthly restore)
- [ ] Capacity planning (monitor resource usage)

**CC8: Change Management**
- [ ] Code review process (at least 1 approval)
- [ ] Automated testing (CI/CD)
- [ ] Deployment logs (who deployed what when)
- [ ] Rollback procedure documented

**CC9: Risk Mitigation**
- [ ] Firewall configured (least privilege)
- [ ] Intrusion detection (AWS GuardDuty, Suricata)
- [ ] Malware protection (endpoint protection)
- [ ] DDoS mitigation (Cloudflare, AWS Shield)

---

### Trust Services Criteria: Availability (Optional)

**A1: Availability Commitments**
- [ ] SLA documented (99.9% uptime)
- [ ] Status page (status.yourcompany.com)
- [ ] Incident communication process

**A2: System Monitoring**
- [ ] Uptime monitoring (Pingdom, UptimeRobot)
- [ ] Performance monitoring (Datadog, New Relic)
- [ ] Alerts for downtime (<5 min response)

**A3: Backup & Recovery**
- [ ] RTO documented (4 hours)
- [ ] RPO documented (1 hour)
- [ ] Disaster recovery plan tested quarterly

---

### Trust Services Criteria: Confidentiality (Optional)

**C1: Confidential Information**
- [ ] Data classification policy (4 levels)
- [ ] Confidential data identified and labeled
- [ ] Access to Confidential data restricted (RBAC)

**C2: Disposal of Confidential Information**
- [ ] Data retention policy (90 days after account closure)
- [ ] Secure deletion procedures (automated scripts)
- [ ] Vendor data deletion (request Certificates of Destruction)

---

### **Readiness Score**: ___/30 controls

**Pass criteria**: 25/30 (83%) to proceed with SOC 2 audit

---

## Checklist 3: ISO 27001 Readiness

**Use this**: Before ISO 27001 certification audit

### A.5: Information Security Policies
- [ ] Information security policy published
- [ ] Policy reviewed annually
- [ ] Policy approved by management

### A.6: Organization of Information Security
- [ ] Security roles and responsibilities defined
- [ ] Security team or CISO appointed
- [ ] Contact with authorities (PDPC, IMDA)

### A.7: Human Resource Security
- [ ] Background checks (where legally allowed)
- [ ] Security terms in employment contracts
- [ ] Security awareness training (annual)

### A.8: Asset Management
- [ ] Asset inventory (laptops, servers, SaaS tools)
- [ ] Asset ownership assigned
- [ ] Data classification policy (4 levels)

### A.9: Access Control
- [ ] Access control policy (RBAC)
- [ ] User registration and de-registration
- [ ] Password management (12+ characters, MFA)
- [ ] Review of user access rights (quarterly)

### A.10: Cryptography
- [ ] Cryptographic controls policy (TLS 1.2+, AES-256)
- [ ] Key management (AWS KMS, Secrets Manager)

### A.11: Physical & Environmental Security
- [ ] Secure areas (office access control)
- [ ] Equipment security (laptop encryption)
- [ ] Secure disposal of media (wipe before disposal)

### A.12: Operations Security
- [ ] Documented operating procedures
- [ ] Change management (PR reviews, staging)
- [ ] Capacity management (monitor resource usage)
- [ ] Malware protection (endpoint protection)
- [ ] Backups (daily, tested monthly)
- [ ] Logging and monitoring (centralized logs)

### A.13: Communications Security
- [ ] Network security management (firewall, VPN)
- [ ] Network segregation (production, staging, dev)
- [ ] Information transfer (encryption in transit)

### A.14: System Acquisition, Development, Maintenance
- [ ] Security requirements in new systems
- [ ] Secure development policy (OWASP guidelines)
- [ ] Code review process (at least 1 approval)
- [ ] Test data policy (no production data in test)

### A.15: Supplier Relationships
- [ ] Vendor security policy
- [ ] Security requirements in supplier agreements (DPAs)
- [ ] Monitoring of supplier security (annual reviews)

### A.16: Information Security Incident Management
- [ ] Incident response plan documented
- [ ] Incident reporting process (security@yourcompany.com)
- [ ] Incident assessment and decision (severity classification)
- [ ] Post-incident review (post-mortem)

### A.17: Business Continuity
- [ ] Business continuity plan (RTO, RPO)
- [ ] Backup and recovery procedures
- [ ] Testing of business continuity (quarterly)

### A.18: Compliance
- [ ] Compliance with legal requirements (PDPA, GDPR)
- [ ] Protection of records (retention policy)
- [ ] Privacy and protection of personal data
- [ ] Independent review of information security (annual audit)

---

### **Readiness Score**: ___/114 controls

**Pass criteria**: 95/114 (83%) to proceed with ISO 27001 certification

---

## Checklist 4: PDPA Compliance (Singapore)

**Use this**: PDPA compliance assessment for Singapore companies

### Consent
- [ ] Consent obtained before collecting personal data
- [ ] Opt-in or opt-out mechanism (documented)
- [ ] Consent withdrawal process (unsubscribe link)

### Purpose
- [ ] Purpose of data collection stated in privacy policy
- [ ] Data only used for stated purpose
- [ ] New purposes require new consent

### Notification
- [ ] Privacy policy published on website
- [ ] Privacy policy linked in signup flow
- [ ] Changes to privacy policy communicated (email)

### Access & Correction
- [ ] Process for data access requests (email privacy@yourcompany.com)
- [ ] Process for data correction requests
- [ ] Response within 30 days

### Accuracy
- [ ] Reasonable effort to ensure data accuracy
- [ ] Data updated when customer updates account

### Protection
- [ ] Encryption at rest (databases, file storage)
- [ ] Encryption in transit (TLS 1.2+)
- [ ] Access controls (RBAC, MFA)
- [ ] Regular security audits (annual)

### Retention
- [ ] Data retention policy documented
- [ ] Data deleted after retention period
- [ ] Exceptions for legal/accounting requirements (7 years)

### Transfer
- [ ] Cross-border transfer documented in privacy policy
- [ ] DPAs with vendors in other countries
- [ ] SCCs for EU transfers (if GDPR applies)

### Openness
- [ ] Privacy policy easy to find (footer link)
- [ ] Contact info for privacy inquiries (privacy@yourcompany.com)
- [ ] DPO appointed (if required)

### Accountability
- [ ] Policies and procedures documented
- [ ] Training provided to employees
- [ ] Breach notification process (PDPC)

---

### **Compliance Score**: ___/10 obligations

**Pass criteria**: 10/10 (100%) to be PDPA compliant

---

## Checklist 5: GDPR Compliance (EU Customers)

**Use this**: GDPR compliance assessment if you have EU customers

### Lawful Basis
- [ ] Lawful basis documented (consent, contract, legitimate interest)
- [ ] Privacy policy states lawful basis for each processing activity

### Consent
- [ ] Explicit consent (opt-in, not pre-checked boxes)
- [ ] Consent freely given (not bundled with terms of service)
- [ ] Consent withdrawal easy (unsubscribe link, account settings)
- [ ] Consent records kept (timestamp, version, scope)

### Data Subject Rights
- [ ] Right to access (export data in machine-readable format)
- [ ] Right to rectification (update incorrect data)
- [ ] Right to erasure (delete account + all data)
- [ ] Right to portability (export in JSON/CSV)
- [ ] Right to restriction (stop processing)
- [ ] Right to object (opt out of marketing)
- [ ] Response within 30 days

### Data Breach Notification
- [ ] Breach detection process (automated alerts)
- [ ] Notification to supervisory authority within 72 hours
- [ ] Notification to affected individuals (if high risk)
- [ ] Breach records kept (incident log)

### Data Protection Officer (DPO)
- [ ] DPO appointed (if large-scale processing or sensitive data)
- [ ] DPO contact published in privacy policy
- [ ] DPO reports to highest management

### Privacy by Design
- [ ] Data minimization (collect only necessary data)
- [ ] Purpose limitation (use data only for stated purpose)
- [ ] Encryption by default (at rest + in transit)
- [ ] Privacy impact assessments (for high-risk processing)

### Data Transfers
- [ ] EU data stored in EU or adequate country
- [ ] OR Standard Contractual Clauses (SCCs) with vendors
- [ ] Transfer mechanisms documented in privacy policy

### Vendor Management
- [ ] DPAs with all processors (vendors)
- [ ] Vendor security assessments (SOC 2, ISO 27001)
- [ ] Sub-processors listed in DPA

### Records of Processing
- [ ] Inventory of processing activities (what data, why, who has access)
- [ ] Legal basis for each activity
- [ ] Retention periods documented

### Children's Data
- [ ] Age verification (16+ in EU, or 13-15 with parental consent)
- [ ] Parental consent mechanism (if targeting children)

---

### **Compliance Score**: ___/10 requirements

**Pass criteria**: 10/10 (100%) to be GDPR compliant

---

## Checklist 6: Pre-Deployment Security Review

**Use this**: Before deploying new features or major changes to production

### Code Review
- [ ] Pull request reviewed by at least 1 engineer
- [ ] No hardcoded secrets (API keys, passwords)
- [ ] No SQL injection vulnerabilities
- [ ] No XSS vulnerabilities
- [ ] Input validation implemented
- [ ] Error handling implemented (no stack traces to users)

### Testing
- [ ] Unit tests pass (90%+ coverage)
- [ ] Integration tests pass
- [ ] Manual testing completed (smoke tests)
- [ ] Load testing (if high-traffic feature)
- [ ] Security testing (OWASP ZAP, Burp Suite)

### Infrastructure
- [ ] Deployed to staging first (not production)
- [ ] Monitored staging for 24 hours (no errors)
- [ ] Rollback plan documented
- [ ] Database migrations tested (staging)
- [ ] Secrets in Secrets Manager (not environment variables)

### Access Control
- [ ] RBAC implemented (least privilege)
- [ ] Authentication required (no unauthenticated endpoints)
- [ ] Authorization checks (users can't access other users' data)
- [ ] Rate limiting (prevent DDoS, brute force)

### Data Protection
- [ ] Encryption in transit (TLS 1.2+)
- [ ] Encryption at rest (if storing sensitive data)
- [ ] Input sanitization (prevent injection attacks)
- [ ] Output encoding (prevent XSS)

### Logging & Monitoring
- [ ] Logs added (who did what when)
- [ ] Alerts configured (errors, anomalies)
- [ ] Metrics tracked (latency, error rate)
- [ ] Dashboard updated (Datadog, Grafana)

### Documentation
- [ ] README updated (if new service)
- [ ] API docs updated (if API changes)
- [ ] Runbook created (how to troubleshoot)
- [ ] Deployment notes (what changed, how to rollback)

---

### **Readiness Score**: ___/30 checks

**Pass criteria**: 28/30 (93%) to deploy to production

---

## Checklist 7: New Employee Onboarding (Security)

**Use this**: Day 1 checklist for new hires

### Day 1
- [ ] **Assign company laptop** (encrypted, MDM enrolled)
- [ ] **Create accounts**:
  - [ ] Google Workspace (email, calendar, Drive)
  - [ ] Slack (add to relevant channels)
  - [ ] 1Password (password manager)
  - [ ] GitHub/GitLab (if engineer)
  - [ ] AWS IAM (if engineer, read-only to start)
  - [ ] Linear/Jira (task management)

- [ ] **Security training** (30 minutes):
  - [ ] Watch security awareness video
  - [ ] Read security policies (5 core policies)
  - [ ] Sign acceptable use policy
  - [ ] Complete phishing quiz

- [ ] **Set up MFA**:
  - [ ] Google Workspace (Google Authenticator)
  - [ ] GitHub (1Password)
  - [ ] AWS (1Password)
  - [ ] Slack (1Password)

### Week 1
- [ ] **Laptop setup**:
  - [ ] Install endpoint protection (CrowdStrike, SentinelOne)
  - [ ] Enable screen lock (5 minutes)
  - [ ] Install VPN (AWS Client VPN, Tailscale)
  - [ ] Install approved software only (no shadow IT)

- [ ] **Access reviews**:
  - [ ] Manager approves access requests (via Jira/ServiceDesk)
  - [ ] Grant least privilege access (RBAC)
  - [ ] Document access granted (spreadsheet or GRC tool)

### Month 1
- [ ] **Complete security training** (90 minutes):
  - [ ] Phishing (30 min)
  - [ ] Password security (15 min)
  - [ ] Data handling (20 min)
  - [ ] Incident reporting (15 min)
  - [ ] Physical security (10 min)

- [ ] **Verify compliance**:
  - [ ] MFA enabled on all accounts
  - [ ] Laptop encrypted (FileVault or BitLocker)
  - [ ] Password manager in use (spot check)
  - [ ] No personal devices used for customer data

---

### **Onboarding Score**: ___/25 checks

**Pass criteria**: 25/25 (100%) before granting production access

---

## Checklist 8: Employee Offboarding (Security)

**Use this**: Day 1 checklist when employee leaves

### Immediately (Within 1 Hour)
- [ ] **Disable accounts**:
  - [ ] Google Workspace (suspend, don't delete)
  - [ ] Slack (deactivate)
  - [ ] AWS IAM (disable access keys, revoke console access)
  - [ ] GitHub/GitLab (remove from organization)
  - [ ] 1Password (remove from team)
  - [ ] Linear/Jira (deactivate)
  - [ ] VPN (revoke certificate)

- [ ] **Revoke hardware**:
  - [ ] Collect laptop (wipe remotely if not returned)
  - [ ] Collect security badge (if physical office)
  - [ ] Collect phone (if company-issued)

- [ ] **Reset shared credentials**:
  - [ ] Change shared passwords (if any)
  - [ ] Rotate API keys (if employee had access)
  - [ ] Revoke SSH keys (if engineer)

### Day 1-7
- [ ] **Transfer ownership**:
  - [ ] Transfer email to manager (if customer-facing)
  - [ ] Transfer documents (Google Drive, Notion)
  - [ ] Transfer projects (Linear, Jira)
  - [ ] Transfer on-call responsibilities (PagerDuty)

- [ ] **Access audit**:
  - [ ] Review all systems for employee's access
  - [ ] Remove from Slack channels (especially #engineering, #security)
  - [ ] Remove from AWS IAM groups
  - [ ] Remove from GitHub teams

### Day 30
- [ ] **Delete accounts** (after 30-day grace period):
  - [ ] Google Workspace (export emails if needed, then delete)
  - [ ] Slack (export DMs if needed, then delete)
  - [ ] AWS IAM user (delete)
  - [ ] GitHub (remove completely)
  - [ ] 1Password (delete vault)

- [ ] **Final audit**:
  - [ ] Verify no access remains
  - [ ] Document offboarding completion (HR ticket)
  - [ ] Archive employee data (if legal requirement)

---

### **Offboarding Score**: ___/20 checks

**Pass criteria**: 20/20 (100%) within 30 days of departure

---

## Summary

**8 checklists provided**:
1. 100-Point Security Scorecard (monthly assessment)
2. SOC 2 Type 1 Readiness (gap analysis)
3. ISO 27001 Readiness (certification prep)
4. PDPA Compliance (Singapore)
5. GDPR Compliance (EU customers)
6. Pre-Deployment Security Review (before production)
7. New Employee Onboarding (Day 1 security)
8. Employee Offboarding (revoke access)

**How to use**:
- Copy checklist to spreadsheet or Notion
- Assign owners and due dates
- Track progress monthly
- Use scores to measure improvement over time

**Next template**: Security Policies (15 copy-paste policies)
