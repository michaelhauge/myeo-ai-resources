# Company Security Policy Template

**Instructions**: Replace all [bracketed text] with your company-specific information. This template is designed for SMBs (5-200 employees) and covers essential security policies without overwhelming complexity.

**Last updated**: [Date]
**Policy owner**: [Name, Title]
**Review frequency**: Annually (or when major changes occur)

---

## 1. Purpose and Scope

This Security Policy establishes the security requirements and responsibilities for all employees, contractors, and third parties who access [Company Name]'s systems, data, and facilities.

**Who this policy applies to**:
- All employees (full-time, part-time, remote)
- Contractors and consultants
- Third-party vendors with access to company systems
- Board members and advisors

**What this policy covers**:
- Password and access management
- Device security (laptops, phones, tablets)
- Data handling and classification
- Network and cloud security
- Acceptable use of company resources
- Incident reporting

---

## 2. Information Security Roles and Responsibilities

### 2.1 Management Responsibilities

**[CEO/Managing Director]**:
- Overall accountability for security program
- Approval of security budget and priorities
- Final authority on security incidents and breaches

**[IT Manager / Operations Manager]** (or designated Security Officer):
- Day-to-day security operations
- Implementation of security controls
- Incident response coordination
- Monthly security audits and reporting

**[All Managers]**:
- Enforce security policies within their teams
- Ensure employees complete security training
- Report security incidents immediately
- Conduct security reviews during onboarding/offboarding

### 2.2 Employee Responsibilities

**All employees must**:
- Follow this security policy
- Complete security awareness training within first 30 days (and annually)
- Protect company data and systems
- Report security incidents immediately (email: security@[company].com)
- Use strong, unique passwords with a password manager
- Enable multi-factor authentication (MFA) on all accounts

**Violation of this policy may result in**:
- First offense: Written warning and remedial training
- Second offense: Suspension or termination (depending on severity)
- Criminal violations: Termination and legal action

---

## 3. Access Control and Authentication

### 3.1 Password Policy

**Requirements**:
- **Minimum length**: 12 characters (or use password manager auto-generated passwords)
- **Complexity**: Not required if using password manager (length is more important)
- **Expiration**: Passwords do NOT expire (per NIST guidelines) if MFA is enabled
- **Reuse**: Cannot reuse any of last 24 passwords
- **Storage**: All passwords MUST be stored in approved password manager ([1Password / Bitwarden])

**Prohibited practices**:
- ❌ Sharing passwords with anyone (including managers, IT staff, colleagues)
- ❌ Writing passwords on paper or sticky notes
- ❌ Using same password across multiple accounts
- ❌ Using dictionary words, names, or common patterns (Password123, Winter2024)
- ❌ Sending passwords via email, Slack, or text message

**Default password changes**:
- All default passwords (routers, software, devices) MUST be changed immediately upon receipt
- Default Wi-Fi passwords MUST be changed within 24 hours of router installation

### 3.2 Multi-Factor Authentication (MFA)

**MFA is REQUIRED for**:
- ☑ All email accounts (Google Workspace, Microsoft 365)
- ☑ All admin/privileged accounts
- ☑ Financial systems (banking, payment processing, accounting)
- ☑ Cloud storage (Google Drive, OneDrive, Dropbox)
- ☑ Customer data systems (CRM, support desk)
- ☑ Code repositories (GitHub, GitLab, Bitbucket)

**Approved MFA methods** (in order of security):
1. **Hardware security keys** (YubiKey, Google Titan) - Most secure, recommended for admins
2. **Authenticator apps** (Google Authenticator, Authy, 1Password) - Required minimum
3. **SMS codes** - Allowed only if no other option available (least secure)

**Prohibited MFA methods**:
- ❌ SMS as sole MFA method for admin accounts
- ❌ Email-based codes (email can be compromised)

### 3.3 Account Management

**Access provisioning**:
- New employee accounts created by [IT Manager / Operations Manager] only
- Access granted based on role (principle of least privilege)
- Default access: Email, file storage, communication tools (Slack/Teams)
- Additional access: Requested by manager via [process - email IT, ticket system, etc.]

