# Security Policies

**Purpose**: 15 copy-paste security policies required for SOC 2, ISO 27001, and enterprise security reviews.

**Instructions**:
1. Replace placeholders: `[COMPANY NAME]`, `[EFFECTIVE DATE]`, `[OWNER NAME/TITLE]`
2. Customize sections marked with `[CUSTOMIZE: ...]`
3. Publish to internal wiki (Notion, Confluence, Google Sites)
4. Have employees acknowledge on hire

---

## Policy 1: Acceptable Use Policy

**Version**: 1.0
**Effective Date**: [EFFECTIVE DATE]
**Owner**: [CISO/CTO NAME], [TITLE]
**Review Frequency**: Annual

### Purpose
This policy defines acceptable use of [COMPANY NAME] systems, devices, and data to protect company assets and ensure security.

### Scope
This policy applies to all employees, contractors, and third parties with access to [COMPANY NAME] systems.

### Policy

**Acceptable use**:
- Company systems are for business use
- Reasonable personal use is allowed (email, web browsing)
- Employees must protect company data and credentials

**Prohibited activities**:
- Illegal activity (piracy, hacking, harassment)
- Installing unauthorized software (shadow IT)
- Sharing passwords or credentials
- Accessing systems without authorization
- Downloading malicious files or visiting phishing sites
- Storing customer data on personal devices

**Reporting**:
- Report security incidents to security@[COMPANY DOMAIN]
- Report suspicious emails to IT (forward as attachment)
- Report lost/stolen devices immediately

### Enforcement
Violations may result in disciplinary action, up to and including termination.

### Review
This policy will be reviewed annually by [OWNER NAME].

---

## Policy 2: Password Policy

**Version**: 1.0
**Effective Date**: [EFFECTIVE DATE]
**Owner**: [CISO/CTO NAME], [TITLE]
**Review Frequency**: Annual

### Purpose
This policy ensures strong passwords and proper credential management to protect against unauthorized access.

### Scope
This policy applies to all employees and contractors accessing [COMPANY NAME] systems.

### Policy

**Password requirements**:
- Minimum 12 characters (or 8 characters with MFA)
- No password reuse across systems
- Passwords must be unique (not used elsewhere)
- Passwords stored in approved password manager ([1Password/LastPass/Bitwarden])

**Multi-factor authentication (MFA)**:
- Required for all critical systems:
  - Google Workspace (email, Drive, Calendar)
  - AWS, GCP, Azure (cloud infrastructure)
  - GitHub, GitLab (source code repositories)
  - Production databases
- MFA app: Google Authenticator, 1Password, or Authy
- SMS MFA allowed only if authenticator app not supported

**Password changes**:
- Required after suspected compromise
- Required after security breach
- Not required periodically (unless breach)

**Shared accounts**:
- Not allowed (each person must have unique login)
- Service accounts must use API keys (not passwords)

### Procedures

**Setting up MFA**:
1. Download MFA app (Google Authenticator, 1Password, Authy)
2. Enable MFA in each system's security settings
3. Save backup codes in password manager
4. Test MFA login before closing setup

**Resetting forgotten password**:
1. Click "Forgot password" on login page
2. Verify identity via email or phone
3. Create new password (minimum 12 characters)
4. Update password in password manager

### Enforcement
Accounts without MFA will be disabled after 7 days notice. Sharing passwords will result in disciplinary action.

### Review
This policy will be reviewed annually by [OWNER NAME].

---

## Policy 3: Data Classification Policy

**Version**: 1.0
**Effective Date**: [EFFECTIVE DATE]
**Owner**: [CISO/CTO NAME], [TITLE]
**Review Frequency**: Annual

### Purpose
This policy defines how to label and protect data based on sensitivity level.

### Scope
This policy applies to all data created, stored, or processed by [COMPANY NAME].

### Policy

**Classification levels**:

