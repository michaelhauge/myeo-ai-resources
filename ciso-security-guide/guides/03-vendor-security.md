# Part 3: Vendor Security Management

**The Reality**: 60% of breaches happen through third-party vendors. You can have perfect security, but if your vendor gets hacked and leaks your customer data, you're liable. Most companies use 50-200 SaaS tools, yet 80% have no vendor security assessment process.

**This guide covers**:
- Vendor risk assessment framework (Tier 1/2/3 vendors)
- Security questionnaires (20-question template)
- Vendor onboarding checklist (before granting access)
- Ongoing vendor monitoring (annual reviews, security alerts)
- Vendor offboarding (revoke access, delete data)

---

## Step 1: Vendor Inventory

**Goal**: Know all the SaaS tools and vendors you use

### Categorize Your Vendors

**By access level**:

**Tier 1: Critical vendors** (have access to customer data or production systems)
- Payment processors: Stripe, PayPal, Xendit, 2C2P
- Cloud infrastructure: AWS, Google Cloud, Azure, DigitalOcean
- Databases: MongoDB Atlas, PlanetScale, Supabase
- Authentication: Auth0, Okta, Firebase Auth
- Customer support: Zendesk, Intercom, Freshdesk
- CRM: Salesforce, HubSpot, Pipedrive
- Email: SendGrid, Mailchimp, Customer.io
- Analytics: Segment, Mixpanel, Amplitude

**Tier 2: Important vendors** (have access to internal data or employee accounts)
- Email/productivity: Google Workspace, Office 365
- Communication: Slack, Zoom, Microsoft Teams
- Development: GitHub, GitLab, Jira, Linear
- HR: BambooHR, Workday, Gusto, Rippling
- Finance: QuickBooks, Xero, Bill.com
- Design: Figma, Canva, Adobe Creative Cloud

**Tier 3: Low-risk vendors** (no access to sensitive data)
- Marketing: SEMrush, Ahrefs, Buffer
- Project management: Asana, Trello, Notion
- Scheduling: Calendly, Cal.com
- Docs: Notion, Confluence, Google Docs

### Vendor Inventory Template

| Vendor Name | Category | Tier | Data Access | Renewal Date | Owner | DPA Signed? |
|-------------|----------|------|-------------|--------------|-------|-------------|
| Stripe | Payments | 1 | Customer PII, payment info | Jan 2027 | CFO | Yes |
| AWS | Infrastructure | 1 | All production data | Monthly | CTO | Yes |
| Zendesk | Support | 1 | Customer PII, support tickets | Mar 2026 | Support Lead | Yes |
| Google Workspace | Email | 2 | Employee emails, documents | Jun 2026 | CTO | Yes |
| Slack | Communication | 2 | Internal messages | Dec 2026 | CTO | No |
| Figma | Design | 3 | Design files (no customer data) | Aug 2026 | Design Lead | No |

**How to build inventory**:
1. [ ] Check expense reports (all SaaS subscriptions)
2. [ ] Check SSO dashboard (Google Workspace, Okta)
3. [ ] Ask department heads (each team has shadow IT)
4. [ ] Scan AWS/cloud billing (identify all integrated services)

---

## Step 2: Vendor Risk Assessment Framework

**Goal**: Prioritize vendor security reviews based on risk level

### Risk Score Formula

```
Vendor Risk Score = (Data Sensitivity × Access Level × Vendor Size) ÷ Security Posture

Data Sensitivity:
5 = Customer PII + payment/health/financial data
4 = Customer PII (names, emails, phone numbers)
3 = Internal data (employee data, company financials)
2 = Semi-public data (marketing data, aggregated analytics)
1 = Public data (website content, blog posts)

Access Level:
5 = Production database access or admin access
4 = API access to customer data
3 = Read-only access to customer data
2 = Employee account access
1 = No access to sensitive systems

Vendor Size (inverse risk):
5 = Unknown startup (<10 employees, <$1M ARR)
4 = Small company (10-50 employees, $1M-$10M ARR)
3 = Mid-size company (50-200 employees, $10M-$100M ARR)
2 = Large company (>200 employees, >$100M ARR)
1 = Public company or Fortune 500

Security Posture (reduce risk):
5 = SOC 2 Type 2 + ISO 27001 certified
4 = SOC 2 Type 2 certified
3 = SOC 2 Type 1 certified
2 = No certification, but detailed security documentation
1 = No certification, no security documentation
```

