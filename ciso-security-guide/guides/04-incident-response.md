# Part 4: Incident Response & Business Continuity

**The Reality**: 77% of companies don't have an incident response plan. When a breach happens, they waste hours figuring out who to call, what to do, and how to communicate. Average breach response takes 280 days (9 months) to contain. With a plan, you can contain in 7-30 days and save $500K-$3M in recovery costs.

**This guide covers**:
- Incident response plan (6-phase framework)
- Breach notification requirements (PDPA, GDPR timelines)
- Communication playbooks (internal, customers, media, regulators)
- Business continuity and disaster recovery (RTO, RPO)
- Cyber insurance (what it covers, how much to buy)

---

## Step 1: Incident Response Plan Overview

**The 6-phase framework**:

1. **Preparation** (before incident): Build IR plan, train team, set up tools
2. **Detection** (0-4 hours): Identify security incident, assess severity
3. **Containment** (4-24 hours): Stop the bleeding, prevent further damage
4. **Eradication** (1-7 days): Remove threat, patch vulnerabilities
5. **Recovery** (7-30 days): Restore systems, verify no backdoors
6. **Lessons Learned** (30-60 days): Post-mortem, improve defenses

**Timeline by severity**:
- **Critical** (customer data breach): 24-hour response, 7-day containment
- **High** (production system down): 4-hour response, 48-hour containment
- **Medium** (internal system compromised): 24-hour response, 7-day containment
- **Low** (phishing attempt): 48-hour response, 7-day containment

---

## Step 2: Preparation (Before Incident)

**Goal**: Build muscle memory so you don't panic during a real incident

### Incident Response Team

**Who to include**:
- **Incident Commander** (CISO or CTO): Makes final decisions, coordinates response
- **Technical Lead** (Senior Engineer): Investigates root cause, implements fixes
- **Legal Counsel** (In-house or external): Advises on legal obligations, breach notification
- **PR/Communications** (Marketing or external): Handles customer/media communication
- **Executive Sponsor** (CEO or COO): Approves major decisions (shutdown production, notify press)

**Contact sheet** (keep in secure location, NOT only in Slack):

| Role | Name | Phone | Email | Backup |
|------|------|-------|-------|--------|
| Incident Commander | [Your CISO] | +65 9XXX XXXX | ciso@yourcompany.com | [CTO] |
| Technical Lead | [Senior Eng] | +65 9XXX XXXX | eng@yourcompany.com | [Another Eng] |
| Legal Counsel | [Lawyer] | +65 9XXX XXXX | legal@law.firm.com | [Backup Lawyer] |
| PR/Communications | [PR Lead] | +65 9XXX XXXX | pr@yourcompany.com | [Marketing Lead] |
| Executive Sponsor | [CEO] | +65 9XXX XXXX | ceo@yourcompany.com | [COO] |

**External contacts**:
- Forensics firm: [Company Name], +65 XXXX XXXX, contact@forensics.com
- Cyber insurance: [Policy Number], +65 XXXX XXXX, claims@insurance.com
- PDPC Singapore: 1800-CALL-PDPC, https://www.pdpc.gov.sg/
- IMDA: +65 6377 3800, https://www.imda.gov.sg/

### Incident Response Tools

**Communication**:
- [ ] War room (Slack channel: `#incident-response`, invite IR team)
- [ ] Video call link (Zoom, Google Meet — for 24/7 access)
- [ ] Status page (status.yourcompany.com — to notify customers)

**Investigation**:
- [ ] Log aggregation (Datadog, Splunk, ELK — centralized logs)
- [ ] SIEM (Splunk, QRadar, Sentinel — security alerts)
- [ ] Forensics tools (Wireshark, Volatility, FTK — for deep analysis)

**Backup & Recovery**:
- [ ] Backup verification (test restore monthly)
- [ ] Backup location (separate AWS account, different region)
- [ ] Backup encryption (encrypted backups, keys in Secrets Manager)

### Tabletop Exercises (Simulate Breach)

**Run quarterly** (30-60 minutes):