**Access reviews**:
- Quarterly: Review all admin accounts (who has admin privileges?)
- Quarterly: Review shared accounts (sales@, support@, etc. - these should be eliminated)
- Annually: Review all employee access (still appropriate for role?)

**Account lockout**:
- Accounts locked after 10 failed login attempts
- Auto-unlock after 30 minutes OR manual unlock by IT
- Repeated lockouts investigated for potential brute-force attack

---

## 4. Device Security

### 4.1 Company-Owned Devices

**Security requirements for all company laptops, desktops, phones, tablets**:
- ☑ **Full disk encryption** enabled (FileVault for Mac, BitLocker for Windows)
- ☑ **Automatic updates** enabled (OS and applications)
- ☑ **Antivirus/endpoint protection** installed ([SentinelOne / CrowdStrike / Malwarebytes / Microsoft Defender])
- ☑ **Screen lock** after 5 minutes of inactivity
- ☑ **Strong password or biometric** (Face ID, Touch ID, Windows Hello)
- ☑ **Firewall** enabled
- ☑ **VPN required** when on public Wi-Fi (see Section 5.3)

**Prohibited on company devices**:
- ❌ Installing unlicensed/pirated software
- ❌ Disabling antivirus or security software
- ❌ Jailbreaking or rooting devices
- ❌ Storing company data on personal cloud accounts (personal Dropbox, iCloud, Google Drive)
- ❌ Connecting to unknown/untrusted Wi-Fi networks without VPN

**Lost or stolen devices**:
- **Immediately report** to IT and manager (within 1 hour if possible)
- Device will be remotely wiped via MDM ([Intune / Jamf / Kandji / Hexnode])
- File police report (required for insurance claim)
- Replacement device issued within [timeframe]

### 4.2 BYOD (Bring Your Own Device) Policy

**[Company Name] [DOES / DOES NOT] allow personal devices to access company data.**

**If BYOD is allowed:**

**Security requirements for personal devices accessing company email/data**:
- ☑ Device PIN/password (minimum 6 digits)
- ☑ Automatic updates enabled
- ☑ Company MDM profile installed (allows remote wipe of company data only)
- ☑ VPN when on public Wi-Fi
- ☑ Separate work profile (Android) or managed Apple ID (iOS)

**Company rights on BYOD devices**:
- Company can remotely wipe **company data only** (not personal data) if device is lost/stolen
- Company may monitor **company data only** (not personal data, photos, messages)
- Employee must allow MDM profile installation

**Employee responsibilities**:
- Maintain device security (updates, antivirus)
- Report lost/stolen devices immediately
- Allow company IT to inspect device if security incident suspected

**If BYOD is NOT allowed:**

Company data may ONLY be accessed from company-owned devices. Exceptions require written approval from [IT Manager / CEO].

---

## 5. Network and Cloud Security

### 5.1 Office Wi-Fi Policy

**Network configuration**:
- Separate networks:
  - **Main network**: [Network Name] - Employees only, WPA3/WPA2 encryption
  - **Guest network**: [Guest Network Name] - Visitors/contractors, isolated from main network
- Wi-Fi passwords changed quarterly (or immediately if employee with Wi-Fi access departs)
- Default router admin password changed

**Prohibited**:
- ❌ Connecting personal devices to main company network (use guest network)
- ❌ Sharing Wi-Fi password with non-employees
- ❌ Connecting IoT devices (smart speakers, cameras) to main network (use guest network or separate IoT network)

### 5.2 Cloud Services Policy

**Approved cloud services**:
- **Email/productivity**: [Google Workspace / Microsoft 365]
- **File storage**: [Google Drive / OneDrive / Dropbox Business]
- **Communication**: [Slack / Microsoft Teams]
- **[Other approved SaaS apps - CRM, project management, etc.]**

