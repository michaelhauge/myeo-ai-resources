# Vendor Security Questionnaires

**Purpose**: Copy-paste security questionnaires for assessing SaaS vendors before onboarding.

**Instructions**:
1. Copy questionnaire based on vendor tier (Tier 1 = 20 questions, Tier 2 = 15 questions, Tier 3 = 10 questions)
2. Send to vendor via email or security portal
3. Review responses with security team
4. Request supporting documents (SOC 2 report, DPA, privacy policy)

---

## Questionnaire 1: Tier 1 Vendor (20 Questions)

**Use for**: Vendors with access to customer data or production systems (Stripe, AWS, Zendesk, CRM, analytics tools)

**Pass criteria**: Must answer YES to Q1 or Q2 (SOC 2 or ISO 27001), YES to Q4 (DPA), YES to Q6-7 (encryption), YES to Q10 (MFA), YES to Q15 (incident response plan), YES to Q20 (breach notification)

---

### Section 1: Certifications & Compliance

**Q1. Do you have SOC 2 Type 2 certification?**
- [ ] Yes (please provide copy of report)
- [ ] Yes, but Type 1 only (provide report)
- [ ] No

**Q2. Do you have ISO 27001 certification?**
- [ ] Yes (please provide certificate)
- [ ] No

**Q3. Are you GDPR compliant?** (if processing EU customer data)
- [ ] Yes
- [ ] No
- [ ] Not applicable (no EU customers)

**Q4. Do you have a Data Processing Agreement (DPA)?**
- [ ] Yes (please provide copy)
- [ ] No

---

### Section 2: Infrastructure & Data Storage

**Q5. Where is customer data stored?** (select all that apply)
- [ ] US
- [ ] EU
- [ ] Singapore
- [ ] Other Asia-Pacific: _______________
- [ ] Other: _______________

**Q6. Do you encrypt data at rest?**
- [ ] Yes (encryption standard: AES-256, AES-128, other: _______)
- [ ] No

**Q7. Do you encrypt data in transit?**
- [ ] Yes (TLS 1.3)
- [ ] Yes (TLS 1.2)
- [ ] No

**Q8. How long do you retain customer data?**
- [ ] While contract is active only
- [ ] 30 days after termination
- [ ] 90 days after termination
- [ ] Other: _______________

**Q9. Can you delete our data upon request?**
- [ ] Yes, within 30 days
- [ ] Yes, within 90 days
- [ ] No, data cannot be deleted
- [ ] Other: _______________

---

### Section 3: Access Control

**Q10. Do you enforce Multi-Factor Authentication (MFA) for employee access?**
- [ ] Yes, required for all employees
- [ ] Yes, required for admin accounts only
- [ ] No, MFA not enforced

**Q11. Do you implement Role-Based Access Control (RBAC)?**
- [ ] Yes
- [ ] No

**Q12. How often do you review employee access?**
- [ ] Monthly
- [ ] Quarterly
- [ ] Annually
- [ ] Never
- [ ] Other: _______________

**Q13. How quickly is access revoked upon employee termination?**
- [ ] Immediately (within 1 hour)
- [ ] Same day (within 24 hours)
- [ ] Within 1 week
- [ ] Other: _______________

---

### Section 4: Security Practices

**Q14. Do you perform regular vulnerability scans?**
- [ ] Yes, weekly
- [ ] Yes, monthly
- [ ] Yes, quarterly
- [ ] No

**Q15. Do you perform penetration tests?**
- [ ] Yes, annually by third-party firm
- [ ] Yes, every 2 years
- [ ] Yes, but internal only (no third-party)
- [ ] No

**Q16. Do you have an incident response plan?**
- [ ] Yes, documented and tested
- [ ] Yes, documented but not tested
- [ ] No

**Q17. Have you had any security breaches in the past 2 years?**
- [ ] No
- [ ] Yes (please describe): _______________

---

### Section 5: Subprocessors & Third Parties

**Q18. Do you use subprocessors (other vendors to process our data)?**
- [ ] Yes (please list): _______________
- [ ] No

**Q19. How do you assess subprocessor security?**
- [ ] SOC 2 certification required
- [ ] Security questionnaire
- [ ] Both of above
- [ ] No formal process

---

### Section 6: Monitoring & Logging

**Q20. Do you maintain audit logs of data access?**
- [ ] Yes, retained for 1 year or longer
- [ ] Yes, retained for 90 days
- [ ] No

**Q21. Will you notify us of security incidents?**
- [ ] Yes, within 24 hours
- [ ] Yes, within 72 hours
- [ ] Yes, but no specific timeline
- [ ] No formal commitment

---

**Vendor Name**: _______________
**Date Completed**: _______________
**Completed By**: _______________ (Name, Title)

**Reviewer Notes**:
- SOC 2/ISO 27001: _______________
- Encryption: _______________
- Pass/Fail: _______________
- Next steps: _______________

