# Vendor Security Questionnaire Template

**Purpose**: Assess third-party vendors' security practices before granting access to company systems or data.

**Instructions**: Send this questionnaire to vendors during procurement process or annually for existing vendors. Use responses to determine vendor risk level and security requirements.

---

## Vendor Information

- **Vendor name**: _______________________________
- **Vendor contact**: _______________________________ Email: _______________________________
- **Service/product**: _______________________________
- **Questionnaire completed by**: _______________________________ Title: _______________________________
- **Date completed**: _______________________________
- **Contract value**: $ _______________________________ Contract term: _______________________________

---

## Section 1: Company and Service Overview

**1.1** Briefly describe your company and the service you provide:
_______________________________
_______________________________
_______________________________

**1.2** Where is your company headquartered?
☐ Singapore ☐ Malaysia ☐ United States ☐ European Union ☐ Other: _______________________________

**1.3** Where is customer data stored? (Check all that apply)
☐ Singapore
☐ Malaysia
☐ Asia-Pacific (specify countries): _______________________________
☐ United States
☐ European Union (specify countries): _______________________________
☐ Other (specify): _______________________________

**1.4** How many employees does your company have?
☐ 1-10 ☐ 11-50 ☐ 51-200 ☐ 201-1000 ☐ 1000+

**1.5** How long has your company been in business?
☐ < 1 year ☐ 1-3 years ☐ 3-5 years ☐ 5-10 years ☐ 10+ years

---

## Section 2: Data Access and Handling

**2.1** What type of our data will you access? (Check all that apply)
☐ Customer personal data (names, emails, phone numbers)
☐ Customer financial data (credit cards, bank accounts)
☐ Employee personal data (names, emails, SSN/NRIC)
☐ Employee financial data (salaries, bank accounts)
☐ Intellectual property (code, product designs, trade secrets)
☐ Login credentials (passwords, API keys)
☐ Health data (PHI/medical records)
☐ None (service does not access our data)
☐ Other (specify): _______________________________

**2.2** Will you store our data?
☐ Yes ☐ No

**If Yes:**
- How long is data retained? _______________________________
- How is data deleted when contract ends? _______________________________
- Can we request data deletion at any time? ☐ Yes ☐ No

**2.3** Will you process our data? (e.g., analyze, aggregate, train AI models)
☐ Yes ☐ No

**If Yes, describe processing activities**:
_______________________________
_______________________________

**2.4** Will our data be shared with third parties (subprocessors)?
☐ Yes ☐ No

**If Yes, list all subprocessors**:
| Subprocessor Name | Location | Purpose | Data Shared |
|-------------------|----------|---------|-------------|
| | | | |
| | | | |
| | | | |

**2.5** Do you use our data to train AI/ML models?
☐ Yes ☐ No ☐ Not applicable

**If Yes, can we opt out?** ☐ Yes ☐ No

---

## Section 3: Security Certifications and Compliance

**3.1** Do you have any of the following certifications? (Check all that apply)
☐ SOC 2 Type II (provide date of most recent audit: _______________________)
☐ ISO 27001 (provide certificate number: _______________________)
☐ ISO 27017 (Cloud security)
☐ ISO 27018 (Privacy in cloud)
☐ PCI-DSS (if handling payment card data)
☐ FedRAMP (US government)
☐ HIPAA compliance (if handling health data)
☐ None of the above

**If you have certifications, can you provide copies?** ☐ Yes (attach) ☐ No