**Example**:

**Stripe**:
- Data Sensitivity: 5 (payment data)
- Access Level: 4 (API access to payment info)
- Vendor Size: 1 (large public company)
- Security Posture: 5 (SOC 2 Type 2 + ISO 27001 + PCI-DSS)
- Risk Score: (5 × 4 × 1) ÷ 5 = 4.0 (LOW RISK)

**Unknown analytics startup**:
- Data Sensitivity: 4 (customer PII)
- Access Level: 3 (read-only access)
- Vendor Size: 5 (unknown startup)
- Security Posture: 1 (no certifications)
- Risk Score: (4 × 3 × 5) ÷ 1 = 60 (HIGH RISK)

**Priority levels**:
- **50+**: High risk (full security assessment required)
- **20-49**: Medium risk (security questionnaire required)
- **<20**: Low risk (basic checks only)

---

## Step 3: Vendor Security Questionnaire

**When to use**: Before onboarding any Tier 1 vendor or high-risk vendor

### 20-Question Security Questionnaire

**Section 1: Certifications & Compliance**

1. **Do you have SOC 2 Type 2 certification?**
   - [ ] Yes (request copy of report)
   - [ ] No (skip to Q2)

2. **Do you have ISO 27001 certification?**
   - [ ] Yes (request certificate)
   - [ ] No

3. **Are you GDPR compliant?** (if EU customers)
   - [ ] Yes
   - [ ] No
   - [ ] Not applicable (no EU customers)

4. **Do you have a Data Processing Agreement (DPA)?**
   - [ ] Yes (request copy)
   - [ ] No

**Section 2: Infrastructure & Data Storage**

5. **Where is customer data stored?** (data residency)
   - [ ] US
   - [ ] EU
   - [ ] Singapore
   - [ ] Other: _______

6. **Do you encrypt data at rest?**
   - [ ] Yes (encryption standard: AES-256, etc.)
   - [ ] No

7. **Do you encrypt data in transit?**
   - [ ] Yes (TLS 1.2 or higher)
   - [ ] No

8. **How long do you retain customer data?**
   - [ ] While contract is active
   - [ ] 90 days after termination
   - [ ] Other: _______

9. **Can you delete our data upon request?**
   - [ ] Yes (within 30 days)
   - [ ] Yes (within 90 days)
   - [ ] No

**Section 3: Access Control**

10. **Do you enforce Multi-Factor Authentication (MFA) for employee access?**
    - [ ] Yes (required for all employees)
    - [ ] Yes (required for admin accounts)
    - [ ] No

11. **Do you implement Role-Based Access Control (RBAC)?**
    - [ ] Yes
    - [ ] No

12. **How often do you review employee access?**
    - [ ] Quarterly
    - [ ] Annually
    - [ ] Never
    - [ ] Other: _______

**Section 4: Security Practices**

13. **Do you perform regular vulnerability scans?**
    - [ ] Yes (weekly)
    - [ ] Yes (monthly)
    - [ ] No

14. **Do you perform penetration tests?**
    - [ ] Yes (annually)
    - [ ] Yes (every 2 years)
    - [ ] No

15. **Do you have an incident response plan?**
    - [ ] Yes (documented and tested)
    - [ ] Yes (documented but not tested)
    - [ ] No

16. **Have you had any security breaches in the past 2 years?**
    - [ ] No
    - [ ] Yes (describe: _________)

**Section 5: Subprocessors & Third Parties**

17. **Do you use subprocessors (other vendors)?**
    - [ ] Yes (list: _________)
    - [ ] No

18. **How do you assess subprocessor security?**
    - [ ] SOC 2 certification required
    - [ ] Security questionnaire
    - [ ] No formal process

**Section 6: Monitoring & Logging**

19. **Do you maintain audit logs of data access?**
    - [ ] Yes (retained for 1 year)
    - [ ] Yes (retained for 90 days)
    - [ ] No

20. **Will you notify us of security incidents?**
    - [ ] Yes (within 24 hours)
    - [ ] Yes (within 72 hours)
    - [ ] No formal commitment

### Scoring the Questionnaire

