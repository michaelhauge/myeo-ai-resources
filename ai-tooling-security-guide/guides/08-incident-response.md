# AI Tool Security Incident Response
**What to Do If Something Goes Wrong (Immediate Action Guide)**

A practical, step-by-step guide for responding to AI tool security incidents.

---

## Overview

**Time Required**: 15 minutes to read (use when needed)
**Difficulty**: Easy (follow checklist)
**Output**: Incident contained, damage assessed, recovery initiated
**Use When**: You suspect a malicious AI tool, data breach, or security compromise

---

## ⚠️ STOP: Are You In An Emergency?

**If ANY of these are true RIGHT NOW**:
- 🚨 Ransomware message appeared (files encrypted, ransom demanded)
- 🚨 Bank/credit card fraud detected (unusual transactions)
- 🚨 Customer data publicly leaked (saw your data on internet)
- 🚨 AWS bill spiked to $10,000+ (ongoing attack)

**→ SKIP THIS GUIDE. Call experts immediately**:
- Singapore: Cyber Security Agency hotline (+65 6323 5214)
- Malaysia: CyberSecurity Malaysia (+603 8992 6888)
- USA: FBI IC3 (ic3.gov)
- Your cyber insurance provider (if you have one)
- Incident response firm (Google "incident response [your country]")

**→ Then come back to Step 1 below for next steps.**

---

## Common AI Tool Incident Scenarios

### Scenario 1: "I think I installed a malicious skill/extension"

**Symptoms**:
- skill-scanner.py flagged as HIGH risk after install
- Extension requested excessive permissions
- Noticed suspicious network activity
- Found security warnings about the tool online

**→ Go to**: Step 1 (Containment)

---

### Scenario 2: "My AWS/cloud bill suddenly spiked"

**Symptoms**:
- AWS bill went from $500/month to $5,000/month overnight
- GCP shows unusual resource usage
- Crypto mining suspected

**→ Go to**: Step 1 (Containment) + Step 5 (Cloud-specific response)

---

### Scenario 3: "I accidentally shared sensitive data with AI tool"

**Symptoms**:
- Pasted API key into ChatGPT
- Uploaded customer data CSV to untrusted GPT
- Shared proprietary code with public AI service

**→ Go to**: Step 2 (Credential rotation) + Step 4 (Assess impact)

---

### Scenario 4: "Someone on my team installed something suspicious"

**Symptoms**:
- Team member installed unapproved extension/skill
- Not sure if it's malicious, but concerned
- Want to investigate without causing panic

**→ Go to**: Step 1 (Containment - isolate that user) + Step 3 (Investigation)

---

### Scenario 5: "We got a data breach notification from AI vendor"

**Symptoms**:
- Email from ChatGPT/Claude/vendor: "We've experienced a security incident"
- Vendor disclosed breach in blog post
- News article about vendor being hacked

**→ Go to**: Step 4 (Assess impact) + Step 6 (Notification obligations)

---

## The 6-Step Incident Response Process

---

### Step 1: Immediate Containment (Next 15 minutes)

**Goal**: Stop the bleeding. Prevent further damage.

#### 1A: Isolate Affected Systems

**If malicious tool is on one machine**:
```bash
# Disconnect from network IMMEDIATELY
# macOS/Linux: Disable WiFi and unplug ethernet
# Windows: Disable network adapter

# OR pull the plug if you need to think first
```

**Why disconnect**: Prevents:
- Data exfiltration (uploading stolen files)
- Lateral movement (spreading to other machines)
- Command and control (attacker controlling your machine remotely)

**Exception**: Don't disconnect if you need to immediately rotate cloud credentials (Step 1B). Rotate first, THEN disconnect.

#### 1B: Disable the Malicious Tool

**For Claude Code skill**:
```bash
# Rename skill folder (disables it)
mv ~/.claude/skills/suspicious-skill ~/.claude/skills/suspicious-skill.DISABLED

# Or delete if you're certain
# (But keep for forensics initially)
```

