# Incident Response Playbook Template

**Purpose**: Provide step-by-step procedures for responding to cybersecurity incidents. This playbook ensures fast, coordinated response to minimize damage and recovery time.

**Instructions**: Customize all [bracketed sections] for your company. Print a copy and store in an accessible location (manager's desk, emergency binder). Practice response procedures quarterly via tabletop exercises.

---

## Emergency Contact Information

**Keep this section updated with current contact information:**

### Internal Contacts

| Role | Name | Phone | Email | After-Hours Contact |
|------|------|-------|-------|---------------------|
| **Incident Commander** | [CEO / Owner] | | | |
| **Technical Lead** | [IT Manager / Developer] | | | |
| **Communications Lead** | [Marketing / HR Manager] | | | |
| **Legal Counsel** | [Name / Law Firm] | | | |
| **HR Manager** | [Name] | | | |

### External Contacts

| Service | Company | Phone | Account # | Notes |
|---------|---------|-------|-----------|-------|
| **Cyber Insurance** | [Insurer] | | Policy #: | **Call within 24 hours** |
| **IT Consultant** | [Company] | | | For 24/7 emergency support |
| **Cybersecurity Consultant** | [Company] | | | Forensics, incident response |
| **Law Enforcement** | Singapore Police / Malaysia Police | +65 6225 0000 / +60 3-2266 2222 | | |
| **PDPC (Singapore)** | Personal Data Protection Commission | https://www.pdpc.gov.sg/ | | Breach notification within 72 hours |

### Service Provider Contacts

| Provider | Service | Support Phone | Support Email | Account Manager |
|----------|---------|---------------|---------------|-----------------|
| [Google Workspace / Microsoft 365] | Email | | | |
| [Hosting Provider] | Infrastructure | | | |
| [Payment Processor] | Payments | | | |
| [CRM Provider] | Customer data | | | |

---

## Incident Classification

**Use this matrix to determine incident severity and response urgency:**

### Severity Levels

| Level | Description | Examples | Response Time | Escalation |
|-------|-------------|----------|---------------|------------|
| **CRITICAL (P1)** | Active threat, data breach, ransomware, financial fraud | - Ransomware encrypting files<br>- Active data exfiltration<br>- Unauthorized wire transfer<br>- Customer PII breach | **IMMEDIATE** (within 1 hour) | Incident Commander, all stakeholders, cyber insurance |
| **HIGH (P2)** | Significant security incident, no immediate threat | - Phishing click (credentials entered)<br>- Malware detected and contained<br>- Unauthorized account access<br>- Lost device with sensitive data | **Within 4 hours** | Incident Commander, Technical Lead |
| **MEDIUM (P3)** | Security concern, limited impact | - Suspicious login attempts<br>- Phishing email received (not clicked)<br>- Policy violation<br>- Expired SSL certificate | **Within 24 hours** | Technical Lead |
| **LOW (P4)** | Informational, no immediate threat | - Security scan findings<br>- Failed backup (no data loss)<br>- Password policy violation | **Within 1 week** | Technical Lead |

**When in doubt, escalate up.** It's better to over-escalate a P3 than under-escalate a P1.

---

## Phase 1: DETECTION (Recognize the Incident)

### Common Detection Methods

☐ **Automated alerts**:
- Antivirus/endpoint protection alert (malware detected)
- Email security alert (phishing detected)
- Cloud security alert (unusual login, admin change)
- Backup failure alert
- Monitoring system alert (system down, unusual traffic)

☐ **Employee reports**:
- "I can't log in" (possible account takeover)
- "I received a suspicious email"
- "My files are encrypted" (ransomware)
- "I think I clicked a phishing link"

☐ **Customer reports**:
- "Why did you send me malware?"
- "Someone from your company is contacting me asking for money"
- "Your website infected my computer"

☐ **Audit findings**:
- Unauthorized user accounts discovered
- Unexpected configuration changes
- Unusual data access patterns

### Initial Assessment (First 15 Minutes)

**Who discovered it?** _______________________________
**When was it discovered?** _______________________________
**What happened?** (Brief description)
_______________________________
_______________________________

**Severity level** (use matrix above): ☐ P1 ☐ P2 ☐ P3 ☐ P4

**Affected systems** (check all that apply):
☐ Email
☐ File storage (Google Drive, OneDrive)
☐ Customer database
☐ Financial systems
☐ Website
☐ Internal applications
☐ Network/infrastructure
☐ Employee devices
☐ Other: _______________________________

**Estimated number of records/systems affected**: _______________________________

---

## Phase 2: RESPONSE (Activate Incident Response Team)

### Step 1: Assemble Team (Within 30 minutes for P1/P2)

**Incident Commander**: _______________________________ (CEO, Owner, or designated person)
- **Responsibilities**: Make final decisions, authorize expenses, communicate with board/investors

**Technical Lead**: _______________________________ (IT Manager, Developer, or IT Consultant)
- **Responsibilities**: Technical investigation, containment, eradication, recovery

**Communications Lead**: _______________________________ (Marketing, HR, or designated person)
- **Responsibilities**: Customer communications, employee communications, PR if needed

**Legal Counsel**: _______________________________ (If data breach or regulatory notification required)
- **Responsibilities**: Legal advice, regulatory notifications, contracts

**Additional team members** (as needed):
- _______________________________ Role: _______________________________
- _______________________________ Role: _______________________________

### Step 2: Set Up War Room

**Physical location**: _______________________________ (conference room, or virtual if remote)
**Communication channel**: _______________________________ (Slack channel, Teams chat, phone bridge)
**Document location**: _______________________________ (Google Doc, Notion page for timeline/notes)

**Initial team meeting agenda** (30 minutes):
1. Incident overview (what we know so far)
2. Assign roles and responsibilities
3. Establish communication protocols (how often to update, who to notify)
4. Set next check-in time
5. Begin investigation and containment

---

## Phase 3: CONTAINMENT (Stop the Bleeding)

**Goal**: Prevent further damage while preserving evidence for investigation.

### Short-Term Containment (First 1-4 Hours)

☐ **Isolate affected systems**:
- ☐ Disconnect infected computers from network (unplug Ethernet, disable Wi-Fi)
  - **IMPORTANT**: Do NOT shut down (preserves evidence in RAM)
- ☐ Suspend compromised user accounts (Google Workspace, Microsoft 365, etc.)
- ☐ Revoke compromised API keys/tokens
- ☐ Block attacker IP addresses (firewall, cloud security)
- ☐ Disable compromised integrations (third-party apps with OAuth access)

☐ **Preserve evidence** (CRITICAL for investigation and insurance):
- ☐ Take screenshots of any error messages, ransomware notes, suspicious activity
- ☐ Export audit logs (email, cloud storage, VPN, servers)
  - Google Workspace: Admin Console → Reporting → Audit
  - Microsoft 365: Purview → Audit → Export
- ☐ Save to offline location (USB drive, not on compromised systems)
- ☐ Document timeline in incident log (see template below)

☐ **Change credentials** (for compromised accounts):
- ☐ Reset passwords for affected accounts
- ☐ Enable MFA if not already enabled
- ☐ Revoke active sessions
- ☐ Review OAuth tokens and revoke suspicious ones

☐ **Notify stakeholders** (internal):
- ☐ Brief employees (if widespread impact): "Security incident detected, here's what to do..."
- ☐ Notify management/board (P1/P2 incidents)
- ☐ Call cyber insurance provider (within 24 hours - policy requirement)

### Long-Term Containment (Next 24 Hours)

☐ **Segment the network** (if network compromise):
- ☐ Isolate critical systems (customer database, financial systems)
- ☐ Implement additional firewall rules
- ☐ Disable unnecessary services and ports

☐ **Implement temporary workarounds**:
- If email compromised: ☐ Set up temporary email forwarding
- If website down: ☐ Set up status page
- If payment processing down: ☐ Set up alternative payment method

☐ **Increase monitoring**:
- ☐ Enable enhanced logging
- ☐ Set up alerts for suspicious activity
- ☐ Assign team member to monitor logs hourly

---

## Phase 4: INVESTIGATION (Figure Out What Happened)

**Goal**: Understand scope, root cause, and impact of incident.

### Investigation Checklist

☐ **Determine entry point** (how did attacker get in?):
- ☐ Phishing email (review email logs, employee interviews)
- ☐ Weak password (brute force attack - check auth logs for multiple failed logins)
- ☐ Unpatched vulnerability (check software versions, CVE databases)
- ☐ Insider threat (disgruntled employee - check access logs, file downloads)
- ☐ Third-party breach (vendor credentials stolen - check vendor notifications)
- ☐ Physical access (device theft, shoulder surfing)
- ☐ Unknown (requires forensic investigation)

**Entry point identified**: _______________________________

☐ **Determine timeline**:
- First suspicious activity: _______________________________ (Date/Time)
- Breach occurred: _______________________________ (Date/Time)
- Breach discovered: _______________________________ (Date/Time)
- Total dwell time: _______________________________ (days attacker had access)

☐ **Determine scope** (what data/systems were affected):
- ☐ Review audit logs for:
  - File access/downloads (who accessed what and when)
  - Account logins (unusual locations, times)
  - Configuration changes (new users, permission changes)
  - Data exports (large downloads, API calls)
- ☐ Identify affected data:
  - ☐ Customer data: ☐ Names ☐ Emails ☐ Addresses ☐ Phone ☐ Financial ☐ Health ☐ SSN/NRIC
  - ☐ Employee data: ☐ Names ☐ SSN/NRIC ☐ Salaries ☐ Health records
  - ☐ Intellectual property: ☐ Source code ☐ Product designs ☐ Trade secrets
  - ☐ Credentials: ☐ Passwords ☐ API keys ☐ Certificates
- ☐ Count affected records: _______________________________ records

☐ **Determine impact**:
- ☐ Data accessed (viewed): _______________________________
- ☐ Data modified: _______________________________
- ☐ Data deleted: _______________________________
- ☐ Data exfiltrated (stolen): _______________________________
- ☐ Systems damaged: _______________________________
- ☐ Business operations disrupted: _______________________________ (hours of downtime)

☐ **Identify attacker indicators** (for ongoing monitoring):
- ☐ IP addresses: _______________________________
- ☐ Email addresses: _______________________________
- ☐ Domains: _______________________________
- ☐ Malware hashes: _______________________________
- ☐ Attack patterns: _______________________________

### Create Incident Report

**Document findings in incident report** (use template below):
- Summary of incident
- Timeline of events
- Root cause analysis
- Scope of impact
- Systems affected
- Data compromised
- Estimated cost/damage
- Recommendations for prevention

**Report completed by**: _______________________________ Date: _______________________________

---

## Phase 5: ERADICATION (Remove the Threat)

**Goal**: Completely remove attacker access and close entry points.

### Eradication Checklist

☐ **Remove attacker access**:
- ☐ Delete/suspend unauthorized user accounts
- ☐ Remove malware (use endpoint protection to scan and clean all devices)
- ☐ Remove backdoors (unauthorized SSH keys, hidden admin accounts, scheduled tasks)
- ☐ Patch vulnerabilities that were exploited
- ☐ Reset ALL passwords (not just compromised ones - attacker may have escalated)
- ☐ Rotate API keys, certificates, and secrets
- ☐ Review and revoke OAuth tokens for all third-party apps

☐ **Clean infected systems**:
- ☐ Reimage/rebuild infected devices (don't just "remove malware" - full rebuild)
- ☐ Restore from clean backups (if available and verified clean)
- ☐ Update all software (OS, applications, firmware)
- ☐ Apply security patches

☐ **Close entry point**:

**If phishing**:
- ☐ Deploy email filtering (DMARC, SPF, DKIM - see Guide 03)
- ☐ Enable advanced phishing protection (Google Workspace, Microsoft 365)
- ☐ Schedule phishing awareness training

**If weak password**:
- ☐ Deploy password manager (see Guide 02)
- ☐ Enforce MFA on all accounts (see Guide 02)
- ☐ Implement password policies (length, complexity)

**If unpatched software**:
- ☐ Enable automatic updates
- ☐ Implement patch management process
- ☐ Schedule quarterly vulnerability scans

**If insider threat**:
- ☐ Review access controls (implement least privilege - see Guide 02)
- ☐ Enable monitoring for data exfiltration
- ☐ Improve offboarding procedures (see templates/offboarding-checklist.md)

**If third-party breach**:
- ☐ Change credentials for third-party services
- ☐ Review vendor security (see templates/vendor-questionnaire.md)
- ☐ Implement MFA for vendor accounts

☐ **Verify eradication**:
- ☐ Full antivirus scan on all devices (no detections)
- ☐ Review audit logs (no suspicious activity in past 24 hours)
- ☐ Verify attacker cannot log back in (test with known attacker IPs/accounts)
- ☐ Confirm backups are clean (not infected)

**Eradication verified by**: _______________________________ Date: _______________________________

---

## Phase 6: RECOVERY (Return to Normal Operations)

**Goal**: Restore systems and verify they're secure before returning to production.

### Recovery Checklist

☐ **Restore systems** (in priority order):
1. ☐ Critical systems first: _______________________________
2. ☐ Internal tools second: _______________________________
3. ☐ Non-critical systems last: _______________________________

☐ **For each system restored**:
- ☐ Verify clean (no malware, no backdoors)
- ☐ Update all software
- ☐ Change all credentials
- ☐ Enable MFA
- ☐ Test functionality
- ☐ Monitor closely for 24-48 hours

☐ **Communication with stakeholders**:
- ☐ Notify employees: "Systems restored, here's what changed..."
- ☐ Notify customers (if their data was affected - see Notification Requirements below)
- ☐ Notify management/board: "Incident resolved, here's summary and next steps..."

☐ **Increase monitoring** (for 30 days post-incident):
- ☐ Daily review of audit logs
- ☐ Weekly access reviews
- ☐ Alert for any activity from attacker indicators (IPs, domains, patterns)

---

## Phase 7: NOTIFICATION (Regulatory and Customer Communications)

**Required by law in many jurisdictions (PDPA, GDPR). Failure to notify can result in fines.**

### Who to Notify

☐ **Customers/individuals** (if their personal data was accessed):
- **When**: Within 72 hours (PDPA/GDPR best practice)
- **How**: Email (see customer notification template below)
- **What to include**:
  - What happened (breach description)
  - What data was affected (be specific)
  - What we're doing (security improvements)
  - What they should do (change password, monitor accounts)

☐ **Regulators** (if required by law):
- **PDPA (Singapore)**: Within 72 hours if 500+ individuals OR significant harm
  - Report at: https://www.pdpc.gov.sg/ → Data Breach Notification
- **GDPR (EU)**: Within 72 hours if breach affects EU residents
  - Report to: Supervisory Authority in applicable country (ICO in UK, CNIL in France, etc.)
- **PCI-DSS**: Immediately notify payment processor and acquiring bank

☐ **Law enforcement** (optional, but recommended for P1 incidents):
- Singapore: Police Technology Crime Division +65 6255 0000
- Malaysia: Police Cyber Crime +60 3-2266 2222
- US: FBI Internet Crime Complaint Center (IC3) - https://www.ic3.gov/

☐ **Cyber insurance**: Within 24 hours (policy requirement)

☐ **Board/investors**: Within 24 hours for P1/P2 incidents

### Customer Notification Email Template

**Subject**: Important Security Notice - [Your Company Name]

```
Dear [Customer Name],

We are writing to inform you of a security incident that may have affected your personal information.

**What Happened**
On [date], we discovered that an unauthorized party accessed our systems between [date range]. We immediately launched an investigation, engaged cybersecurity experts, and took steps to secure our systems.

**What Information Was Involved**
The following information may have been accessed:
- [List specific data types: Name, Email, Address, Phone, etc.]

The following information was NOT affected:
- [List data NOT affected: Credit cards (we don't store them), Passwords (encrypted), etc.]

**What We're Doing**
- Secured our systems and removed unauthorized access
- Engaged cybersecurity firm to investigate
- Implementing additional security measures (MFA, enhanced monitoring, etc.)
- Notified authorities as required by law

**What You Should Do**
- Change your password for [your service] immediately
- Enable multi-factor authentication (instructions: [link])
- Be cautious of phishing emails claiming to be from us
- Monitor your accounts for suspicious activity
- [If applicable] We are offering free credit monitoring/identity protection: [link]

**Questions**
Contact us at security@[company].com or [phone]. We have a dedicated team to assist you.

We sincerely apologize for this incident and any inconvenience. Protecting your information is our top priority.

Sincerely,
[CEO Name and Title]
[Company Name]

More information: [link to FAQ page]
```

---

## Phase 8: POST-INCIDENT REVIEW (Learn and Improve)

**Goal**: Understand what went wrong and prevent it from happening again.

### Post-Mortem Meeting (Within 1 Week)

**Schedule post-mortem meeting** (2 hours):

**Attendees**: Incident Response Team + key stakeholders

**Agenda**:
1. Timeline review (what happened and when)
2. Root cause analysis (how did attacker get in, why were we vulnerable)
3. Response effectiveness (what went well, what went poorly)
4. Lessons learned
5. Action items (preventative measures to implement)

### Post-Mortem Template

**Incident name**: _______________________________
**Date of incident**: _______________________________
**Date of post-mortem**: _______________________________

**1. TIMELINE**
| Time | Event |
|------|-------|
| | |
| | |
| | |

**2. ROOT CAUSE**
- **Primary cause**: _______________________________
- **Contributing factors**:
  1. _______________________________
  2. _______________________________
  3. _______________________________

**3. IMPACT**
- **Systems affected**: _______________________________
- **Data compromised**: _______________________________ records
- **Downtime**: _______________________________ hours
- **Financial cost**: $ _______________________________ (estimated)
- **Customers affected**: _______________________________

**4. RESPONSE EFFECTIVENESS**

**What went well:**
- _______________________________
- _______________________________
- _______________________________

**What went poorly:**
- _______________________________
- _______________________________
- _______________________________

**5. LESSONS LEARNED**
1. _______________________________
2. _______________________________
3. _______________________________

**6. ACTION ITEMS**
| Action | Owner | Due Date | Status |
|--------|-------|----------|--------|
| | | | |
| | | | |
| | | | |

**7. PREVENTATIVE MEASURES**
- **Technical improvements**:
  1. _______________________________
  2. _______________________________
- **Process improvements**:
  1. _______________________________
  2. _______________________________
- **Training improvements**:
  1. _______________________________
  2. _______________________________

### Implementation Plan

☐ **Implement action items** (within 30 days):
- ☐ _______________________________
- ☐ _______________________________
- ☐ _______________________________

☐ **Verify improvements** (within 90 days):
- ☐ Test backup restore (actually restore from backup)
- ☐ Run phishing simulation (verify employees trained)
- ☐ Conduct tabletop exercise (simulate another incident)

☐ **Update this playbook** (based on learnings):
- Changes made: _______________________________
- Updated by: _______________________________ Date: _______________________________

---

## Appendix A: Incident Log Template

**Use this log to document all actions during incident response:**

| Date/Time | Action Taken | Person Responsible | Outcome/Notes |
|-----------|--------------|-------------------|---------------|
| | | | |
| | | | |
| | | | |
| | | | |
| | | | |

---

## Appendix B: Cost Tracking

**Track all costs associated with incident (for insurance claim and financial planning):**

| Expense Category | Vendor/Description | Cost | Date | Notes |
|------------------|-------------------|------|------|-------|
| **Forensics/Investigation** | | $ | | |
| **Legal fees** | | $ | | |
| **PR/Communications** | | $ | | |
| **Customer notifications** | | $ | | |
| **Consultant fees** | | $ | | |
| **Credit monitoring (for customers)** | | $ | | |
| **Business interruption** (lost revenue) | | $ | | |
| **Employee overtime** | | $ | | |
| **Regulatory fines** | | $ | | |
| **Customer settlements** | | $ | | |
| **Other** | | $ | | |
| **TOTAL** | | $ | | |

**Insurance claim filed**: ☐ Yes ☐ No Date: _______________________________
**Insurance payout**: $ _______________________________ Date: _______________________________

---

## Appendix C: Communication Templates

### Template 1: Internal Employee Notification (During Incident)

**Subject**: [URGENT] Security Incident - Action Required

```
Team,

We have detected a security incident affecting [describe scope - email, file storage, etc.].

**What you need to do right now:**
1. [Specific action - e.g., "Change your password immediately"]
2. [Specific action - e.g., "Do not open any email attachments until further notice"]
3. [Specific action - e.g., "Report any suspicious activity to security@company.com"]

**What we're doing:**
- Our IT team and cybersecurity experts are investigating
- We've taken immediate steps to secure our systems
- We'll provide updates every [frequency]

**Next update:** [Date/Time]

If you have questions or concerns, contact [Name] at [Phone] or [Email].

[Incident Commander Name]
[Title]
```

### Template 2: Management/Board Notification

**Subject**: Security Incident Notification - [Severity Level]

```
[Board Member Name],

I am writing to inform you of a [P1/P2] security incident that occurred on [date].

**Summary:**
[Brief description of what happened]

**Impact:**
- Systems affected: [List]
- Data affected: [Type and number of records]
- Downtime: [Hours]
- Estimated cost: $[Amount]

**Response Actions Taken:**
- [Action 1]
- [Action 2]
- [Action 3]

**Current Status:**
[Contained/Investigating/Recovering]

**Next Steps:**
- [Next action]
- Expected resolution: [Date/Time]

**Regulatory/Legal Implications:**
[Any notification requirements, potential fines, legal risks]

I will provide updates [frequency]. For immediate questions, contact me at [phone].

[Incident Commander Name]
[Title]
[Phone]
```

---

## Appendix D: Runbook for Common Incidents

### Ransomware Response

**Signs**: Files encrypted, ransom note, .encrypted/.locked file extensions

**Response**:
1. ☐ **DO NOT PAY** immediately (try recovery first)
2. ☐ Disconnect infected device from network (unplug, don't shut down)
3. ☐ Identify ransomware variant: https://id-ransomware.malwarehunter.net/
4. ☐ Check for free decryptor: https://www.nomoreransom.org/
5. ☐ Restore from backups (see Guide 06)
6. ☐ If backup doesn't exist: Contact cybersecurity consultant for negotiation
7. ☐ Only pay as last resort (40% don't get data back even after paying)

### Phishing Click Response

**Signs**: Employee reports clicking suspicious link or entering credentials

**Response**:
1. ☐ **ACT FAST** (minutes matter)
2. ☐ Have employee disconnect from network immediately
3. ☐ Reset employee's password(s) for all company accounts
4. ☐ Enable MFA if not already enabled
5. ☐ Review account activity (logins, emails sent, file access)
6. ☐ Check for:
   - Email forwarding rules (attacker may have set up auto-forward)
   - Unusual email sends (spam sent from account)
   - File downloads (data exfiltration)
7. ☐ Run full antivirus scan on employee's device
8. ☐ Monitor account for 30 days for suspicious activity

### Lost/Stolen Device Response

**Signs**: Employee reports device lost or stolen

**Response**:
1. ☐ Determine what data was on device (customer data, credentials, files)
2. ☐ If company-managed device with MDM:
   - Remotely wipe device immediately (Intune, Jamf, Kandji, Hexnode)
   - Verify wipe succeeded
3. ☐ If personal device (BYOD):
   - Remotely wipe company data only (via MDM)
   - Instruct employee to change password for personal accounts
4. ☐ Change passwords for any accounts employee had saved on device
5. ☐ Monitor for unauthorized access attempts
6. ☐ If Confidential/Restricted data was on device: Consider data breach notification
7. ☐ File police report (required for insurance)

---

## Related Documents

- **Security Policy**: templates/security-policy.md
- **Guide 08: Incident Response**: guides/08-incident-response.md (detailed guidance)
- **Offboarding Checklist**: templates/offboarding-checklist.md (for insider threat response)
- **Backup & Recovery Guide**: guides/06-backup-recovery.md (for ransomware recovery)

---

**End of Incident Response Playbook**

**CRITICAL**: Review and update this playbook quarterly. Test via tabletop exercises (simulate incident and walk through response). Print a copy and keep in accessible location for emergencies.