**Pass criteria** (Tier 1 vendor):
- Must have SOC 2 Type 2 OR ISO 27001 (Q1 or Q2 = Yes)
- Must have DPA (Q4 = Yes)
- Must encrypt data at rest and in transit (Q6 and Q7 = Yes)
- Must enforce MFA (Q10 = Yes)
- Must have incident response plan (Q15 = Yes)
- Must notify of breaches (Q20 = Yes)

**If vendor fails**: Consider alternative vendor or accept risk (document in risk register)

---

## Step 4: Vendor Onboarding Checklist

**Goal**: Secure vendor access before granting it

### Pre-Onboarding (Before Signing Contract)

- [ ] **Run security questionnaire** (20 questions above)
- [ ] **Request SOC 2 report** (if applicable)
- [ ] **Review privacy policy** (data retention, deletion, sharing)
- [ ] **Sign Data Processing Agreement (DPA)**
- [ ] **Document approved use case** (what data they'll access, why)
- [ ] **Assign vendor owner** (who is responsible for managing this vendor)

### Onboarding (Granting Access)

- [ ] **Create service account** (not personal account)
  - Example: `stripe-integration@yourcompany.com`, not `mike@yourcompany.com`
- [ ] **Grant minimum necessary access** (least privilege)
  - Example: Read-only API key if vendor only needs to read data
- [ ] **Enable MFA** (if vendor supports it)
- [ ] **Set up audit logging** (track what vendor does with your data)
- [ ] **Document credentials** (where API keys are stored, who has access)
- [ ] **Set renewal reminder** (calendar alert 30 days before contract expires)

### Post-Onboarding (First 30 Days)

- [ ] **Monitor vendor activity** (review logs, API calls, data access)
- [ ] **Verify data deletion** (if offboarding previous vendor)
- [ ] **Update vendor inventory** (add to spreadsheet or GRC tool)

---

## Step 5: Vendor Access Levels (Least Privilege)

**The rule**: Grant minimum access necessary for vendor to do their job

### Access Level Guidelines

**Read-only access**:
- Use when: Vendor only needs to view data (analytics, reporting)
- Example: Analytics tool reading production database (read replica)
- Risk: Low (can't modify or delete data)

**API access (scoped)**:
- Use when: Vendor needs programmatic access
- Example: Stripe payment processor (only access payment methods, not user profiles)
- Risk: Medium (depends on API scope)

**Admin access**:
- Use when: Absolutely necessary (hosting, infrastructure)
- Example: AWS (full access to production infrastructure)
- Risk: High (can do anything)

**No direct access**:
- Use when: Vendor can work without accessing your systems
- Example: Marketing agency (give them export CSV, not database access)
- Risk: None (vendor never touches your systems)

### API Key Scoping Best Practices

**Bad** (overly permissive):
```javascript
// Stripe API key with full access
const stripe = new Stripe('sk_live_FULL_ACCESS'); // Can create/read/update/delete everything
```

**Good** (scoped):
```javascript
// Stripe Restricted API key (can only create payment intents)
const stripe = new Stripe('rk_live_SCOPED_ACCESS'); // Can only create payment intents, not delete customers
```

**How to scope API keys**:
- [ ] Use restricted keys when available (Stripe, AWS IAM)
- [ ] Grant only the permissions vendor needs (read vs write)
- [ ] Set expiration dates (rotate keys every 90 days)

---

## Step 6: Vendor Monitoring (Ongoing)

**Goal**: Detect when vendor security posture changes (breach, certification lapse)

### Quarterly Vendor Reviews

**Every quarter**:
- [ ] Review vendor access logs (who accessed what)
- [ ] Check for unusual activity (spike in API calls, data exports)
- [ ] Verify vendor still has SOC 2 (certifications expire annually)
- [ ] Review vendor headcount (if startup grew 10x, security might not have scaled)

### Annual Vendor Audits

**Every year** (for Tier 1 vendors):
- [ ] Re-run security questionnaire (confirm nothing changed)
- [ ] Request updated SOC 2 report
- [ ] Review contract renewal terms (pricing, SLAs)
- [ ] Assess if still best-in-class (competitors may have better security)

### Security Alert Monitoring

**Set up Google Alerts** for vendor security breaches:
- Google Alert: `"[Vendor Name]" + "security breach"`
- Google Alert: `"[Vendor Name]" + "data leak"`

**Subscribe to vendor security updates**:
- Most vendors have security@vendor.com mailing list
- Subscribe to vendor status page (status.vendor.com)

**If vendor has breach**:
1. Assess impact (did they leak your customer data?)
2. Review breach notification (what data was exposed?)
3. Request remediation plan (how will they prevent recurrence?)
4. Consider terminating contract (if breach is severe)

---

## Step 7: Vendor Offboarding Checklist

**Goal**: Revoke access and delete data when leaving vendor

### Pre-Offboarding (Before Canceling)

- [ ] **Export all data** (before losing access)
  - Example: Export Zendesk tickets, Mailchimp contacts, HubSpot CRM data
- [ ] **Migrate to new vendor** (if replacing)
  - Example: Migrate from Mailchimp to Customer.io
- [ ] **Test new vendor** (ensure no data loss)

### Offboarding (Revoking Access)

- [ ] **Revoke API keys** (delete or rotate immediately)
- [ ] **Revoke OAuth tokens** (disconnect integrations)
- [ ] **Delete service account** (e.g., `stripe-integration@yourcompany.com`)
- [ ] **Remove from SSO** (Google Workspace, Okta)
- [ ] **Cancel subscriptions** (don't let auto-renew)

### Post-Offboarding (Data Deletion)

- [ ] **Request data deletion** (email vendor: "Please delete all our data per DPA")
- [ ] **Verify data deletion** (request Certificate of Destruction if high-risk vendor)
- [ ] **Remove from vendor inventory** (update spreadsheet)
- [ ] **Update documentation** (if vendor was in runbooks, architecture docs)

**Data deletion timeline**:
- Request deletion within 7 days of offboarding
- Vendor should delete within 30-90 days (check DPA)
- Follow up if no confirmation after 90 days

---

## Step 8: Shadow IT (Unapproved Vendors)

**The problem**: Employees sign up for SaaS tools without security approval

**How to detect**:
- [ ] **SSO dashboard** (Google Workspace, Okta shows all OAuth apps)
- [ ] **Expense reports** (SaaS subscriptions on credit cards)
- [ ] **DNS logs** (CloudFlare, AWS Route53 shows domains accessed)
- [ ] **Browser extensions** (some SaaS tools install extensions)

**How to prevent**:
- [ ] **Vendor approval process** (require security review before purchasing)
- [ ] **SSO enforcement** (block OAuth apps not on approved list)
- [ ] **Credit card controls** (require manager approval for SaaS purchases)
- [ ] **Security awareness training** ("Don't upload customer data to unapproved tools")

**If you discover shadow IT**:
1. Assess risk (does tool have access to customer data?)
2. If high risk: Revoke access immediately (block OAuth app)
3. If low risk: Retroactively approve (run security questionnaire)
4. Educate employee (explain why approval is required)

---

## Step 9: Vendor Security Tools

**GRC platforms** (automate vendor security):
- **Vanta** ($2K-$10K/year): Vendor risk management + SOC 2 compliance
- **Secureframe** ($2K-$10K/year): Similar to Vanta
- **OneTrust** ($20K-$100K/year): Enterprise GRC platform
- **SecurityScorecard** ($10K-$50K/year): Continuous vendor monitoring

**What they do**:
- Automate vendor questionnaires (send, track responses)
- Monitor vendor security posture (check SOC 2 expiration)
- Alert on vendor breaches (scrape news, vendor status pages)
- Centralize vendor inventory (all vendors in one place)

**Cost-benefit**:
- If you have <20 vendors: Spreadsheet is fine
- If you have 20-50 vendors: Consider Vanta or Secureframe ($2K-$5K/year)
- If you have 50+ vendors: GRC platform is worth it (saves 10-20 hours/month)

---

## Step 10: Vendor Security by Category

### Cloud Infrastructure (AWS, GCP, Azure)

**Security requirements**:
- [ ] Enable MFA for root account (required)
- [ ] Enable CloudTrail or equivalent (audit logs)
- [ ] Use IAM roles (not root credentials)
- [ ] Enable encryption at rest (S3, EBS, RDS)
- [ ] Review IAM policies (least privilege)
- [ ] Set up billing alerts (detect anomalies)

**Risk**: HIGH (full access to production infrastructure)

---

### Payment Processors (Stripe, PayPal, Xendit)

**Security requirements**:
- [ ] PCI-DSS Level 1 certified (required)
- [ ] SOC 2 Type 2 certified (preferred)
- [ ] Use tokenization (don't store credit card numbers)
- [ ] Enable fraud detection (Stripe Radar, PayPal Seller Protection)
- [ ] Enable webhooks signature verification (prevent spoofing)
- [ ] Set up 3D Secure (reduce fraud)

**Risk**: CRITICAL (handles payment data)

---

### Customer Support (Zendesk, Intercom, Freshdesk)

**Security requirements**:
- [ ] SOC 2 Type 2 certified (required)
- [ ] Enable MFA for agents (required)
- [ ] Limit agent access (RBAC: some agents see all tickets, others only assigned)
- [ ] Mask sensitive data (credit card numbers, passwords in tickets)
- [ ] Set up data retention (auto-delete closed tickets after 2 years)

**Risk**: HIGH (access to customer PII, support history)

---

### Email Marketing (Mailchimp, Customer.io, SendGrid)

**Security requirements**:
- [ ] SOC 2 Type 2 certified (preferred)
- [ ] Enable double opt-in (confirm email subscriptions)
- [ ] Set up unsubscribe link (CAN-SPAM, GDPR compliance)
- [ ] Limit employee access (only marketing team)
- [ ] Enable SPF, DKIM, DMARC (prevent email spoofing)

**Risk**: MEDIUM (access to customer emails, but not financial data)

---

### CRM (Salesforce, HubSpot, Pipedrive)

**Security requirements**:
- [ ] SOC 2 Type 2 certified (required)
- [ ] Enable MFA (required)
- [ ] RBAC (sales reps see assigned accounts, managers see all)
- [ ] Audit logs (track who viewed/modified records)
- [ ] Data loss prevention (block bulk export of contacts)

**Risk**: HIGH (access to customer data, sales pipeline)

---

### Communication (Slack, Zoom, Microsoft Teams)

**Security requirements**:
- [ ] SOC 2 Type 2 certified (required)
- [ ] Enable MFA (required)
- [ ] SSO integration (Google Workspace, Okta)
- [ ] Disable guest access (or limit to specific channels)
- [ ] Set up data retention (delete messages after X years)
- [ ] Block file uploads of sensitive data (DLP)

**Risk**: MEDIUM (internal communications, may contain sensitive info)

---

### Development (GitHub, GitLab, Jira)

**Security requirements**:
- [ ] SOC 2 Type 2 certified (required)
- [ ] Enable MFA (required)
- [ ] Branch protection (require PR reviews, no force push)
- [ ] Secrets scanning (GitHub Advanced Security, GitLab Secret Detection)
- [ ] Dependabot alerts (vulnerable dependencies)
- [ ] Limit repo access (not all employees need access to all repos)

**Risk**: CRITICAL (access to source code, secrets, intellectual property)

---

## Summary

**Key takeaways**:
1. **Vendor inventory**: Know all your vendors (50-200 SaaS tools)
2. **Risk assessment**: Tier 1 vendors (customer data) require full security review
3. **Security questionnaire**: 20 questions before onboarding Tier 1 vendors
4. **Onboarding**: Grant least privilege access, sign DPAs, enable MFA
5. **Monitoring**: Quarterly reviews, annual audits, security alerts
6. **Offboarding**: Revoke access, delete data (request Certificate of Destruction)
7. **Shadow IT**: Detect and prevent unapproved vendor usage
8. **GRC tools**: Vanta, Secureframe for 20+ vendors ($2K-$10K/year)

**Quick wins**:
- Build vendor inventory (spreadsheet with Tier 1/2/3 classification)
- Sign DPAs with top 10 vendors (Stripe, AWS, Google, etc.)
- Enable MFA on all Tier 1 vendor accounts
- Set renewal reminders (30 days before contracts expire)
- Request SOC 2 reports from Tier 1 vendors

**Next steps**:
- Complete vendor inventory (use template in this guide)
- Run security questionnaire on top 5 vendors
- Sign DPAs with all Tier 1 vendors
- Set up quarterly vendor reviews (calendar reminder)
- Read Part 4: Incident Response & Business Continuity