**3.2** Are you compliant with the following regulations? (Check all that apply)
☐ PDPA (Singapore Personal Data Protection Act)
☐ PDPA (Malaysia Personal Data Protection Act)
☐ GDPR (EU General Data Protection Regulation)
☐ CCPA (California Consumer Privacy Act)
☐ None of the above
☐ Not applicable (we don't handle personal data)

**3.3** Have you experienced a data breach in the past 3 years?
☐ Yes ☐ No

**If Yes:**
- When did the breach occur? _______________________________
- How many records were affected? _______________________________
- What caused the breach? _______________________________
- What remediation steps were taken? _______________________________

**3.4** Do you have cyber insurance?
☐ Yes ☐ No

**If Yes:**
- Coverage amount: $ _______________________________
- Insurer name: _______________________________

---

## Section 4: Access Control and Authentication

**4.1** How do your employees access our data?
☐ Web-based application (browser)
☐ API access
☐ SSH/remote desktop
☐ VPN
☐ Other (specify): _______________________________

**4.2** Do you require multi-factor authentication (MFA) for your employees?
☐ Yes, required for all employees
☐ Yes, required for admins only
☐ Optional (employees can choose to enable)
☐ No

**4.3** What MFA methods do you support? (Check all that apply)
☐ Authenticator app (Google Authenticator, Authy)
☐ Hardware security keys (YubiKey)
☐ SMS codes
☐ Email codes
☐ Biometrics (Face ID, Touch ID)
☐ None

**4.4** How often do you review and revoke access for employees who no longer need it?
☐ Immediately upon departure
☐ Within 24 hours
☐ Within 1 week
☐ Monthly
☐ Quarterly
☐ No formal process

**4.5** Do you implement role-based access control (RBAC)?
☐ Yes (employees only have access needed for their role)
☐ No (all employees have same access)

---

## Section 5: Data Encryption

**5.1** Is data encrypted in transit (when being transmitted over networks)?
☐ Yes ☐ No

**If Yes, what encryption protocol?**
☐ TLS 1.3
☐ TLS 1.2
☐ TLS 1.1 or older (not recommended)
☐ Other (specify): _______________________________

**5.2** Is data encrypted at rest (when stored on servers/databases)?
☐ Yes ☐ No

**If Yes, what encryption standard?**
☐ AES-256
☐ AES-128
☐ Other (specify): _______________________________

**5.3** Who manages the encryption keys?
☐ We manage our own keys (customer-controlled)
☐ Your company manages keys
☐ Cloud provider manages keys (AWS KMS, Azure Key Vault, etc.)

---

## Section 6: Infrastructure and Network Security

**6.1** Where is your infrastructure hosted?
☐ AWS (Amazon Web Services)
☐ Azure (Microsoft)
☐ Google Cloud Platform (GCP)
☐ On-premises data center
☐ Other cloud provider (specify): _______________________________

**6.2** Do you use a Web Application Firewall (WAF)?
☐ Yes ☐ No

**6.3** Do you perform regular vulnerability scanning?
☐ Yes, continuously (automated)
☐ Yes, monthly
☐ Yes, quarterly
☐ Yes, annually
☐ No

**6.4** Do you conduct penetration testing?
☐ Yes, annually by third-party
☐ Yes, internally
☐ No

**If Yes, when was the last penetration test?** _______________________________

**6.5** Do you have a bug bounty program?
☐ Yes (provide link): _______________________________
☐ No

---

## Section 7: Application Security

**7.1** Do you follow secure coding practices? (Check all that apply)
☐ Code reviews (peer review before merging)
☐ Static application security testing (SAST)
☐ Dynamic application security testing (DAST)
☐ Software composition analysis (SCA) - scans for vulnerable dependencies
☐ Security training for developers
☐ None of the above

**7.2** How often do you update dependencies to patch security vulnerabilities?
☐ Within 24 hours of critical vulnerability disclosure
☐ Within 1 week
☐ Monthly
☐ Quarterly
☐ Annually
☐ No formal process

**7.3** Do you maintain a Software Bill of Materials (SBOM)?
☐ Yes ☐ No

---

## Section 8: Backup and Disaster Recovery

**8.1** Do you maintain backups of our data?
☐ Yes ☐ No

**If Yes:**
- Backup frequency: ☐ Continuous ☐ Hourly ☐ Daily ☐ Weekly
- Backup retention: ☐ 7 days ☐ 30 days ☐ 90 days ☐ 1 year ☐ Other: _______
- Are backups encrypted? ☐ Yes ☐ No
- Are backups stored offsite/in separate region? ☐ Yes ☐ No

**8.2** Do you have a disaster recovery plan?
☐ Yes ☐ No

**If Yes:**
- Recovery Time Objective (RTO): _______________________________ (max downtime)
- Recovery Point Objective (RPO): _______________________________ (max data loss)
- When was DR plan last tested? _______________________________

**8.3** What is your uptime SLA (Service Level Agreement)?
☐ 99.9% (43 minutes downtime per month)
☐ 99.95% (22 minutes downtime per month)
☐ 99.99% (4 minutes downtime per month)
☐ 99.999% (26 seconds downtime per month)
☐ No SLA
☐ Other (specify): _______________________________

---

## Section 9: Incident Response

**9.1** Do you have a documented incident response plan?
☐ Yes ☐ No

**9.2** Do you have a Security Operations Center (SOC) or security team?
☐ Yes, 24/7 SOC
☐ Yes, business hours only
☐ No, we outsource to third party (specify): _______________________________
☐ No

**9.3** How will you notify us if there's a security incident affecting our data?
☐ Email (within how many hours? _______)
☐ Phone call (within how many hours? _______)
☐ Dashboard/portal notification
☐ Other (specify): _______________________________

**9.4** Will you notify us before notifying regulators or the public?
☐ Yes ☐ No ☐ Depends on legal requirements

**9.5** Do you maintain cyber insurance?
☐ Yes, coverage amount: $ _______________________________
☐ No

---

## Section 10: Employee Security

**10.1** Do you conduct background checks on employees before hiring?
☐ Yes, for all employees
☐ Yes, for employees with access to customer data
☐ No

**10.2** Do you provide security awareness training to employees?
☐ Yes, during onboarding
☐ Yes, annually
☐ Yes, continuously
☐ No

**10.3** Do you conduct phishing simulations for employees?
☐ Yes, regularly (monthly/quarterly)
☐ Yes, annually
☐ No

**10.4** How do you handle employee offboarding?
☐ Access revoked immediately upon departure
☐ Access revoked within 24 hours
☐ Access revoked within 1 week
☐ No formal process

---

## Section 11: Physical Security (if applicable)

**11.1** If you have physical data centers, what physical security measures are in place? (Check all that apply)
☐ 24/7 security guards
☐ Biometric access controls
☐ Video surveillance (CCTV)
☐ Mantrap/airlock entry
☐ Fire suppression system
☐ Redundant power (UPS, generators)
☐ Not applicable (cloud-hosted only, no physical data centers)

---

## Section 12: Monitoring and Logging

**12.1** Do you maintain audit logs of access to our data?
☐ Yes ☐ No

**If Yes:**
- Retention period: ☐ 30 days ☐ 90 days ☐ 1 year ☐ 2+ years
- Can we access these logs? ☐ Yes ☐ No ☐ Upon request

**12.2** Do you monitor for suspicious activity (SIEM/security monitoring)?
☐ Yes, 24/7
☐ Yes, business hours
☐ No

**12.3** Do you use intrusion detection/prevention systems (IDS/IPS)?
☐ Yes ☐ No

---

## Section 13: Data Privacy and Rights

**13.1** Can we request a copy of our data at any time?
☐ Yes, self-service (immediate)
☐ Yes, upon request (how long? _______)
☐ No

**13.2** Can we request deletion of our data?
☐ Yes, self-service (immediate)
☐ Yes, upon request (how long? _______)
☐ No

**13.3** If we terminate the contract, how is our data handled?
☐ Deleted immediately
☐ Deleted within 30 days
☐ Deleted within 90 days
☐ Available for export for _______ days, then deleted
☐ Retained indefinitely (not recommended)

**13.4** Do you have a Data Processing Agreement (DPA) available?
☐ Yes (attach) ☐ No ☐ Can provide upon request

**13.5** Do you have a publicly accessible Privacy Policy?
☐ Yes (provide URL): _______________________________
☐ No

---

## Section 14: Additional Information

**14.1** Have you completed security questionnaires from other customers?
☐ Yes, regularly
☐ Yes, occasionally
☐ No, this is our first

**14.2** Can you provide references from other customers regarding your security practices?
☐ Yes ☐ No

**If Yes, provide contact information**:
- Reference 1: _______________________________ Company: _______________________________ Email: _______________________________
- Reference 2: _______________________________ Company: _______________________________ Email: _______________________________

**14.3** Do you have a public security page or trust center?
☐ Yes (provide URL): _______________________________
☐ No

**14.4** Are you willing to sign a Business Associate Agreement (BAA) if required? (for HIPAA compliance)
☐ Yes ☐ No ☐ Not applicable

**14.5** Are you willing to undergo a third-party security audit at our request?
☐ Yes, at our expense
☐ Yes, at your expense
☐ No

**14.6** Additional comments or information:
_______________________________
_______________________________
_______________________________

---

## Section 15: Sign-Off

I certify that the information provided in this questionnaire is accurate and complete to the best of my knowledge.

**Name**: _______________________________
**Title**: _______________________________
**Signature**: _______________________________
**Date**: _______________________________

---

## Internal Use Only: Risk Assessment

**Completed by**: _______________________________ (Customer company)
**Date assessed**: _______________________________

### Risk Scoring

**Assign points for each factor (0 = high risk, 5 = low risk):**

| Factor | Score (0-5) | Notes |
|--------|-------------|-------|
| **Certifications** (SOC 2, ISO 27001) | | 0 = None, 3 = ISO only, 5 = SOC 2 Type II |
| **Data encryption** (at rest and in transit) | | 0 = No encryption, 3 = One, 5 = Both |
| **MFA enforcement** | | 0 = No MFA, 3 = Optional, 5 = Required |
| **Incident response plan** | | 0 = None, 3 = Basic, 5 = Comprehensive with 24/7 SOC |
| **Data location** (compliance with local laws) | | 0 = Unknown/non-compliant, 3 = Adequate, 5 = Ideal |
| **Breach history** | | 0 = Recent breach, 3 = Old breach with remediation, 5 = No breaches |
| **Access controls** (RBAC, least privilege) | | 0 = Poor, 3 = Adequate, 5 = Excellent |
| **Backup and DR** | | 0 = None, 3 = Basic, 5 = Comprehensive with tested DR |
| **Monitoring and logging** | | 0 = None, 3 = Basic, 5 = 24/7 SIEM |
| **Vulnerability management** | | 0 = None, 3 = Quarterly, 5 = Continuous |

**Total Score**: _____ / 50

### Risk Level

- **40-50 points**: **Low Risk** - Vendor demonstrates strong security practices. Standard contract terms acceptable.
- **25-39 points**: **Medium Risk** - Vendor has adequate security but gaps exist. Require improvements or additional contractual protections.
- **0-24 points**: **High Risk** - Vendor has significant security gaps. Consider alternative vendors OR require comprehensive security improvements before proceeding.

### Decision

Based on risk assessment:

☐ **APPROVED** - Proceed with standard contract
☐ **APPROVED WITH CONDITIONS** - Require the following improvements:
  1. _______________________________
  2. _______________________________
  3. _______________________________

☐ **REJECTED** - Security risks too high. Reasons:
  _______________________________
  _______________________________

☐ **FURTHER REVIEW NEEDED** - Request additional information:
  _______________________________
  _______________________________

**Approved by**: _______________________________ Title: _______________________________ Date: _______________________________

---

## Next Steps

**For approved vendors:**
1. ☐ Add to approved vendor list
2. ☐ Set up annual re-assessment: Due date _______________________________
3. ☐ File questionnaire in vendor management system
4. ☐ Sign Data Processing Agreement (DPA) if handling personal data
5. ☐ Grant access with appropriate restrictions (least privilege)
6. ☐ Add to quarterly access review schedule

**For vendors requiring improvements:**
1. ☐ Send list of required security improvements
2. ☐ Set deadline for implementation: _______________________________
3. ☐ Schedule follow-up review
4. ☐ Restrict access until improvements complete

---

## Related Documents

- **Security Policy**: templates/security-policy.md (Section 9: Vendor Management)
- **Cloud Security Guide**: guides/07-cloud-security.md (Part 3: Third-Party SaaS Security)
- **Compliance Guide**: COMPLIANCE.md (DPA and legal requirements)

---

**End of Vendor Security Questionnaire**

**Best practice**: Send this questionnaire during procurement process (before signing contract) and annually for existing vendors. Store completed questionnaires for 3-7 years (regulatory compliance).