**Level 1: Public**
- Definition: Information intended for public consumption
- Examples: Marketing materials, blog posts, public documentation, press releases
- Protection: No encryption required (but recommended)
- Storage: Anywhere (public S3 buckets, CDN, website)
- Access: No restrictions

**Level 2: Internal**
- Definition: Information for internal use only
- Examples: Internal wikis, Slack conversations, project plans, non-sensitive code
- Protection: Encryption in transit required (TLS 1.2+)
- Storage: Internal systems (Google Workspace, Notion, GitHub private repos)
- Access: All employees

**Level 3: Confidential**
- Definition: Sensitive information that could cause harm if disclosed
- Examples: Customer PII (names, emails, phone numbers), financial data (revenue, costs), source code, contracts, employee HR data
- Protection: Encryption at rest + in transit required
- Storage: Production databases, encrypted cloud storage (S3 with encryption)
- Access: Need-to-know basis (RBAC)

**Level 4: Restricted**
- Definition: Highly sensitive information that would cause severe harm if disclosed
- Examples: Credit card numbers (full PAN), government IDs (NRIC, passport), health records, authentication credentials (passwords, API keys), encryption keys
- Protection: Encryption at rest + in transit + field-level encryption required
- Storage: Secrets managers (AWS Secrets Manager, HashiCorp Vault) or restricted databases
- Access: Minimal access (only admins/on-call engineers with MFA)
- Audit: All access logged

### Procedures

**Labeling data**:
- Add classification level to document title: `[CONFIDENTIAL] Q4 Revenue Report`
- Tag S3 buckets, databases with classification level
- Use email subject prefix: `[RESTRICTED] API Keys for Production`

**Sharing data**:
- Public: Can share freely
- Internal: Share via company systems only (Google Drive, not personal email)
- Confidential: Share via encrypted email or secure file transfer (Dropbox Transfer, Google Drive with expiration)
- Restricted: Share via Secrets Manager (never via email or Slack)

### Enforcement
Mishandling Restricted data (e.g., emailing passwords) will result in disciplinary action.

### Review
This policy will be reviewed annually by [OWNER NAME].

---

## Policy 4: Data Retention & Deletion Policy

**Version**: 1.0
**Effective Date**: [EFFECTIVE DATE]
**Owner**: [CISO/CTO NAME], [TITLE]
**Review Frequency**: Annual

### Purpose
This policy ensures data is not kept longer than necessary, per PDPA and GDPR requirements.

### Scope
This policy applies to all personal data processed by [COMPANY NAME].

### Policy

**Retention periods**:

**Customer account data**:
- Active accounts: Keep while account is active
- Closed accounts: Delete 90 days after closure
- Exception: Transaction history kept 7 years (tax/accounting requirement)

**Marketing data**:
- Email subscribers: Keep while subscribed
- Unsubscribed: Delete 30 days after unsubscribe (allows re-subscription detection)
- Analytics data: Aggregate and anonymize after 2 years (delete raw data)

**Support tickets**:
- Active tickets: Keep while ticket is open
- Closed tickets: Keep 2 years for historical reference
- After 2 years: Delete PII (names, emails), keep ticket content

**Log data**:
- Application logs: Keep 90 days
- Security logs: Keep 1 year (for incident investigation)
- Audit logs: Keep 7 years (compliance requirement)

**Payment data**:
- Credit card numbers: NEVER store (use Stripe tokens)
- Transaction history: Keep 7 years (tax/accounting requirement)
- Invoices: Keep 7 years

**Employee data**:
- Active employees: Keep while employed
- Former employees: Keep 7 years (tax/legal requirement in Singapore)
- Delete after 7 years (or longer if required by local law)

### Procedures

**Automated deletion**:
- Weekly cron job runs deletion scripts
- Deletes accounts closed >90 days ago
- Deletes unsubscribed emails >30 days ago
- Anonymizes support tickets >2 years old

**Manual deletion (data subject requests)**:
- Customer requests deletion via privacy@[COMPANY DOMAIN]
- Verify identity (email verification code)
- Delete within 30 days
- Send confirmation email

