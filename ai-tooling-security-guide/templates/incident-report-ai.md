# AI Security Incident Report
**Template for documenting AI-related security incidents**

---

## Instructions

**Purpose**: Document AI security incidents for investigation, compliance, and prevention of future occurrences.

**When to use**: After any AI-related security incident (data exposure, malicious tool, credential theft, etc.)

**How to use**:
1. Fill out this form as soon as possible after incident discovery
2. Be specific and factual (no speculation without labeling it as such)
3. Attach supporting evidence (screenshots, logs, skill files)
4. Share with IT/Security team for investigation
5. Keep confidential - do not share outside security team without approval
6. Update as investigation progresses

**Retention**: Keep for 3 years minimum for compliance/audit purposes

---

## Incident Identification

**Incident ID**: IR-AI-________________ (Assigned by IT/Security, format: IR-AI-YYYYMMDD-001)

**Report Date**: ____________________ (YYYY-MM-DD)

**Report Time**: ____________________ (HH:MM timezone)

**Incident Discovery Date**: ____________________ (YYYY-MM-DD)

**Incident Discovery Time**: ____________________ (HH:MM timezone) [When was incident first noticed?]

**Time Between Occurrence and Discovery**: __________ hours/days [If known]

**Reported By**:
- **Name**: _____________________________________________________________
- **Title/Department**: _________________________________________________
- **Email**: ____________________________________________________________
- **Phone**: ____________________________________________________________

**Incident Severity** (assigned by Security team):
- [ ] **CRITICAL** - Production breach, customer data exposed, credentials stolen
- [ ] **HIGH** - Confidential data exposed, potential compliance violation
- [ ] **MEDIUM** - Internal data exposed, no customer impact
- [ ] **LOW** - Near-miss, no actual data exposure

---

## Section 1: Incident Summary

### 1.1 What Happened (Plain English)

**Briefly describe the incident in 2-3 sentences**:

___________________________________________________________________________

___________________________________________________________________________

___________________________________________________________________________

**Example**: "Employee accidentally pasted production AWS credentials into ChatGPT Free while debugging a deployment issue. Credentials were visible in the conversation history for approximately 30 minutes before being discovered and deleted."

---

### 1.2 Incident Type

**What type of AI security incident occurred?** (Check all that apply)

**Data Exposure**:
- [ ] Credentials exposed (API keys, passwords, tokens)
- [ ] Customer PII exposed (names, emails, personal data)
- [ ] Financial data exposed (contracts, revenue, pricing)
- [ ] Source code exposed (proprietary algorithms, trade secrets)
- [ ] Confidential business data exposed (strategy, M&A, unreleased products)
- [ ] Other sensitive data: __________________________________________

**Malicious Tool**:
- [ ] Malicious Claude Code skill installed
- [ ] Malicious MCP server installed
- [ ] Malicious browser extension installed
- [ ] Malicious ChatGPT plugin/GPT used
- [ ] Compromised npm package in MCP server
- [ ] Other: ________________________________________________________

**Account Compromise**:
- [ ] AI tool account compromised (unauthorized access)
- [ ] AI tool used for unauthorized purposes
- [ ] Account credentials stolen via AI tool

**Compliance Violation**:
- [ ] GDPR violation (EU customer data processed by unapproved AI)
- [ ] Singapore PDPA violation
- [ ] Contractual DPA violation (customer contract prohibits AI use)
- [ ] Export control violation (sharing controlled data with foreign AI)
- [ ] Other: ________________________________________________________

**System Compromise**:
- [ ] Malware delivered via AI tool
- [ ] Backdoor installed by malicious skill/MCP server
- [ ] Crypto mining detected
- [ ] Ransomware delivered
- [ ] Other: ________________________________________________________

---

## Section 2: AI Tool Details

### 2.1 AI Tool Involved

**What AI tool was involved in this incident?**