**Unapproved/shadow IT**:
- Employees may NOT use unapproved cloud services to store/process company data
- Examples of prohibited apps (unless approved):
  - Personal cloud storage (personal Dropbox, iCloud, OneDrive personal)
  - File transfer services (WeTransfer, SendAnywhere, Filemail)
  - Personal email forwarding (forwarding work email to personal Gmail)
  - Unapproved AI tools for customer data (ChatGPT, Claude) - see AI Policy below

**How to request approval for new cloud service**:
1. Email IT/operations: App name, purpose, cost, what data it will access
2. IT conducts security review (see Section 9: Vendor Management)
3. Decision within 3 business days
4. If approved, added to approved apps list

### 5.3 VPN (Virtual Private Network) Policy

**VPN is REQUIRED when**:
- Accessing company systems from public Wi-Fi (coffee shops, airports, hotels)
- Accessing company systems from home (if not using trusted home network)
- Accessing company systems from international locations

**Approved VPN**: [Cloudflare Zero Trust / NordLayer / Perimeter 81 / Tailscale]

**How to connect to VPN**:
- [Instructions or link to IT documentation]

---

## 6. Data Classification and Handling

### 6.1 Data Classification Levels

**Public**:
- **Definition**: Information intended for public consumption
- **Examples**: Marketing materials, public website content, press releases
- **Handling**: Can be shared freely, no restrictions

**Internal**:
- **Definition**: Information for internal use only, but not highly sensitive
- **Examples**: Internal policies, org charts, office locations, meeting notes
- **Handling**: Can be shared with employees and contractors, but not externally without approval

**Confidential**:
- **Definition**: Sensitive business information that could cause harm if disclosed
- **Examples**: Financial data, employee salaries, customer lists, contracts, product roadmaps
- **Handling**:
  - Shared only with authorized employees (need-to-know basis)
  - Email: Use "Confidential" label in subject line
  - Files: Label documents "CONFIDENTIAL" in header/footer
  - Sharing: Cannot be shared externally without explicit approval from [manager / legal]

**Restricted** (Highly Confidential):
- **Definition**: Most sensitive data, severe harm if disclosed, regulatory requirements
- **Examples**:
  - Customer PII (personal data under PDPA/GDPR)
  - Payment card data (credit card numbers, CVV)
  - Health data (if applicable - HIPAA)
  - Authentication credentials (passwords, API keys)
  - Legal documents (litigation, investigations)
- **Handling**:
  - Access restricted to specific roles only (not all employees)
  - Email: Encrypted email required OR use secure file sharing (Google Drive/OneDrive with specific people only)
  - Files: Cannot use "Anyone with the link" sharing
  - Storage: Must be encrypted at rest
  - Printing: Only on secure printers, documents must be shredded (not thrown in trash)

### 6.2 Email Security

**Safe email practices**:
- ☑ Verify sender before clicking links or downloading attachments (see 10 Red Flags in Guide 03)
- ☑ Hover over links to see actual URL before clicking
- ☑ Be suspicious of urgent requests (especially financial transactions)
- ☑ Use [Encrypted Email / Secure File Sharing] for Confidential/Restricted data

**Prohibited**:
- ❌ Opening attachments from unknown senders
- ❌ Clicking links in suspicious emails
- ❌ Forwarding work email to personal email accounts
- ❌ Auto-forwarding email to external addresses (creates data leak risk)

**If you receive a phishing email**:
1. **Do NOT click** any links or download attachments
2. **Report** to IT immediately (Forward to security@[company].com or use report phishing button)
3. **Delete** the email

**If you accidentally clicked a phishing link**:
1. **Immediately disconnect** from internet (unplug Ethernet or disable Wi-Fi)
2. **Report to IT** (call or text [IT phone number] - do not email)
3. **Change your password** (after IT approves reconnecting)

### 6.3 File Sharing Policy

**Internal sharing** (with employees/contractors):
- Use approved cloud storage ([Google Drive / OneDrive])
- Shared with specific people by email address (not "Anyone with the link")

