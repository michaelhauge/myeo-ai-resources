# Incident Response: When You've Been Hacked

**Why This Matters**: 68% of SMBs experience a cyberattack, but only 14% are prepared to respond. Average detection time: 207 days. Average recovery cost: $200K. Fast response (within 24 hours) reduces costs by 75%.

**Business Impact**:
- **Without incident response plan**: Prolonged downtime, regulatory fines, customer loss, reputation damage
- **With incident response plan**: Controlled recovery, minimal downtime, preserved evidence, compliance maintained
- **ROI**: $150K-$500K+ in reduced breach costs

---

## Prerequisites

Before starting this guide:
- ✅ You have admin access to key systems (email, cloud storage, servers)
- ✅ You have backups (Guide 06)
- ✅ You have password manager access (Guide 02)
- ⏱️ **Time needed**: 2-3 hours to create response plan, 1-72 hours to respond to actual incident

---

## Part 1: How to Know If You've Been Hacked

### Common Signs of a Breach

**Critical indicators (act immediately):**
- ☑ **Ransomware message**: Files encrypted, ransom note appears (Guide 06 for recovery)
- ☑ **Mass password resets**: Multiple employees can't log in, passwords changed without their knowledge
- ☑ **Unauthorized wire transfers**: Money moved from business bank accounts
- ☑ **Customer complaints**: "Why did you email me malware?" or "Your website infected my computer"
- ☑ **Locked out of admin accounts**: Google Workspace, Microsoft 365, domain registrar, hosting

