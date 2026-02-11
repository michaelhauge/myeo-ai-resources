# AI Vendor Security Questionnaire
**Send this to AI vendors before signing contracts**

---

## Instructions

**Purpose**: Evaluate security and compliance posture of AI vendors (ChatGPT Team, Claude for Work, AI writing tools, etc.)

**When to use**: Before signing any AI SaaS contract where you'll process customer data or sensitive business information

**How to use**:
1. Copy this entire document
2. Send to vendor sales/security contact
3. Request written answers (not verbal)
4. Review answers using [Vendor Evaluation Guide](../guides/07-vendor-evaluation.md)
5. Flag any "We don't have that" or vague answers for negotiation

---

## Vendor Information

**Vendor Name**: _____________________________________________________

**Product/Service Name**: ____________________________________________

**Website**: __________________________________________________________

**Contact Person**: ___________________________________________________

**Email**: ____________________________________________________________

**Date Sent**: ____________________ (YYYY-MM-DD)

**Response Deadline**: ____________________ (YYYY-MM-DD) [Give 7-10 days]

---

## Section 1: Security Certifications & Compliance

### 1.1 Security Certifications

**Question**: What third-party security certifications does your company/product hold?

**Please check all that apply and provide details**:
- [ ] SOC 2 Type I (audit date: ______________, auditor: ______________)
- [ ] SOC 2 Type II (audit period: ______________, auditor: ______________)
- [ ] ISO 27001 (certificate number: ______________, valid until: ______________)
- [ ] ISO 27017 (Cloud Security)
- [ ] ISO 27018 (Cloud Privacy)
- [ ] CSA STAR Level: [ ] 1 [ ] 2 [ ] 3
- [ ] Other: ___________________________________________________

**Can you provide copies of current reports/certificates?**: [ ] Yes [ ] No (if Yes, NDA required?: [ ] Yes [ ] No)

**Follow-up**: If no certifications:
- Are you working toward any certifications? Which ones? ETA?

**Answer**: _____________________________________________________________

___________________________________________________________________________

---

### 1.2 Compliance Frameworks

**Question**: Which compliance frameworks do you meet?

**Please check all that apply**:
- [ ] GDPR (EU General Data Protection Regulation)
- [ ] Singapore PDPA (Personal Data Protection Act)
- [ ] Malaysia PDPA
- [ ] HIPAA (Healthcare) - Do you sign BAAs? [ ] Yes [ ] No
- [ ] PCI DSS Level: [ ] 1 [ ] 2 [ ] 3 [ ] 4 (for payment data)
- [ ] SOX (Sarbanes-Oxley, for financial data)
- [ ] FedRAMP (US Government)
- [ ] Other: ___________________________________________________

**Answer**: _____________________________________________________________

---

### 1.3 Penetration Testing

**Question**: When was your last third-party penetration test?

**Date of last pentest**: ____________________ (YYYY-MM-DD)

**Pentest frequency**: [ ] Annually [ ] Bi-annually [ ] Quarterly [ ] Other: ______

**Pentesting firm**: _____________________________________________________

**Were all critical/high findings remediated?**: [ ] Yes [ ] No [ ] N/A

**Can you provide an executive summary of findings?**: [ ] Yes [ ] No

**Answer**: _____________________________________________________________

---

## Section 2: Data Handling & Privacy

### 2.1 Data Retention

**Question**: How long do you retain customer data after it's submitted to your service?

**Data retention period**:
- Prompts/queries: __________ days
- Uploaded files: __________ days
- Generated outputs: __________ days
- Metadata (logs): __________ days

**Is retention period configurable?**: [ ] Yes [ ] No

**After account termination, data is**:
- [ ] Deleted immediately
- [ ] Deleted within __________ days
- [ ] Retained indefinitely
- [ ] Other: ___________________________________________________

**Answer**: _____________________________________________________________

---

### 2.2 Training on Customer Data

**Question**: Is customer data used to train or improve your AI models?

