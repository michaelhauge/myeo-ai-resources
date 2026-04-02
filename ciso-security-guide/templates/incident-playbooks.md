# Incident Response Playbooks

**Purpose**: Step-by-step playbooks for responding to common security incidents. Print and keep in secure location (not only in Slack).

---

## Playbook 1: Data Breach (Customer PII Leaked)

**Severity**: P0 (Critical)
**Response Time**: Immediate (< 1 hour)
**Containment**: < 24 hours

### Phase 1: Detection (0-15 minutes)

**Trigger**: Automated alert or manual report that customer data may be exposed

**Actions**:
- [ ] **Document initial evidence**:
  - What data was accessed? (names, emails, passwords, credit cards)
  - How many customers affected? (estimate)
  - When did breach occur? (timestamp)
  - How was it discovered? (alert, customer report, researcher)

- [ ] **Activate Incident Response Team**:
  - Call Incident Commander: [PHONE NUMBER]
  - Slack message to #incident-response: "@here P0 DATA BREACH - Join war room"
  - Start Zoom call: [ZOOM LINK]

### Phase 2: Containment (15 minutes - 4 hours)

**Actions**:
- [ ] **Stop data exfiltration**:
  - Identify attacker IP or API key
  - Block attacker IP in firewall (AWS Security Group, Cloudflare WAF)
  - Rotate compromised API keys immediately
  - Disable compromised user accounts