**Warning signs (investigate within 24 hours):**
- ⚠️ **Unusual login alerts**: Logins from unexpected countries (especially Russia, China, North Korea if you don't operate there)
- ⚠️ **Spam sent from your domain**: Customers receiving spam emails from your addresses
- ⚠️ **New users or admins created**: Accounts you didn't create appearing in admin panel
- ⚠️ **Antivirus alerts**: Multiple detections across multiple computers
- ⚠️ **Unexplained system slowness**: All computers slow, network saturated (possible data exfiltration or cryptomining)
- ⚠️ **Files modified or deleted**: Important documents changed, deleted, or moved
- ⚠️ **Browser redirects**: Employees' browsers redirect to unexpected sites

**Suspicious activity (monitor, don't panic yet):**
- ⚠️ Failed login attempts (10-50 attempts) - Could be brute force attack or employee forgetting password
- ⚠️ Phishing email received - Receiving phishing doesn't mean you're breached (only if someone clicked)
- ⚠️ Port scans or network probes - Automated internet scanning, common and mostly harmless

---

## Part 2: The First 24 Hours (Incident Response Protocol)

### Hour 0-1: Containment (Stop the Bleeding)

**Step 1: Assemble incident response team (10 min)**

**Minimum team (for SMBs):**
- **Incident Commander**: Owner, CEO, or senior manager (makes final decisions)
- **Technical Lead**: IT person, developer, or external IT consultant
- **Communications Lead**: Marketing/HR (handles customer and employee communication)

**External help to call:**
- **Cybersecurity consultant** (if you don't have IT staff): $150-$300/hour, worth it
- **Lawyer** (if breach involves customer data): For legal advice on notification requirements
- **Cyber insurance provider** (if you have cyber insurance): They often provide free incident response services

**Step 2: Isolate compromised systems (30 min)**

**If specific computers are compromised:**
1. **Disconnect from network** (unplug Ethernet, disable Wi-Fi)
2. **Do NOT shut down** (turning off destroys evidence in RAM)
3. **Take photos** of any error messages, ransomware notes, suspicious activity

**If cloud accounts compromised (Google Workspace, Microsoft 365):**
1. **Suspend compromised user accounts** (don't delete - preserves evidence)
   - Google Workspace: Admin Console → Users → [User] → More → Suspend user
   - Microsoft 365: Azure AD → Users → [User] → Block sign-in
2. **Revoke active sessions**:
   - Google: Admin Console → Security → Session Management → Sign out [user]
   - Microsoft: Azure AD → Users → [User] → Revoke sessions
3. **Reset passwords** for compromised accounts (use password manager to generate strong passwords)

**If entire network might be compromised:**
- **Do NOT disconnect internet yet** (attacker may have dead-man switch that triggers destruction if connection lost)
- **Do NOT change passwords yet** (attacker may be monitoring and will know you're responding)
- **Call cybersecurity consultant immediately** - This is beyond DIY scope

**Step 3: Preserve evidence (20 min)**

**Why preserve evidence:**
- Needed for insurance claims
- Required for law enforcement (if you report)
- Helps understand how breach happened (prevents repeat)

**What to preserve:**
1. **Screenshots**: Any ransomware messages, unusual system behavior, error messages
2. **Log exports**:
   - Google Workspace: Admin Console → Reporting → Audit → Export (save as CSV)
   - Microsoft 365: Purview → Audit → Export (save all audit logs from past 90 days)
3. **Email samples**: If spam was sent, save copies of the malicious emails
4. **System logs**: If you have access, export server logs, firewall logs, VPN logs

**Where to save evidence:**
- **NOT on compromised systems**
- **USB drive** (physical, offline)
- **Separate cloud account** (personal Google Drive, not company account if compromised)
- **Email to lawyer** (attorney-client privilege protects from disclosure)

---

### Hour 1-4: Investigation (Figure Out What Happened)

**Step 4: Determine scope of breach (1-2 hours)**

**Key questions to answer:**
1. **What data was accessed?**
   - Customer data (names, emails, addresses, phone numbers)
   - Financial data (credit cards, bank accounts)
   - Employee data (SSN/NRIC, salaries, health info)
   - Intellectual property (product designs, code, trade secrets)
   - Credentials (passwords, API keys, access tokens)

2. **How did attacker get in?**
   - Phishing email (employee clicked malicious link or attachment)
   - Weak password (brute force attack or credential stuffing)
   - Unpatched software (exploited vulnerability in software)
   - Insider threat (disgruntled employee or contractor)
   - Third-party breach (vendor or partner account compromised)

3. **When did breach start?**
   - Review audit logs for first suspicious activity
   - Check file modification dates
   - Look for unusual login times or locations

4. **Is attacker still in the system?**
   - Active sessions still running?
   - New accounts created?
   - Backdoors installed (malware, unauthorized admin accounts, SSH keys)?

**Tools to use:**
- **Google Workspace**: Admin Console → Security Center → Investigation tool
- **Microsoft 365**: Purview → Audit → Search audit log
- **Antivirus scan**: Full system scan on all devices (SentinelOne, CrowdStrike, Malwarebytes)
- **Network monitoring**: Check router logs for unusual traffic

**Step 5: Assess impact (30 min)**

**Create impact assessment document:**

| Category | Impact | Details |
|----------|--------|---------|
| **Data compromised** | Customer PII | 5,000 customer records (names, emails, purchase history) |
| **Systems affected** | Email, CRM | Google Workspace admin account + Salesforce |
| **Duration** | 14 days | First suspicious login: Jan 15, discovered: Jan 29 |
| **Business impact** | 2 days downtime | Unable to send/receive email during recovery |
| **Financial loss** | $15K (estimated) | Consultant fees, employee overtime, lost productivity |
| **Regulatory** | PDPA notification required | Singapore customers affected, must notify PDPC |

**This document is critical for:**
- Cyber insurance claim
- Regulatory notifications (PDPA, GDPR)
- Customer communications
- Internal post-mortem

---

### Hour 4-8: Eradication (Remove the Attacker)

**Step 6: Remove attacker access (2-3 hours)**

**For compromised cloud accounts:**
1. **Reset all passwords** (not just compromised accounts - attacker may have escalated):
   - Start with admin accounts
   - Then all employee accounts
   - Use password manager to generate 16+ character random passwords
   - **Do NOT reuse any old passwords**

2. **Enable/enforce MFA** (if not already done):
   - Google Workspace: Enforce 2-Step Verification for all users
   - Microsoft 365: Enable Security Defaults or Conditional Access

3. **Review and revoke OAuth tokens**:
   - Google Workspace: Admin Console → Security → API Controls → Review third-party apps
   - Microsoft 365: Azure AD → Enterprise applications → Review permissions
   - **Revoke any suspicious or unknown apps**

4. **Remove unauthorized users and admins**:
   - Check for new accounts created by attacker
   - Demote suspicious accounts from admin to regular user
   - Suspend (don't delete) until investigation complete

**For compromised computers:**
1. **Reimage infected devices** (clean install, don't just "remove malware"):
   - Backup important files to clean USB drive (scan for malware first)
   - Perform factory reset or reinstall OS
   - Restore files from clean backup (not from infected system)

2. **Update all software**:
   - Operating system (Windows, macOS, Linux)
   - Applications (browsers, Office, Adobe)
   - Firmware (BIOS, router firmware)

**For compromised network:**
1. **Change Wi-Fi password** (attacker may have stolen it)
2. **Change router admin password** (default passwords are common entry point)
3. **Disable remote management** on router (unless you specifically need it)

**Step 7: Close entry point (1 hour)**

**Based on how attacker got in:**

| Entry Point | Remediation |
|-------------|-------------|
| **Phishing email** | Enable email filtering (Guide 03), run phishing training (Guide 03) |
| **Weak password** | Enforce password manager (Guide 02), enable MFA (Guide 02) |
| **Unpatched software** | Enable automatic updates, deploy patch management tool |
| **Insider threat** | Review access controls (Guide 02), implement least privilege, monitor for data exfiltration |
| **Third-party breach** | Change credentials for third-party apps, enable MFA on vendor accounts, review vendor security (use `templates/vendor-questionnaire.md`) |

---

### Hour 8-24: Recovery (Return to Normal Operations)

**Step 8: Restore services (2-4 hours)**

**Priority order:**
1. **Critical services first**: Email, customer-facing website, payment processing
2. **Internal tools second**: CRM, project management, Slack
3. **Non-critical services last**: Marketing website, internal wikis

**For each service:**
1. Verify attacker removed (no backdoors, no suspicious accounts)
2. Change all credentials (passwords, API keys, access tokens)
3. Enable MFA if not already enabled
4. Test functionality before full restore
5. Monitor closely for 24-48 hours (watch for re-infection)

**Step 9: Notify stakeholders (1-3 hours)**

**Who to notify and when:**

| Stakeholder | Timing | What to Say |
|-------------|--------|-------------|
| **Employees** | Within 4 hours | "We experienced a security incident. Here's what happened, what we're doing, and what you need to do." |
| **Customers** (if their data was accessed) | Within 72 hours (PDPA/GDPR requirement) | See notification template below |
| **Board/investors** | Within 24 hours | "Security incident occurred, contained, here's impact and response plan" |
| **Cyber insurance** | Within 24 hours | Exact details vary by policy - check your policy for notification requirements |
| **Regulators** (PDPC for Singapore, ICO for UK) | Within 72 hours if customer data breached | See Part 3: Notification Requirements |
| **Law enforcement** (optional) | Within 24 hours if you want to report | Police cybercrime unit or FBI IC3 (if US-based) |

**Customer notification email template** (if data breach occurred):

```
Subject: Important Security Notice - [Your Company Name]

Dear [Customer Name],

We are writing to inform you of a security incident that may have affected your personal information.

**What happened:**
On [date], we discovered that an unauthorized party accessed our systems between [date range]. We immediately launched an investigation, engaged cybersecurity experts, and took steps to secure our systems.

**What information was involved:**
The following information may have been accessed:
- Name
- Email address
- [Other data types - be specific and complete]

The following information was NOT affected:
- Credit card numbers (we do not store credit card data)
- Passwords (passwords are encrypted and were not accessed)

**What we're doing:**
- We have secured our systems and removed the unauthorized access
- We have engaged a leading cybersecurity firm to investigate
- We are implementing additional security measures to prevent future incidents
- We have notified relevant authorities as required by law

**What you should do:**
- Change your password for [your service] if you haven't recently
- Be cautious of phishing emails claiming to be from us (we will never ask for your password via email)
- Monitor your accounts for suspicious activity
- [If applicable] We are offering [free credit monitoring, identity protection, etc.]

**Questions:**
If you have questions, please contact us at [security@yourcompany.com] or [phone number]. We have set up a dedicated team to assist you.

We sincerely apologize for this incident and any inconvenience it may cause. Protecting your information is our top priority.

Sincerely,
[CEO or senior executive name and title]
[Company Name]

**More information:** [link to FAQ page on your website]
```

---

## Part 3: Notification Requirements (Compliance)

### PDPA (Singapore / Malaysia) Notification Requirements

**When notification is required:**
- Data breach is likely to result in "significant harm" to individuals
- "Significant harm" includes: identity theft, financial loss, damage to reputation, physical harm

**Who to notify:**
1. **Affected individuals**: Within 72 hours of discovery (best practice, not strictly required but recommended)
2. **Personal Data Protection Commission (PDPC)**: Within 72 hours if breach affects 500+ individuals, OR as soon as practicable for smaller breaches

**What to include in notification:**
- Description of the breach
- Types of personal data involved
- Number of individuals affected
- Likely consequences of the breach
- Measures taken or proposed to be taken to address the breach
- Contact information for inquiries

**How to notify PDPC:**
- Singapore: https://www.pdpc.gov.sg/ → Data Breach Notification Form
- Malaysia: http://www.pdp.gov.my/ → Report a Complaint

**Penalties for non-notification:**
- Singapore: Up to $1 million fine
- Malaysia: Up to RM 500,000 fine or 3 years imprisonment

---

### GDPR (European Union) Notification Requirements

**When notification is required:**
- Personal data breach likely to result in "risk to rights and freedoms" of individuals
- This is a LOW bar - most breaches require notification

**Who to notify:**
1. **Supervisory Authority** (ICO in UK, CNIL in France, etc.): Within 72 hours of becoming aware
2. **Affected individuals**: Without undue delay if "high risk" to their rights and freedoms

**What to include:**
- Nature of the personal data breach
- Name and contact details of Data Protection Officer (DPO) or other contact
- Likely consequences of the breach
- Measures taken or proposed to mitigate

**Penalties for non-notification:**
- Up to €10 million OR 2% of global annual revenue (whichever is higher)
- Recent examples: British Airways £20M fine, Marriott £18.4M fine

**How to notify:**
- UK: https://ico.org.uk/ → Report a breach
- EU: Contact your country's Data Protection Authority

---

### PCI-DSS (Payment Card Data) Notification Requirements

**When notification is required:**
- Any time payment card data (card numbers, CVV, cardholder names) is accessed by unauthorized party

**Who to notify:**
1. **Payment processor** (Stripe, Square, PayPal): Immediately
2. **Acquiring bank**: Within 24 hours
3. **Card networks** (Visa, Mastercard): Via your acquiring bank
4. **Affected cardholders**: As directed by card networks

**Note**: If you use Stripe, Square, or PayPal (and DON'T store card data yourself), you are NOT responsible for PCI compliance or breach notification. The payment processor handles it. This is why we recommend using third-party payment processors in COMPLIANCE.md.

---

### Cyber Insurance Notification

**When to notify:**
- Immediately upon discovering breach (within 24 hours)
- Before taking any major actions (your policy may require pre-approval for expenses)

**What your insurer provides:**
- Incident response team (forensics, legal, PR)
- Coverage for response costs (up to policy limits)
- Coverage for business interruption
- Coverage for legal defense (if sued by customers)

**Note**: Cyber insurance typically costs $1,000-$5,000/year for SMBs and covers $1M-$5M in losses. Highly recommended for any business handling customer data.

---

## Part 4: Post-Incident Review (Learn from the Breach)

### Within 1 Week: Immediate Post-Mortem

**Conduct post-mortem meeting (2 hours):**

**Attendees**: Incident response team + all key stakeholders

**Agenda**:
1. **Timeline review**: What happened and when (use timeline from investigation)
2. **Root cause analysis**: How did attacker get in? Why were we vulnerable?
3. **Response effectiveness**: What went well? What went poorly?
4. **Action items**: What will we change to prevent this from happening again?

**Document template** (see `templates/incident-response.md` for full template):

```markdown
## Post-Incident Review: [Incident Name]

**Date of incident**: [Date]
**Date of review**: [Date]
**Attendees**: [Names]

### Timeline
| Time | Event |
|------|-------|
| Jan 15, 9:47 AM | Phishing email sent to sales@company.com |
| Jan 15, 10:03 AM | Employee clicked link, entered credentials |
| Jan 15, 10:15 AM | Attacker logged into Google Workspace admin account |
| Jan 15-29 | Attacker accessed customer data, exported 5,000 records |
| Jan 29, 2:30 PM | Unusual login alert noticed by IT |
| Jan 29, 3:00 PM | Incident response initiated |

### Root Cause
**Primary**: Employee fell for phishing email (no prior training)
**Contributing factors**:
- No MFA on admin accounts
- No email filtering (DMARC/SPF/DKIM not configured)
- No regular security awareness training

### Response Effectiveness
**What went well**:
- Incident detected within 14 days (better than 207-day average)
- Evidence preserved correctly
- Attacker removed within 6 hours of detection

**What went poorly**:
- No incident response plan existed (figured it out as we went)
- Unclear roles (who makes decisions?)
- Customer notification delayed (took 5 days to draft message)

### Action Items
| Action | Owner | Due Date | Status |
|--------|-------|----------|--------|
| Deploy phishing awareness training (KnowBe4) | IT Lead | Feb 15 | In Progress |
| Enforce MFA on all accounts | IT Lead | Feb 1 | Completed |
| Configure DMARC/SPF/DKIM | IT Lead | Feb 1 | Completed |
| Create incident response plan | Security Team | Feb 28 | Not Started |
| Conduct quarterly phishing simulations | IT Lead | Ongoing | Not Started |

### Lessons Learned
1. **Prevention is cheaper than response**: $200/month for phishing training vs. $15K incident cost
2. **MFA is non-negotiable**: Would have stopped this breach entirely
3. **Preparation matters**: Wasted 2 hours figuring out what to do; plan would have saved time
```

---

### Within 1 Month: Implement Improvements

**Based on post-mortem action items, implement changes:**

**Common improvements after typical breaches:**

| Breach Type | Improvements to Implement |
|-------------|---------------------------|
| **Phishing → Account takeover** | MFA enforcement (Guide 02), phishing training (Guide 03), email filtering (Guide 03) |
| **Ransomware** | Offline backups (Guide 06), endpoint protection (Guide 04), email filtering (Guide 03) |
| **Weak password brute force** | Password manager (Guide 02), MFA (Guide 02), account lockout policies |
| **Unpatched software exploit** | Automatic updates, patch management, vulnerability scanning |
| **Insider threat** | Least privilege access (Guide 02), activity monitoring, exit procedures (templates/offboarding-checklist.md) |
| **Third-party vendor breach** | Vendor security reviews (templates/vendor-questionnaire.md), MFA on vendor accounts, least privilege for integrations |

---

### Within 3 Months: Test Your Improvements

**Verify that improvements actually work:**

**Test 1: Phishing simulation (monthly)**
- Use KnowBe4, Proofpoint, or Cofense to send simulated phishing emails
- Track click rates (goal: <10% after 3 months of training)
- Provide immediate training to employees who click

**Test 2: Backup restore (monthly)**
- Actually restore data from backup (don't assume backups work)
- Time how long restore takes (critical for RTO/RPO planning)
- Document any issues encountered

**Test 3: Incident response tabletop exercise (quarterly)**
- Simulate a breach scenario (e.g., "Ransomware hit accounting server")
- Walk through response steps as a team
- Identify gaps in incident response plan
- Update plan based on learnings

---

## Common Pitfalls

### ❌ Mistake 1: Shutting down compromised systems immediately
**Why it's bad**: Turning off a computer destroys evidence in RAM (running processes, encryption keys, network connections). Makes forensics impossible.

**Fix**:
- **Disconnect from network** (unplug Ethernet, disable Wi-Fi)
- **Leave powered on** (or take RAM dump before shutting down)
- **Document everything** before touching

**Real example**: "We immediately shut down the server when we saw ransomware. This destroyed the encryption keys stored in RAM. Even though we paid the ransom, attacker couldn't decrypt our files because keys were lost. $50K in ransom + $200K in lost data."

---

### ❌ Mistake 2: Not preserving evidence
**Why it's bad**: Without evidence, you can't:
- Determine scope of breach (what data was taken?)
- Support insurance claim (insurer will deny without proof)
- Prosecute attacker (law enforcement needs evidence)
- Prevent repeat (can't fix what you don't understand)

**Fix**:
- **Screenshot everything** before making changes
- **Export logs** immediately (before 90-day retention expires)
- **Save to offline location** (USB drive, not compromised systems)

**Real example**: "We didn't export audit logs before resetting passwords. Logs were overwritten by new activity. Couldn't determine what data was accessed. PDPC fined us for insufficient notification because we couldn't specify what was breached."

---

### ❌ Mistake 3: Paying ransomware without trying recovery first
**Why it's bad**:
- 40% of ransomware victims who pay DON'T get data back
- Paying funds criminal enterprises
- You become target for repeat attacks

**Fix**:
- **Try backup restore first** (see Guide 06)
- **Contact cybersecurity consultant** (they may have decryption tools)
- **Only pay as last resort** (and never without negotiating - initial ransom is always inflated)

**Real example**: "We paid $50K in Bitcoin immediately. Attacker provided decryption tool, but it was slow (20+ hours). Later discovered we had working backups - could have restored in 4 hours. Wasted $50K."

---

### ❌ Mistake 4: Notifying customers before investigation complete
**Why it's bad**:
- May overstate or understate scope of breach
- May provide incorrect information (have to send follow-up corrections)
- May violate regulations (GDPR requires accurate information)

**Fix**:
- **Complete investigation first** (determine what data was accessed)
- **Draft notification with lawyer** (ensure compliance with regulations)
- **Have PR team review** (clear, empathetic, not defensive)
- **Then notify** (within 72 hours is fine, don't rush in 4 hours)

**Real example**: "We immediately emailed customers saying 'Your credit cards may have been stolen.' Turned out credit cards were never accessed - only names/emails. Customers panicked, canceled cards, blamed us for inconvenience. Should have investigated first."

---

### ❌ Mistake 5: Not having cyber insurance
**Why it's bad**:
- Incident response costs $50K-$500K (forensics, legal, PR, notification)
- SMBs can't afford this out of pocket
- Without insurance, you're financially motivated to hide breach (illegal and unethical)

**Fix**:
- **Buy cyber insurance** ($1,000-$5,000/year for $1M-$5M coverage)
- **Before you need it** (can't buy after breach is discovered)
- **Read policy carefully** (notification requirements, coverage limits, exclusions)

**Real example**: "Breach cost us $200K (forensics, legal, customer notifications, business interruption). No insurance. Had to take out bank loan to cover costs. Nearly bankrupted the company. Cyber insurance would have cost $2,000/year."

---

## Testing & Verification

### Test 1: Incident response plan walkthrough (30 min)

**Scenario**: "At 9 AM on Monday, multiple employees report they can't access their email. Error message: 'Account suspended.' You check admin console and see a new admin account you don't recognize."

**Walk through your incident response plan:**
1. Who do you call first? (Do you have their contact info?)
2. What's the first action you take? (Contain, investigate, or notify?)
3. Where are your audit logs? (Can you access them in <5 minutes?)
4. Who notifies customers if data was breached? (Who drafts the message?)
5. Do you have cyber insurance? (What's the phone number? Where's the policy?)

**If any answer is "I don't know"**: Your plan needs more detail.

---

### Test 2: Backup restore under pressure (1 hour)

**Scenario**: "Ransomware encrypted your accounting server. You need to restore from backup."

**Test your backup:**
1. Can you access backups? (Password stored in password manager?)
2. How long does restore take? (4 hours? 24 hours? Unknown?)
3. Do backups actually work? (Last tested when?)
4. What data is lost? (Backup from yesterday = 1 day of data lost)

**If restore fails or takes >24 hours**: Your backup strategy needs improvement (see Guide 06).

---

### Test 3: Communication tree (15 min)

**Scenario**: "Breach discovered at 11 PM on Friday night. You need to notify CEO, board, customers, and regulators."

**Test your contact list:**
1. Do you have emergency contact info for all key people?
2. Can you reach them outside business hours? (Personal cell phone, not work email)
3. Who's authorized to send customer notifications? (CEO, lawyer, both?)
4. Do you have notification templates ready? (Or will you write from scratch at 11 PM?)

**If you can't reach someone in <30 minutes**: Update your emergency contact list.

---

## Success Metrics

### Week 1 (Immediate response):
- ✅ Attacker removed from systems within 24 hours of discovery
- ✅ Evidence preserved (screenshots, log exports, timeline documented)
- ✅ Critical services restored (email, customer-facing systems)
- ✅ Key stakeholders notified (employees, management, insurance)

### Month 1 (Short-term recovery):
- ✅ Post-mortem completed with action items assigned
- ✅ Regulatory notifications filed (if required)
- ✅ Customer notifications sent (if data breach occurred)
- ✅ Entry point closed (MFA enabled, patches applied, etc.)

### Month 3 (Long-term prevention):
- ✅ All action items from post-mortem implemented
- ✅ Incident response plan created and tested
- ✅ Security improvements verified (phishing simulation, backup test, access review)
- ✅ No repeat incidents (same attack vector doesn't work again)

---

## Real-World Examples

### Example 1: Fast response saves customer trust
**Company**: 40-person e-commerce company (Singapore)
**Incident**: Employee fell for phishing email, attacker accessed Shopify admin for 3 hours

**Response timeline**:
- Hour 0: Incident detected (unusual login alert)
- Hour 1: Admin account suspended, attacker removed
- Hour 2: Investigation completed (no customer data accessed, only product catalog viewed)
- Hour 4: CEO sent email to customers explaining incident and confirming no data breach
- Day 3: Post-mortem completed, MFA enforced on all accounts

**Result**:
- Zero customer churn (transparent communication preserved trust)
- Zero regulatory fines (no data breach, no notification required)
- **Total cost**: $5K (consultant fees, employee overtime)
- **Cost if slow response**: $50K+ (prolonged breach, data theft, regulatory penalties)

---

### Example 2: Insurance saves the company
**Company**: 25-person professional services firm (Malaysia)
**Incident**: Ransomware encrypted all file servers (2 TB of client data)

**Response**:
- Called cyber insurance within 2 hours (policy requirement)
- Insurer provided incident response team (forensics, negotiator, PR)
- Negotiated ransom from $100K down to $25K (insurance paid)
- Restored from backups (faster than decryption)
- Insurance also covered business interruption (3 days downtime)

**Result**:
- **Total cost**: $150K (ransom, forensics, legal, notification, lost revenue)
- **Insurance covered**: $145K (paid out within 30 days)
- **Out-of-pocket**: $5K (deductible)
- **Without insurance**: Would have bankrupted the company

---

### Example 3: Slow response leads to regulatory fine
**Company**: 60-person healthcare company (Singapore)
**Incident**: Database backup stolen by terminated employee (insider threat)

**What went wrong**:
- Incident discovered 45 days after theft (routine audit found it)
- Investigation took 30 days to determine scope (no logs preserved)
- Customer notification sent 90 days after incident (PDPA requires 72 hours)
- PDPC investigation found "inadequate security measures" and "delayed notification"

**Result**:
- **PDPC fine**: $75K (for delayed notification and security failures)
- **Customer lawsuits**: $200K settlement (class action by affected patients)
- **Reputation damage**: Lost 3 major clients, 20% revenue decline
- **Total cost**: $500K+ (fine, legal, lost revenue, remediation)
- **Prevention cost**: Would have been $20K/year (proper access controls, monitoring, backup encryption)

---

## Next Steps

### Immediate (today):
1. [ ] Save emergency contact list (CEO, IT, lawyer, insurance agent) with personal cell phone numbers
2. [ ] Verify you can access audit logs (Google Workspace, Microsoft 365, server logs)
3. [ ] Locate cyber insurance policy (if you have one) and save insurer phone number

### This week:
1. [ ] Create incident response contact tree (who calls whom in emergency)
2. [ ] Draft customer notification email template (customize the template above)
3. [ ] Identify cybersecurity consultant to call in emergency (get 3 quotes, have contracts ready)

### This month:
1. [ ] Create full incident response plan (use `templates/incident-response.md`)
2. [ ] Conduct tabletop exercise with team (simulate breach, walk through response)
3. [ ] Buy cyber insurance if you don't have it ($1,000-$5,000/year)

### This quarter:
1. [ ] Test backup restore under pressure (can you actually recover?)
2. [ ] Run phishing simulation (test employee awareness)
3. [ ] Review and update incident response plan based on tests

---

## Related Guides

- **Guide 06: Backup & Recovery** - Critical for incident recovery (ransomware, data loss)
- **Guide 03: Email Security & Phishing** - Prevents most common breach entry point
- **Guide 02: Passwords & Access Control** - MFA prevents account takeover
- **Template: Incident Response Playbook** - Step-by-step response procedures
- **Template: Vendor Security Questionnaire** - Prevents third-party breaches
- **COMPLIANCE.md** - Detailed notification requirements for PDPA, GDPR, PCI-DSS

---

## Frequently Asked Questions

**Q: Should I pay the ransom if hit by ransomware?**

**A**: **Try everything else first**:
1. **Restore from backups** (see Guide 06) - Fastest and cheapest if backups work
2. **Check for free decryptors** - ID Ransomware (https://id-ransomware.malwarehunter.net/) identifies ransomware variant and links to decryption tools
3. **Consult with cybersecurity firm** - They may have decryption tools or contacts with law enforcement

**Consider paying ONLY if:**
- Backups don't exist or don't work
- No free decryptor available
- Data is critical and irreplaceable
- Business will fail without data

**If you pay**:
- Negotiate (initial ransom is inflated 3-5x)
- Use ransomware negotiator (cyber insurance often provides)
- Pay in Bitcoin (what attackers demand)
- Keep records (needed for tax deduction and insurance claim)

**Note**: FBI discourages paying, but acknowledges businesses must make business decisions.

---

**Q: Do I have to report every breach to regulators?**

**A**: **No, only breaches meeting certain thresholds**:

**PDPA (Singapore/Malaysia)**:
- Only if breach "likely to result in significant harm" (identity theft, financial loss, reputational damage)
- If breach affected only email addresses (no other data), likely no notification required
- If breach affected SSN/NRIC, financial data, or health data, notification required

**GDPR (EU)**:
- Only if breach "likely to result in risk to rights and freedoms"
- This is a LOW bar - most breaches involving EU residents require notification
- If breach affected only hashed passwords (not plaintext), may not require notification

**When in doubt**: Consult with lawyer. Over-reporting is safer than under-reporting (penalties for non-reporting are severe).

---

**Q: How long do I have to notify customers?**

**A**:
- **PDPA**: "As soon as practicable" (no specific deadline, but best practice is 72 hours)
- **GDPR**: "Without undue delay" (72 hours to regulator, "without undue delay" to customers)
- **Best practice**: Within 72 hours if possible, but complete investigation first

**Don't rush to notify before you know scope** - Better to notify accurately in 5 days than inaccurately in 1 day (and have to send corrections later).

---

**Q: Can I be personally liable for a data breach?**

**A**: **Depends on your role and jurisdiction**:

**Singapore (PDPA)**:
- Company is primarily liable (fines up to $1M)
- Directors/officers can be personally liable if they "consented or connived" in the breach
- Example: Director knew passwords were weak but refused to implement MFA

**EU (GDPR)**:
- Company is primarily liable (fines up to 4% of global revenue)
- Directors/officers not directly liable under GDPR
- But: Can be sued by shareholders for breach of fiduciary duty

**US (varies by state)**:
- Some states (New York, Ohio) hold executives personally liable for security failures
- Most states only hold company liable

**Protection**: Directors & Officers (D&O) insurance covers personal liability. Cost: $1,000-$5,000/year for SMBs.

---

**Q: What if I discover a breach months or years after it happened?**

**A**: **Still notify, but disclosure timeline starts from when YOU discovered it, not when breach occurred**:

**PDPA/GDPR**: 72 hours from "becoming aware" of breach (not from when breach occurred)

**Example timeline**:
- January 1: Attacker breaches system (you don't know)
- June 15: You discover breach during routine audit
- June 15: 72-hour clock starts
- June 17: Notification due

**This is why regular audits are critical** (see Guide 07: Cloud Security for monthly audit checklist). The longer a breach goes undetected, the worse the impact.

---

## Conclusion

Incident response is not about preventing breaches (that's impossible) - it's about minimizing damage when they happen. The difference between a $5K incident and a $500K disaster is preparation.

**The 80/20 of incident response:**
- 80% of damage reduction comes from: Fast detection + documented response plan + cyber insurance
- 20% additional benefit from: Forensics expertise + legal counsel + PR management

**Three things to do this week:**
1. Create incident response contact list (who to call, how to reach them)
2. Test your backups (can you actually restore?)
3. Buy cyber insurance if you don't have it

Remember: Hope is not a strategy. The time to prepare for a breach is before it happens, not during.