### Enforcement
Failure to delete data per policy may violate PDPA/GDPR and result in regulatory fines.

### Review
This policy will be reviewed annually by [OWNER NAME].

---

## Policy 5: Access Control Policy

**Version**: 1.0
**Effective Date**: [EFFECTIVE DATE]
**Owner**: [CISO/CTO NAME], [TITLE]
**Review Frequency**: Annual

### Purpose
This policy ensures access to company systems is granted on a need-to-know basis (least privilege).

### Scope
This policy applies to all employees, contractors, and vendors with access to [COMPANY NAME] systems.

### Policy

**Access principles**:
- Least privilege: Grant minimum necessary access
- Role-based access control (RBAC): Access based on job role
- No shared accounts: Each person has unique login
- MFA required: For all critical systems
- Regular reviews: Quarterly access audits

**Access levels**:
- **Read-only**: View data (analytics, reporting)
- **Standard**: View + edit (most employees)
- **Admin**: View + edit + delete + grant access (managers, IT)
- **Superadmin**: Full access (CISO, CTO only)

**Access requests**:
- Employee submits request via [Jira/ServiceDesk/Slack]
- Manager approves request
- IT provisions access within 24 hours
- Access logged in spreadsheet or GRC tool

**Access reviews**:
- Quarterly: Review admin access (who has keys to the kingdom?)
- Annually: Review all access (remove unnecessary permissions)
- Document reviews in Jira/spreadsheet

**Access revocation**:
- Upon termination: Immediate revocation (within 1 hour)
- Upon role change: Remove unnecessary access (within 24 hours)
- Upon request: Employee can request access removal

### Procedures

**Requesting access**:
1. Submit Jira ticket: "Access request for [System] as [Role]"
2. Manager approves via Jira
3. IT provisions access
4. IT notifies requestor via Jira comment

**Revoking access**:
1. Manager submits Jira ticket: "Revoke access for [Employee] from [System]"
2. IT revokes access within 1 hour (if termination) or 24 hours (if role change)
3. IT confirms revocation via Jira comment

### Enforcement
Unauthorized access or sharing credentials will result in disciplinary action, up to and including termination.

### Review
This policy will be reviewed annually by [OWNER NAME].

---

## Policy 6: Remote Access Policy

**Version**: 1.0
**Effective Date**: [EFFECTIVE DATE]
**Owner**: [CISO/CTO NAME], [TITLE]
**Review Frequency**: Annual

### Purpose
This policy ensures secure remote work and protects company data outside the office.

### Scope
This policy applies to all employees working remotely.

### Policy

**Remote access requirements**:
- VPN required for accessing internal systems ([AWS Client VPN/OpenVPN/Tailscale])
- Laptop encryption required (BitLocker for Windows, FileVault for Mac)
- MFA on VPN login required
- No public WiFi without VPN
- Screen lock after 5 minutes (auto-lock)
- No sharing devices with family members

**Company devices**:
- Company laptops must have endpoint protection (CrowdStrike, SentinelOne)
- Company laptops enrolled in MDM ([Jamf/Intune/Kandji])
- Remote wipe capability enabled (if lost/stolen)
- No personal use of company laptops for illegal activity

**Personal devices (BYOD)**:
- Not allowed for customer data
- If email access needed: Use mobile app (Gmail, Outlook), not browser
- If BYOD required: Enroll in MDM, enable encryption

**Physical security**:
- Lock laptop when away from desk (Windows+L, Cmd+Ctrl+Q)
- Don't leave laptop unattended in public places (coffee shops, airports)
- Report lost/stolen devices immediately to IT

### Procedures

**Setting up VPN**:
1. Download VPN client ([AWS Client VPN/OpenVPN/Tailscale])
2. Import VPN config file (provided by IT)
3. Enable MFA for VPN (Google Authenticator)
4. Test VPN connection

**Reporting lost/stolen device**:
1. Call IT hotline: [PHONE NUMBER]
2. Email IT: it@[COMPANY DOMAIN]
3. IT will remotely wipe device within 1 hour

