# Part 1: Security Assessment & Risk Management

**The Reality**: Most breaches happen because companies don't know what they're protecting or where their vulnerabilities are. You can't secure what you can't see.

**This guide covers**:
- How to run a comprehensive security assessment (identify all assets and risks)
- Vulnerability management (scan, prioritize, remediate)
- Risk scoring framework (likelihood × impact)
- The 100-point security scorecard
- Continuous monitoring strategy

---

## Step 1: Asset Inventory

**Goal**: Document everything you need to protect (if you don't know what you have, you can't secure it)

### What to Inventory

**Applications**:
- [ ] Production systems (web app, mobile app, API)
- [ ] Internal tools (admin panels, dashboards)
- [ ] Marketing sites (website, blog)
- [ ] Development/staging environments

**Data Stores**:
- [ ] Databases (PostgreSQL, MySQL, MongoDB)
- [ ] File storage (S3, Google Cloud Storage)
- [ ] Backups (where, how often, encrypted?)
- [ ] Logs (CloudWatch, Datadog, Splunk)

**Infrastructure**:
- [ ] Cloud accounts (AWS, GCP, Azure)
- [ ] Servers/VMs (EC2, Compute Engine)
- [ ] CDN (Cloudflare, Fastly)
- [ ] DNS (Route53, Cloudflare DNS)

**SaaS Tools**:
- [ ] Identity (Google Workspace, Okta, Auth0)
- [ ] Development (GitHub, GitLab, Jira)
- [ ] Communication (Slack, Zoom, email)
- [ ] HR/Finance (BambooHR, QuickBooks, Stripe)

**Sensitive Data**:
- [ ] Customer PII (names, emails, phone numbers)
- [ ] Financial data (credit cards, bank accounts)
- [ ] Health data (if applicable)
- [ ] Authentication credentials (passwords, tokens, keys)
- [ ] Source code (intellectual property)

---

## Step 2: Vulnerability Scanning

**Automated scanning tools**:
- **Qualys** ($2K-$5K/year): Enterprise-grade, comprehensive
- **Tenable Nessus** ($3K-$5K/year): Industry standard
- **Intruder** ($100-$500/month): Modern, SaaS-based
- **Nuclei** (Free): Open-source, CLI-based

**What to scan**:
- [ ] Web applications (OWASP Top 10 vulnerabilities)
- [ ] APIs (authentication, authorization, injection)
- [ ] Infrastructure (SSH, RDP, open ports)
- [ ] Containers (Docker images, Kubernetes configs)
- [ ] Dependencies (npm, pip, gem libraries)

**Scan frequency**:
- Production: Weekly
- Before each release: Always
- After major infrastructure changes: Always

---

## Step 3: Risk Prioritization

**Risk Score Formula**:
```
Risk Score = Likelihood (1-5) × Impact (1-5) × 10

Likelihood:
5 = Certain (exploited in the wild)
4 = Likely (exploit published, easy to use)
3 = Possible (exploit exists, requires skill)
2 = Unlikely (theoretical, no known exploit)
1 = Rare (requires physical access, insider)

Impact:
5 = Critical (breach of all customer data, company-ending)
4 = High (breach of some customer data, major revenue loss)
3 = Medium (breach of internal data, moderate revenue loss)
2 = Low (minimal data exposure, minor impact)
1 = Minimal (informational only, no real impact)
```

**Example**:
- SQL Injection in production: Likelihood 5 × Impact 5 × 10 = **250** (CRITICAL)
- Missing security headers: Likelihood 2 × Impact 2 × 10 = **40** (LOW)

**Priority levels**:
- **250+**: Critical (fix within 24 hours)
- **150-249**: High (fix within 7 days)
- **75-149**: Medium (fix within 30 days)
- **25-74**: Low (fix within 90 days)
- **<25**: Informational (fix when convenient)

---

## The 100-Point Security Scorecard

**Score your security posture (0-100 points)**:

### Identity & Access (25 points)
- [ ] MFA on all critical systems (10 pts)
- [ ] Password manager for all employees (5 pts)
- [ ] Regular access reviews (quarterly) (5 pts)
- [ ] Least privilege access (RBAC) (5 pts)

### Data Protection (20 points)
- [ ] Encryption at rest (databases, files) (7 pts)
- [ ] Encryption in transit (TLS 1.2+) (5 pts)
- [ ] Automated daily backups (5 pts)
- [ ] Backup testing (quarterly restore test) (3 pts)

### Endpoint Security (15 points)
- [ ] Endpoint protection on all devices (7 pts)
- [ ] Laptop encryption (BitLocker, FileVault) (5 pts)
- [ ] MDM for company devices (3 pts)

### Network Security (10 points)
- [ ] Firewall rules (least privilege) (5 pts)
- [ ] VPN for remote access (5 pts)

### Logging & Monitoring (10 points)
- [ ] Centralized logging (CloudWatch, Datadog) (5 pts)
- [ ] Security alerts configured (5 pts)

### Vulnerability Management (10 points)
- [ ] Weekly vulnerability scans (5 pts)
- [ ] Patch management process (5 pts)

### Policies & Training (10 points)
- [ ] Security policies documented (5 pts)
- [ ] Annual security awareness training (5 pts)

**Scoring**:
- **90-100**: Excellent (enterprise-grade security)
- **70-89**: Good (ready for SOC 2)
- **50-69**: Fair (basic security, needs improvement)
- **<50**: Poor (high risk, urgent action needed)

---

## Continuous Monitoring Strategy

**Weekly**:
- [ ] Review vulnerability scan results
- [ ] Check failed login attempts (brute force?)
- [ ] Review new cloud resources (shadow IT?)

**Monthly**:
- [ ] Access reviews (who has admin access?)
- [ ] Update systems inventory (new apps, decom old)
- [ ] Review security incidents (even minor ones)

**Quarterly**:
- [ ] Penetration test (if budget allows, $5K-$15K)
- [ ] Policy review (update, re-train)
- [ ] Vendor security assessments (Tier 1 vendors)

**Annually**:
- [ ] Full security audit (SOC 2 or equivalent)
- [ ] Disaster recovery test (restore from backup)
- [ ] Security awareness training refresh

---

## Summary

**Key takeaways**:
1. **Asset inventory first**: Can't secure what you don't know exists
2. **Automate scanning**: Weekly vulnerability scans ($100-$500/month)
3. **Prioritize by risk**: Likelihood × Impact × 10 = Risk Score
4. **100-point scorecard**: Aim for 70+ (SOC 2 ready)
5. **Continuous monitoring**: Weekly scans, monthly reviews, quarterly pentests

**Next steps**:
- Complete asset inventory (use spreadsheet template)
- Run first vulnerability scan (Intruder, Qualys, or Tenable)
- Calculate 100-point security score
- Fix Critical/High risks first
- Read Part 2: Data Privacy & Compliance
