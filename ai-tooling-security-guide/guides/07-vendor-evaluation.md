# AI Vendor Evaluation Guide
**Evaluating AI SaaS Providers for Enterprise Use (1-Hour Due Diligence)**

Before signing an AI vendor contract, verify they meet security and compliance standards.

---

## Overview

**Time Required**: 1 hour per vendor (initial evaluation)
**Difficulty**: Medium (some compliance knowledge helpful)
**Output**: APPROVE / REJECT / NEGOTIATE decision
**Use When**: Evaluating AI SaaS providers (Claude for Work, ChatGPT Team, AI writing tools, etc.)

---

## Why This Matters

**Free/personal AI tools** (ChatGPT Plus, Claude) vs. **Enterprise AI tools** (ChatGPT Team, Claude for Work):

| Aspect | Personal Tools | Enterprise Tools |
|--------|---------------|------------------|
| **Your data** | May be used for training | Not used for training (contractual) |
| **Data retention** | Indefinite | Configurable (often 30 days) |
| **Admin controls** | None | User management, audit logs |
| **Compliance** | No guarantees | SOC 2, ISO 27001, GDPR, etc. |
| **Data residency** | No choice | Can specify region (EU, US, etc.) |
| **SLA** | Best effort | 99.9%+ uptime guarantee |
| **Support** | Community only | Dedicated support team |
| **Liability** | You accept all risk | Vendor shares liability (limited) |

**Bottom line**: For business use with customer data or sensitive information, enterprise AI tools are mandatory.

---

## The 10-Step Vendor Evaluation Process

---

### Step 1: Security Certifications (15 minutes)

**Question**: Does the vendor have third-party security certifications?

#### Must-Have Certifications

✅ **SOC 2 Type II**
- What it is: Third-party audit of security controls
- Look for: "SOC 2 Type II" (NOT just "SOC 2 Type I")
- Type I = Point-in-time audit
- Type II = Continuous audit over 6-12 months (much stronger)
- How to verify: Ask for SOC 2 report (they may require NDA)

✅ **ISO 27001**
- What it is: International standard for information security
- Look for: Certificate from accredited certifying body
- How to verify: Certificate number should be verifiable online

#### Nice-to-Have Certifications

⚠️ **ISO 27017** (cloud security)
⚠️ **ISO 27018** (cloud privacy)
⚠️ **ISO 27701** (privacy management)
⚠️ **CSA STAR** (Cloud Security Alliance)

#### Red Flags

❌ **No certifications** - If handling customer data, this is unacceptable
❌ **"In progress"** - May take years, or never complete
❌ **Expired certifications** - Must be renewed annually/bi-annually
❌ **Certifications for parent company only** - Specific product must be certified

**Checklist**:
- [ ] SOC 2 Type II report available (within last 12 months)
- [ ] ISO 27001 certificate valid and current
- [ ] Certifications cover the specific AI product (not just the company)

**Decision**:
- ✅ Pass (has SOC 2 Type II or ISO 27001) → Continue
- ❌ Fail → **REJECT** for enterprise use (OK for internal experimentation only)

---

### Step 2: Data Retention & Training Policies (10 minutes)

**Question**: What happens to your data after you submit it?

#### Key Questions

**Data retention**:
- [ ] How long is data retained? (30 days is standard for enterprise AI)
- [ ] Can we request deletion? (GDPR right to be forgotten)
- [ ] What happens after deletion? (backups purged too?)