### Enforcement
Accessing company systems without VPN or on personal devices (BYOD) will result in disciplinary action.

### Review
This policy will be reviewed annually by [OWNER NAME].

---

## Policy 7: Incident Response Policy

**Version**: 1.0
**Effective Date**: [EFFECTIVE DATE]
**Owner**: [CISO/CTO NAME], [TITLE]
**Review Frequency**: Annual

### Purpose
This policy defines how to respond to security incidents to minimize damage and recovery time.

### Scope
This policy applies to all employees who may detect or respond to security incidents.

### Policy

**Incident definition**:
- Unauthorized access to systems or data
- Data breach (customer data leaked)
- Malware or ransomware attack
- Phishing attack (employee clicked malicious link)
- DDoS attack (site unreachable)
- Lost/stolen device with company data

**Incident Response Team**:
- Incident Commander: [CISO/CTO NAME]
- Technical Lead: [SENIOR ENGINEER NAME]
- Legal Counsel: [LAWYER NAME/FIRM]
- PR/Communications: [PR LEAD/MARKETING LEAD]
- Executive Sponsor: [CEO/COO NAME]

**Incident classification**:
- **P0 (Critical)**: Customer data breach, ransomware, production down
  - Response time: Immediate (activate IR team)
  - Containment: 24 hours
  - Resolution: 7 days

- **P1 (High)**: Internal systems compromised, vulnerability exploited
  - Response time: 4 hours
  - Containment: 48 hours
  - Resolution: 7 days

- **P2 (Medium)**: Single employee account compromised, suspicious activity
  - Response time: 24 hours
  - Containment: 7 days
  - Resolution: 30 days

- **P3 (Low)**: Phishing email received (not clicked), port scan
  - Response time: 48 hours
  - Containment: 7 days
  - Resolution: 30 days

**Incident response process**:
1. **Detection**: Identify incident (automated alert or manual report)
2. **Activation**: Notify Incident Commander via phone/Slack
3. **Containment**: Stop the bleeding (isolate systems, revoke credentials)
4. **Eradication**: Remove threat (delete malware, patch vulnerability)
5. **Recovery**: Restore systems (from backup if needed)
6. **Post-mortem**: Document lessons learned, prevent recurrence

**Breach notification**:
- GDPR (EU customers): 72 hours to supervisory authority
- PDPA (Singapore): "As soon as practicable" to PDPC
- Customers: After investigation complete (48-72 hours)

### Procedures

**Reporting an incident**:
1. Email security@[COMPANY DOMAIN] with details:
   - What happened (phishing email, malware detected, unusual login)
   - When (timestamp)
   - Impact (how many users affected)
   - Evidence (screenshots, logs)
2. If P0/P1: Also call Incident Commander at [PHONE NUMBER]

### Enforcement
Failure to report security incidents may delay response and increase damage, resulting in disciplinary action.

### Review
This policy will be reviewed annually by [OWNER NAME].

---

## Policy 8: Vendor Security Policy

**Version**: 1.0
**Effective Date**: [EFFECTIVE DATE]
**Owner**: [CISO/CTO NAME], [TITLE]
**Review Frequency**: Annual

### Purpose
This policy ensures third-party vendors meet security standards before accessing company data.

### Scope
This policy applies to all SaaS vendors, contractors, and partners with access to [COMPANY NAME] systems or data.

### Policy

**Vendor classification**:
- **Tier 1 (Critical)**: Access to customer data or production systems (Stripe, AWS, Zendesk)
  - Requires: SOC 2 Type 2 certification
  - Security questionnaire (20 questions)
  - Data Processing Agreement (DPA)
  - Annual security review

- **Tier 2 (Important)**: Access to internal data or employee accounts (Google Workspace, Slack, GitHub)
  - Requires: SOC 2 Type 1 or security documentation
  - Security questionnaire (20 questions)
  - DPA

