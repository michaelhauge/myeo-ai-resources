# Compliance Basics for SMBs

**Understanding cybersecurity compliance requirements without a legal team**

This guide explains common compliance frameworks in plain English, focusing on what small and medium businesses need to know.

---

## When Do You Need Compliance?

Most SMBs don't need full compliance certifications, but you may need to understand these regulations if:

| Regulation | When It Applies | Who Needs It |
|------------|-----------------|--------------|
| **PDPA (Singapore/Malaysia)** | You collect personal data from Singapore/Malaysia residents | **All SEA businesses** |
| **GDPR** | You process data of EU residents | Businesses serving European customers |
| **PCI-DSS** | You store/process credit card data | E-commerce, retail (but use Stripe/Square to avoid) |
| **HIPAA** | You handle healthcare data (PHI) | Healthcare providers, health tech |
| **SOC 2** | Customers require it for vendor security | B2B SaaS companies |

**Most SMBs need**: PDPA basics + good security hygiene
**Some SMBs need**: GDPR (if EU customers) + PCI-DSS (if taking cards)
**Few SMBs need**: HIPAA, SOC 2 (specialized industries)

---

## PDPA (Personal Data Protection Act)

**Applies to**: Singapore, Malaysia
**Who needs it**: Any business collecting personal data from Singapore/Malaysia residents

### What Is Personal Data?

Personal data is any information that can identify a person:

✅ **Definitely personal data**:
- Name, email, phone number
- IC/Passport number
- Address, date of birth
- Photos, videos with faces
- Employee records, resumes

⚠️ **Sometimes personal data** (depends on context):
- IP addresses (if linked to a person)
- Device IDs, cookies
- Transaction history (if identifiable)

❌ **Not personal data**:
- Aggregated/anonymous statistics
- Business contact information (company emails)
- Public information already published

### PDPA Key Requirements

**1. Consent**
- Get explicit consent before collecting personal data
- Explain what data you're collecting and why
- Allow people to withdraw consent

**2. Purpose Limitation**
- Only collect data you actually need
- Use data only for the stated purpose
- Don't keep data longer than necessary

**3. Notification**
- Have a Privacy Policy on your website
- Explain how you use, store, and protect data
- Provide contact information for data inquiries

**4. Access & Correction**
- People can request their data
- People can request corrections
- Respond within 30 days

**5. Protection**
- Implement reasonable security measures
- Prevent unauthorized access, use, or disclosure
- Report breaches to affected individuals and authorities

**6. Transfer Limitation (Singapore)**
- Be careful sending data outside Singapore
- Ensure receiving country has adequate protection
- Get consent if needed

**7. Accountability**
- Appoint a Data Protection Officer (DPO) if large-scale
- Document your data protection practices
- Train employees on PDPA

### PDPA Fines

**Singapore**:
- Up to S$1 million per violation
- Criminal penalties for intentional breaches

**Malaysia**:
- Up to RM 500,000 per violation
- Up to 3 years imprisonment

### PDPA Quick Compliance Checklist

- [ ] Create a Privacy Policy (post on website)
- [ ] Add consent checkboxes to forms
- [ ] Document what data you collect and why
- [ ] Implement security measures (this guide!)
- [ ] Train employees on handling personal data
- [ ] Create process for access/correction requests
- [ ] Have breach notification procedure
- [ ] Review vendor contracts (data processors)