---

## Questionnaire 2: Tier 2 Vendor (15 Questions)

**Use for**: Vendors with access to internal data or employee accounts (Google Workspace, Slack, GitHub, HR tools)

**Pass criteria**: Must answer YES to Q1 or Q2 (SOC 2 or ISO 27001), YES to Q3 (encryption), YES to Q5 (MFA), YES to Q10 (incident response plan)

---

### Section 1: Certifications

**Q1. Do you have SOC 2 certification (Type 1 or Type 2)?**
- [ ] Yes, Type 2 (provide report)
- [ ] Yes, Type 1 (provide report)
- [ ] No

**Q2. Do you have ISO 27001 certification?**
- [ ] Yes (provide certificate)
- [ ] No

---

### Section 2: Data Protection

**Q3. Do you encrypt data at rest and in transit?**
- [ ] Yes, both at rest (AES-256) and in transit (TLS 1.2+)
- [ ] Yes, in transit only
- [ ] No

**Q4. Where is data stored?**
- [ ] US
- [ ] EU
- [ ] Singapore
- [ ] Other: _______________

**Q5. Can you delete our data upon contract termination?**
- [ ] Yes, within 30 days
- [ ] Yes, within 90 days
- [ ] No

---

### Section 3: Access Control

**Q6. Do you enforce MFA for employee access?**
- [ ] Yes, for all employees
- [ ] Yes, for admins only
- [ ] No

**Q7. How often do you review employee access?**
- [ ] Quarterly
- [ ] Annually
- [ ] Never

---

### Section 4: Security Practices

**Q8. Do you perform vulnerability scans?**
- [ ] Yes, monthly or more frequently
- [ ] Yes, quarterly
- [ ] No

**Q9. Do you perform penetration tests?**
- [ ] Yes, annually
- [ ] Yes, every 2 years
- [ ] No

**Q10. Do you have an incident response plan?**
- [ ] Yes, documented and tested
- [ ] Yes, documented but not tested
- [ ] No

---

### Section 5: Incidents

**Q11. Have you had security breaches in the past 2 years?**
- [ ] No
- [ ] Yes (describe): _______________

**Q12. Will you notify us of security incidents?**
- [ ] Yes, within 24-72 hours
- [ ] Yes, but no specific timeline
- [ ] No

---

### Section 6: Subprocessors

**Q13. Do you use subprocessors?**
- [ ] Yes (list): _______________
- [ ] No

**Q14. How do you assess subprocessor security?**
- [ ] SOC 2 required
- [ ] Security questionnaire
- [ ] No formal process

---

### Section 7: Audit Logs

**Q15. Do you maintain audit logs?**
- [ ] Yes, retained for 1 year
- [ ] Yes, retained for 90 days
- [ ] No

---

**Vendor Name**: _______________
**Date Completed**: _______________
**Completed By**: _______________ (Name, Title)

**Pass/Fail**: _______________

---

## Questionnaire 3: Tier 3 Vendor (10 Questions)

**Use for**: Vendors with no access to sensitive data (Calendly, Figma, marketing tools, project management tools with no customer data)

**Pass criteria**: No strict criteria (informational only), but prefer YES to Q1 (SOC 2), YES to Q3 (encryption), YES to Q5 (MFA)

---

**Q1. Do you have SOC 2 or ISO 27001 certification?**
- [ ] Yes, SOC 2
- [ ] Yes, ISO 27001
- [ ] No

**Q2. Where is data stored?**
- [ ] US
- [ ] EU
- [ ] Other: _______________

**Q3. Do you encrypt data in transit (HTTPS/TLS)?**
- [ ] Yes
- [ ] No

**Q4. Can you delete our data upon request?**
- [ ] Yes
- [ ] No

**Q5. Do you support MFA for user accounts?**
- [ ] Yes
- [ ] No

**Q6. Do you perform vulnerability scans?**
- [ ] Yes
- [ ] No

**Q7. Do you have an incident response plan?**
- [ ] Yes
- [ ] No

**Q8. Have you had security breaches in past 2 years?**
- [ ] No
- [ ] Yes (describe): _______________

**Q9. Will you notify us of security incidents?**
- [ ] Yes
- [ ] No

**Q10. Do you use subprocessors?**
- [ ] Yes (list): _______________
- [ ] No

---

**Vendor Name**: _______________
**Date Completed**: _______________
**Pass/Fail**: _______________

---

## Questionnaire 4: Custom Industry-Specific Questions

**Use these**: Add to Tier 1/2 questionnaires for specific industries

### Payment Processors (Stripe, PayPal, Xendit)

**Q. Are you PCI-DSS Level 1 certified?**
- [ ] Yes (provide Attestation of Compliance)
- [ ] No

**Q. Do you tokenize credit card data?**
- [ ] Yes, full PAN never stored
- [ ] No, we store encrypted PAN