- [ ] No, customer data is NEVER used for training
- [ ] Yes, but customers can opt out
- [ ] Yes, for all customers (cannot opt out)
- [ ] Only with explicit opt-in consent

**If opt-out available**: How do we opt out? _____________________________

**Is this guaranteed in contract (DPA/MSA)?**: [ ] Yes [ ] No

**Answer**: _____________________________________________________________

---

### 2.3 Data Deletion

**Question**: Can customers request deletion of their data?

- [ ] Yes, via self-service (how: _____________________________________)
- [ ] Yes, via support request (SLA: __________ days)
- [ ] No, data is retained per policy

**Are backups purged when data is deleted?**: [ ] Yes [ ] No

**Deletion verification**: Can you provide confirmation after deletion? [ ] Yes [ ] No

**Answer**: _____________________________________________________________

---

### 2.4 Data Encryption

**Question**: How is data encrypted?

**Encryption in transit**:
- [ ] TLS 1.2+
- [ ] TLS 1.3
- [ ] Other: ___________________________________________________

**Encryption at rest**:
- [ ] AES-256
- [ ] AES-128
- [ ] Other: ___________________________________________________
- [ ] Not encrypted

**Key management**:
- [ ] We manage encryption keys
- [ ] Customer-managed keys (BYOK) available
- [ ] Other: ___________________________________________________

**Answer**: _____________________________________________________________

---

## Section 3: Data Residency & Subprocessors

### 3.1 Data Residency

**Question**: Where is customer data processed and stored?

**Data center locations** (check all that apply):
- [ ] United States (regions: _______________________________________)
- [ ] European Union (regions: ______________________________________)
- [ ] Singapore
- [ ] Malaysia
- [ ] Other APAC: __________________________________________________
- [ ] Other: ______________________________________________________

**Can customers choose data residency?**: [ ] Yes [ ] No

**If Yes**:
- Which regions can we choose from? _________________________________
- Is there an additional cost? [ ] Yes (amount: ______) [ ] No

**Does data ever leave the chosen region?**: [ ] Yes [ ] No

**If Yes, under what circumstances?**: ___________________________________

**Answer**: _____________________________________________________________

---

### 3.2 Subprocessors

**Question**: What third-party subprocessors do you use?

**Please provide a list of subprocessors**:

| Subprocessor Name | Purpose | Location | Access to Customer Data? |
|-------------------|---------|----------|-------------------------|
| Example: AWS | Hosting | US, EU | Yes |
| | | | |
| | | | |
| | | | |

**Is the subprocessor list available online?**: [ ] Yes (URL: ________________) [ ] No

**Notification of new subprocessors**:
- [ ] Yes, customers are notified in advance (how many days? ________)
- [ ] Yes, but only after the fact
- [ ] No notification

**Can customers object to specific subprocessors?**: [ ] Yes [ ] No

**Answer**: _____________________________________________________________

---

## Section 4: Access Controls & User Management

### 4.1 User Management

**Question**: What user management features are available?

**Available features** (check all that apply):
- [ ] Add/remove users centrally
- [ ] Single Sign-On (SSO) - Protocols: [ ] SAML [ ] OAuth [ ] Other: ______
- [ ] Multi-Factor Authentication (MFA) - Required or optional? ____________
- [ ] Role-Based Access Control (RBAC)
  - Available roles: _______________________________________________
- [ ] SCIM provisioning (auto add/remove users from IdP)
- [ ] Session timeout configuration
- [ ] Remote session revocation

**Which plan tier includes these features?**:
- SSO: [ ] All plans [ ] Team [ ] Enterprise [ ] N/A
- RBAC: [ ] All plans [ ] Team [ ] Enterprise [ ] N/A
- SCIM: [ ] All plans [ ] Team [ ] Enterprise [ ] N/A

**Answer**: _____________________________________________________________

---

### 4.2 Audit Logging

**Question**: What audit logging capabilities do you provide?

**Logged events** (check all that apply):
- [ ] User logins/logouts
- [ ] Failed login attempts
- [ ] Data access (who accessed what)
- [ ] Data modifications
- [ ] Permission changes
- [ ] API calls
- [ ] Other: ___________________________________________________