**Tool Category**:
- [ ] Claude Code skill
- [ ] MCP server
- [ ] ChatGPT plugin/GPT
- [ ] Browser extension
- [ ] AI chatbot (ChatGPT, Claude, Gemini, etc.)
- [ ] AI coding assistant (Copilot, Cursor, etc.)
- [ ] AI writing assistant (Grammarly, Jasper, etc.)
- [ ] Other: ________________________________________________________

**Tool Name**: _________________________________________________________

**Tool Version** (if known): ___________________________________________

**Tool Source**:
- [ ] Official (Anthropic, OpenAI, etc.)
- [ ] OpenClaw (github.com/cline/openclaw)
- [ ] GitHub (URL: _________________________________________________)
- [ ] npm package (name: ____________________________________________)
- [ ] Browser extension store (Chrome Web Store, Firefox Add-ons)
- [ ] Direct download/file share (Discord, Slack, email)
- [ ] Unknown/can't remember

**Tool Author** (if known): ____________________________________________

**Installation Date** (if known): ____________________ (YYYY-MM-DD)

**Installed By**: ______________________________________________________

**Was this tool approved per company policy?**: [ ] Yes [ ] No [ ] Unknown

---

### 2.2 Tool Permissions

**What permissions did this tool have?**

**File system access**:
- [ ] Read files in current directory
- [ ] Write files in current directory
- [ ] Read files in parent directories
- [ ] Full file system access
- [ ] Unknown

**Command execution**:
- [ ] Could execute bash commands
- [ ] Could not execute commands
- [ ] Unknown

**Network access**:
- [ ] Could make network requests
- [ ] Was blocked from network
- [ ] Unknown

**Credentials access**:
- [ ] Could access environment variables (`.env`, `process.env`)
- [ ] Could access credential files (`.aws/credentials`, `.ssh/`)
- [ ] Could access browser cookies/sessions
- [ ] Unknown

---

## Section 3: Data Impact Assessment

### 3.1 What Data Was Exposed/Affected?

**Data Classification Level** (see [Data Protection Guide](../guides/06-data-protection.md)):
- [ ] **Public** (no real impact)
- [ ] **Internal** (minor impact)
- [ ] **Confidential** (significant impact, potential compliance issue)
- [ ] **Secret** (critical impact, immediate action required)

**Specific Data Exposed** (check all that apply):

**Credentials**:
- [ ] Production API keys: [ ] AWS [ ] GCP [ ] Azure [ ] Stripe [ ] Other: _______
- [ ] Development/staging API keys
- [ ] Database credentials (host, username, password)
- [ ] SSH private keys
- [ ] OAuth tokens/secrets
- [ ] Other: ________________________________________________________

**Customer Data**:
- [ ] Customer names
- [ ] Email addresses (quantity: __________)
- [ ] Phone numbers (quantity: __________)
- [ ] Addresses
- [ ] Payment information (credit cards, bank accounts)
- [ ] Account IDs/usernames
- [ ] Usage data (analytics, behavior)
- [ ] Other PII: ____________________________________________________

**Business Data**:
- [ ] Source code (proprietary algorithms)
- [ ] Financial reports (revenue, contracts)
- [ ] Customer contracts (pricing, terms)
- [ ] Strategic plans (unreleased products, M&A targets)
- [ ] Employee data (salaries, performance reviews)
- [ ] Other: ________________________________________________________

**Estimated Volume**:
- Number of records exposed: __________ (e.g., 500 customer emails)
- Number of files exposed: __________
- Total data size: __________ MB/GB

---

### 3.2 Where Was Data Exposed To?

**Destination of exposed data**:
- [ ] AI chatbot conversation history (ChatGPT, Claude, etc.)
- [ ] Malicious skill/MCP server uploaded to attacker server
- [ ] Browser extension uploaded to unknown server
- [ ] Logs/audit trail of AI tool provider
- [ ] Unknown/unclear