**Q. Do you support 3D Secure (SCA)?**
- [ ] Yes
- [ ] No

### Healthcare (HIPAA-Covered Entities)

**Q. Are you HIPAA compliant?**
- [ ] Yes (provide Business Associate Agreement)
- [ ] No

**Q. Do you sign Business Associate Agreements (BAAs)?**
- [ ] Yes (provide template)
- [ ] No

**Q. Do you encrypt PHI (Protected Health Information) at rest?**
- [ ] Yes (AES-256)
- [ ] No

### Financial Services (Banking, Fintech)

**Q. Are you compliant with MAS TRM (Singapore)?**
- [ ] Yes
- [ ] No
- [ ] Not applicable

**Q. Do you have cyber insurance?**
- [ ] Yes (coverage amount: __________)
- [ ] No

**Q. Do you conduct regular security audits?**
- [ ] Yes, annually by third-party
- [ ] Yes, internally only
- [ ] No

### Government (GovTech, Public Sector)

**Q. Do you comply with AIAS (Automated Intelligence Assurance Standard)?**
- [ ] Yes
- [ ] No
- [ ] Not applicable

**Q. Can you host data in Singapore (data residency)?**
- [ ] Yes
- [ ] No

**Q. Do you have government customers?**
- [ ] Yes (list): _______________
- [ ] No

---

## Scoring & Decision Matrix

**Tier 1 Vendor Scoring**:
- SOC 2 Type 2 or ISO 27001: 20 points (required)
- DPA available: 20 points (required)
- Encryption at rest + in transit: 15 points (required)
- MFA enforced: 15 points (required)
- Incident response plan: 10 points (required)
- Breach notification commitment: 10 points (required)
- Annual penetration tests: 5 points
- No breaches in 2 years: 5 points

**Total**: 100 points
**Pass**: ≥85 points (must include all required)

---

**Tier 2 Vendor Scoring**:
- SOC 2 or ISO 27001: 30 points (required)
- Encryption at rest + in transit: 20 points (required)
- MFA enforced: 20 points (required)
- Incident response plan: 15 points (required)
- Breach notification: 10 points
- Annual vulnerability scans: 5 points

**Total**: 100 points
**Pass**: ≥80 points

---

**Tier 3 Vendor Scoring**:
- SOC 2 or ISO 27001: 30 points (preferred)
- Encryption in transit: 20 points (preferred)
- MFA support: 20 points (preferred)
- Incident response plan: 15 points
- No breaches in 2 years: 15 points

**Total**: 100 points
**Pass**: ≥60 points

---

## Decision Tree

```
Vendor questionnaire completed
    |
    ├─ Tier 1 vendor?
    |   ├─ Score ≥85 + SOC 2 + DPA? → APPROVE (sign DPA, grant access)
    |   └─ Score <85 or no SOC 2? → REJECT or accept risk (document in risk register)
    |
    ├─ Tier 2 vendor?
    |   ├─ Score ≥80 + SOC 2? → APPROVE (sign DPA, grant access)
    |   └─ Score <80? → CONDITIONALLY APPROVE (document gaps, require improvements)
    |
    └─ Tier 3 vendor?
        ├─ Score ≥60? → APPROVE (no formal requirements)
        └─ Score <60? → APPROVE (low risk, but note concerns)
```

---

## Follow-Up Actions

**After vendor passes questionnaire**:
1. [ ] Request SOC 2 report (if applicable)
2. [ ] Request DPA (Data Processing Agreement)
3. [ ] Sign DPA before granting access
4. [ ] Document vendor in vendor inventory (spreadsheet or GRC tool)
5. [ ] Set annual review reminder (calendar)
6. [ ] Grant least privilege access (API keys scoped, read-only where possible)

**If vendor fails questionnaire**:
1. [ ] Assess if risk is acceptable (document in risk register)
2. [ ] Consider alternative vendor with better security
3. [ ] Request vendor to remediate gaps (e.g., get SOC 2 certification)
4. [ ] Set timeline for re-assessment (3-6 months)

---

## Summary

**4 questionnaires provided**:
1. Tier 1 Vendor (20 questions) - Customer data access
2. Tier 2 Vendor (15 questions) - Internal data access
3. Tier 3 Vendor (10 questions) - No sensitive data access
4. Industry-Specific Questions (payment, healthcare, finance, government)

**Scoring system**:
- Tier 1: ≥85/100 to pass (SOC 2 + DPA required)
- Tier 2: ≥80/100 to pass (SOC 2 required)
- Tier 3: ≥60/100 to pass (no strict requirements)

**How to use**:
1. Classify vendor (Tier 1/2/3)
2. Send appropriate questionnaire
3. Review responses, request supporting docs
4. Score vendor (pass/fail)
5. Approve or reject based on score

**Next template**: Incident Response Playbooks (step-by-step breach response)