**Template**: [Privacy Policy Generator](https://www.pdpc.gov.sg/help-and-resources/privacy-policy-generator) (Singapore PDPC)

---

## GDPR (General Data Protection Regulation)

**Applies to**: European Union
**Who needs it**: Any business processing data of EU residents (even if company is outside EU)

### When GDPR Applies to You

You need GDPR compliance if:
- You have EU customers or users
- You sell to EU residents (even if no EU office)
- You track/monitor EU residents online
- You process >250 employees' data

**Good news**: PDPA and GDPR are similar. If you're PDPA compliant, you're 80% of the way to GDPR.

### GDPR vs PDPA Differences

| Requirement | PDPA | GDPR |
|-------------|------|------|
| **Consent** | Implicit okay | Must be explicit "opt-in" |
| **Data breach notification** | As soon as practicable | Within 72 hours to authority |
| **Right to deletion** | Not required | "Right to be forgotten" required |
| **Data Protection Officer** | Recommended | Required (if large-scale) |
| **Fines** | Up to S$1M | Up to €20M or 4% revenue |

### GDPR Additional Requirements

**1. Lawful Basis for Processing**
Must have ONE of these reasons to process personal data:
- **Consent**: Person explicitly agreed
- **Contract**: Necessary to fulfill a contract
- **Legal obligation**: Required by law
- **Vital interests**: Protect someone's life
- **Public task**: Government function
- **Legitimate interest**: Your business need (but must balance with person's rights)

**2. Data Processing Agreement (DPA)**
If you use third-party tools (Google, Slack, etc.), you need a DPA stating:
- They will only process data per your instructions
- They will keep data secure
- They will help you comply with GDPR

**Good news**: Most major SaaS providers offer standard DPAs

**3. Privacy by Design**
- Consider privacy from the start of new projects
- Minimize data collection
- Anonymize when possible

**4. Right to Data Portability**
- Users can request their data in machine-readable format
- Users can transfer data to another service

### GDPR Quick Compliance Checklist

- [ ] Update Privacy Policy (GDPR-specific language)
- [ ] Implement explicit consent (no pre-checked boxes)
- [ ] Create data deletion procedure
- [ ] Sign DPAs with all vendors
- [ ] 72-hour breach notification procedure
- [ ] Appoint EU representative (if >$25M revenue)
- [ ] Document lawful basis for processing

**Template**: [GDPR Privacy Policy Template](https://gdpr.eu/privacy-notice/)

---

## PCI-DSS (Payment Card Industry Data Security Standard)

**Applies to**: Any business that stores, processes, or transmits credit card data
**Who needs it**: E-commerce, retail, any business taking card payments

### The Simple Answer: Don't Store Card Data

**Best practice for SMBs**: Use a payment processor (Stripe, Square, PayPal) and **never handle card data yourself**.

When you use Stripe/Square:
- ✅ They handle PCI compliance
- ✅ You never see full card numbers
- ✅ You only store tokens (safe)
- ✅ Cheaper than PCI certification

### PCI-DSS Levels

| Level | Annual Transactions | Requirements |
|-------|-------------------|--------------|
| **Level 1** | >6 million | Annual on-site audit ($50K-$200K) |
| **Level 2** | 1-6 million | Annual self-assessment + quarterly scan |
| **Level 3** | 20K-1 million | Annual self-assessment + quarterly scan |
| **Level 4** | <20,000 | Annual self-assessment |

**Most SMBs**: Level 3 or 4

### PCI-DSS 12 Requirements (Simplified)

If you must handle card data directly:

1. **Firewall**: Protect cardholder data with firewall
2. **No Default Passwords**: Change all default passwords
3. **Encrypt Stored Data**: Encrypt card data at rest
4. **Encrypt Transmitted Data**: Use TLS/SSL for transmission
5. **Antivirus**: Use and update antivirus software
6. **Secure Systems**: Keep systems patched and secure
7. **Restrict Access**: Only give access to those who need it
8. **Unique IDs**: Each person has unique login ID
9. **Physical Security**: Restrict physical access to card data
10. **Monitor Access**: Log and monitor all access to card data
11. **Test Security**: Regularly test security systems
12. **Security Policy**: Have and maintain a security policy

### How to Avoid PCI-DSS Compliance

**Option 1: Use Stripe/Square** (Recommended)
- They handle all PCI requirements
- You just embed their payment form
- Cost: 2.9% + $0.30 per transaction
- **You don't need PCI certification**

**Option 2: Use PayPal**
- Similar to Stripe, they handle PCI
- Customer redirected to PayPal
- Cost: 2.9% + $0.30 per transaction

**Option 3: Card-Not-Present (phone orders)**
- Still need PCI compliance
- But simpler than card-present (retail)

### PCI-DSS Quick Compliance Checklist

If you must be PCI compliant:

- [ ] Complete SAQ (Self-Assessment Questionnaire)
- [ ] Run quarterly vulnerability scans (use Approved Scanning Vendor)
- [ ] Implement 12 PCI requirements above
- [ ] Document everything
- [ ] Train employees on handling card data
- [ ] Create incident response plan
- [ ] Submit annual compliance report to acquirer

**Recommendation**: Use Stripe/Square and avoid this entirely.

---

## HIPAA (Health Insurance Portability and Accountability Act)

**Applies to**: United States healthcare data
**Who needs it**: Healthcare providers, health insurance, health tech handling PHI

### What Is PHI (Protected Health Information)?

PHI is health information that can identify a person:

✅ **PHI includes**:
- Patient name + any health info
- Medical records, diagnoses, treatments
- Lab results, prescriptions
- Insurance information
- Medical device data (if identifiable)

❌ **Not PHI**:
- De-identified health data (anonymized)
- Education records (FERPA covers this)
- Employment records

### When HIPAA Applies to Your Business

**Covered Entities** (MUST comply):
- Doctors, clinics, hospitals
- Health insurance companies
- Healthcare clearinghouses

**Business Associates** (MUST comply if working with covered entity):
- Medical billing companies
- Cloud storage for patient data
- Telemedicine platforms
- Any vendor handling PHI

**Not Covered** (Don't need HIPAA):
- Fitness apps (unless integrated with medical records)
- Wellness programs (unless run by health insurer)
- General health information websites

### HIPAA Requirements

**1. Privacy Rule**
- Patient consent for data use
- Minimum necessary disclosure
- Patient rights (access, amendment, accounting)

**2. Security Rule**
- Administrative safeguards (policies, training)
- Physical safeguards (locked servers, access control)
- Technical safeguards (encryption, access logs, audit)

**3. Breach Notification Rule**
- Report breaches >500 people to HHS within 60 days
- Notify affected individuals within 60 days
- Notify media if >500 people in a state

**4. Business Associate Agreement (BAA)**
If you're a vendor to a healthcare provider, you need a BAA:
- Specifies how you'll protect PHI
- Limits what you can do with PHI
- Requires security measures
- Breach notification requirements

### HIPAA Fines

- **Tier 1** (unaware): $100-$50,000 per violation
- **Tier 2** (reasonable cause): $1,000-$50,000 per violation
- **Tier 3** (willful neglect, corrected): $10,000-$50,000 per violation
- **Tier 4** (willful neglect, not corrected): $50,000 per violation
- **Max annual penalty**: $1.5 million per violation type

### HIPAA Quick Compliance Checklist

- [ ] Conduct risk assessment
- [ ] Create HIPAA Security Policy
- [ ] Train all employees on HIPAA (annual)
- [ ] Sign BAAs with all vendors handling PHI
- [ ] Implement encryption (data at rest and in transit)
- [ ] Access controls (unique IDs, MFA)
- [ ] Audit logs for all PHI access
- [ ] Breach notification procedure
- [ ] Backup and disaster recovery plan
- [ ] Appoint HIPAA Privacy and Security Officers

**Do NOT handle PHI unless you**:
1. Have a BAA requirement from a healthcare customer
2. Have budget for HIPAA compliance ($20K-$50K+ annually)
3. Are willing to undergo regular audits

---

## SOC 2 (Service Organization Control 2)

**Applies to**: Service providers (especially SaaS)
**Who needs it**: B2B companies whose customers require proof of security practices

### What Is SOC 2?

SOC 2 is a security audit that verifies your company follows best practices for:
- **Security**: Protection against unauthorized access
- **Availability**: System uptime and reliability
- **Processing Integrity**: Complete, accurate processing
- **Confidentiality**: Protection of confidential information
- **Privacy**: Protection of personal information

**There are two types**:
- **SOC 2 Type I**: Audit of controls at a point in time (cheaper, faster)
- **SOC 2 Type II**: Audit of controls over 6-12 months (**this is what customers want**)

### When You Need SOC 2

**You probably need it if**:
- B2B SaaS selling to enterprises
- Customers are asking for it in RFPs
- Handling sensitive customer data at scale
- Raising Series A+ funding (investors often require)

**You probably don't need it if**:
- B2C consumer product
- Selling to small businesses
- Early-stage startup (pre-revenue)
- Not handling sensitive data

### SOC 2 Trust Service Criteria

| Criteria | What It Covers | Common Controls |
|----------|----------------|-----------------|
| **Security** (required) | Unauthorized access, theft, damage | Firewalls, MFA, encryption, access control |
| **Availability** (optional) | System uptime, disaster recovery | Monitoring, redundancy, backups |
| **Processing Integrity** (optional) | Complete, accurate, timely processing | Validation, error handling, monitoring |
| **Confidentiality** (optional) | Protection of confidential info | NDAs, access control, encryption |
| **Privacy** (optional) | Personal information protection | Privacy policy, consent, data retention |

**Most companies**: Security (required) + Availability (common)

### SOC 2 Compliance Process

**Timeline**: 6-18 months
**Cost**: $20K-$100K+ (depends on company size and complexity)

**Steps**:
1. **Readiness Assessment** (1-3 months)
   - Gap analysis vs SOC 2 requirements
   - Identify controls to implement
   - Cost: $5K-$15K

2. **Remediation** (3-6 months)
   - Implement missing controls
   - Document policies and procedures
   - Train employees
   - Cost: Internal time + tools

3. **Audit** (2-4 months)
   - Hire auditor (Big 4 or specialized firm)
   - Evidence collection
   - Testing controls
   - Cost: $15K-$75K

4. **Report** (1 month)
   - Auditor issues SOC 2 report
   - Share with customers
   - Valid for 12 months

**After Year 1**: Annual audits ($20K-$50K)

### SOC 2 Quick Readiness Checklist

Before pursuing SOC 2, ensure you have:

- [ ] Documented security policies
- [ ] Access control (SSO, MFA, role-based access)
- [ ] Encryption (data at rest and in transit)
- [ ] Logging and monitoring
- [ ] Vulnerability management (patching, scanning)
- [ ] Incident response plan
- [ ] Vendor management (vendor security reviews)
- [ ] Employee background checks
- [ ] Security awareness training
- [ ] Backup and disaster recovery
- [ ] Change management process

**If you're missing >5 items**: You're not ready. Implement basics first (this guide!), then pursue SOC 2 in 6-12 months.

### Alternatives to SOC 2

If customers are asking for security proof but you're not ready for SOC 2:

**Option 1: Security Questionnaire**
- Fill out customer security questionnaires
- Provide documentation of your practices
- Cost: Free (just time)

**Option 2: ISO 27001**
- International security standard
- Similar to SOC 2 but broader
- Cost: $15K-$50K

**Option 3: AICPA Pre-Assessment**
- Self-assessment against SOC 2 criteria
- Not a real audit, but shows you're serious
- Cost: $5K-$10K

---

## Compliance Decision Tree

**Use this to decide what compliance you need**:

```
START: What type of business are you?

├─ Healthcare (doctors, health insurance, health tech)
│  └─ Do you handle patient health information (PHI)?
│     ├─ YES → HIPAA required (get help from compliance consultant)
│     └─ NO → General security (this guide) + maybe PDPA/GDPR

├─ E-commerce / Retail
│  └─ Do you store credit card numbers?
│     ├─ YES → PCI-DSS required (consider switching to Stripe/Square)
│     └─ NO (using Stripe/Square) → PDPA/GDPR only

├─ B2B SaaS
│  └─ Are enterprise customers asking for SOC 2?
│     ├─ YES → Start SOC 2 preparation (6-12 months)
│     └─ NO → Good security (this guide) + PDPA/GDPR

└─ General Business (services, products, other)
   └─ Where are your customers?
      ├─ Singapore/Malaysia → PDPA required
      ├─ Europe → GDPR required
      └─ Other → General security (this guide)
```

---

## Compliance Costs (Budget Planning)

| Compliance | Year 1 Cost | Ongoing Annual | Time Investment |
|------------|-------------|----------------|-----------------|
| **PDPA (Singapore)** | $2K-$5K | $1K-$2K | 40-80 hours |
| **GDPR** | $5K-$15K | $2K-$5K | 60-120 hours |
| **PCI-DSS** (if not using Stripe) | $10K-$30K | $5K-$15K | 120-200 hours |
| **HIPAA** | $20K-$50K | $10K-$25K | 200-400 hours |
| **SOC 2 Type II** | $40K-$100K | $20K-$50K | 400-800 hours |

**Most SMBs**: PDPA/GDPR ($5K-$10K total Year 1)

**Costs include**:
- Legal review (policies, contracts)
- Consulting (gap assessment, remediation)
- Tools (security, monitoring, audit logging)
- Training (employees)
- Audit (if required)

---

## Compliance Resources

### PDPA Resources
- **Singapore PDPC**: https://www.pdpc.gov.sg/
- **Malaysia PDPA**: https://www.kkmm.gov.my/en/resources/acts
- **Privacy Policy Generator**: https://www.pdpc.gov.sg/help-and-resources/privacy-policy-generator

### GDPR Resources
- **GDPR.eu**: https://gdpr.eu/
- **EU GDPR Portal**: https://gdpr-info.eu/
- **DPA Template**: https://gdpr.eu/data-processing-agreement/

### PCI-DSS Resources
- **PCI Security Standards**: https://www.pcisecuritystandards.org/
- **Self-Assessment Questionnaires**: https://www.pcisecuritystandards.org/document_library/

### HIPAA Resources
- **HHS HIPAA**: https://www.hhs.gov/hipaa/
- **HIPAA Security Rule**: https://www.hhs.gov/hipaa/for-professionals/security/

### SOC 2 Resources
- **AICPA SOC**: https://www.aicpa.org/soc
- **SOC 2 Academy**: https://www.vendr.com/blog/soc-2-compliance

---

## When to Hire a Compliance Consultant

**DIY is okay for**:
- PDPA (Singapore/Malaysia) - basic compliance
- GDPR - if similar to PDPA, small scale
- General security practices

**Hire a consultant for**:
- HIPAA (complex, high penalties)
- PCI-DSS Level 1 or 2 (if you must be compliant)
- SOC 2 (requires audit anyway)
- Multi-jurisdiction compliance (operating in 3+ countries)

**Cost**: $150-$300/hour or $10K-$50K fixed fee

---

## Related Resources

- [Security Tools](TOOLS.md) - Tools that help with compliance (encryption, logging, MFA)
- [Security Policy Template](templates/security-policy.md) - Required for most compliance frameworks
- [Vendor Questionnaire](templates/vendor-questionnaire.md) - Assess third-party vendors (required for SOC 2, HIPAA)
- [Incident Response Plan](templates/incident-response.md) - Required for breach notification (PDPA, GDPR, HIPAA)

---

**Last Updated**: February 2026
**Disclaimer**: This guide provides general information only and is not legal advice. Consult with a qualified attorney or compliance professional for specific guidance on your business.
