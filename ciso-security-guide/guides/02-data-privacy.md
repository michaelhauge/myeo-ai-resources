# Part 2: Data Privacy & Compliance

**The Reality**: PDPA fines in Singapore can reach $1M or 10% of annual turnover. GDPR fines in EU go up to €20M or 4% of global revenue. Data breaches cost $500K-$5M+ (forensics, legal, customer churn). Yet most SEA companies have no data classification, no privacy policy, and no idea where customer data lives.

**This guide covers**:
- PDPA compliance for SEA (Singapore, Malaysia, Indonesia, Thailand, Vietnam, Philippines)
- GDPR compliance for EU customers
- Data residency by country (where data must be stored)
- Data classification framework (Public, Internal, Confidential, Restricted)
- Privacy by design (build privacy into products, not bolt it on later)

---

## Step 1: Understand Your Data

**Goal**: Know what personal data you collect, where it's stored, and why you need it

### Data Mapping Template

**Customer Data**:
- [ ] Name, email, phone number
- [ ] Address (billing, shipping)
- [ ] Payment information (credit card, bank account)
- [ ] IP address, device ID, cookies
- [ ] Usage data (logins, page views, clicks)
- [ ] Support conversations (tickets, chat logs)
- [ ] Social media profiles (if OAuth login)

**Employee Data**:
- [ ] Name, email, phone number
- [ ] IC/NRIC/passport number
- [ ] Bank account (for payroll)
- [ ] Emergency contact
- [ ] Performance reviews
- [ ] Medical information (if health insurance)

**Vendor/Partner Data**:
- [ ] Contact information (names, emails)
- [ ] Contracts, agreements
- [ ] Bank details (for payments)

**Where it's stored**:
- [ ] Production database (PostgreSQL, MySQL, MongoDB)
- [ ] Analytics (Google Analytics, Mixpanel, Amplitude)
- [ ] CRM (Salesforce, HubSpot, Pipedrive)
- [ ] Email (Google Workspace, Office 365)
- [ ] Support (Zendesk, Intercom, Freshdesk)
- [ ] Payment processor (Stripe, PayPal, Xendit)
- [ ] Cloud storage (S3, Google Cloud Storage)
- [ ] Backups (separate AWS account, Backblaze)

---

## Step 2: PDPA Compliance (Singapore)

**The law**: Personal Data Protection Act (PDPA) 2012, amended 2020

**Who it applies to**: Any organization in Singapore that collects, uses, or discloses personal data (regardless of customer location)

**Key requirements**:
1. **Consent**: Must obtain consent before collecting/using/disclosing personal data
2. **Purpose**: Must tell people why you're collecting data and only use it for that purpose
3. **Accuracy**: Must keep personal data accurate and up-to-date
4. **Protection**: Must protect personal data with reasonable security measures
5. **Retention**: Must not keep personal data longer than necessary
6. **Access**: Individuals can request access to their personal data
7. **Correction**: Individuals can request correction of their personal data
8. **Portability**: Individuals can request data in portable format (added 2020)

**Exemptions**:
- Business contact information (names, job titles, work emails) — exempt from consent requirement
- Personal data collected before 2014 — exempt from some requirements
- Data processed outside Singapore — still covered if organization is in Singapore

### Consent Management

**Types of consent**:
- **Opt-in consent** (recommended): User actively checks box or clicks "I agree"
- **Opt-out consent** (allowed for some cases): Pre-checked box, user can uncheck
- **Deemed consent** (new in 2020): Can assume consent for certain reasonable purposes

**When you need consent**:
- Collecting email for marketing: YES (opt-in)
- Collecting email for account creation: NO (necessary for service)
- Sharing data with third parties: YES (explicit consent)
- Using cookies for analytics: YES (cookie banner)

**Cookie banner example**:
```html
<div class="cookie-banner">
  <p>We use cookies to improve your experience. By using our site, you consent to cookies.</p>
  <button onclick="acceptCookies()">Accept</button>
  <a href="/privacy">Learn more</a>
</div>
```