- **Tier 3 (Low-risk)**: No access to sensitive data (Calendly, Figma)
  - Requires: None (basic checks only)

**Vendor onboarding**:
- Security questionnaire completed before contract signing
- SOC 2 report requested (Tier 1/2 vendors)
- DPA signed before granting access
- Least privilege access granted (API keys scoped, read-only where possible)
- Vendor owner assigned (responsible for managing relationship)

**Ongoing monitoring**:
- Quarterly: Review vendor access logs
- Annually: Re-run security questionnaire, request updated SOC 2 report
- Immediate: Assess impact if vendor has breach (Google Alert monitoring)

**Vendor offboarding**:
- Revoke access immediately upon contract termination
- Request data deletion within 30 days (per DPA)
- Verify data deleted (request Certificate of Destruction for Tier 1 vendors)

### Procedures

**Approving new vendor**:
1. Submit vendor request to security@[COMPANY DOMAIN]
2. Security team sends security questionnaire to vendor
3. Vendor completes questionnaire + provides SOC 2 report
4. Security team reviews (pass = SOC 2 + DPA required)
5. Procurement signs contract + DPA
6. IT provisions access (least privilege)

### Enforcement
Using unapproved vendors (shadow IT) for customer data will result in disciplinary action.

### Review
This policy will be reviewed annually by [OWNER NAME].

---

## Policy 9: Backup & Recovery Policy

**Version**: 1.0
**Effective Date**: [EFFECTIVE DATE]
**Owner**: [CISO/CTO NAME], [TITLE]
**Review Frequency**: Annual

### Purpose
This policy ensures data can be restored after incident (ransomware, accidental deletion, hardware failure).

### Scope
This policy applies to all production data and critical business systems.

### Policy

**Backup strategy**:
- **3-2-1 rule**: 3 copies of data, 2 different media, 1 offsite
- **Production databases**: Hourly automated backups (RDS snapshots, MongoDB backups)
- **Files/documents**: Daily backups (S3 versioning, Google Drive)
- **Source code**: Continuous (GitHub already has copies)