**Can data be deleted?**:
- [ ] Yes, already deleted (e.g., deleted ChatGPT conversation)
- [ ] Yes, but not yet deleted (e.g., can request deletion from vendor)
- [ ] No, data is permanent (e.g., uploaded to attacker server, can't retrieve)
- [ ] Unknown

**Evidence of data exfiltration**:
- [ ] Yes, network logs show data upload to external IP: _______________
- [ ] Suspected but not confirmed
- [ ] No evidence found
- [ ] Unable to check (no logging enabled)

---

## Section 4: Timeline

### 4.1 Incident Timeline

**Reconstruct the timeline of events** (use 24-hour format):

| Date & Time | Event | Performed By |
|-------------|-------|--------------|
| Example: 2026-02-07 09:30 | Installed Claude Code skill from GitHub | John Smith |
| Example: 2026-02-07 14:15 | Skill executed, uploaded .env to attacker server | Skill (automated) |
| Example: 2026-02-07 16:45 | Unusual AWS bill alert triggered | AWS CloudWatch |
| Example: 2026-02-07 17:00 | Investigation began, skill removed | IT Security |
| | | |
| | | |
| | | |
| | | |

---

### 4.2 Detection Method

**How was this incident discovered?**
- [ ] Employee self-reported (saw suspicious behavior)
- [ ] Automated alert (cloud billing, SIEM, IDS)
- [ ] Audit/review (routine security audit)
- [ ] Customer complaint (customer noticed unusual activity)
- [ ] Third-party notification (AI vendor security team)
- [ ] Other: ________________________________________________________

**Detection details**: ________________________________________________

___________________________________________________________________________

---

## Section 5: Immediate Response

### 5.1 Containment Actions Taken

**What immediate actions were taken?** (Check all that apply, include timestamp)

**Tool Removal**:
- [ ] Removed malicious skill/MCP server (Time: __________)
- [ ] Uninstalled browser extension (Time: __________)
- [ ] Revoked AI tool access/account (Time: __________)
- [ ] Deleted AI conversation history (Time: __________)

**Credential Rotation**:
- [ ] Rotated AWS keys (Time: __________)
- [ ] Rotated GCP keys (Time: __________)
- [ ] Rotated database passwords (Time: __________)
- [ ] Rotated API keys (Stripe, etc.) (Time: __________)
- [ ] Other: _______________________________ (Time: __________)

**Access Revocation**:
- [ ] Revoked user's access to systems (Time: __________)
- [ ] Blocked IP addresses (Time: __________)
- [ ] Disabled compromised accounts (Time: __________)

**Monitoring**:
- [ ] Enabled enhanced logging (Time: __________)
- [ ] Set up alerts for unusual activity (Time: __________)
- [ ] Started monitoring cloud bills (Time: __________)

**Communication**:
- [ ] Notified IT/Security team (Time: __________)
- [ ] Notified manager (Time: __________)
- [ ] Notified legal/compliance (Time: __________)
- [ ] Notified affected customers (Time: __________) [If applicable]

---

### 5.2 Eradication

**Steps taken to remove the threat**:

**Malware/backdoor removal**:
- [ ] Scanned system for malware (Tool used: ___________________________)
- [ ] Removed LaunchAgents/cron jobs (Path: __________________________)
- [ ] Checked for persistence mechanisms
- [ ] Reimaged affected system (Date: __________)
- [ ] No malware found

**Verification**:
- [ ] Confirmed threat is removed (Method: ___________________________)
- [ ] Ran follow-up scans (All clear: [ ] Yes [ ] No)

---

## Section 6: Investigation Findings

### 6.1 Root Cause Analysis

**What was the root cause of this incident?**

**Primary cause**:
- [ ] Employee error (installed unapproved tool)
- [ ] Lack of training (employee didn't know tool was risky)
- [ ] Policy gap (no policy against this action)
- [ ] Technical control gap (no monitoring/blocking in place)
- [ ] Social engineering (tricked into installing malicious tool)
- [ ] Supply chain compromise (trusted source was compromised)
- [ ] Other: ________________________________________________________

**Contributing factors** (check all that apply):
- [ ] No approval process for AI tools
- [ ] No training on AI tool security
- [ ] Production credentials on laptop (should be on CI/CD only)
- [ ] No audit logging enabled
- [ ] No monitoring for unusual activity
- [ ] Employee under time pressure (took shortcut)
- [ ] Other: ________________________________________________________

**Detailed explanation**:

___________________________________________________________________________

___________________________________________________________________________

___________________________________________________________________________

---

### 6.2 Evidence Collected

**What evidence was collected during investigation?**

**Digital Evidence**:
- [ ] Screenshots of malicious tool/conversation
- [ ] Skill/MCP server source code files
- [ ] Network logs (IP addresses, timestamps)
- [ ] Cloud billing alerts (unusual usage)
- [ ] Audit logs from AI tool provider
- [ ] System logs (bash history, command execution)
- [ ] Other: ________________________________________________________

**Evidence Location**: ________________________________________________

**Evidence Custodian**: _______________________________________________

**Chain of Custody Maintained**: [ ] Yes [ ] No

---

### 6.3 Attacker Profile (If Applicable)

**If malicious tool was involved, what do we know about the attacker?**

**Attacker Attribution**:
- [ ] Known threat actor/group: ______________________________________
- [ ] Opportunistic/automated malware
- [ ] Unknown/unidentified
- [ ] No attacker (accidental exposure, not targeted)

**Indicators of Compromise (IOCs)**:
- Attacker IP addresses: ____________________________________________
- Domain names: _____________________________________________________
- File hashes (SHA256): _____________________________________________
- Other IOCs: _______________________________________________________

**Motive** (if known):
- [ ] Financial (crypto mining, ransom)
- [ ] Espionage (stealing trade secrets)
- [ ] Sabotage (disruption)
- [ ] Unknown

---

## Section 7: Impact Assessment

### 7.1 Business Impact

**Confidentiality Impact**:
- [ ] **High** - Secret data exposed (credentials, trade secrets)
- [ ] **Medium** - Confidential data exposed (customer PII, contracts)
- [ ] **Low** - Internal data exposed (no customer/business impact)
- [ ] **None** - No data exposed (near-miss)

**Integrity Impact**:
- [ ] **High** - Data modified/corrupted, cannot trust accuracy
- [ ] **Medium** - Some data modified, can identify and fix
- [ ] **Low** - Minimal data modification
- [ ] **None** - No data modification

**Availability Impact**:
- [ ] **High** - Systems/services down >4 hours
- [ ] **Medium** - Systems/services down 1-4 hours
- [ ] **Low** - Systems/services down <1 hour
- [ ] **None** - No downtime

**Financial Impact** (estimated):
- Immediate costs (credential rotation, incident response): $__________
- Cloud bill from malicious activity (crypto mining, etc.): $__________
- Lost revenue (downtime, customer churn): $__________
- Regulatory fines (potential): $__________
- **Total estimated impact**: $__________

---

### 7.2 Compliance Impact

**Regulatory Obligations Triggered**:

**Singapore PDPA**:
- [ ] Notifiable Data Breach (NDB) - must report to PDPC within 72 hours
- [ ] Must notify affected individuals
- [ ] Not a notifiable breach (no significant harm likely)

**EU GDPR** (if EU customers affected):
- [ ] Personal data breach - must report to DPA within 72 hours
- [ ] Must notify affected data subjects
- [ ] Not reportable

**Other Regulations**:
- [ ] HIPAA (US healthcare data)
- [ ] PCI DSS (payment card data)
- [ ] SOX (financial data)
- [ ] Other: ________________________________________________________

**Notification Deadlines**:
- Regulator notification due: ____________________ (YYYY-MM-DD HH:MM)
- Customer notification due: ____________________ (YYYY-MM-DD HH:MM)

**Notification Status**:
- [ ] Regulator notified (Date: __________)
- [ ] Customers notified (Date: __________)
- [ ] Not yet notified (plan to notify by: __________)
- [ ] Not required

---

### 7.3 Reputational Impact

**Customer Impact**:
- Number of customers affected: __________
- [ ] Customers contacted proactively
- [ ] Customers are unaware
- [ ] Customer complaints received: __________

**Media/Public Impact**:
- [ ] Incident is public (media coverage)
- [ ] Incident is not public (internal only)
- [ ] Risk of public disclosure: [ ] High [ ] Medium [ ] Low

---

## Section 8: Recovery

### 8.1 Recovery Actions

**Steps taken to restore normal operations**:

**System Recovery**:
- [ ] Reimaged affected systems (Date: __________)
- [ ] Restored from clean backups (Date: __________)
- [ ] Verified backups are clean (no malware)
- [ ] Rebuilt affected services (Date: __________)

**Credential Recovery**:
- [ ] All affected credentials rotated
- [ ] Confirmed new credentials working
- [ ] Updated credential vaults/password managers
- [ ] Notified teams of new credentials

**Service Restoration**:
- [ ] All systems back online (Date: __________, Time: __________)
- [ ] Functionality verified
- [ ] Monitoring confirmed normal operations

**Time to Recovery**:
- Incident discovered: ____________________ (YYYY-MM-DD HH:MM)
- Full recovery achieved: ____________________ (YYYY-MM-DD HH:MM)
- **Total time to recover**: __________ hours

---

### 8.2 Verification

**Post-recovery verification**:
- [ ] No malware detected in follow-up scans
- [ ] No unauthorized access in logs
- [ ] Cloud billing returned to normal
- [ ] Customer services functioning normally
- [ ] No complaints from customers

**Verified By**: ______________________________________________________

**Verification Date**: ____________________ (YYYY-MM-DD)

---

## Section 9: Lessons Learned

### 9.1 What Went Well?

**Positive aspects of incident response**:

___________________________________________________________________________

___________________________________________________________________________

___________________________________________________________________________

**Examples**:
- Employee self-reported quickly (no delay)
- Automated alerts detected unusual activity
- Credential rotation completed within 1 hour

---

### 9.2 What Could Be Improved?

**Areas for improvement**:

___________________________________________________________________________

___________________________________________________________________________

___________________________________________________________________________

**Examples**:
- No policy in place to prevent unapproved tool installation
- Production credentials shouldn't have been on laptop
- Detection took 7 hours (should have been faster)

---

### 9.3 Corrective Actions

**What specific actions will be taken to prevent recurrence?**

| Action Item | Owner | Due Date | Status |
|-------------|-------|----------|--------|
| Example: Implement Claude Code skill vetting process | IT Security | 2026-02-14 | In Progress |
| Example: Move production credentials to CI/CD only | DevOps | 2026-02-10 | Not Started |
| Example: Roll out AI security training to all employees | HR + IT | 2026-02-28 | Not Started |
| | | | |
| | | | |
| | | | |

**Preventive Measures** (check all that apply):
- [ ] Policy update (AI Acceptable Use Policy)
- [ ] Technical control (block unapproved tools, monitoring)
- [ ] Training (AI security awareness)
- [ ] Process change (approval workflow for AI tools)
- [ ] Architecture change (credential isolation)
- [ ] Other: ________________________________________________________

---

## Section 10: Communication

### 10.1 Internal Communication

**Who was notified internally?**

| Stakeholder | Notified Date/Time | Method | Key Points Shared |
|-------------|-------------------|--------|-------------------|
| IT/Security Team | | | |
| Manager/Department Head | | | |
| Executive Team (CTO/CEO) | | | |
| Legal/Compliance | | | |
| PR/Communications | | | |
| Other: | | | |

---

### 10.2 External Communication

**Customers**:
- [ ] Customers were notified (Date: __________, Method: ______________)
- [ ] Notification not required (no customer impact)
- [ ] Template used: [Link to notification email template]

**Regulators**:
- [ ] Regulator was notified (Date: __________, Method: ______________)
- [ ] Notification not required
- [ ] Notification pending (due by: __________)

**AI Vendor**:
- [ ] AI tool vendor was notified (e.g., OpenAI, Anthropic)
- [ ] Vendor provided assistance
- [ ] Vendor acknowledged receipt
- [ ] Notification not applicable

**Media**:
- [ ] Media statement prepared
- [ ] Media inquiries received (count: __________)
- [ ] No media involvement

---

## Section 11: Sign-Off

### 11.1 Incident Closure

**Is this incident resolved and ready to close?**
- [ ] **Yes** - All recovery actions complete, no ongoing risk
- [ ] **No** - Still investigating or remediating (ETA: __________)

**Incident Status**:
- [ ] Open (active investigation)
- [ ] Contained (threat neutralized, recovery in progress)
- [ ] Closed (fully resolved)

**Closure Date**: ____________________ (YYYY-MM-DD)

---

### 11.2 Approvals

**Report Prepared By**:
- **Name**: _____________________________________________________________
- **Title**: ____________________________________________________________
- **Signature**: ________________________________________________________
- **Date**: ____________________ (YYYY-MM-DD)

**Reviewed and Approved By**:
- **Name**: _____________________________________________________________
- **Title** (e.g., CISO, CTO): __________________________________________
- **Signature**: ________________________________________________________
- **Date**: ____________________ (YYYY-MM-DD)

---

## Section 12: Attachments

**Supporting Documentation** (list all attachments):

- [ ] Screenshots of malicious tool/behavior
- [ ] Skill/MCP server source code files
- [ ] Network traffic logs
- [ ] Cloud billing alerts
- [ ] Email notifications sent to customers
- [ ] Regulatory notification confirmation
- [ ] Forensic analysis report
- [ ] Other: ________________________________________________________

**Attachment Location**: _______________________________________________

(Store attachments in secure incident response folder, not in email)

---

## Related Documentation

**Reference guides**:
- [Incident Response Guide](../guides/08-incident-response.md) - Full IR playbook
- [Data Protection Guide](../guides/06-data-protection.md) - What data was exposed
- [Skill Vetting Guide](../guides/02-skill-vetting.md) - How to vet skills
- [MCP Servers Guide](../guides/03-mcp-servers.md) - How to vet MCP servers

**Templates**:
- [Skill Review Checklist](skill-review-checklist.md) - Vetting checklist
- [Vendor Questionnaire](vendor-ai-questionnaire.md) - Vendor evaluation

---

## Template Version

**Template version**: 1.0.0
**Last updated**: February 2026
**Source**: AI Tooling Security Guide (MyEO AI Resources)

---

## Notes for Incident Responders

### Best Practices for Incident Documentation

1. **Document immediately**: Don't wait - memories fade, logs get overwritten
2. **Be specific**: "Around 2pm" → "14:15 SGT"; "some credentials" → "AWS production keys"
3. **Stick to facts**: Separate observations from speculation
4. **Preserve evidence**: Screenshot everything before deleting/removing
5. **Update as you learn**: This is a living document during active incidents
6. **Maintain confidentiality**: Incident reports contain sensitive data

### Common Mistakes to Avoid

❌ **Deleting the threat before documenting** (screenshot first!)
❌ **Rotating credentials without documenting which ones** (you'll forget)
❌ **Assuming timeline without checking logs** (memories are unreliable)
❌ **Closing incident before corrective actions complete** (track to completion)
❌ **Not notifying legal/compliance early** (they need time to assess)

### When to Escalate

**Escalate to executive team if**:
- Customer PII exposure >100 records
- Financial impact >$10,000
- Media attention or public disclosure
- Regulatory notification required
- Customer contracts violated

**Escalate to legal immediately if**:
- Regulatory notification deadline approaching
- Customer litigation risk
- Law enforcement involvement needed
- Contractual breach suspected

### Incident Report Storage

**Where to store completed reports**:
- Secure folder with restricted access (not general file share)
- Encrypted if containing sensitive data
- Retention: 3-7 years (check local compliance requirements)
- Backed up regularly

**Access control**:
- Only incident response team, security, legal, executives
- Audit access to incident reports
- Never email full reports (use secure file sharing)

### Follow-Up Actions

After closing an incident:
- [ ] Schedule lessons learned meeting (within 1 week)
- [ ] Update security policies based on findings
- [ ] Track corrective actions to completion (monthly review)
- [ ] Share anonymized case study with team (for learning)
- [ ] Update incident response runbook if needed