**Consent tracking**:
- [ ] Store consent timestamp (when user agreed)
- [ ] Store consent version (which privacy policy version they agreed to)
- [ ] Store consent scope (what they agreed to: marketing emails, analytics, etc.)
- [ ] Allow withdrawal of consent (unsubscribe link, account settings)

### Privacy Policy

**Required sections** (SEA template):

1. **What data we collect**:
   - Personal identification (name, email, phone)
   - Account information (username, password)
   - Payment information (credit card, billing address)
   - Usage data (IP address, browser, device, pages visited)

2. **Why we collect it** (purpose):
   - Provide our service (account management, billing)
   - Improve our service (analytics, bug fixes)
   - Communicate with you (support, product updates)
   - Marketing (if you opted in)

3. **How we use it**:
   - Process transactions
   - Send transactional emails (order confirmations, password resets)
   - Personalize experience (recommendations, saved preferences)
   - Analyze usage patterns (improve product)
   - Send marketing emails (if opted in, with unsubscribe)

4. **Who we share it with**:
   - Service providers (Stripe for payments, AWS for hosting)
   - Legal obligations (if required by law or court order)
   - Business transfers (if company is acquired)

5. **How we protect it**:
   - Encryption in transit (TLS 1.2+)
   - Encryption at rest (database encryption)
   - Access controls (least privilege, MFA)
   - Regular security audits

6. **Your rights**:
   - Access your data (request copy)
   - Correct your data (update account)
   - Delete your data (right to be forgotten)
   - Export your data (data portability)
   - Withdraw consent (unsubscribe, close account)

7. **Data retention**:
   - Active accounts: Keep data while account is active
   - Closed accounts: Delete data 90 days after closure (or longer if legally required)
   - Marketing data: Delete after unsubscribe

8. **Contact us**:
   - Email: privacy@yourcompany.com
   - Address: [Singapore office address]
   - Data Protection Officer (if you have one)

**Where to publish**:
- [ ] Website footer (link: "Privacy Policy")
- [ ] Signup flow (checkbox: "I agree to Privacy Policy")
- [ ] App settings (link in "About" or "Legal")

---

## Step 3: PDPA Compliance (Other SEA Countries)

### Malaysia PDPA

**Law**: Personal Data Protection Act 2010

**Similar to Singapore PDPA**, with these differences:
- **Applies to**: Organizations processing personal data in Malaysia (commercial transactions)
- **Registration**: Must register with Personal Data Protection Commissioner if processing sensitive personal data
- **Penalties**: Up to RM 500,000 (~$100K USD) or 3 years imprisonment