**Scenario 1: Ransomware attack**
- "Your production database is encrypted. Ransom note demands $50K Bitcoin."
- Practice: Who do you call? How do you restore from backup? Do you pay?

**Scenario 2: Employee laptop stolen**
- "A laptop with customer data was stolen from airport. It was not encrypted."
- Practice: Do you notify PDPC? Notify customers? How many customers affected?

**Scenario 3: AWS credentials leaked on GitHub**
- "An engineer accidentally committed AWS access keys to public GitHub repo."
- Practice: How fast can you rotate keys? Check if keys were used? Assess damage?

**Scenario 4: Phishing attack**
- "5 employees clicked phishing link and entered credentials. Attacker has access."
- Practice: Reset passwords? Revoke sessions? Check if attacker accessed data?

**After each exercise**:
- Document what went well, what went wrong
- Update incident response plan
- Train team on gaps

---

## Step 3: Detection (0-4 Hours)

**Goal**: Identify incident quickly, assess severity, activate IR team

### How to Detect Incidents

**Automated alerts**:
- [ ] Failed login attempts (>10 in 5 minutes from single IP)
- [ ] Unusual API calls (spike in data exports, bulk deletions)
- [ ] Anomalous traffic (DDoS, port scans)
- [ ] Malware detected (endpoint protection alert)
- [ ] Secrets exposed (GitHub secret scanning, GitGuardian)

**Manual reporting**:
- [ ] Employee reports phishing email
- [ ] Customer reports suspicious activity (account takeover)
- [ ] Security researcher reports vulnerability
- [ ] News article mentions your company in breach

**Tools for detection**:
- SIEM (Splunk, QRadar, Sentinel) — correlate security events
- IDS/IPS (Snort, Suricata, AWS GuardDuty) — detect intrusions
- EDR (CrowdStrike, SentinelOne, Carbon Black) — detect malware on endpoints

### Incident Classification

**Severity levels**:

**P0 (Critical)**:
- Customer data breach (PII, payment info, passwords leaked)
- Production systems down (no revenue, customers can't use product)
- Ransomware attack (data encrypted, ransom demanded)
- Active attacker in production (ongoing data exfiltration)

**P1 (High)**:
- Internal systems compromised (employee accounts, admin panels)
- Vulnerability actively exploited (but no data breach yet)
- DDoS attack (site unreachable, but no data loss)

**P2 (Medium)**:
- Single employee account compromised (phishing, stolen laptop)
- Vulnerability discovered (but not exploited)
- Suspicious activity (unusual login, but no confirmed breach)

**P3 (Low)**:
- Phishing email received (but not clicked)
- Scanner activity (port scan, but no intrusion)
- Misconfiguration (S3 bucket public, but no data accessed)

### Activating Incident Response Team

**P0/P1**: Activate immediately (call Incident Commander)
**P2**: Activate during business hours (Slack message to IR team)
**P3**: Document and investigate (no IR team activation)

**Incident notification template** (Slack):
```
🚨 INCIDENT DETECTED - P0 CRITICAL

**What**: Customer database potentially compromised (unusual data export)
**When**: 2024-01-15 14:32 SGT
**Impact**: Up to 10,000 customer records (names, emails, phone numbers)
**Status**: Investigating

@incident-commander @tech-lead @legal @pr

War room: #incident-2024-01-15
Zoom: https://zoom.us/j/123456789
```

---

## Step 4: Containment (4-24 Hours)

**Goal**: Stop the bleeding, prevent further damage

### Immediate Containment (First 4 Hours)

**If active attacker**:
- [ ] **Isolate affected systems** (disconnect from network, not delete)
- [ ] **Revoke attacker credentials** (rotate API keys, reset passwords)
- [ ] **Block attacker IP** (add to firewall rules, WAF blacklist)
- [ ] **Preserve evidence** (take VM snapshots, copy logs before attacker deletes)

**If data breach**:
- [ ] **Identify scope** (how many customers affected? What data leaked?)
- [ ] **Stop data exfiltration** (block outbound traffic, revoke API keys)
- [ ] **Notify IR team** (don't notify customers yet — wait for full investigation)

**If ransomware**:
- [ ] **Isolate infected systems** (unplug from network immediately)
- [ ] **Do NOT pay ransom** (yet — assess if you can restore from backup)
- [ ] **Check backups** (verify backups are not also encrypted)
- [ ] **Notify cyber insurance** (they may have ransom negotiators)

### Long-Term Containment (24 Hours - 7 Days)

- [ ] **Patch vulnerabilities** (how did attacker get in? Fix immediately)
- [ ] **Reset all credentials** (assume attacker has all passwords, API keys)
- [ ] **Enable additional monitoring** (watch for attacker returning)
- [ ] **Segment network** (limit attacker movement if they return)

---

## Step 5: Eradication (1-7 Days)

**Goal**: Remove attacker completely, ensure no backdoors

### Forensics Investigation

**Hire forensics firm** (if P0 incident):
- **When to hire**: Customer data breach, ransomware, active attacker
- **Cost**: $50K-$200K (depends on scope)
- **What they do**: Root cause analysis, timeline reconstruction, identify all compromised systems
- **Deliverable**: Forensics report (needed for insurance claim, legal defense)

**Forensics firms in SEA**:
- Kroll (Singapore) — global firm, expensive ($200K+)
- Stroz Friedberg (Singapore) — global firm
- Group-IB (Singapore) — cybersecurity firm with forensics
- Quann (Malaysia) — regional firm, more affordable ($50K-$100K)

**DIY forensics** (if P2/P3 incident):
- [ ] **Collect logs** (all logs from 7 days before incident to now)
- [ ] **Analyze logs** (find attacker IP, entry point, what they accessed)
- [ ] **Timeline reconstruction** (what happened when)
- [ ] **Identify compromised accounts** (reset all affected accounts)

### Removing the Threat

- [ ] **Delete malware** (if ransomware, reimage infected systems)
- [ ] **Close entry point** (patch vulnerability, disable compromised account)
- [ ] **Rotate all secrets** (API keys, database passwords, SSH keys)
- [ ] **Review firewall rules** (ensure no backdoor rules added by attacker)
- [ ] **Check for persistence** (cron jobs, scheduled tasks, startup scripts)

---

## Step 6: Recovery (7-30 Days)

**Goal**: Restore systems, verify no backdoors, return to normal operations

### System Restoration

**If from backup**:
- [ ] **Test restore** (restore to staging first, verify data integrity)
- [ ] **Restore production** (schedule during maintenance window)
- [ ] **Verify functionality** (run smoke tests, check critical workflows)
- [ ] **Monitor closely** (watch for attacker returning)

**If rebuilding**:
- [ ] **Rebuild from clean images** (don't restore from potentially compromised backups)
- [ ] **Restore data** (from backup taken before incident)
- [ ] **Re-deploy applications** (from version control, not compromised servers)
- [ ] **Re-configure systems** (firewall rules, access controls, monitoring)

### Verification

- [ ] **Penetration test** (hire external firm to verify no backdoors)
- [ ] **Vulnerability scan** (ensure all patches applied)
- [ ] **Monitor for 30 days** (watch for suspicious activity)
- [ ] **Customer communication** (notify customers when safe to return)

---

## Step 7: Communication Playbooks

**Who to notify, when, and what to say**

### Internal Communication (Employees)

**When**: Immediately (P0/P1 incidents)

**Template**:
```
Subject: Security Incident - Action Required

Team,

We are investigating a security incident that occurred on [DATE].
Here's what we know:

- What happened: [Brief description]
- Impact: [Affected systems, data]
- Status: [Contained, investigating, recovering]

**Action required:**
1. Reset your password immediately: [Link]
2. Enable MFA if not already enabled: [Link]
3. Report any suspicious activity to security@yourcompany.com

We will provide updates every [6/12/24] hours.

Questions? Contact security@yourcompany.com or Slack #incident-response.

Thank you,
[Incident Commander]
```

### Customer Communication

**When**:
- **P0 (data breach)**: After investigation complete (48-72 hours), but before public disclosure
- **P1 (production down)**: Immediately via status page
- **P2/P3**: No customer communication unless affected

**Template** (data breach):
```
Subject: Important Security Update for [Your Company] Users

Dear [Customer Name],

We are writing to inform you of a security incident that may have affected your account.

**What happened:**
On [DATE], we discovered unauthorized access to our systems. An attacker accessed [SPECIFIC DATA: names, emails, phone numbers, etc.].

**What data was affected:**
- Your name and email address
- [Other data fields]

**What was NOT affected:**
- Passwords (encrypted and not accessed)
- Payment information (stored by Stripe, not affected)

**What we're doing:**
1. We have contained the breach and removed the attacker
2. We have hired [Forensics Firm] to investigate
3. We have implemented additional security measures
4. We have notified relevant authorities

**What you should do:**
1. Reset your password immediately: [Link]
2. Enable two-factor authentication: [Link]
3. Monitor your accounts for suspicious activity
4. Be cautious of phishing emails (we will never ask for your password)

**Questions?**
Contact us at security@yourcompany.com or call +65 XXXX XXXX.

We sincerely apologize for this incident and are committed to protecting your data.

[Your Name]
[Title]
[Company]
```

### Regulator Notification (PDPC, GDPR)

**Singapore PDPA**:
- **Timeline**: No mandatory timeline (but "as soon as practicable")
- **Who to notify**: Personal Data Protection Commission (PDPC)
- **How to notify**: https://www.pdpc.gov.sg/report-data-breach
- **What to include**: Nature of breach, affected individuals, remediation steps

**GDPR** (EU customers):
- **Timeline**: 72 hours of becoming aware of breach
- **Who to notify**: Supervisory authority in lead EU country
- **How to notify**: Via national DPA website (e.g., ICO in UK, CNIL in France)
- **What to include**: Nature of breach, affected individuals, consequences, remediation

**Template** (PDPC notification):
```
To: Personal Data Protection Commission Singapore

Subject: Data Breach Notification - [Your Company]

We are writing to notify you of a personal data breach that occurred on [DATE].

**Nature of breach:**
Unauthorized access to customer database via compromised API key.

**Data affected:**
- Number of individuals: 10,000
- Type of data: Names, email addresses, phone numbers
- Sensitive data: None

**Discovery:**
Breach discovered on [DATE] via automated monitoring alert.

**Containment:**
- API key rotated immediately
- Attacker access blocked
- Forensics investigation underway

**Remediation:**
- All API keys rotated
- Additional monitoring implemented
- Affected customers notified on [DATE]

**Contact:**
[Your Name], CISO
[Email], [Phone]

Attachments: Forensics report, customer notification template
```

### Media Communication (If Public)

**When**: Only if breach becomes public (news article, social media)

**Template** (press statement):
```
[Your Company] Statement on Security Incident

On [DATE], [Your Company] discovered a security incident involving unauthorized access to customer data. We immediately launched an investigation, contained the breach, and notified affected customers.

**What happened:**
An unauthorized party gained access to our systems and accessed customer names, email addresses, and phone numbers. No passwords, payment information, or sensitive data were accessed.

**What we're doing:**
- We have contained the breach and removed the attacker
- We have hired [Forensics Firm] to conduct a thorough investigation
- We have implemented additional security measures
- We have notified relevant authorities and affected customers

**Customer support:**
Affected customers can contact us at security@yourcompany.com or +65 XXXX XXXX.

We sincerely apologize for this incident and remain committed to protecting our customers' data.

[Spokesperson Name]
[Title]
```

---

## Step 8: Business Continuity & Disaster Recovery

**Goal**: Keep business running even if systems go down

### RTO and RPO

**RTO (Recovery Time Objective)**: How long can you be down?
- **Critical systems** (production app): 4 hours
- **Important systems** (admin panel): 24 hours
- **Non-critical systems** (marketing site): 7 days

**RPO (Recovery Point Objective)**: How much data can you lose?
- **Critical data** (transactions, customer data): 1 hour (hourly backups)
- **Important data** (support tickets, logs): 24 hours (daily backups)
- **Non-critical data** (marketing content): 7 days (weekly backups)

**Example**:
- RTO = 4 hours: Production must be restored within 4 hours
- RPO = 1 hour: You can lose up to 1 hour of data (restore from backup 1 hour old)

### Backup Strategy

**3-2-1 rule**:
- **3 copies** of data (1 production + 2 backups)
- **2 different media** (local disk + cloud storage)
- **1 offsite** (different AWS account or region)

**Backup frequency**:
- **Production databases**: Every 1 hour (automated snapshots)
- **Files/documents**: Every 24 hours (daily backups)
- **Code repositories**: Continuous (GitHub already has copies)

**Backup testing**:
- [ ] **Monthly**: Test restore from backup (verify data integrity)
- [ ] **Quarterly**: Full disaster recovery drill (restore entire production)

**Backup storage**:
- Store in separate AWS account (attacker can't delete backups)
- Enable versioning (can restore from any point in time)
- Encrypt backups (AES-256)
- Set lifecycle policies (delete backups after 90 days to save cost)

### Disaster Recovery Plan

**Scenario 1: AWS region goes down**
- **Plan**: Multi-region deployment (primary: Singapore, failover: Mumbai)
- **Failover time**: 30 minutes (update DNS to point to Mumbai)
- **Data loss**: 1 hour (last cross-region backup)

**Scenario 2: Database corrupted**
- **Plan**: Restore from automated snapshot
- **Failover time**: 2 hours (restore + verify)
- **Data loss**: 1 hour (last snapshot)

**Scenario 3: Ransomware encrypts production**
- **Plan**: Restore from backup in separate AWS account
- **Failover time**: 4 hours (restore + rebuild)
- **Data loss**: 1 hour (last backup before encryption)

**Scenario 4: Key engineer quits**
- **Plan**: Documentation + cross-training (2 engineers know each critical system)
- **Failover time**: 1 day (handoff to backup engineer)
- **Data loss**: None

---

## Step 9: Cyber Insurance

**What it covers**:
- **First-party costs** (your costs):
  - Forensics investigation ($50K-$200K)
  - Legal fees ($30K-$100K)
  - PR/crisis communication ($20K-$100K)
  - Business interruption (lost revenue during downtime)
  - Ransomware payment (if you choose to pay)
  - Data recovery (restoring from backup, rebuilding systems)

- **Third-party costs** (liability to others):
  - Regulatory fines (PDPA, GDPR penalties)
  - Customer lawsuits (class action lawsuits)
  - Customer notification costs (email, postal mail)

**What it does NOT cover**:
- Reputational damage (stock price drop, customer churn)
- Fines from willful negligence (knew about vulnerability, didn't fix)
- Nation-state attacks (war exclusion)
- Insider threats (sometimes excluded)

### How Much Coverage to Buy

**Formula**:
```
Coverage Amount = (Forensics + Legal + PR + Business Interruption + Regulatory Fine) × 1.5

Example ($5M ARR SaaS):
- Forensics: $100K
- Legal: $50K
- PR: $50K
- Business interruption: $500K (1 month downtime × $500K/month revenue)
- Regulatory fine: $500K (10% of annual revenue)
- Total: $1.2M
- Coverage: $1.2M × 1.5 = $1.8M (round to $2M)
```

**Recommended coverage by company size**:
- **$1M-$5M ARR**: $1M-$2M coverage
- **$5M-$15M ARR**: $2M-$5M coverage
- **$15M+ ARR**: $5M-$10M+ coverage

### Cyber Insurance Cost

**Premiums** (annual):
- **$1M-$5M ARR**: $5K-$20K/year (0.5-1% of revenue)
- **$5M-$15M ARR**: $20K-$50K/year
- **$15M+ ARR**: $50K-$150K/year

**Factors affecting cost**:
- Security posture (SOC 2 certified = 30-50% discount)
- Industry (fintech, healthcare = higher premiums)
- Claims history (prior breaches = higher premiums)
- Coverage amount (higher coverage = higher premiums)

**Cyber insurance providers in SEA**:
- AIG (global, available in SEA)
- Chubb (global, strong in SEA)
- AXA (global)
- Beazley (UK, covers APAC)
- Coalition (US, covers globally)

---

## Step 10: Lessons Learned (Post-Mortem)

**Goal**: Learn from incident, prevent recurrence

### Post-Mortem Meeting (Within 30 Days)

**Attendees**: Incident Response Team + management

**Agenda**:
1. **Timeline reconstruction** (what happened when)
2. **Root cause analysis** (how did attacker get in)
3. **Response evaluation** (what went well, what went wrong)
4. **Remediation plan** (how to prevent recurrence)

### Post-Mortem Template

```markdown
# Incident Post-Mortem: [Incident Name]

**Date**: 2024-01-15
**Duration**: 48 hours (detection to containment)
**Severity**: P0 (Critical)
**Impact**: 10,000 customers affected

## Summary
On January 15, 2024, an attacker gained access to our customer database via a compromised API key and exfiltrated 10,000 customer records (names, emails, phone numbers).

## Timeline
- **14:30 SGT**: Automated alert detected unusual data export
- **14:45 SGT**: Incident Response Team activated
- **15:00 SGT**: API key rotated, attacker access blocked
- **16:00 SGT**: Forensics investigation started
- **Jan 16, 10:00 SGT**: Customers notified
- **Jan 17, 14:00 SGT**: Incident contained

## Root Cause
API key was hardcoded in public GitHub repository. Attacker discovered key via GitHub search and used it to access customer database.

## What Went Well
- Automated monitoring detected breach within 15 minutes
- Incident Response Team activated quickly
- Containment completed within 24 hours

## What Went Wrong
- API key was hardcoded (should have been in Secrets Manager)
- GitHub repo scanning was not enabled (would have caught this)
- No rate limiting on API (attacker exported 10K records in 30 seconds)

## Action Items
1. [ ] Enable GitHub secret scanning (prevent future leaks) — Owner: CTO, Due: Jan 20
2. [ ] Migrate all secrets to AWS Secrets Manager (remove hardcoded secrets) — Owner: Tech Lead, Due: Jan 31
3. [ ] Implement API rate limiting (max 10 requests/second) — Owner: Backend Eng, Due: Jan 25
4. [ ] Enable pre-commit hooks (block commits with secrets) — Owner: DevOps, Due: Jan 22
5. [ ] Run security awareness training (teach developers about secrets management) — Owner: CISO, Due: Feb 15

## Lessons Learned
1. Automated detection works (caught breach in 15 minutes)
2. Secrets management is critical (never hardcode API keys)
3. Rate limiting prevents mass data exfiltration
4. GitHub secret scanning is essential

## Cost
- Forensics: $80K
- Legal: $30K
- PR: $20K
- Total: $130K (covered by cyber insurance)
```

---

## Summary

**Key takeaways**:
1. **Incident Response Plan**: 6 phases (Preparation, Detection, Containment, Eradication, Recovery, Lessons Learned)
2. **Preparation**: Build IR team, run tabletop exercises quarterly
3. **Detection**: Automated alerts (failed logins, unusual API calls, malware)
4. **Containment**: Isolate systems, revoke credentials, block attacker (4-24 hours)
5. **Communication**: Notify employees (immediately), customers (48-72 hours), regulators (72 hours for GDPR)
6. **Business Continuity**: RTO (4 hours), RPO (1 hour), 3-2-1 backup rule
7. **Cyber Insurance**: $1M-$10M coverage depending on ARR, costs 0.5-1% of revenue
8. **Post-Mortem**: Root cause analysis, action items, prevent recurrence

**Quick wins**:
- Build Incident Response Team contact sheet (keep offline)
- Run first tabletop exercise (ransomware scenario)
- Set up automated backups (hourly for critical systems)
- Test backup restore (monthly)
- Buy cyber insurance ($1M-$2M coverage for $5K-$20K/year)

**Next steps**:
- Create Incident Response Plan (use template in Part 5: Templates)
- Run tabletop exercise (use scenarios in this guide)
- Set up backup testing (monthly calendar reminder)
- Get cyber insurance quotes (AIG, Chubb, Beazley)
- Read Part 5: Security Governance & Policies