**External sharing** (with clients, partners, vendors):
- **Public data**: "Anyone with the link" is acceptable
- **Internal data**: Share with specific email addresses only
- **Confidential data**:
  - Share with specific email addresses + expiration date (30-90 days)
  - OR use password-protected files
- **Restricted data**:
  - Encrypted file sharing only
  - Require recipient MFA authentication
  - Set expiration date (7-30 days)

**Prohibited**:
- ❌ Sharing "Confidential" or "Restricted" data via "Anyone with the link"
- ❌ Uploading company data to personal cloud accounts (personal Dropbox, iCloud)
- ❌ Using file transfer services (WeTransfer) for Confidential data
- ❌ Sending Restricted data via unencrypted email

---

## 7. Physical Security

### 7.1 Office Security

**Access control**:
- Office doors locked after business hours
- Visitors must be escorted by employee (no unaccompanied visitors)
- Visitor log maintained (name, company, date, host)

**Clean desk policy**:
- Confidential documents must not be left on desks overnight
- Lock sensitive documents in drawers or file cabinets
- Computer screens locked when stepping away (screen lock after 5 minutes)

**Secure disposal**:
- **Paper documents**: Shredded (not thrown in trash)
- **Hard drives/devices**: Wiped using certified software ([DBAN / Blancco]) OR physically destroyed
- **Never throw devices in trash** (data recovery is possible even after "deleting" files)

### 7.2 Remote Work Security

**Home office requirements**:
- Secure Wi-Fi (WPA3 or WPA2, not default password)
- VPN when accessing company systems
- Physical security (devices not accessible to family members, visitors)
- Privacy (no one can see screen during video calls or work sessions)

**Public spaces (coffee shops, coworking)**:
- VPN required
- Privacy screens recommended
- Never leave devices unattended
- Be aware of shoulder surfers (people watching your screen)

---

## 8. Acceptable Use Policy

### 8.1 Permitted Uses

Company devices and systems are provided for business purposes. Reasonable personal use is permitted if it:
- Does not interfere with work responsibilities
- Does not consume significant bandwidth or resources
- Does not violate any other policy

**Examples of acceptable personal use**:
- Checking personal email during breaks
- Online shopping during lunch
- Personal research (not illegal or inappropriate content)

### 8.2 Prohibited Uses

**Illegal activities**:
- ❌ Downloading or distributing pirated software, movies, music
- ❌ Hacking, unauthorized access, or penetration testing (without explicit authorization)
- ❌ Any illegal activity under Singapore/Malaysia/applicable law

**Inappropriate content**:
- ❌ Accessing, storing, or distributing pornographic, hateful, or discriminatory content
- ❌ Gambling sites or services
- ❌ Content promoting violence or illegal drugs

**Resource abuse**:
- ❌ Cryptocurrency mining
- ❌ Running personal servers or services
- ❌ Mass downloading or file sharing (torrents)
- ❌ Excessive personal use that impacts work or network performance

**Security violations**:
- ❌ Attempting to bypass security controls (disabling antivirus, VPN, firewall)
- ❌ Sharing passwords or access credentials
- ❌ Installing unauthorized software (unless IT approves)

---

## 9. Vendor and Third-Party Security

### 9.1 Vendor Risk Assessment

**All vendors with access to company systems or data must**:
- Complete security questionnaire (see `templates/vendor-questionnaire.md`)
- Provide proof of security measures (SOC 2, ISO 27001, or equivalent)
- Sign Data Processing Agreement (DPA) if handling customer data (PDPA/GDPR requirement)

**Vendor categories**:

| Risk Level | Examples | Requirements |
|------------|----------|--------------|
| **High Risk** | Payment processors, customer data systems, infrastructure hosts | SOC 2 Type II, annual security review, DPA required |
| **Medium Risk** | Communication tools, project management, analytics | Security questionnaire, DPA if handling data |
| **Low Risk** | Marketing tools (view-only data), design tools | Basic security review |

### 9.2 Vendor Access Management