**For browser extension**:
```
Chrome: chrome://extensions/ → Toggle OFF (don't delete yet)
Firefox: about:addons → Disable
Safari: Safari → Preferences → Extensions → Uncheck
```

**For MCP server**:
```bash
# Stop the server
docker stop mcp-server-name

# Or edit Claude config to disable
# (Don't delete, preserve for investigation)
```

**For ChatGPT plugin/GPT**:
```
ChatGPT → Settings → Plugins → Disable plugin
(Or stop using that GPT)
```

#### 1C: Document Current State

**Before changing anything else**, document:
```
# Take screenshots
- Of suspicious behavior
- Of unusual processes (Activity Monitor/Task Manager)
- Of network connections (if available)
- Of error messages

# Save logs
- Browser console (F12 → Console tab)
- System logs (macOS: Console.app, Windows: Event Viewer)
- AI tool logs (if available)

# Write timeline
- When did you install the tool?
- When did you first notice suspicious behavior?
- What actions did you take?
- Who else on team might be affected?
```

**Why document**: Evidence for investigation, insurance claims, legal proceedings.

---

### Step 2: Rotate Credentials (Next 30 minutes)

**Goal**: Assume the worst. Change anything the malicious tool could have accessed.

#### 2A: Identify Exposed Credentials

**What could the tool have accessed?**

**Claude Code skill / MCP server**:
- All files in working directory
- `.env` files (API keys, database passwords)
- `~/.aws/credentials` (AWS keys)
- `~/.ssh/` (SSH keys)
- `~/.config/gcloud/` (GCP keys)

**Browser extension**:
- Passwords typed into forms
- Cookies (session tokens)
- Data on web pages (if extension had permissions)

**ChatGPT/Claude**:
- Anything you pasted into conversation
- Uploaded files

#### 2B: Rotate Everything Exposed

**Priority order** (do these first):

**Critical (next 30 min)**:
1. **Production API keys** (AWS, GCP, Stripe, etc.)
   ```bash
   # AWS: Create new access key, delete old one
   aws iam create-access-key --user-name your-user
   aws iam delete-access-key --access-key-id OLD_KEY_ID

   # Then update CI/CD with new key
   ```

2. **Database passwords**
   ```sql
   -- Change database user passwords
   ALTER USER app_user WITH PASSWORD 'new_random_password';
   ```

3. **Admin passwords** (cloud consoles, etc.)
   - Change via web interface immediately

**High priority (next 1 hour)**:
4. **Service tokens** (GitHub tokens, Slack tokens, etc.)
5. **SSH keys** (if `.ssh/` was accessible)
6. **SSL certificates** (if private keys were accessible)

**Medium priority (next 24 hours)**:
7. **Email passwords**
8. **Other service accounts**

#### 2C: Revoke Sessions

**Cloud services**:
- AWS: Revoke sessions in IAM Console
- GCP: Revoke access tokens in API Console
- Azure: Revoke sessions in Azure Portal

**SaaS tools**:
- Slack: Workspace Settings → Session Management → Sign out all devices
- GitHub: Settings → Sessions → Revoke all
- Stripe: Dashboard → Team → Sign out all sessions

---

### Step 3: Investigation (Next 1-2 hours)

**Goal**: Understand what happened, what was accessed, what damage was done.

#### 3A: Forensic Analysis

**What to check**:

**1. Process list** (what's running?):
```bash
# macOS/Linux
ps aux | grep -i "curl\|wget\|python\|node\|bash"

# Windows
tasklist
```

Look for:
- Unusual processes
- Processes with suspicious names
- High CPU/network usage processes

**2. Network connections** (where is data going?):
```bash
# macOS
lsof -i -P | grep ESTABLISHED

# Linux
netstat -tulpn

# Windows
netstat -ano
```

Look for:
- Connections to unknown IP addresses
- Large data uploads (check bytes sent vs. received)

**3. File modifications** (what changed?):
```bash
# Files modified in last 24 hours
find ~ -type f -mtime -1 -ls

# Files modified since you installed suspicious tool
find ~ -type f -newermt "2026-02-07 10:00" -ls
```

Look for:
- New files created
- Important files modified (config, .env, .ssh)
- Files deleted (ransomware?)

**4. Startup items** (persistence check):
```bash
# macOS LaunchAgents
ls -la ~/Library/LaunchAgents/
ls -la /Library/LaunchAgents/

# Linux crontab
crontab -l

# Windows startup
# Check: Task Scheduler, Startup folder, Registry Run keys
```

Look for:
- New entries you don't recognize
- Scripts that run on boot/login

#### 3B: Determine Scope

**Questions to answer**:
- [ ] How many machines affected? (Just yours or team-wide?)
- [ ] What data was accessed? (API keys, customer data, code?)
- [ ] Was data exfiltrated? (Look at network logs, large uploads)
- [ ] Are there signs of persistence? (Backdoors, scheduled tasks)
- [ ] How long was the malicious tool active? (Install date to discovery)

**Create impact assessment**:
```
Incident: [Malicious Claude Code skill "XYZ"]
Discovered: [2026-02-07 14:30 SGT]
Installed: [2026-02-05 09:00 SGT] (active for 2.3 days)

Affected systems:
- 1 MacBook (Mike's laptop)
- Potentially: Development EC2 instances (SSH keys exposed)

Data potentially accessed:
- AWS access keys (dev and staging, NOT production)
- Stripe test mode keys (no real payment data)
- GitHub personal access token (read-only scopes)
- Source code (proprietary but not trade secret level)

Data definitely NOT accessed:
- Production API keys (not on this laptop)
- Customer database (not on this laptop)
- Production infrastructure (requires MFA we didn't expose)

Estimated impact:
- Financial: $0-500 (potential abuse of staging AWS)
- Reputation: Low (no customer data exposed)
- Operational: 8 hours to fully remediate
```

---

### Step 4: Assess Impact & Damage (Next 1 hour)

**Goal**: Understand the business impact and legal obligations.

#### 4A: Data Breach Assessment

**Was personal data exposed?**

**Personal data** includes (GDPR/PDPA):
- Names
- Email addresses
- Phone numbers
- Addresses
- Payment information
- Any identifier that can identify a person

**Questions**:
- [ ] Was customer data accessed? (How many records?)
- [ ] Was employee data accessed? (How many people?)
- [ ] What categories of personal data? (PII, financial, health, etc.)
- [ ] Was data encrypted? (If encrypted, may not count as breach)

**Notification triggers** (Singapore PDPA):
- ✅ **Must notify** regulator + individuals if:
  - Personal data accessed/disclosed without authorization
  - AND significant harm likely (financial loss, identity theft, etc.)
- ✅ **Timeline**: Within 72 hours of discovery

**Notification triggers** (EU GDPR):
- ✅ **Must notify** regulator within 72 hours (all breaches, with some exceptions)
- ✅ **Must notify** individuals if high risk to their rights and freedoms

#### 4B: Financial Impact

**Calculate costs**:

| Cost Category | Estimated Amount | Notes |
|---------------|------------------|-------|
| **Immediate costs** | | |
| Credential rotation time | $800 | 8 hours @ $100/hr (your time) |
| Emergency security audit | $2,000 | External consultant |
| **Breach response** | | |
| Legal review | $5,000 | Breach notification obligations |
| Notification costs | $500 | Email, postage if required |
| Customer support | $2,000 | Handling inquiries |
| **Regulatory** | | |
| PDPA fine | $0-100,000 | Depends on severity, negligence |
| **Reputation** | | |
| Lost customers | $10,000 | Estimated churn |
| PR/communications | $3,000 | Press release, customer comms |
| **Total estimated** | **$23,300 - $123,300** | |

**Also check**:
- Cloud bills (AWS, GCP) - crypto mining can cost $10k-100k
- Stripe/payment processor - fraudulent transactions
- Bank accounts - unauthorized transfers

#### 4C: Compliance Obligations

**Determine what you must do** (by jurisdiction):

**Singapore (PDPA)**:
- Assess: Is this a "notifiable data breach"?
- Notify PDPC within 72 hours if yes
- Notify affected individuals
- Document assessment (keep records for 3 years)

**Malaysia (PDPA)**:
- Similar to Singapore
- Notify Commissioner within 72 hours

**EU (GDPR)**:
- Notify supervisory authority within 72 hours
- Notify individuals if high risk

**USA**: Varies by state
- California (CCPA): Notify individuals "without unreasonable delay"

---

### Step 5: Cloud-Specific Response (If Applicable)

**If you suspect compromised cloud credentials**:

#### AWS Incident Response

```bash
# 1. Immediately create new access keys for emergency use
aws iam create-access-key --user-name emergency-admin

# 2. Delete compromised keys
aws iam delete-access-key --access-key-id COMPROMISED_KEY_ID

# 3. Check for crypto mining (unusual EC2 instances)
aws ec2 describe-instances --query 'Reservations[*].Instances[*].[InstanceId,InstanceType,State.Name,LaunchTime]'

# 4. Check unusual S3 buckets
aws s3 ls

# 5. Check CloudTrail for unauthorized actions
aws cloudtrail lookup-events --max-items 100 \
  --lookup-attributes AttributeKey=EventName,AttributeValue=RunInstances

# 6. Enable AWS GuardDuty (if not already enabled)
aws guardduty create-detector --enable
```

**Look for**:
- EC2 instances you didn't create (crypto mining)
- S3 buckets you didn't create (data exfiltration staging)
- IAM users/roles created (persistence)
- Unusual regions (activity in regions you don't use)

#### GCP Incident Response

```bash
# 1. Revoke compromised service account key
gcloud iam service-accounts keys delete KEY_ID \
  --iam-account=SERVICE_ACCOUNT_EMAIL

# 2. Check for unusual compute instances
gcloud compute instances list --format="table(name,zone,machineType,status)"

# 3. Check audit logs
gcloud logging read "timestamp>\"2026-02-07T00:00:00Z\"" \
  --limit 100 --format json

# 4. Check billing
gcloud billing accounts list
```

#### Stripe Incident Response

```
1. Stripe Dashboard → Developers → API Keys → Roll keys
2. Review recent transactions: Dashboard → Payments
3. Check for:
   - Unusual refunds (to attacker's accounts)
   - Test mode toggled to live mode
   - Webhook endpoints added (data exfiltration)
4. Review Logs: Dashboard → Logs (last 30 days)
```

---

### Step 6: Notification & Communication (Next 24-72 hours)

**Goal**: Meet legal obligations, maintain trust, control narrative.

#### 6A: Internal Communication

**Who to notify within your company**:
1. **CEO/Leadership** (immediately)
2. **Legal counsel** (within 1 hour)
3. **IT/Security team** (if you have one)
4. **Affected employees** (if their data was breached)

**What to say** (internal memo template):

```
Subject: Security Incident - [CONFIDENTIAL]

Team,

We've identified a security incident involving [brief description].

What happened:
- [1-2 sentences on what occurred]
- Discovered: [Date/time]
- Contained: [Date/time]

Impact:
- [What data may have been accessed]
- [How many people/records affected]
- [No evidence of X, Y, Z - if true]

Actions taken:
- [Immediate containment steps]
- [Credential rotation]
- [Engaged external security firm - if applicable]

What we need from you:
- [Change your password for X, Y, Z]
- [Be alert for phishing attempts]
- [Do not discuss publicly until we release statement]

Timeline:
- [When you'll provide next update]

Questions: [Contact person/email]

- [Name, Title]
```

#### 6B: Customer Notification (If Required)

**Template for data breach notification**:

```
Subject: Important Security Notice

Dear [Customer Name],

We are writing to inform you of a data security incident that may have affected your personal information.

What Happened:
On [date], we discovered that an unauthorized third party gained access to [system/database/tool] containing customer information.

What Information Was Involved:
The information potentially accessed includes:
- [Category 1, e.g., names and email addresses]
- [Category 2, e.g., account numbers]
- [NOT affected: Payment information, passwords - if true]

What We're Doing:
- Immediately secured the affected system
- Engaged cybersecurity experts to investigate
- Notified relevant authorities
- Implemented additional security measures

What You Can Do:
- Monitor your accounts for unusual activity
- Consider changing your password (if applicable)
- Be alert for phishing emails impersonating our company

More Information:
[Link to dedicated incident page on your website]
Questions: [Support email/phone]

We sincerely apologize for this incident and any concern it may cause.

Sincerely,
[Name, Title]
[Company]
```

#### 6C: Regulatory Notification

**Template for PDPA/GDPR notification to regulator**:

```
To: [Singapore PDPC / relevant regulator]
Subject: Notification of Data Breach - [Company Name]

Organization Details:
- Name: [Company name]
- Registration: [Business reg number]
- Contact: [DPO name, email, phone]

Incident Details:
- Discovery date: [YYYY-MM-DD HH:MM]
- Estimated compromise date: [YYYY-MM-DD]
- Description: [What happened]

Personal Data Affected:
- Categories: [Names, emails, etc.]
- Number of individuals: [X,XXX]
- Data subjects: [Customers, employees, etc.]

Actions Taken:
- [Immediate containment]
- [Notification to affected individuals: Yes/No]
- [Measures to mitigate harm]

Root Cause:
- [If known: What vulnerability was exploited]
- [If unknown: Investigation ongoing]

Contact: [Name, email, phone]

[Signature]
[Date]
```

**Submission deadlines**:
- Singapore PDPA: 72 hours from discovery
- EU GDPR: 72 hours from becoming aware
- Malaysia PDPA: 72 hours

---

### Step 7: Recovery & Prevention (Next 7-30 days)

**Goal**: Return to normal operations, prevent recurrence.

#### 7A: System Recovery

**Checklist**:
- [ ] All compromised credentials rotated
- [ ] Malicious tool completely removed (not just disabled)
- [ ] Persistence mechanisms eliminated (LaunchAgents, cron jobs, etc.)
- [ ] Systems patched and updated
- [ ] Security tools installed ([skill-scanner.py](../scripts/skill-scanner.py), antivirus, etc.)
- [ ] Backups verified (not corrupted by attacker)

**Verification**:
```bash
# Re-run security scans
python3 scripts/skill-scanner.py ~/.claude/skills/*/

# Check no unauthorized network connections
lsof -i -P | grep ESTABLISHED

# Verify no new startup items
ls -la ~/Library/LaunchAgents/

# Run full antivirus scan (if available)
```

#### 7B: Prevent Recurrence

**Immediate fixes** (this week):
1. Implement [skill vetting process](02-skill-vetting.md)
2. Install security scripts ([skill-scanner.py](../scripts/skill-scanner.py))
3. [Separate environments](06-data-protection.md#strategy-1-separate-environments-critical) (prod credentials off laptop)

**Short-term** (this month):
4. Create [AI acceptable use policy](../templates/ai-acceptable-use-policy.md)
5. Train team on AI tool security
6. Set up monitoring (cloud billing alerts, API usage alerts)

**Long-term** (this quarter):
7. Complete [90-day roadmap](../README.md) from this guide
8. Quarterly security audits
9. Incident response plan (documented, tested)

#### 7C: Post-Incident Review

**Schedule a postmortem** (1 week after incident):

**Attendees**: Team leads, affected employees, security consultant (if engaged)

**Agenda**:
1. Timeline review (what happened when)
2. Root cause analysis (how did this happen?)
3. Response assessment (what went well, what didn't)
4. Lessons learned
5. Action items to prevent recurrence

**Template questions**:
- How did the malicious tool get installed? (What check failed?)
- What could we have done to detect it sooner?
- What slowed down our response?
- What worked well in our response?
- What training/tools do we need?

**Document and share**: Postmortem should be written and shared with team (blameless, focused on improvement)

---

## Incident Response Checklist (Summary)

**Print this and keep handy**:

### Hour 0: Immediate Response
- [ ] Disconnect affected system from network (if severe)
- [ ] Disable malicious tool (don't delete yet)
- [ ] Document current state (screenshots, logs, timeline)
- [ ] Notify leadership/legal

### Hours 1-2: Containment
- [ ] Rotate all exposed credentials (API keys, passwords)
- [ ] Revoke sessions (cloud, SaaS tools)
- [ ] Check cloud bills (crypto mining detection)
- [ ] Isolate affected systems

### Hours 2-8: Investigation
- [ ] Forensic analysis (processes, network, file changes)
- [ ] Determine scope (how many machines, what data)
- [ ] Assess impact (financial, compliance, reputation)
- [ ] Check for persistence (backdoors, startup items)

### Hours 8-24: Response
- [ ] Notify regulator if required (PDPA: within 72 hours)
- [ ] Notify affected individuals if required
- [ ] Internal communication (team memo)
- [ ] External communication (customer notification, press if needed)

### Days 1-7: Recovery
- [ ] Complete credential rotation
- [ ] Remove malicious tools and persistence
- [ ] Verify systems clean (rescan)
- [ ] Restore from backups if needed
- [ ] Implement immediate preventive measures

### Days 7-30: Prevention
- [ ] Postmortem meeting
- [ ] Implement vetting process
- [ ] Train team
- [ ] Update security policies
- [ ] Set up monitoring

---

## When to Call Experts

**Call immediately if**:
- 🚨 Ransomware (files encrypted, ransom demanded)
- 🚨 Large-scale breach (>10,000 customer records)
- 🚨 Ongoing attack (can't contain it yourself)
- 🚨 Regulated data exposed (healthcare, financial, children's data)
- 🚨 Critical infrastructure impacted (production down)

**Who to call**:

**Incident Response Firms** (Singapore):
- Accenture Security
- Deloitte Cyber
- KPMG Cyber
- PwC Cybersecurity

**Cost**: $5,000-20,000 for initial response (worth it for serious incidents)

**Also consider**:
- Cyber insurance (if you have it - call immediately)
- Legal counsel (breach notification expertise)
- PR firm (if reputational damage likely)

---

## 🔗 Related Resources

**Prevention**:
- [Skill Vetting](02-skill-vetting.md) - Vet before installing
- [Data Protection](06-data-protection.md) - Minimize blast radius
- [Assessment](01-assessment.md) - Check your security posture

**Templates**:
- [Incident Report Template](../templates/incident-report-ai.md)
- [AI Acceptable Use Policy](../templates/ai-acceptable-use-policy.md)

**External Resources**:
- [Singapore PDPC Breach Notification Guide](https://www.pdpc.gov.sg/help-and-resources/2018/01/guide-to-managing-data-breaches)
- [EU GDPR Breach Notification](https://gdpr-info.eu/art-33-gdpr/)
- [NIST Incident Response Guide](https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-61r2.pdf)

---

**Last Updated**: February 2026

---

**Remember**: The best incident response is prevention. But if an incident happens, quick, decisive action in the first hour makes the difference between a minor incident and a catastrophic breach.

**Golden Rule**: When in doubt, assume the worst and over-respond. It's better to rotate credentials that didn't need rotation than to leave compromised credentials active for days.