**Backup storage**:
- Separate AWS account (attacker can't delete backups)
- Different region (disaster recovery if primary region fails)
- Encrypted at rest (AES-256)
- Versioned (can restore from any point in time)
- Lifecycle policies (delete backups after 90 days to save cost)

**Recovery objectives**:
- **RTO (Recovery Time Objective)**: How long can we be down?
  - Critical systems (production app): 4 hours
  - Important systems (admin panel): 24 hours
  - Non-critical systems (marketing site): 7 days

- **RPO (Recovery Point Objective)**: How much data can we lose?
  - Critical data (transactions, customer data): 1 hour
  - Important data (support tickets, logs): 24 hours
  - Non-critical data (marketing content): 7 days

**Backup testing**:
- **Monthly**: Test restore from backup (verify data integrity)
- **Quarterly**: Full disaster recovery drill (restore entire production)
- **Document results**: Jira ticket with screenshots

### Procedures

**Restoring from backup**:
1. Identify backup to restore (timestamp, version)
2. Restore to staging first (not production)
3. Verify data integrity (spot check critical records)
4. Restore to production (schedule during maintenance window)
5. Notify team via Slack #engineering

**Disaster recovery drill**:
1. Schedule 2-hour drill (Friday afternoon recommended)
2. Simulate disaster (delete staging database)
3. Restore from backup
4. Document timeline (how long to restore?)
5. Post-mortem: What went well? What to improve?

### Enforcement
Failure to test backups may result in data loss during actual disaster.

### Review
This policy will be reviewed annually by [OWNER NAME].

---

## Policy 10: Change Management Policy

**Version**: 1.0
**Effective Date**: [EFFECTIVE DATE]
**Owner**: [CISO/CTO NAME], [TITLE]
**Review Frequency**: Annual

### Purpose
This policy prevents production outages from unreviewed changes.

### Scope
This policy applies to all code changes and infrastructure modifications affecting production.

### Policy

**Change approval**:
- All production changes require pull request (PR) review
- At least 1 engineer approval before merge (2 approvals for critical changes)
- Automated tests must pass (CI/CD)
- Staging deployment before production (test in staging first)
- Rollback plan documented (how to undo change)

**Change types**:
- **Standard change** (low risk): 1 approval, staging test
  - Examples: Bug fix, CSS change, documentation update

- **Normal change** (medium risk): 2 approvals, staging test, rollback plan
  - Examples: New feature, database migration, API change

- **Emergency change** (high risk): 1 approval, production test, immediate rollback if issues
  - Examples: Security patch, critical bug fix during outage

**Deployment schedule**:
- Standard/Normal changes: Deploy during business hours (Mon-Thu, 10am-4pm SGT)
- Emergency changes: Deploy anytime (24/7)
- No deployments on Fridays (avoid weekend outages)
- Maintenance windows: Saturdays 2am-4am SGT (low traffic)

**Rollback procedure**:
- Automated rollback: Revert git commit, re-deploy previous version
- Database migrations: Write reversible migrations (up + down)
- If rollback fails: Escalate to Incident Response Team

### Procedures

**Deploying code change**:
1. Create pull request (PR) on GitHub
2. Request review from at least 1 engineer
3. Address review comments
4. Wait for CI/CD tests to pass (automated)
5. Merge PR (deploys to staging automatically)
6. Test in staging (smoke tests)
7. Deploy to production (click "Deploy to prod" button)
8. Monitor for 30 minutes (check error rate, latency)

### Enforcement
Deploying to production without approval will result in disciplinary action.

### Review
This policy will be reviewed annually by [OWNER NAME].

---

## Policy 11-15: Remaining Policies (Condensed)

### Policy 11: Physical Security Policy
- Laptop encryption required (BitLocker, FileVault)
- Screen lock after 5 minutes
- No unattended laptops in public
- Report stolen/lost devices immediately
- Office access badges (if physical office)

### Policy 12: BYOD (Bring Your Own Device) Policy
- Company data only on company devices (no BYOD for customer data)
- If BYOD allowed: MDM required, encryption required, remote wipe capability
- Email access via mobile app (not browser)
- No storing customer data on personal devices

### Policy 13: Cryptography Policy
- TLS 1.2+ for data in transit
- AES-256 for data at rest
- No storing credit card numbers (use tokenization)
- No storing passwords in plaintext (use bcrypt, scrypt, argon2)
- Secrets stored in Secrets Manager (AWS, HashiCorp Vault)

### Policy 14: Security Awareness Training Policy
- Annual security awareness training (all employees)
- New hire security training (within 7 days)
- Quarterly phishing simulations (KnowBe4, SecurityIQ)
- Incident response training (IR team only)
- Training completion tracked (HR system)

### Policy 15: Asset Management Policy
- Asset inventory (all laptops, servers, SaaS tools)
- Asset ownership (who owns each system)
- Asset classification (critical, important, non-critical)
- Asset disposal (secure wipe before decommissioning)
- Quarterly asset inventory review

---

## Summary

**15 policies provided**:
1. Acceptable Use Policy
2. Password Policy
3. Data Classification Policy
4. Data Retention & Deletion Policy
5. Access Control Policy
6. Remote Access Policy
7. Incident Response Policy
8. Vendor Security Policy
9. Backup & Recovery Policy
10. Change Management Policy
11. Physical Security Policy
12. BYOD Policy
13. Cryptography Policy
14. Security Awareness Training Policy
15. Asset Management Policy

**How to use**:
1. Copy policy template
2. Replace placeholders (`[COMPANY NAME]`, `[EFFECTIVE DATE]`, `[OWNER]`)
3. Customize sections marked with `[CUSTOMIZE: ...]`
4. Publish to internal wiki (Notion, Confluence, Google Sites)
5. Have employees acknowledge on hire
6. Review annually

**Next template**: Vendor Questionnaires (20-question security assessment)