**Key difference**: Malaysia PDPA has **7 principles** (vs Singapore's 9 obligations):
1. General principle (comply with law)
2. Notice and choice (inform and get consent)
3. Disclosure (only disclose with consent)
4. Security (protect data)
5. Retention (don't keep longer than necessary)
6. Data integrity (keep accurate)
7. Access (individuals can request access)

**Compliance**: Follow Singapore PDPA guidance above, plus:
- [ ] Register with PDPC Malaysia if processing sensitive data (race, religion, health, political views)
- [ ] Appoint Data Protection Officer if required (large organizations)

---

### Indonesia (PP 71/2019)

**Law**: Government Regulation No. 71 of 2019 on Electronic Systems and Transactions

**Key requirement**: **Personal data must be hosted in Indonesia** (or have local copy if hosted overseas)

**Who it applies to**:
- Public service providers (government, education, healthcare)
- Financial services (fintech, banking)
- Social networks with >1M users in Indonesia

**What counts as personal data**:
- Name, email, phone number
- ID number (KTP)
- Financial information
- Health records
- Location data

**Compliance steps**:
- [ ] Host data in Indonesia (use AWS Jakarta, GCP Jakarta, or local data centers)
- [ ] If hosting overseas: Maintain local copy in Indonesia
- [ ] Register with Ministry of Communication and Informatics (Kominfo) if required
- [ ] Appoint local representative if foreign company

**Cost**: Setting up local hosting adds $500-$2K/month (dedicated server or AWS Jakarta region)

---

### Thailand PDPA

**Law**: Personal Data Protection Act (PDPA) 2019, enforced 2022

**Modeled after GDPR**, with these requirements:
- **Consent**: Must obtain explicit consent (opt-in, not opt-out)
- **Data subject rights**: Access, correction, deletion, portability, objection
- **Data breach notification**: Must notify PDPC Thailand within 72 hours
- **Data Protection Officer**: Required for large-scale data processing

**Penalties**: Up to 5M THB (~$140K USD) or 1% of annual revenue

**Key difference from Singapore**: Thailand PDPA is **stricter** on consent (explicit opt-in required, pre-checked boxes not allowed)

**Compliance**:
- [ ] Implement explicit consent mechanism (user must actively click "I agree")
- [ ] Allow data export (JSON or CSV format)
- [ ] Implement right to be forgotten (delete account + all data)
- [ ] Notify PDPC Thailand within 72 hours if breach affects >1,000 people

---

### Vietnam Cybersecurity Law 2019

**Law**: Law on Cybersecurity (effective 2019)

**Key requirement**: **Critical data must be stored in Vietnam**

**What counts as critical data**:
- Personal information related to national security
- Data on Vietnamese citizens that affects national security
- Data of companies with >1M users in Vietnam

**Who it applies to**:
- Domestic and foreign companies with users in Vietnam
- Social networks, content platforms, e-commerce
- Financial services

**Compliance**:
- [ ] Store critical data in Vietnam (use local data centers or cloud regions when available)
- [ ] Maintain local server if >1M users in Vietnam
- [ ] Appoint local representative (if foreign company)

**Cost**: Vietnam local hosting is more expensive than regional hosting ($1K-$3K/month for dedicated servers)

---

### Philippines Data Privacy Act 2012

**Law**: Data Privacy Act of 2012 (RA 10173)

**Similar to Singapore PDPA**, with these differences:
- **Applies to**: Organizations processing personal data in Philippines (or Filipino citizens' data)
- **Registration**: Must register with National Privacy Commission (NPC)
- **Data Protection Officer**: Required for organizations processing sensitive personal data
- **Penalties**: Up to PHP 5M (~$90K USD) or 6 years imprisonment

**Key difference**: Philippines DPA is **more strict** on sensitive personal data (race, religion, health, government IDs)

**Compliance**:
- [ ] Register with National Privacy Commission (NPC)
- [ ] Appoint Data Protection Officer (required for most organizations)
- [ ] Implement stricter consent for sensitive data (health records, government IDs)
- [ ] Notify NPC within 72 hours of breach

---

## Step 4: GDPR Compliance (EU Customers)

**The law**: General Data Protection Regulation (GDPR) 2018

**Who it applies to**: Any organization that processes personal data of EU residents (regardless of where your company is located)

**Key requirements** (stricter than PDPA):
1. **Lawful basis**: Must have legal basis for processing (consent, contract, legitimate interest, legal obligation, vital interest, public task)
2. **Consent**: Explicit, informed, freely given, specific (can't bundle consent with terms of service)
3. **Data subject rights**: Access, rectification, erasure, portability, restriction, objection, automated decision-making
4. **Data breach notification**: Must notify supervisory authority within 72 hours
5. **Data Protection Officer**: Required for large-scale processing or sensitive data
6. **Privacy by design**: Build privacy into products from the start
7. **Data transfer**: Restricted transfers outside EU (need adequacy decision or safeguards)

**Penalties**: Up to €20M or 4% of global annual revenue (whichever is higher)

### GDPR vs PDPA: Key Differences

| Requirement | GDPR | Singapore PDPA |
|-------------|------|----------------|
| **Consent** | Explicit opt-in, cannot be bundled | Opt-in or opt-out allowed |
| **Age of consent** | 16 years (or 13-15 with parental consent) | No minimum age specified |
| **Data breach notification** | 72 hours to supervisory authority | No mandatory notification timeline |
| **Data Protection Officer** | Required for large-scale processing | Not required |
| **Right to be forgotten** | Yes, unconditional | No, only if no legal/business reason to keep |
| **Data portability** | Yes, in machine-readable format | Yes, added in 2020 amendment |
| **Penalties** | €20M or 4% global revenue | $1M or 10% annual turnover (SG only) |

**If you have EU customers**, you need to comply with **both GDPR and local PDPA**.

### GDPR Compliance Checklist

- [ ] **Lawful basis**: Document why you're processing personal data (usually "contract" for service, "consent" for marketing)
- [ ] **Privacy policy**: Update to include GDPR rights (right to erasure, portability, restriction, objection)
- [ ] **Consent mechanism**: Implement explicit opt-in (no pre-checked boxes, clear language)
- [ ] **Cookie consent**: Implement cookie banner with granular controls (analytics, marketing, necessary)
- [ ] **Data subject requests**: Build workflow to handle access, deletion, portability requests (respond within 30 days)
- [ ] **Data breach plan**: Document how you'll detect, respond, and notify within 72 hours
- [ ] **Vendor agreements**: Ensure SaaS vendors (Stripe, AWS, Google) have GDPR-compliant Data Processing Agreements (DPAs)
- [ ] **Data transfers**: If storing data outside EU, ensure adequacy decision (UK, Switzerland, Japan, Canada) or Standard Contractual Clauses (SCCs)
- [ ] **Data Protection Officer**: Appoint DPO if large-scale processing (optional for small companies)

**Cost**: GDPR compliance audit and implementation: $10K-$30K (one-time), ongoing monitoring: $5K-$10K/year

---

## Step 5: Data Classification Framework

**Goal**: Label data by sensitivity level to determine how to protect it

### 4-Level Classification

**Level 1: Public**
- **Definition**: Information intended for public consumption
- **Examples**: Marketing materials, blog posts, public documentation, press releases
- **Storage**: Can be stored anywhere (S3 public buckets, CDN)
- **Access**: No restrictions
- **Encryption**: Not required (but recommended)

**Level 2: Internal**
- **Definition**: Information for internal use only (not customer data)
- **Examples**: Internal wikis, Slack conversations, project plans, non-sensitive code
- **Storage**: Internal systems (Google Workspace, Notion, GitHub private repos)
- **Access**: All employees
- **Encryption**: Encryption in transit required (TLS 1.2+)

**Level 3: Confidential**
- **Definition**: Sensitive information that could cause harm if disclosed
- **Examples**: Customer PII (names, emails, phone numbers), financial data (revenue, costs), source code, contracts, employee HR data
- **Storage**: Production databases, secure cloud storage (encrypted S3)
- **Access**: Need-to-know basis (RBAC)
- **Encryption**: Encryption at rest + in transit required

**Level 4: Restricted**
- **Definition**: Highly sensitive information that would cause severe harm if disclosed
- **Examples**: Credit card numbers (full PAN), government IDs (NRIC, passport), health records, authentication credentials (passwords, API keys), encryption keys
- **Storage**: Restricted databases or secrets managers (AWS Secrets Manager, HashiCorp Vault)
- **Access**: Minimal access (only admins/on-call engineers with MFA)
- **Encryption**: Encryption at rest + in transit + field-level encryption (tokenization for credit cards)
- **Audit**: Log all access to Restricted data

### How to Apply Classification

**Step 1**: Tag all databases and storage systems with classification level

**Example** (AWS S3 buckets):
- `s3://yourcompany-public-assets` → Public
- `s3://yourcompany-internal-docs` → Internal
- `s3://yourcompany-customer-data` → Confidential
- `s3://yourcompany-sensitive-data` → Restricted

**Step 2**: Implement access controls based on classification

**Example** (PostgreSQL database):
- `users` table (name, email) → Confidential → Engineers + Support + Sales
- `payments` table (credit card tokens) → Restricted → Admins only + MFA required

**Step 3**: Document data flows

**Example**:
```
Customer enters credit card → Stripe (tokenized) → Your database (token only, not full PAN) → Restricted
Customer enters email → Your database (plaintext) → Confidential → Marketing tool (Mailchimp) → Internal
```

---

## Step 6: Privacy by Design

**The concept**: Build privacy into products from the start, not as an afterthought

### 7 Principles of Privacy by Design

**1. Proactive not Reactive**
- Anticipate privacy risks before building features
- Example: Before adding "Share profile with friends" feature, ask: What data is shared? Can users control it? Can they revoke access?

**2. Privacy as Default**
- Default settings should be most privacy-protective
- Example: Account visibility defaults to "Private", not "Public"

**3. Privacy Embedded in Design**
- Privacy is part of the product, not a separate feature
- Example: End-to-end encryption in messaging app (not an opt-in setting)

**4. Full Functionality (Positive-Sum)**
- Don't make users choose between privacy and functionality
- Example: Delete account should delete all data (not "deactivate" while keeping data)

**5. End-to-End Security**
- Protect data throughout entire lifecycle (collection → storage → deletion)
- Example: Encrypt data in transit (TLS), at rest (database encryption), and in backups

**6. Visibility and Transparency**
- Users should know what data you collect and how you use it
- Example: Privacy dashboard showing all data collected + ability to export/delete

**7. Respect for User Privacy**
- User-centric, keep promises, treat data as belonging to users
- Example: If privacy policy says "we don't sell your data", actually don't sell it (even anonymized)

### Privacy by Design Checklist (for New Features)

When building a new feature, ask:
- [ ] **Data minimization**: Do we really need this data? Can we use less data?
- [ ] **Purpose limitation**: Will we only use this data for the stated purpose?
- [ ] **Consent**: Do we need explicit consent? Is it easy to withdraw consent?
- [ ] **Access control**: Who needs access to this data? (Least privilege)
- [ ] **Encryption**: Should this data be encrypted? (At rest? In transit?)
- [ ] **Retention**: How long should we keep this data? (Auto-delete after X days?)
- [ ] **User control**: Can users see, export, or delete this data?
- [ ] **Third parties**: Will we share this data with vendors? Do they have DPAs?
- [ ] **Breach impact**: If this data leaks, what's the harm? (Likelihood × impact)

**Example**: Adding "Login with Google" OAuth

- ✅ Data minimization: Only request email and name (not full profile or contacts)
- ✅ Purpose limitation: Use email for login only (not for marketing without consent)
- ✅ Consent: User explicitly clicks "Login with Google" (implied consent)
- ✅ Access control: Store OAuth tokens securely (encrypted, restricted access)
- ✅ Retention: Delete OAuth tokens when user deletes account
- ✅ User control: Allow disconnect Google account from settings
- ✅ Third parties: Google has DPA (already GDPR compliant)
- ✅ Breach impact: Low (email/name are public, no sensitive data)

---

## Step 7: Data Retention & Deletion

**The rule**: Don't keep personal data longer than necessary

### Retention Periods by Data Type

**Customer account data**:
- Active accounts: Keep while account is active
- Closed accounts: Delete 90 days after closure (grace period for reactivation)
- Exceptions: Keep transaction history for 7 years (tax/accounting requirements)

**Marketing data**:
- Email subscribers: Keep while subscribed
- Unsubscribed: Delete immediately (or after 30 days for re-subscription detection)
- Analytics data: Aggregate and anonymize after 2 years (delete raw data)

**Support tickets**:
- Active tickets: Keep while ticket is open
- Closed tickets: Keep 2 years (for historical reference)
- Delete PII after 2 years (keep ticket content without names/emails)

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
- Former employees: Keep 7 years (tax/legal requirement)
- Delete after 7 years (or longer if required by local law)

### Automated Deletion Scripts

**Example** (PostgreSQL):
```sql
-- Delete accounts closed >90 days ago
DELETE FROM users
WHERE status = 'closed'
AND closed_at < NOW() - INTERVAL '90 days';

-- Delete unsubscribed marketing contacts
DELETE FROM email_subscribers
WHERE unsubscribed_at < NOW() - INTERVAL '30 days';

-- Anonymize old support tickets (keep content, remove PII)
UPDATE support_tickets
SET customer_name = 'Deleted User',
    customer_email = 'deleted@example.com'
WHERE closed_at < NOW() - INTERVAL '2 years';
```

**Schedule**: Run deletion scripts weekly (cron job or scheduled Lambda)

---

## Step 8: Data Subject Rights (Access, Deletion, Portability)

**What users can request**:
1. **Access**: "What data do you have about me?"
2. **Correction**: "My email is wrong, update it"
3. **Deletion**: "Delete all my data" (right to be forgotten)
4. **Portability**: "Give me my data in a portable format" (JSON, CSV)
5. **Object**: "Stop using my data for marketing"

### Handling Data Subject Requests

**Step 1: Verify identity**
- Ask for account email or ID number
- Send verification code to registered email
- For sensitive requests (deletion), require additional verification (security questions, government ID)

**Step 2: Respond within timeline**
- GDPR: 30 days
- Singapore PDPA: 30 days (reasonable time)
- Thailand PDPA: 30 days

**Step 3: Fulfill request**

**Access request**:
- Export all user data from databases (users table, transactions, support tickets, etc.)
- Format as JSON or CSV
- Send via secure download link (expires in 7 days)

**Example** (Node.js):
```javascript
async function exportUserData(userId) {
  const user = await db.users.findById(userId);
  const transactions = await db.transactions.find({ userId });
  const tickets = await db.supportTickets.find({ userId });

  const data = {
    user,
    transactions,
    tickets,
    exportedAt: new Date().toISOString()
  };

  const json = JSON.stringify(data, null, 2);
  const downloadLink = await uploadToS3(json, `user-data-${userId}.json`);

  return downloadLink; // Send to user via email
}
```

**Deletion request**:
- Delete user account + all related data (transactions, tickets, logs)
- Exception: Keep transaction history for 7 years (legal requirement) — anonymize instead
- Send confirmation email

**Example** (PostgreSQL):
```sql
-- Delete user and cascade to related tables
BEGIN;

-- Anonymize transactions (keep for accounting)
UPDATE transactions
SET user_email = 'deleted@example.com',
    user_name = 'Deleted User'
WHERE user_id = 12345;

-- Delete user account
DELETE FROM users WHERE id = 12345;

-- Delete logs
DELETE FROM activity_logs WHERE user_id = 12345;

-- Delete support tickets
DELETE FROM support_tickets WHERE user_id = 12345;

COMMIT;
```

**Portability request**:
- Export data in machine-readable format (JSON preferred, CSV acceptable)
- Include all personal data (not just account data)

---

## Step 9: Cross-Border Data Transfers

**The challenge**: Transferring data from one country to another (e.g., Singapore → US)

### GDPR Data Transfers (EU → Outside EU)

**GDPR restricts** transferring personal data outside EU unless:

**Option 1: Adequacy decision**
- EU has determined the destination country has adequate data protection laws
- **Adequate countries** (as of 2026): UK, Switzerland, Canada, Japan, Argentina, Israel, New Zealand, South Korea, Uruguay
- **NOT adequate**: US (general), Singapore, Malaysia, Indonesia, Thailand, Vietnam, Philippines, China, India

**Option 2: Standard Contractual Clauses (SCCs)**
- Sign EU-approved contract with data recipient (vendor, partner)
- SCCs are legal contracts that ensure GDPR-level protection
- Most SaaS vendors (AWS, Google Cloud, Stripe) have SCCs

**Option 3: Binding Corporate Rules (BCRs)**
- For large multinationals with entities in multiple countries
- Not practical for startups/SMEs

**How to comply if you have EU customers**:
- [ ] If hosting in EU: No problem (data stays in EU)
- [ ] If hosting outside EU (e.g., AWS Singapore): Sign SCCs with AWS
- [ ] If using SaaS vendors: Verify vendors have SCCs (Stripe, Mailchimp, etc.)
- [ ] Document data transfer mechanisms in privacy policy

### PDPA Data Transfers (SEA → Outside SEA)

**Singapore PDPA** allows transferring data outside Singapore if:
- Organization ensures receiving country has comparable data protection standard (via contract, certification, or other means)

**Practical approach**:
- [ ] Sign Data Processing Agreement (DPA) with vendors
- [ ] Ensure vendors are ISO 27001 or SOC 2 certified
- [ ] Document in privacy policy: "We transfer data to [Country] for [Purpose], with contractual protections"

**Malaysia, Thailand, Philippines**: Similar to Singapore (allowed with safeguards)

**Indonesia, Vietnam**: Prefer local storage (but allowed if safeguards in place)

---

## Step 10: Vendor Data Processing Agreements (DPAs)

**What is a DPA**: Legal contract between you (data controller) and vendor (data processor) that specifies how vendor handles your customer data

**Who needs DPAs**:
- SaaS vendors that process customer data on your behalf (Stripe, Mailchimp, AWS, Google Cloud, Zendesk, Intercom, etc.)

**What DPAs must include**:
- [ ] Purpose of processing (e.g., "payment processing", "email delivery")
- [ ] Type of data processed (e.g., "names, emails, payment info")
- [ ] Duration (e.g., "while contract is active + 90 days after termination")
- [ ] Security measures vendor will implement (encryption, access controls)
- [ ] Sub-processors (other vendors vendor uses)
- [ ] Data breach notification (vendor must notify you within 24-72 hours)
- [ ] Data deletion after contract ends
- [ ] Audit rights (you can audit vendor's security practices)
- [ ] Liability (who pays if breach occurs)

**How to get DPAs**:
- Most SaaS vendors have standard DPAs you can sign online (Stripe, AWS, Google)
- Some require contacting sales (enterprise plans)
- If vendor doesn't have DPA, request one (use template)

**DPA Checklist for Key Vendors**:
- [ ] Stripe (payment processing) — DPA available
- [ ] AWS (hosting) — AWS Customer Agreement includes DPA terms
- [ ] Google Workspace (email) — DPA available in admin console
- [ ] Mailchimp (email marketing) — DPA available
- [ ] Zendesk (support) — DPA available
- [ ] Intercom (chat) — DPA available
- [ ] HubSpot (CRM) — DPA available

---

## Summary

**Key takeaways**:
1. **Know your data**: Map what data you collect, where it's stored, and why
2. **PDPA compliance**: Obtain consent, provide privacy policy, honor data subject rights (access, correction, deletion)
3. **GDPR compliance** (if EU customers): Stricter consent, 72-hour breach notification, explicit rights to erasure and portability
4. **Data residency**: Indonesia and Vietnam require local storage for certain data
5. **Data classification**: Label data by sensitivity (Public, Internal, Confidential, Restricted)
6. **Privacy by design**: Build privacy into products from the start
7. **Data retention**: Don't keep data longer than necessary (auto-delete after X days/years)
8. **Data subject rights**: Build workflow to handle access, deletion, and portability requests (respond within 30 days)
9. **Cross-border transfers**: Use SCCs for EU customers, DPAs for all vendors
10. **Vendor DPAs**: Ensure all SaaS vendors have Data Processing Agreements

**Next steps**:
- Complete data mapping (use template in this guide)
- Publish privacy policy (use template in Part 5: Templates)
- Implement consent mechanism (cookie banner, signup checkbox)
- Set up data retention policies (auto-delete scripts)
- Sign DPAs with key vendors (Stripe, AWS, Google)
- Read Part 3: Vendor Security Management