- [ ] **Preserve evidence**:
  - Take VM snapshots (don't shut down servers yet)
  - Copy logs to separate S3 bucket (attacker may delete logs)
  - Document all actions in Jira ticket

- [ ] **Assess scope**:
  - Query database: How many customer records accessed?
  - Check logs: What data was exported? (SELECT queries, API calls)
  - Identify affected customers (create CSV list)

### Phase 3: Investigation (4 hours - 48 hours)

**Actions**:
- [ ] **Hire forensics firm** (if >1,000 customers affected):
  - Call forensics firm: [FIRM NAME], [PHONE NUMBER]
  - Provide evidence (logs, snapshots)
  - Request preliminary report within 48 hours

- [ ] **Root cause analysis**:
  - How did attacker get in? (SQL injection, phishing, API vulnerability)
  - What vulnerability was exploited? (OWASP Top 10)
  - Timeline reconstruction (when did breach start, how long)

- [ ] **Fix vulnerability**:
  - Patch immediately (no waiting for next release)
  - Deploy fix to production (emergency change)
  - Verify fix (penetration test)

### Phase 4: Notification (48-72 hours)

**Actions**:
- [ ] **Notify regulators** (per legal requirements):
  - **GDPR** (if EU customers): 72 hours to supervisory authority
    - File report: https://www.pdpc.gov.sg/report-data-breach
  - **PDPA** (Singapore): "As soon as practicable" to PDPC
    - Email: pdpc@pdpc.gov.sg

- [ ] **Notify affected customers**:
  - Draft email (use template below)
  - Review with Legal + PR
  - Send via email service (Mailchimp, SendGrid)
  - Publish blog post (security.yourcompany.com/incidents)

- [ ] **Internal communication**:
  - Email all employees (before customer notification)
  - Brief on what happened, what to tell customers
  - Update FAQs (how to respond to customer questions)

**Customer notification email template**:
```
Subject: Important Security Update for [Your Company] Users

Dear [Customer Name],

We are writing to inform you of a security incident that affected your account.

**What happened:**
On [DATE], we discovered unauthorized access to our systems. An attacker accessed [SPECIFIC DATA: names, emails, phone numbers].

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
4. We have notified relevant authorities (PDPC, GDPR)

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

### Phase 5: Recovery (7-30 days)

**Actions**:
- [ ] **Monitor for recurrence**:
  - Watch logs for 30 days (attacker may return)
  - Set up alerts for similar attack patterns
  - Weekly security meetings (IR team)

- [ ] **Implement additional controls**:
  - Enable AWS GuardDuty (intrusion detection)
  - Add rate limiting (prevent mass data export)
  - Require MFA for API access (prevent future credential theft)

- [ ] **Customer support**:
  - Set up dedicated support email (security@yourcompany.com)
  - Train support team on FAQs
  - Monitor social media for customer concerns

### Phase 6: Post-Mortem (30-60 days)

**Actions**:
- [ ] **Post-mortem meeting** (IR team + management):
  - Timeline reconstruction (what happened when)
  - Root cause analysis (how did attacker get in)
  - Response evaluation (what went well, what went wrong)
  - Remediation plan (how to prevent recurrence)

- [ ] **Document lessons learned**:
  - Update incident response plan
  - Add new monitoring rules
  - Train team on new procedures

**Cost estimate**:
- Forensics: $50K-$200K
- Legal: $30K-$100K
- PR: $20K-$100K
- Customer notifications: $5K-$20K
- **Total**: $100K-$500K (covered by cyber insurance)

---

## Playbook 2: Ransomware Attack

**Severity**: P0 (Critical)
**Response Time**: Immediate (< 1 hour)
**Containment**: < 4 hours

### Phase 1: Detection (0-15 minutes)

**Trigger**: Systems encrypted, ransom note displayed

**Actions**:
- [ ] **DO NOT pay ransom immediately** (assess first)
- [ ] **Isolate infected systems**:
  - Unplug from network (don't shut down — preserves memory)
  - Disable WiFi
  - Disconnect external drives

- [ ] **Activate Incident Response Team**:
  - Call Incident Commander: [PHONE NUMBER]
  - Slack: "@here P0 RANSOMWARE - DO NOT TOUCH INFECTED SYSTEMS"

### Phase 2: Containment (15 minutes - 4 hours)

**Actions**:
- [ ] **Identify ransomware variant**:
  - Take photo of ransom note (contains variant name)
  - Check No More Ransom: https://www.nomoreransom.org/ (free decryption tools)

- [ ] **Assess damage**:
  - How many systems infected? (single laptop or entire network)
  - Are backups affected? (check if attacker deleted backups)
  - Are databases encrypted? (check production RDS, MongoDB)

- [ ] **Check backups**:
  - Verify backups exist (AWS snapshots, separate S3 bucket)
  - Verify backups are NOT encrypted (test restore to staging)
  - If backups good: Don't pay ransom (restore from backup)

- [ ] **Notify cyber insurance**:
  - Call insurance: [POLICY NUMBER], [PHONE NUMBER]
  - They may have ransom negotiators
  - Get approval before paying (if backups failed)

### Phase 3: Decision (4-24 hours)

**Decision tree**:
```
Backups available and clean?
    ├─ YES → Restore from backup (don't pay ransom)
    └─ NO → Consider paying ransom (but consult legal first)
```

**If paying ransom**:
- [ ] Contact insurance (they may negotiate lower amount)
- [ ] Get legal approval (paying ransom may be illegal in some jurisdictions)
- [ ] Buy Bitcoin (may take 24-48 hours)
- [ ] Pay ransom via Tor browser
- [ ] Test decryption key before full restore

**If restoring from backup**:
- [ ] Wipe infected systems (reimage, don't just decrypt)
- [ ] Restore from backup to staging first (test)
- [ ] Restore to production (schedule during maintenance window)
- [ ] Monitor for reinfection (attacker may have backdoor)

### Phase 4: Recovery (7-30 days)

**Actions**:
- [ ] **Forensics investigation**:
  - Hire forensics firm (determine how ransomware entered)
  - Common entry: Phishing email, RDP exposed, unpatched vulnerability

- [ ] **Remediation**:
  - Patch all systems (especially if vulnerability exploited)
  - Disable RDP (or require VPN + MFA)
  - Train employees on phishing (ransomware often starts with phishing)

- [ ] **Improve backups**:
  - Separate backup account (attacker can't delete)
  - Test restores monthly (verify backups work)
  - Immutable backups (can't be deleted for 90 days)

### Phase 5: Post-Mortem (30-60 days)

**Actions**:
- [ ] Document timeline, root cause, response
- [ ] Update incident response plan
- [ ] Run tabletop exercise (simulate ransomware again)

**Cost estimate** (if paying ransom):
- Ransom: $10K-$500K (varies by company size)
- Bitcoin fees: $500-$2K
- Forensics: $50K-$200K
- Recovery: $20K-$100K
- **Total**: $80K-$800K

**Cost estimate** (if restoring from backup):
- Forensics: $50K-$100K
- Recovery: $10K-$50K
- **Total**: $60K-$150K (much cheaper than paying ransom)

---

## Playbook 3: Phishing Attack (Employee Clicked Link)

**Severity**: P2 (Medium) → P0 (Critical if attacker accessed data)
**Response Time**: < 4 hours
**Containment**: < 24 hours

### Phase 1: Detection (0-30 minutes)

**Trigger**: Employee reports "I clicked a phishing link"

**Actions**:
- [ ] **Don't panic** (many phishing links just steal credentials, not install malware)
- [ ] **Gather details from employee**:
  - What link did you click?
  - Did you enter any credentials? (username, password)
  - Did you download any files?
  - What system were you on? (laptop, phone)

### Phase 2: Containment (30 minutes - 4 hours)

**Actions**:
- [ ] **Reset compromised credentials**:
  - Reset employee password (Google Workspace, AWS, GitHub, all systems)
  - Revoke all sessions (force re-login everywhere)
  - Enable MFA if not already (prevent future credential theft)

- [ ] **Check for unauthorized access**:
  - Review Google Workspace admin logs (unusual logins, device, location)
  - Review AWS CloudTrail (unusual API calls)
  - Review GitHub audit logs (unusual commits, repo access)

- [ ] **Scan employee laptop**:
  - Run endpoint protection scan (CrowdStrike, SentinelOne)
  - Check for malware, keyloggers
  - If malware found: Reimage laptop (don't just delete malware)

### Phase 3: Investigation (4-24 hours)

**Actions**:
- [ ] **Assess damage**:
  - Did attacker access any systems? (check logs)
  - Did attacker access customer data? (database queries)
  - Did attacker exfiltrate data? (large downloads, API calls)

**If no data accessed**:
- [ ] Mark as P2 (Medium severity)
- [ ] Reset credentials, scan laptop
- [ ] Send reminder email to all employees (phishing awareness)
- [ ] No customer notification required

**If data accessed**:
- [ ] Mark as P0 (Critical severity)
- [ ] Follow "Data Breach" playbook above
- [ ] Notify customers, regulators

### Phase 4: Prevention (7-30 days)

**Actions**:
- [ ] **Run phishing simulation** (test all employees):
  - Use KnowBe4, SecurityIQ
  - Track click rate (target <5%)

- [ ] **Additional training** (for employees who clicked):
  - 30-minute phishing training
  - Quiz at end (must pass to use company systems)

- [ ] **Email filtering**:
  - Enable SPF, DKIM, DMARC (prevent email spoofing)
  - Enable link scanning (Google Workspace, Microsoft 365)
  - Block attachments from external senders (.exe, .zip)

**Cost estimate**: $0-$100K (depends if data breach occurred)

---

## Playbook 4: AWS Credentials Leaked on GitHub

**Severity**: P1 (High)
**Response Time**: < 1 hour
**Containment**: < 4 hours

### Phase 1: Detection (0-15 minutes)

**Trigger**: GitHub secret scanning alert or manual discovery

**Actions**:
- [ ] **Find leaked credentials**:
  - AWS access key ID (starts with AKIA...)
  - AWS secret access key
  - GitHub commit URL

### Phase 2: Containment (15 minutes - 1 hour)

**Actions**:
- [ ] **Rotate AWS keys immediately**:
  - AWS Console → IAM → Users → [User] → Security credentials → Delete access key
  - Create new access key (save in Secrets Manager, not code)

- [ ] **Check if keys were used**:
  - AWS CloudTrail → Event history → Filter by access key ID
  - Look for unusual API calls (EC2 instances created, S3 buckets exported)

- [ ] **Assess damage**:
  - If no API calls: Keys found but not used (lucky!)
  - If API calls: Determine what attacker did (created resources, accessed data)

### Phase 3: Cleanup (1-4 hours)

**Actions**:
- [ ] **Delete attacker resources**:
  - Terminate EC2 instances (check for cryptominers)
  - Delete S3 buckets created by attacker
  - Delete IAM users created by attacker

- [ ] **Remove leaked credentials from GitHub**:
  - Delete commit with credentials (git rebase or git filter-branch)
  - Force push to GitHub (rewrites history)
  - Notify GitHub Support (they can purge from cache)

### Phase 4: Prevention (7 days)

**Actions**:
- [ ] **Enable GitHub secret scanning** (free for public repos):
  - GitHub → Settings → Code security → Enable secret scanning

- [ ] **Enable pre-commit hooks** (block commits with secrets):
  - Install detect-secrets: `pip install detect-secrets`
  - Add to .git/hooks/pre-commit

- [ ] **Use Secrets Manager** (not environment variables):
  - Migrate all secrets to AWS Secrets Manager
  - Update code to fetch from Secrets Manager

- [ ] **Train developers**:
  - Never commit credentials
  - Use .env files (add .env to .gitignore)
  - Use Secrets Manager for production

**Cost estimate**:
- If keys not used: $0
- If keys used (attacker created EC2 instances): $500-$5K (AWS bill)
- If data exfiltrated: $100K-$500K (follow Data Breach playbook)

---

## Playbook 5: DDoS Attack (Site Unreachable)

**Severity**: P1 (High)
**Response Time**: < 1 hour
**Containment**: < 4 hours

### Phase 1: Detection (0-15 minutes)

**Trigger**: Site unreachable, monitoring alerts, customer complaints

**Actions**:
- [ ] **Confirm DDoS** (vs normal outage):
  - Check AWS CloudWatch (spike in traffic)
  - Check Cloudflare (if using)
  - Check uptime monitor (Pingdom, UptimeRobot)

- [ ] **Identify attack type**:
  - Layer 3/4 (network layer): High volume traffic (Gbps)
  - Layer 7 (application layer): HTTP requests (thousands of requests/second)

### Phase 2: Mitigation (15 minutes - 4 hours)

**Actions**:
- [ ] **Enable DDoS mitigation** (if not already):
  - **AWS Shield Standard** (free, always on)
  - **AWS Shield Advanced** ($3K/month, on-demand protection + 24/7 support)
  - **Cloudflare** (free plan has basic DDoS protection, paid plans have advanced)

- [ ] **Rate limiting**:
  - Limit requests per IP (10 requests/second)
  - Block IPs with >100 requests/minute (AWS WAF, Cloudflare)

- [ ] **Scale infrastructure** (if attack is overwhelming):
  - Enable auto-scaling (add more EC2 instances)
  - Increase ALB capacity
  - Contact AWS Support (they may provide additional DDoS protection)

### Phase 3: Recovery (4-24 hours)

**Actions**:
- [ ] **Monitor traffic**:
  - Watch for attack subsiding (traffic returns to normal)
  - Check error rate (should drop to <1%)

- [ ] **Analyze attack**:
  - Where did attack come from? (which countries, IPs)
  - What was targeted? (homepage, API, specific endpoint)
  - How long did it last? (minutes, hours, days)

### Phase 4: Prevention (7 days)

**Actions**:
- [ ] **Enable Cloudflare** (if not already):
  - Free plan provides basic DDoS protection
  - Pro plan ($20/month) provides advanced protection

- [ ] **Enable AWS WAF** (Web Application Firewall):
  - Rate limiting rules
  - Geo-blocking (block high-risk countries)
  - Bot detection (block scrapers, DDoS bots)

- [ ] **Enable AWS Shield Advanced** (if frequent attacks):
  - $3K/month + 10% of AWS bill (up to $50K/month)
  - 24/7 DDoS Response Team
  - Cost protection (AWS credits for scaling costs during attack)

**Cost estimate**:
- If using Cloudflare free: $0
- If scaling AWS: $500-$5K (temporary spike in EC2/bandwidth costs)
- If AWS Shield Advanced: $3K/month ongoing

---

## Summary

**5 playbooks provided**:
1. Data Breach (customer PII leaked) — P0, $100K-$500K cost
2. Ransomware Attack (systems encrypted) — P0, $60K-$800K cost
3. Phishing Attack (employee clicked link) — P2 or P0, $0-$100K cost
4. AWS Credentials Leaked on GitHub — P1, $0-$5K cost
5. DDoS Attack (site unreachable) — P1, $0-$5K cost

**How to use**:
1. Print playbooks and keep in secure location (not only on Slack)
2. When incident occurs, follow playbook step-by-step
3. Document all actions in Jira ticket
4. Update playbook after incident (lessons learned)

**Next template**: Compliance Roadmaps (SOC 2, ISO 27001, PDPA timelines)