**Log retention period**: __________ days

**Log export options**:
- [ ] Yes, via dashboard download
- [ ] Yes, via API
- [ ] Yes, via SIEM integration (which?: _________________________)
- [ ] No export available

**Real-time alerting available?**: [ ] Yes [ ] No

**Answer**: _____________________________________________________________

---

## Section 5: Incident Response & Breach Notification

### 5.1 Incident Response Plan

**Question**: Do you have a documented incident response plan?

- [ ] Yes, documented and tested
- [ ] Yes, documented but not tested
- [ ] Informal plan (not documented)
- [ ] No

**How often is the plan tested?**: [ ] Annually [ ] Bi-annually [ ] Never [ ] Other: ________

**Answer**: _____________________________________________________________

---

### 5.2 Breach Notification

**Question**: What is your breach notification process?

**Notification timeline**:
- Customers notified within __________ hours of breach discovery
- Regulators notified within __________ hours (if required)

**Notification method**:
- [ ] Email to designated contact
- [ ] Dashboard notification
- [ ] Phone call
- [ ] Other: ___________________________________________________

**Information provided in notification** (check all that apply):
- [ ] Nature of breach (what happened)
- [ ] Data affected (categories, volume)
- [ ] Likely consequences
- [ ] Remediation steps taken
- [ ] Assistance with customer notifications (if we need to notify our customers)

**Is this defined in contract (DPA)?**: [ ] Yes [ ] No

**Answer**: _____________________________________________________________

---

### 5.3 Historical Incidents

**Question**: Have you experienced any security incidents or data breaches in the past 24 months?

- [ ] No
- [ ] Yes (please describe below)

**If Yes**:
- Date of incident: ____________________
- Nature of incident: ______________________________________________
- Customer data affected?: [ ] Yes [ ] No
- Root cause: _______________________________________________________
- Remediation: ______________________________________________________

**Publicly disclosed?**: [ ] Yes (link: ______________) [ ] No

**Answer**: _____________________________________________________________

---

## Section 6: Service Level Agreement (SLA)

### 6.1 Uptime Commitment

**Question**: What is your uptime SLA?

**Uptime commitment**: ______% (e.g., 99.9%, 99.95%, 99.99%)

**This equates to maximum downtime of**:
- Per month: __________ minutes
- Per year: __________ hours

**Measurement method**:
- [ ] Synthetic monitoring
- [ ] Actual user requests
- [ ] Other: ___________________________________________________