**Training on your data**:
- [ ] Is our data used to train AI models? (**Must be NO for enterprise**)
- [ ] Can we opt out? (Should be opt-out by default for business plans)
- [ ] Is this in the contract? (Verbal promises don't count)

#### Acceptable Policies

✅ **Enterprise-grade**:
- Data retained for 30 days (for service delivery)
- Data NOT used for AI training
- Can request deletion at any time
- Contractual guarantee (not just policy page)

⚠️ **Borderline**:
- Data retained for 90 days
- Data "may be used to improve service" (vague)
- Opt-out available but requires action

❌ **Unacceptable for business**:
- Data retained indefinitely
- "We may use data for any purpose"
- Data used to train models (no opt-out)

**How to verify**:
1. Read Terms of Service (search for "data retention", "training")
2. Read Data Processing Agreement (DPA) if enterprise plan
3. Ask sales rep directly (get written answer)

**Checklist**:
- [ ] Data retention period is defined and acceptable (<90 days)
- [ ] Data NOT used for training (or can opt out)
- [ ] Deletion process is documented
- [ ] Policies are contractual (in DPA), not just marketing

**Decision**:
- ✅ Pass → Continue
- ❌ Fail → **Negotiate** or **REJECT**

---

### Step 3: Data Residency & Subprocessors (10 minutes)

**Question**: Where is your data processed and stored?

#### Data Residency

**Why it matters**: Singapore PDPA, Malaysia PDPA, Indonesia PDP Law require:
- Adequate protection when transferring data overseas
- In some cases, data must stay in-country

**Questions to ask vendor**:
- [ ] Where are data centers located? (US, EU, Asia?)
- [ ] Can we choose data residency? (e.g., "EU only" or "Singapore only")
- [ ] What's the default if we don't specify?

**Acceptable for SEA companies**:
✅ Data processed in Singapore (ideal for SG companies)
✅ Data processed in EU with Standard Contractual Clauses (SCCs)
✅ Data processed in US with adequate safeguards (Privacy Shield successor)

❌ Data processed in countries without adequate protection (no recourse if breach)

#### Subprocessors

**AI vendors often use subprocessors** (cloud hosting, analytics, etc.)

**Questions**:
- [ ] Who are the subprocessors? (List should be in DPA)
- [ ] Where are they located?
- [ ] Can we object to specific subprocessors?
- [ ] Are we notified when new subprocessors are added?

**Example subprocessors**:
- AWS (hosting) - US/EU/Asia regions
- Google Cloud (hosting) - Global
- Datadog (monitoring) - US/EU
- Zendesk (customer support) - US

**Red flags**:
❌ "We may use any subprocessor without notice"
❌ Subprocessor list not provided
❌ Subprocessors in countries with weak data protection

**Checklist**:
- [ ] Data residency can be specified (or is acceptable by default)
- [ ] Subprocessor list provided
- [ ] Subprocessors have adequate protections (SOC 2, etc.)
- [ ] Notification process for new subprocessors

**Decision**:
- ✅ Pass → Continue
- ⚠️ Negotiate → Request specific data residency
- ❌ Fail → **REJECT**

---

### Step 4: Data Processing Agreement (DPA) (10 minutes)

**Question**: Is there a proper DPA for GDPR/PDPA compliance?

#### What is a DPA?

**Data Processing Agreement**: Contract that defines:
- Your company = "Data Controller" (you own the data)
- AI vendor = "Data Processor" (they process on your behalf)
- Vendor's obligations to protect data
- Your rights (access, deletion, portability)

**Required for**: Any processing of personal data (GDPR, PDPA)

#### DPA Checklist

**Must include**:
- [ ] Purpose of processing (e.g., "AI assistance", not "any purpose")
- [ ] Types of data processed (e.g., "prompts, uploaded files")
- [ ] Data subjects (e.g., "employees, customers")
- [ ] Retention period (e.g., "30 days after account termination")
- [ ] Security measures (encryption, access controls)
- [ ] Subprocessor list
- [ ] Data breach notification (within 72 hours per GDPR)
- [ ] Audit rights (you can verify compliance)
- [ ] Data return/deletion on termination

**How to get DPA**:
- Enterprise plans: Usually automatic (or requested from sales)
- Free/personal plans: Usually NOT available (red flag for business use)

**Template DPAs**:
- OpenAI DPA: [openai.com/policies/terms-of-use](https://openai.com/policies/terms-of-use)
- Anthropic DPA: Available on request for Claude for Work
- Most SaaS: Available in account settings or from sales team

**Checklist**:
- [ ] DPA available for this plan tier (not just enterprise)
- [ ] DPA covers GDPR/PDPA requirements
- [ ] DPA is signed (not just referenced in ToS)
- [ ] DPA can be reviewed by legal team

**Decision**:
- ✅ Pass (DPA available and acceptable) → Continue
- ⚠️ Borderline (DPA weak) → **Negotiate**
- ❌ Fail (no DPA) → **REJECT** for business use

---

### Step 5: Incident Response & Breach Notification (5 minutes)

**Question**: What happens if the vendor gets breached?

#### Questions to Ask

- [ ] Do they have an incident response plan?
- [ ] Will they notify us if our data is breached? (Within what timeframe?)
- [ ] What information will they provide? (Details of breach, affected data, remediation)
- [ ] Do they have breach notification obligations in contract? (Not just policy)

**Acceptable commitments**:
- ✅ Notify within 72 hours of breach discovery (GDPR requirement)
- ✅ Provide details: What data, how many users, root cause
- ✅ Remediation plan and timeline
- ✅ Assistance with our notification obligations (to our customers)

**Red flags**:
- ❌ "We'll notify you if we think it's necessary" (vague)
- ❌ No timeframe for notification
- ❌ No details on what information will be provided

**Example good language** (from DPA):
> "Vendor will notify Customer within 72 hours of becoming aware of a Personal Data Breach affecting Customer Data. Notification will include: (a) nature of breach, (b) categories and approximate number of data subjects affected, (c) likely consequences, (d) measures taken or proposed to address breach."

**Checklist**:
- [ ] Breach notification commitment in DPA (not just ToS)
- [ ] Timeframe specified (≤72 hours)
- [ ] Details of what will be disclosed
- [ ] Assistance with customer notifications (if needed)

**Decision**:
- ✅ Pass → Continue
- ❌ Fail → **Negotiate** or **REJECT**

---

### Step 6: Access Controls & User Management (5 minutes)

**Question**: Can we control who in our team uses this tool?

#### Enterprise Features Checklist

**User management**:
- [ ] Can we add/remove users centrally?
- [ ] Single Sign-On (SSO) support? (SAML, Google Workspace, Okta)
- [ ] Role-based access control (RBAC)? (Admin, User, Read-only)
- [ ] Can we enforce MFA (Multi-Factor Authentication)?

**Audit logging**:
- [ ] Can we see who accessed what data?
- [ ] Can we export logs for compliance?
- [ ] How long are logs retained?

**Session management**:
- [ ] Can we enforce session timeouts?
- [ ] Can we remotely revoke sessions? (If employee leaves)

**Why this matters**:
- Employee leaves → Need to revoke access immediately
- Compliance audit → Need to show who accessed customer data
- Security incident → Need logs to investigate

**Decision criteria**:

| Company Size | Requirements |
|--------------|--------------|
| **<10 people** | User management (add/remove), basic logs |
| **10-50 people** | SSO, RBAC, audit logs |
| **>50 people** | Full enterprise features (SSO, RBAC, SCIM provisioning, advanced logging) |

**Checklist**:
- [ ] Can add/remove users (minimum requirement)
- [ ] SSO available (if company >10 people)
- [ ] Audit logs available (exportable)

**Decision**:
- ✅ Pass → Continue
- ⚠️ Borderline → Acceptable for small teams, negotiate for larger
- ❌ Fail → **REJECT** if >50 employees

---

### Step 7: Service Level Agreement (SLA) (5 minutes)

**Question**: What uptime is guaranteed, and what compensation if SLA is missed?

#### SLA Components

**Uptime commitment**:
- ✅ **99.9%** ("three nines") = 43 minutes downtime/month (acceptable for most)
- ✅ **99.95%** = 22 minutes downtime/month (better)
- ✅ **99.99%** ("four nines") = 4 minutes downtime/month (enterprise-grade)
- ❌ **"Best effort"** = No guarantee (unacceptable for business-critical)

**Service credits** (compensation for downtime):
- ✅ 10% credit for 99.5-99.9% uptime
- ✅ 25% credit for 95-99.5% uptime
- ✅ 50-100% credit for <95% uptime
- ❌ No credits = No teeth in SLA

**Exclusions** (when SLA doesn't apply):
- Scheduled maintenance (must be announced in advance)
- Force majeure (natural disasters, etc.)
- Your misuse of service
- Third-party failures (cloud provider outage)

**Support response times**:
- Critical issues: <2 hours response
- High priority: <8 hours response
- Normal: <24 hours response

**Checklist**:
- [ ] SLA is ≥99.9% uptime (for business-critical tools)
- [ ] Service credits are meaningful (≥10% for minor breaches)
- [ ] Support response times defined
- [ ] SLA is contractual (in Master Service Agreement)

**Decision**:
- ✅ Pass (99.9%+ with credits) → Continue
- ⚠️ Borderline (99%+ with credits) → Acceptable for non-critical
- ❌ Fail (best effort, no credits) → **REJECT** for critical workflows

---

### Step 8: Pricing & Licensing (5 minutes)

**Question**: What are we actually paying for, and are there hidden costs?

#### Pricing Models

**Per-user pricing** (most common):
- $20-50/user/month (standard for AI tools)
- Scales with team size
- Pro: Simple, predictable
- Con: Expensive for large teams

**Usage-based pricing** (API calls):
- Pay per API request or token
- Pro: Pay only for what you use
- Con: Unpredictable costs, can spike

**Tiered pricing**:
- Different features at different price points
- Example: Basic ($10), Pro ($25), Enterprise ($custom)

#### Hidden Costs to Watch For

- ❌ **Overage fees** (exceed user limit or API quota)
- ❌ **Data export fees** (pay to get your data out)
- ❌ **Training/onboarding fees** (enterprise plans)
- ❌ **Support fees** (pay extra for faster support)
- ❌ **Integration fees** (SSO, API access)

**Questions to ask**:
- [ ] What's included in base price?
- [ ] What costs extra? (SSO, audit logs, data residency)
- [ ] What happens if we exceed limits? (Hard cap or overage fees?)
- [ ] What's the cancellation policy? (Can we leave anytime or locked in?)
- [ ] Data export: Free or paid? (GDPR requires free data export)

**Checklist**:
- [ ] Pricing is transparent (no hidden fees)
- [ ] Can scale pricing as we grow (volume discounts?)
- [ ] Can cancel without penalty (no long-term lock-in)
- [ ] Data export is free (GDPR compliance)

**Decision**:
- ✅ Pass → Continue
- ⚠️ Negotiate → Lock in pricing, clarify overage policy

---

### Step 9: Compliance & Industry Standards (5 minutes)

**Question**: Does vendor meet compliance requirements for our industry?

#### Common Compliance Frameworks

**If you handle**:
- **Healthcare data (HIPAA)** → Vendor must have HIPAA BAA (Business Associate Agreement)
- **Payment data (PCI DSS)** → Vendor must be PCI compliant
- **Singapore personal data (PDPA)** → Vendor must meet PDPA requirements (DPA, data residency)
- **EU personal data (GDPR)** → Vendor must have DPA, SCCs if data leaves EU
- **Financial data (SOX, etc.)** → Vendor should have SOC 2 Type II

**How to verify**:
- Ask sales: "Do you have [HIPAA/PCI/etc.] certification?"
- Request compliance documentation
- Check trust page (e.g., openai.com/trust, anthropic.com/trust)

**Checklist**:
- [ ] Vendor meets compliance requirements for our industry
- [ ] Compliance documentation provided (BAA, PCI AoC, etc.)
- [ ] Vendor undergoes regular audits (annual SOC 2, etc.)

**Decision**:
- ✅ Pass → Continue
- ❌ Fail → **REJECT** if compliance is mandatory

---

### Step 10: Vendor Stability & Reputation (5 minutes)

**Question**: Will this vendor still exist in 12 months?

#### Evaluation Criteria

**Company stability**:
- [ ] How long in business? (>2 years is safer)
- [ ] Funding status? (Well-funded = more stable)
- [ ] Revenue/customers? (Public numbers if available)
- [ ] Leadership team? (Known executives vs. anonymous)

**Product maturity**:
- [ ] Is this a mature product or beta? (Avoid "beta" for business-critical)
- [ ] How many customers? (>1,000 = safer)
- [ ] How often updated? (Active development vs. stagnant)

**Reputation**:
- [ ] What do customers say? (G2, Capterra reviews)
- [ ] Any major security incidents? (Google "[vendor] security breach")
- [ ] Any controversies? (Lawsuits, bad press)

**Exit strategy**:
- [ ] How easy to migrate away? (Data export, no lock-in)
- [ ] Alternative vendors available? (Not sole-source dependency)

**Red flags**:
- ❌ Startup <1 year old (high failure risk)
- ❌ Unclear funding or burn rate (may shut down)
- ❌ Major security incidents in past year
- ❌ Negative reviews about data handling
- ❌ Hard to export data (lock-in)

**Checklist**:
- [ ] Vendor has been in business >2 years OR well-funded
- [ ] Product is mature (not beta/experimental)
- [ ] No major security incidents
- [ ] Easy to migrate away (data export, alternatives exist)

**Decision**:
- ✅ Pass → Approve
- ⚠️ Borderline → Approve for non-critical use only
- ❌ Fail → **REJECT** or wait until more mature

---

## Vendor Scorecard Template

Use this to compare multiple vendors:

| Criteria | Weight | Vendor A | Vendor B | Vendor C |
|----------|--------|----------|----------|----------|
| **Security certs** (SOC 2, ISO) | 🔴 Critical | ✅ Yes | ✅ Yes | ❌ No |
| **Data retention** (<90 days) | 🔴 Critical | ✅ 30 days | ⚠️ 90 days | ❌ Indefinite |
| **No training on data** | 🔴 Critical | ✅ Yes | ✅ Yes | ❌ Used for training |
| **DPA available** | 🔴 Critical | ✅ Yes | ✅ Yes | ❌ No |
| **Data residency** (SEA/EU) | 🟡 High | ✅ Singapore | ⚠️ US only | ⚠️ US only |
| **Breach notification** (<72h) | 🟡 High | ✅ Yes | ✅ Yes | ❌ Undefined |
| **SSO support** | 🟡 High | ✅ Yes | ✅ Yes | ❌ No |
| **SLA** (99.9%+) | ⚠️ Medium | ✅ 99.95% | ⚠️ 99.5% | ❌ Best effort |
| **Audit logs** | ⚠️ Medium | ✅ Yes | ✅ Yes | ❌ No |
| **Compliance** (HIPAA/PCI) | 🟡 High | ✅ Yes | ⚠️ Partial | ❌ No |
| **Vendor stability** | ⚠️ Medium | ✅ Mature | ✅ Mature | ⚠️ Startup |
| **Pricing** | 🟢 Low | $25/user | $20/user | $15/user |

**Scoring**:
- All 🔴 Critical = Must be ✅ (non-negotiable)
- 🟡 High = Prefer ✅, negotiate if ⚠️
- ⚠️ Medium = Nice to have
- 🟢 Low = Consider last

**Example decision**:
- **Vendor A**: Passes all critical + most high priority → **APPROVE**
- **Vendor B**: Passes critical, some compromises → **APPROVE with caveats**
- **Vendor C**: Fails multiple critical → **REJECT**

---

## Negotiation Tips

**What's negotiable**:
- ✅ Pricing (volume discounts, annual vs. monthly)
- ✅ Contract length (1 year vs. 3 year commitment)
- ✅ Data residency (may require higher tier)
- ✅ Support SLA (faster response for higher price)
- ✅ Custom features (for enterprise deals)

**What's usually NOT negotiable**:
- ❌ Security certifications (they have them or they don't)
- ❌ Data retention policies (baked into product)
- ❌ Training on data (philosophical choice by vendor)

**Negotiation leverage**:
- Large deal size (>100 users, $50k+ annually)
- Multi-year commitment
- Case study/testimonial willingness
- Referrals to other customers

---

## Example Vendor Evaluations

### Example 1: OpenAI ChatGPT Team

**Security**: SOC 2 Type II ✅
**Data retention**: 30 days (enterprise), not used for training ✅
**DPA**: Available ✅
**Data residency**: US (can request EU) ⚠️
**SLA**: 99.9% for Team/Enterprise ✅
**SSO**: Yes (Enterprise only) ⚠️
**Compliance**: No HIPAA BAA (fails for healthcare) ❌

**Decision**: ✅ **APPROVE** for most businesses (not healthcare)

---

### Example 2: Anthropic Claude for Work

**Security**: SOC 2 Type II ✅
**Data retention**: Configurable (30 days default), not used for training ✅
**DPA**: Available ✅
**Data residency**: US/EU options ✅
**SLA**: 99.9% ✅
**SSO**: Yes ✅
**Compliance**: SOC 2, working on HIPAA ⚠️

**Decision**: ✅ **APPROVE** for most businesses

---

### Example 3: "AI Startup Pro"

**Security**: "Working on SOC 2" ❌
**Data retention**: Unclear policy ❌
**DPA**: Not available ❌
**Data residency**: US only ⚠️
**SLA**: Best effort ❌
**SSO**: No ❌
**Compliance**: None ❌

**Decision**: ❌ **REJECT** for business use (OK for personal experiments)

---

## 🔗 Related Resources

**Before using this guide**:
- [TOOLS.md](../TOOLS.md) - Trusted AI vendors

**Implementation guides**:
- [Data Protection](06-data-protection.md) - Minimize vendor access to sensitive data
- [Incident Response](08-incident-response.md) - What if vendor is breached

**External resources**:
- [OpenAI Trust Portal](https://trust.openai.com)
- [Anthropic Security](https://www.anthropic.com/security)
- [CSA STAR Registry](https://cloudsecurityalliance.org/star/)

---

**Last Updated**: February 2026

---

**Remember**: Your AI vendor processes your most sensitive business data (customer conversations, internal documents). Choosing a vendor without proper due diligence is like hiring someone and giving them root access to your database on day one. Take the time to vet properly.