**Vendor accounts**:
- Separate vendor accounts (not employee accounts)
- Least privilege access (only what's needed for their service)
- Access reviewed quarterly (still needed?)
- Access revoked immediately when contract ends

**Vendor offboarding**:
- Within 24 hours of contract termination:
  - Revoke all access (accounts, VPN, physical access)
  - Change any passwords vendor had access to
  - Retrieve all company devices and documents

---

## 10. Artificial Intelligence (AI) Policy

**Approved AI tools for internal use** (non-customer data):
- [List approved tools - ChatGPT, Claude, GitHub Copilot, etc.]

**AI usage guidelines**:
- ☑ Use AI for drafting, research, code generation (internal use)
- ☑ Review AI outputs for accuracy (AI makes mistakes)
- ☑ Cite AI assistance in work product (transparency)

**Prohibited**:
- ❌ Inputting customer PII into AI tools (PDPA/GDPR violation unless tool is GDPR-compliant)
- ❌ Inputting Confidential/Restricted data into AI tools (data may be used for training)
- ❌ Using AI-generated content without human review (accuracy, bias, legal concerns)
- ❌ Relying solely on AI for critical decisions (hiring, financial, legal)

**GDPR-compliant AI tools** (for customer data):
- [List tools with DPAs - Claude for Work, ChatGPT Enterprise, etc.]

**If unsure whether data can be used with AI**: Ask IT or err on the side of caution (don't input).

---

## 11. Backup and Disaster Recovery

**Backup policy**:
- **Frequency**: Daily backups for critical systems (file servers, databases)
- **Retention**: 30 days of daily backups + 12 months of monthly backups
- **3-2-1 rule**: 3 copies, 2 media types, 1 offsite
- **Testing**: Monthly backup restore tests (verify backups actually work)

**Disaster recovery**:
- **Recovery Time Objective (RTO)**: [24 hours / 48 hours] (maximum tolerable downtime)
- **Recovery Point Objective (RPO)**: [24 hours / 1 week] (maximum tolerable data loss)
- **Disaster recovery plan**: See [link to DR plan or Guide 06]

---

## 12. Security Incident Response

### 12.1 What is a Security Incident?

**Examples of security incidents**:
- Suspected or confirmed data breach (unauthorized access to customer/employee data)
- Ransomware or malware infection
- Phishing attack (employee clicked link or entered credentials)
- Lost or stolen device containing company data
- Unauthorized access to accounts (suspicious logins)
- Accidental data disclosure (email sent to wrong recipient)

### 12.2 Incident Reporting

**All security incidents must be reported immediately**:

**How to report**:
1. **Email**: security@[company].com
2. **Phone/Text** (for urgent incidents): [IT Manager phone]
3. **In-person**: [IT Manager name]

**What to include**:
- What happened (be specific)
- When did you notice it
- What systems/data were affected
- Any actions you've already taken

**Do NOT**:
- ❌ Wait to report (delays increase damage)
- ❌ Try to "fix it yourself" (you may destroy evidence)
- ❌ Assume "it's probably nothing" (report anyway, let IT decide)

### 12.3 Incident Response Process

**See**: `templates/incident-response.md` for full playbook

**High-level process**:
1. **Contain**: Isolate affected systems (disconnect from network, suspend accounts)
2. **Investigate**: Determine what happened, scope of impact, how attacker got in
3. **Eradicate**: Remove attacker access, close entry point
4. **Recover**: Restore systems from backups, verify attacker is gone
5. **Notify**: Inform customers, regulators, insurance (if required)
6. **Learn**: Post-mortem, implement improvements

---

## 13. Compliance and Legal Requirements

**Regulations we must comply with** (check all that apply):

☐ **PDPA** (Personal Data Protection Act - Singapore/Malaysia)
  - Applies to: Companies collecting personal data from Singapore/Malaysia residents
  - Requirements: Consent, data protection measures, breach notification

☐ **GDPR** (General Data Protection Regulation - EU)
  - Applies to: Companies processing data of EU residents
  - Requirements: Legal basis for processing, data subject rights, breach notification (72 hours)

☐ **PCI-DSS** (Payment Card Industry Data Security Standard)
  - Applies to: Companies storing, processing, or transmitting credit card data
  - Note: Using Stripe/Square/PayPal? They handle PCI compliance (you don't store card data)

☐ **HIPAA** (Health Insurance Portability and Accountability Act - US)
  - Applies to: Healthcare providers, health insurers, their business associates
  - Requirements: PHI protection, HIPAA-compliant tools, Business Associate Agreements

☐ **SOC 2** (Service Organization Control)
  - Applies to: SaaS companies, service providers handling customer data
  - Requirements: Annual audit of security controls ($15K-$50K cost)

**For detailed compliance requirements**: See COMPLIANCE.md

---

## 14. Security Training and Awareness

**Required training**:

**All employees**:
- ☑ Security awareness training (within first 30 days of employment)
- ☑ Annual security refresher training
- ☑ Monthly phishing simulations (via [KnowBe4 / Proofpoint / Cofense])

**Managers**:
- All of the above, plus:
- ☑ Incident response training (what to do if someone reports breach)
- ☑ Data classification training (how to identify and handle sensitive data)

**IT staff / admins**:
- All of the above, plus:
- ☑ Advanced security training (forensics, incident response, security tools)
- ☑ Vendor-specific certifications (Google Workspace, Microsoft 365, security tools)

**Training topics**:
- Password security and MFA
- Phishing and social engineering
- Device security
- Data classification and handling
- Incident reporting
- Physical security

**Training delivery**:
- Online modules: [Platform - KnowBe4, Udemy, etc.]
- In-person sessions: [Quarterly / annually]
- Internal documentation: [Link to security wiki or knowledge base]

---

## 15. Policy Review and Updates

**Review schedule**:
- This policy is reviewed **annually** (or more frequently if major changes occur)
- Last review: [Date]
- Next scheduled review: [Date]

**Policy updates**:
- Updates approved by: [CEO / Security Committee]
- Employees notified of updates via: [Email / Slack / Company meeting]
- Employees must acknowledge updates: [Within 14 days]

**Contact for questions**:
- Policy questions: [IT Manager / Operations Manager] (email: [email])
- Incident reporting: security@[company].com or [phone]
- Security suggestions: [email]

---

## 16. Acknowledgment

I acknowledge that I have read, understood, and agree to comply with this Security Policy. I understand that violation of this policy may result in disciplinary action, up to and including termination.

**Employee signature**: _______________________________
**Employee name (printed)**: _______________________________
**Date**: _______________________________

**Manager signature**: _______________________________
**Manager name (printed)**: _______________________________
**Date**: _______________________________

---

## Appendix: Quick Reference

### Emergency Contacts
- **Security incidents**: security@[company].com / [phone]
- **IT support**: [email / phone]
- **Cyber insurance**: [Insurer name / policy number / phone]
- **Cybersecurity consultant**: [Name / phone]
- **Legal counsel**: [Name / phone]

### Common Scenarios Quick Guide

| Scenario | What To Do |
|----------|-----------|
| **Received phishing email** | Don't click links. Report to security@[company].com. Delete. |
| **Clicked phishing link** | Disconnect from internet. Call IT: [phone]. Change password. |
| **Lost device** | Report immediately: [phone]. Device will be remotely wiped. |
| **Suspicious login alert** | Change password immediately. Enable MFA. Report to IT. |
| **Ransomware screen** | Don't pay yet. Disconnect from network. Call IT: [phone]. |
| **Need to share confidential data** | Use [Google Drive / OneDrive], specific people only, expiration date. |
| **Vendor needs access** | Email IT with: vendor name, what access needed, why, duration. |
| **Forgot password** | Use password manager recovery. If needed, email IT for reset. |

---

**End of Security Policy Template**

**Implementation note**: After customizing this template:
1. Have legal counsel review (if handling customer data)
2. Present to all employees (company meeting + email)
3. Collect signed acknowledgments from all employees
4. Store acknowledgments securely (HR file or document management system)
5. Review and update annually