**Exclusions** (when SLA doesn't apply):
- Scheduled maintenance (advance notice of __________ hours)
- Force majeure
- Other: ___________________________________________________________

**Answer**: _____________________________________________________________

---

### 6.2 Service Credits

**Question**: What compensation is provided if SLA is missed?

**Service credit structure**:

| Uptime | Service Credit |
|--------|----------------|
| <99.95% | ______% credit |
| <99.5% | ______% credit |
| <99.0% | ______% credit |
| <95.0% | ______% credit |

**Credit cap**: Max credit is ______% of monthly fees

**How to claim credits**: ______________________________________________

**Answer**: _____________________________________________________________

---

### 6.3 Support Response Times

**Question**: What are your support response time SLAs?

| Severity | Description | Response Time | Resolution Time |
|----------|-------------|---------------|-----------------|
| Critical | Service down | _______ hours | _______ hours |
| High | Major function broken | _______ hours | _______ hours |
| Medium | Minor issue | _______ hours | _______ hours |
| Low | General question | _______ hours | _______ hours |

**Support channels available**:
- [ ] Email
- [ ] Phone (24/7?: [ ] Yes [ ] No)
- [ ] Chat
- [ ] Dedicated Slack channel (Enterprise only?: [ ] Yes [ ] No)

**Answer**: _____________________________________________________________

---

## Section 7: Data Processing Agreement (DPA)

### 7.1 DPA Availability

**Question**: Do you provide a Data Processing Agreement (DPA)?

- [ ] Yes, available for all customers
- [ ] Yes, available for Team/Enterprise tiers only
- [ ] Yes, available on request
- [ ] No

**DPA covers**:
- [ ] GDPR requirements
- [ ] Singapore PDPA requirements
- [ ] Other: ___________________________________________________

**Audit rights**: Can we audit your compliance? [ ] Yes [ ] No

**If Yes**: Frequency: [ ] Annually [ ] On request [ ] Other: __________

**Answer**: _____________________________________________________________

---

## Section 8: Vendor Stability

### 8.1 Company Information

**Question**: Please provide company background information.

**Founded**: __________ (year)

**Funding status**:
- [ ] Bootstrapped
- [ ] Seed funded (amount: ______________)
- [ ] Series A/B/C/D (last round: ______________)
- [ ] Profitable
- [ ] Public company

**Number of customers**: __________ (approximate)

**Annual recurring revenue (ARR)**: [ ] <$1M [ ] $1M-10M [ ] $10M-100M [ ] >$100M [ ] Decline to disclose

**Answer**: _____________________________________________________________

---

### 8.2 Business Continuity

**Question**: What is your business continuity/disaster recovery plan?

**Backup frequency**: [ ] Real-time [ ] Hourly [ ] Daily [ ] Weekly

**Backup locations**: _________________________________________________

**Recovery Time Objective (RTO)**: __________ hours (how quickly can service be restored)

**Recovery Point Objective (RPO)**: __________ hours (max data loss in event of disaster)

**Disaster recovery plan tested?**: [ ] Yes, last test: __________ [ ] No

**Answer**: _____________________________________________________________

---

## Section 9: Pricing & Terms

### 9.1 Pricing Transparency

**Question**: Please clarify pricing structure and any hidden costs.

**Base price**: $__________ per __________ (user/month, API call, etc.)

**Additional costs** (check all that apply):
- [ ] SSO integration: $__________
- [ ] Advanced audit logs: $__________
- [ ] Data residency (specific region): $__________
- [ ] Premium support: $__________
- [ ] API access: $__________
- [ ] Data export: $__________
- [ ] Overage fees (if exceed limit): $__________
- [ ] Other: _________________________________________________

**Volume discounts available?**: [ ] Yes (at what threshold?: __________) [ ] No

**Answer**: _____________________________________________________________

---

### 9.2 Contract Terms

**Question**: What are the contract terms?

**Minimum commitment**: [ ] Month-to-month [ ] Annual [ ] Multi-year [ ] Other: ________

**Cancellation policy**:
- Notice required: __________ days
- Cancellation fee: $__________ or [ ] None
- Partial refunds for pre-paid annual? [ ] Yes [ ] No

**Auto-renewal**: [ ] Yes (opt-out period: __________ days) [ ] No

**Price lock**: Prices guaranteed for __________ months/years

**Answer**: _____________________________________________________________

---

## Section 10: Additional Questions

### 10.1 Custom Questions

**Question 1**: [Add custom question specific to your industry/needs]

**Answer**: _____________________________________________________________

---

**Question 2**: [Add custom question]

**Answer**: _____________________________________________________________

---

## Vendor Signature

**I certify that the information provided in this questionnaire is accurate and current as of the date below.**

**Signature**: _______________________________________________________

**Printed Name**: ___________________________________________________

**Title**: __________________________________________________________

**Date**: ____________________ (YYYY-MM-DD)

---

## Internal Review (For Your Team)

**Reviewed by**: ________________________________________________________

**Review date**: ____________________ (YYYY-MM-DD)

**Overall assessment**:
- [ ] Meets all requirements → Approve
- [ ] Meets most requirements → Negotiate on: ____________________
- [ ] Does not meet requirements → Reject or escalate

**Red flags identified**: ____________________________________________

______________________________________________________________________

**Decision**: [ ] Approve [ ] Approve with conditions [ ] Reject

**Next steps**: _______________________________________________________

______________________________________________________________________

---

## Template Version

**Template version**: 1.0.0
**Last updated**: February 2026
**Source**: AI Tooling Security Guide (MyEO AI Resources)
