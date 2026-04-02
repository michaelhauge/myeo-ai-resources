# FAQ: 15 Common CISO Questions

**Quick answers to common security and compliance questions for SEA CISOs**

---

## 1. Do I need SOC 2 if I'm only selling to SMBs?

**Short answer**: No, but you need security policies and basic controls.

**Breakdown**:
- **SMB customers** ($10K-$50K ACVs): Ask for security questionnaire, not SOC 2
- **Mid-market** ($50K-$100K ACVs): 30-40% require SOC 2
- **Enterprise** ($100K+ ACVs): 80-90% require SOC 2

**What SMBs want**:
- Security policies (acceptable use, data handling, incident response)
- Basic controls (MFA, encryption, backups)
- Vendor security questionnaire responses

**When to get SOC 2**: When you're targeting $100K+ ACV deals and losing opportunities due to security requirements.

**Reality check**: If you're losing 5+ enterprise deals per quarter due to "no SOC 2", that's $500K-$2M in lost ARR. Get SOC 2.

**See also**: Part 5: Security Governance (policies without SOC 2)

---

## 2. How long does SOC 2 take and what does it cost?

**Short answer**: 90 days for Type 1, 12 months for Type 2. Cost: $50K-$100K.

**Breakdown**:

**SOC 2 Type 1** (point-in-time audit):
- Timeline: 90 days (with our sprint methodology)
- Cost: $50K-$100K
  - Tools (Vanta, Secureframe): $20K-$40K/year
  - Auditor: $15K-$30K
  - Security tools (MFA, logging, endpoint): $10K-$20K
  - Consulting (optional): $10K-$30K

**SOC 2 Type 2** (12-month audit):
- Timeline: 12-15 months total (3 months prep + 12 months observation + audit)
- Cost: $80K-$150K
  - Same tools as Type 1
  - Auditor: $30K-$60K (more expensive, 12-month audit)
  - Ongoing compliance: $20K-$40K

**Reality check**: Type 1 is enough for first enterprise deals. Upgrade to Type 2 when customers specifically require it (usually $500K+ ACV deals).

**See also**: 90-Day Security Sprint in README

---

## 3. What's the difference between SOC 2 and ISO 27001?

**Short answer**: SOC 2 is US-focused, ISO 27001 is global. Get SOC 2 first for SEA.

**Comparison**:

| Aspect | SOC 2 | ISO 27001 |
|--------|-------|-----------|
| Origin | US (AICPA) | International (ISO) |
| Focus | Cloud/SaaS security | Comprehensive ISMS |
| Audit | Annual | 3-year cycle |
| Cost | $50K-$100K | $80K-$150K |
| Timeline | 90 days (Type 1) | 6-12 months |
| Customer demand | 80% of US/SEA enterprises | 60% of EU enterprises |

**When to get SOC 2**:
- Selling to US or SEA enterprises
- Need to close deals quickly (90 days)
- Typical SaaS/cloud company

**When to get ISO 27001**:
- Selling to European enterprises (prefer ISO)
- Government/public sector contracts
- Want long-term certification (3 years vs annual)

**Reality check**: Most SEA startups get SOC 2 first ($5M-$15M ARR), then add ISO 27001 later ($15M+ ARR) when selling to EU.

**See also**: Part 2: Data Privacy (GDPR for EU customers)

---

## 4. How much does a data breach cost in SEA?

**Short answer**: $500K-$5M for $2M-$50M ARR companies.

**Cost breakdown**:

**Direct costs** ($200K-$1M):
- Forensics: $50K-$200K (investigate breach)
- Legal: $30K-$100K (notify customers, regulators)
- PR: $20K-$100K (damage control)
- Remediation: $50K-$200K (fix vulnerabilities)
- Fines: $10K-$500K (PDPA, GDPR violations)

**Indirect costs** ($300K-$4M):
- Customer churn: 30-60% of customers leave (trust lost)
  - Example: 40% churn × $5M ARR = $2M lost revenue
- Sales impact: 3-6 month sales freeze (no new deals while breach ongoing)
- Insurance: Premiums increase 50-200%
- Reputation: 2-5 years to rebuild brand

**Example** ($5M ARR SaaS company):
- Direct costs: $500K
- Customer churn: 40% × $5M = $2M
- Sales impact: 6 months × $500K = $3M (foregone growth)
- **Total impact**: $5.5M (more than 1 year's revenue)

**Reality check**: One breach can kill a $5M ARR startup. Invest $50K-$100K in security to avoid $5M breach.

**See also**: Part 4: Incident Response (breach preparation)

---

## 5. What are the 10 most important security controls?

**Short answer**: MFA, password manager, endpoint protection, logging, encryption, backups, inventory, incident response, policies, training.

**The 10 Core Controls**:

1. **MFA on all critical systems** (Google, AWS, GitHub, databases)
   - Cost: Free (Google Authenticator) or $5-$10/user/month (Duo, Okta)
   - Impact: Prevents 99.9% of account takeovers

2. **Password manager** (1Password, LastPass for all employees)
   - Cost: $5-$8/user/month
   - Impact: Eliminates weak/reused passwords

3. **Endpoint protection** (Crowdstrike, SentinelOne, Carbon Black)
   - Cost: $10-$30/endpoint/month
   - Impact: Blocks malware, ransomware

4. **Logging & monitoring** (Datadog, Splunk, ELK)
   - Cost: $100-$500/month
   - Impact: Detect breaches within hours (not months)

5. **Laptop encryption** (BitLocker for Windows, FileVault for Mac)
   - Cost: Free (built-in)
   - Impact: Protects data if laptop stolen

6. **Automated backups** (daily backups to separate AWS account)
   - Cost: $100-$500/month (S3, Glacier)
   - Impact: Recover from ransomware, data loss

7. **Systems inventory** (document all apps, services, databases)
   - Cost: $0 (use spreadsheet or Vanta/Secureframe)
   - Impact: Know what you're securing

8. **Incident response plan** (who to call, escalation path)
   - Cost: $0 (use our template)
   - Impact: Respond to breach in hours (not days)

9. **Security policies** (5-15 policies: acceptable use, data handling, etc.)
   - Cost: $0 (use our templates)
   - Impact: Pass security reviews, train employees

10. **Security awareness training** (KnowBe4, SecurityIQ)
    - Cost: $5-$15/user/year
    - Impact: Reduce phishing success by 80%

**Total cost**: $5K-$20K/year
**Impact**: 80-90% risk reduction

**See also**: 90-Day Security Sprint, Month 1 Week 3-4

---

## 6. Do I need a full-time CISO at $5M ARR?

**Short answer**: No, hire part-time or fractional CISO until $15M+ ARR.

**Hiring timeline**:

**$0-$5M ARR**: No dedicated security hire
- CTO or VP Eng owns security (10-20% of time)
- Use external: Fractional CISO ($5K-$15K/month part-time)
- Use tools: Vanta, Secureframe for compliance automation

**$5M-$15M ARR**: Fractional CISO or Security Engineer
- Fractional CISO: $10K-$20K/month (2-3 days/week)
- OR Security Engineer: $120K-$180K/year full-time
- Focus: SOC 2, security program, tooling

**$15M-$30M ARR**: Full-time CISO
- Salary: $200K-$300K/year (SEA market)
- Reports to: CEO or CTO
- Manages: 2-3 security engineers
- Focus: Governance, risk, compliance, vendor security

**$30M+ ARR**: Security team (CISO + 5-10 engineers)
- CISO + AppSec, SecOps, GRC, IR teams
- Budget: $1M-$3M/year (team + tools)

**Reality check**: Most SEA startups over-hire security too early. Fractional CISO is more cost-effective until $15M ARR.

**See also**: Part 5: Security Governance (build security program)

---

## 7. What's PDPA and how does it differ from GDPR?

**Short answer**: PDPA is Singapore's GDPR-equivalent. Similar requirements, lower fines.

**Comparison**:

| Aspect | PDPA (Singapore) | GDPR (EU) |
|--------|------------------|-----------|
| Scope | Singapore residents | EU residents |
| Consent | Opt-out (can collect by default) | Opt-in (must get consent) |
| Breach notification | 3 days to PDPC | 72 hours to authorities |
| Fines | Up to $1M or 10% turnover | Up to €20M or 4% revenue |
| Data portability | No | Yes |
| Right to be forgotten | No | Yes |

**Key differences**:
- PDPA is less strict (opt-out vs opt-in)
- GDPR has higher fines (4% global revenue vs 10% turnover)
- GDPR has more rights (portability, erasure)

**Do you need both?**
- PDPA: Yes if you have Singapore customers (mandatory)
- GDPR: Yes if you have EU customers (even 1 customer triggers GDPR)

**Compliance overlap**: 80% of GDPR requirements cover PDPA. If you're GDPR-compliant, you're mostly PDPA-compliant.

**See also**: Part 2: Data Privacy & Compliance

---

## 8. Can I use US-based SaaS tools or do I need SEA data residency?

**Short answer**: Depends on country and data type. Singapore/Malaysia: US OK. Indonesia/Vietnam: Local required.

**By country**:

**Singapore**: US tools OK
- PDPA allows overseas data transfer if adequate protection
- Exception: Government data (must stay in SG)
- Recommendation: Use AWS Singapore region when possible

**Malaysia**: US tools OK
- PDPA similar to Singapore
- Recommendation: Use AWS/GCP Malaysia region if available

**Indonesia**: Local storage required
- PP 71/2019: Personal data must be hosted in Indonesia
- Exception: Can use overseas with local mirror
- Recommendation: AWS Jakarta region mandatory

**Thailand**: US tools OK with consent
- PDPA 2022 allows transfer with user consent
- Government data: Must stay in Thailand
- Recommendation: AWS Bangkok region for Thai customers

**Vietnam**: Local storage for critical data
- Cybersecurity Law 2019: Critical data stays in Vietnam
- Foreign companies with >1M users: Must have local server
- Recommendation: Use local cloud provider or AWS Singapore with data replication

**Philippines**: US tools OK
- Data Privacy Act allows overseas transfer if adequate protection
- Less strict than Indonesia/Vietnam

**Reality check**: For most B2B SaaS, AWS Singapore region covers Singapore, Malaysia, Thailand, Philippines. Add AWS Jakarta for Indonesia. Vietnam is trickiest (consider local partner).

**See also**: SEA Data Residency section in README

---

## 9. How do I evaluate security of SaaS vendors we use?

**Short answer**: Use security questionnaire + check for SOC 2/ISO 27001. Don't trust marketing claims.

**The 3-tier vendor assessment framework**:

**Tier 1: Critical vendors** (access to production, customer data)
- Examples: AWS, database, auth provider, payment processor
- Assessment: Full security review
  - SOC 2 Type 2 or ISO 27001 (required)
  - 50-question security questionnaire
  - Penetration test report (if available)
- Review frequency: Annual

**Tier 2: Important vendors** (access to internal data, but not customer data)
- Examples: Slack, Notion, HR system, accounting software
- Assessment: Moderate review
  - SOC 2 Type 1 or equivalent
  - 25-question security questionnaire
- Review frequency: Every 2 years

**Tier 3: Low-risk vendors** (no access to sensitive data)
- Examples: Social media tools, analytics, marketing
- Assessment: Basic review
  - Check for basic security page
  - 10-question questionnaire
- Review frequency: Every 3 years or when contract renews

**Red flags** (don't use vendor if):
- No security certification (SOC 2, ISO 27001) for Tier 1 vendors
- Refuses to fill out security questionnaire
- Had recent breach (check Have I Been Pwned, Google news)
- Unclear where data is stored (won't answer data residency question)

**See also**: Part 3: Vendor Security Management, Template: Vendor Questionnaires

---

## 10. What should I do immediately after discovering a breach?

**Short answer**: Contain, investigate, notify. Follow your incident response plan (you do have one, right?).

**The 4-step breach response**:

**Step 1: Contain (Hour 0-2)**
- Isolate affected systems (shut down server, revoke credentials)
- Preserve evidence (snapshot VMs, save logs before they rotate)
- Assemble incident response team (CEO, CTO, Legal, PR)

**Step 2: Investigate (Hour 2-48)**
- Hire forensics firm ($50K-$200K): Determine scope, root cause
- Review logs (when breach started, what data accessed)
- Assess impact (how many customers affected, what data exposed)

**Step 3: Notify (Hour 48-72)**
- Notify regulators (PDPC within 3 days, GDPR within 72 hours)
- Notify affected customers (email, public statement)
- Notify partners (resellers, vendors who may be affected)

**Step 4: Remediate (Week 1-4)**
- Fix vulnerability (patch, reconfigure, rebuild)
- Reset passwords/credentials
- Monitor for reoccurrence (attackers often return)
- Conduct post-mortem (what went wrong, how to prevent)

**Legal requirements** (SEA):
- Singapore PDPA: Notify PDPC within 3 days if significant harm possible
- GDPR: Notify within 72 hours (if you have EU customers)
- Failure to notify: Additional fines ($100K-$500K)

**Reality check**: First 2 hours are critical. Have incident response plan ready before breach happens.

**See also**: Part 4: Incident Response, Template: Incident Response Playbooks

---

## 11. How much does cyber insurance cost and do I need it?

**Short answer**: $30K-$150K/year, highly recommended for $5M+ ARR companies.

**Cost factors**:
- Revenue: $5M ARR = $30K-$50K, $20M ARR = $80K-$150K
- Industry: Fintech/healthcare higher (2x), general SaaS lower
- Security posture: SOC 2 = 30-50% discount, no MFA = 2x premium
- Coverage: $1M limit = $30K, $5M limit = $100K

**What it covers**:
- Incident response: Forensics, legal, PR ($100K-$500K)
- Regulatory fines: PDPA, GDPR fines ($10K-$1M)
- Customer lawsuits: Class action defense ($500K-$5M)
- Business interruption: Lost revenue during downtime

**What it doesn't cover**:
- Ransomware payment (some policies exclude)
- Fines for gross negligence (no MFA, no patches)
- Reputational damage (indirect costs)

**When to get insurance**:
- $5M+ ARR: Highly recommended
- $10M+ ARR: Required by investors, customers
- $2M-$5M ARR: Optional but smart

**How to reduce premiums**:
- Get SOC 2 (30-50% discount)
- Implement MFA everywhere (20-30% discount)
- Have incident response plan (10-20% discount)
- Security awareness training (10% discount)

**Reality check**: Insurance won't prevent breach, but makes recovery much less painful. Think of it as "breach bankruptcy protection."

---

## 12. What's the difference between vulnerability scan and penetration test?

**Short answer**: Vuln scan is automated tool, pentest is manual hacker. Both are useful.

**Comparison**:

| Aspect | Vulnerability Scan | Penetration Test |
|--------|-------------------|------------------|
| Method | Automated tool | Manual testing by humans |
| Cost | $0-$500/month | $5K-$30K per test |
| Frequency | Continuous/weekly | Quarterly or annual |
| Depth | Shallow (finds known vulns) | Deep (finds novel exploits) |
| Output | List of CVEs | Exploitation path + proof |
| Time | Minutes-hours | 1-4 weeks |

**Vulnerability scanning** (Qualys, Tenable, Intruder):
- What: Automated tool scans for known vulnerabilities
- When: Run continuously or weekly
- Cost: $0-$500/month
- Output: List of CVE numbers, patches needed
- Good for: Ongoing monitoring, compliance requirement

**Penetration testing** (offensive security firms):
- What: Ethical hacker tries to break in
- When: Quarterly or before major release
- Cost: $5K-$30K (1-2 weeks of work)
- Output: Report showing how they broke in, what they accessed
- Good for: Pre-launch, major releases, annual audit

**What you need**:
- $2M-$5M ARR: Vulnerability scanning only
- $5M-$15M ARR: Vuln scanning + annual pentest
- $15M+ ARR: Vuln scanning + quarterly pentest

**Reality check**: Vulnerability scan is table stakes (continuous monitoring). Penetration test is nice-to-have until $5M+ ARR or before major product launch.

**See also**: Part 1: Security Assessment (vulnerability management)

---

## 13. How do I handle security for remote employees?

**Short answer**: VPN, MDM, endpoint protection, and clear BYOD policy.

**The 5 remote security controls**:

**1. VPN (Virtual Private Network)**
- Tool: WireGuard, Tailscale, or Cloudflare Zero Trust
- Cost: $5-$15/user/month
- Requirement: All remote employees must use VPN to access company resources
- Why: Encrypts traffic, prevents man-in-the-middle attacks on public WiFi

**2. MDM (Mobile Device Management)**
- Tool: Jamf (Mac), Intune (Windows), Kandji (Mac)
- Cost: $5-$15/device/month
- Requirement: All company laptops enrolled in MDM
- Features: Remote wipe, enforce encryption, push software updates

**3. Endpoint protection** (same as office)
- Tool: Crowdstrike, SentinelOne, Carbon Black
- Cost: $10-$30/endpoint/month
- Requirement: Must be installed, can't be disabled
- Why: Detects malware even when off-network

**4. MFA everywhere**
- Requirement: MFA on all work apps (Google, Slack, GitHub, AWS, etc.)
- No exceptions for remote workers
- Why: Prevent account takeover (phishing is easier when remote)

**5. BYOD (Bring Your Own Device) policy**
- Personal devices: Can access email/Slack (web only), no customer data
- Company devices: Required for engineers, product, anyone accessing production
- Hybrid: Separate work profile on personal phone (Android Work Profile, iOS MDM)

**Remote work security checklist**:
- [ ] VPN required for all company systems access
- [ ] MDM enrolled (company laptops only)
- [ ] Endpoint protection installed (can't disable)
- [ ] MFA enabled on all critical apps
- [ ] Security training covers remote risks (public WiFi, phishing, home network security)
- [ ] Clear BYOD policy (what's allowed, what's not)

**Reality check**: Remote work doesn't reduce security if you have right controls. Many breaches happen from office networks too.

**See also**: Part 5: Security Governance (remote work policy)

---

## 14. What's the best way to securely store API keys and secrets?

**Short answer**: Use secrets manager (AWS Secrets Manager, HashiCorp Vault). Never hardcode in code.

**The secrets hierarchy** (from worst to best):

**❌ Hardcoded in code** (NEVER DO THIS)
```javascript
const API_KEY = "sk-test123456789"; // WRONG
```
- Why bad: Committed to git, visible in GitHub, anyone with repo access has key
- How it leaks: Public GitHub repos, former employees, screenshots

**❌ .env file committed to git** (NEVER DO THIS)
```bash
# .env
API_KEY=sk-test123456789
```
- Why bad: Still in git history even if you delete it later
- How it leaks: Public repos, git history scraping

**✅ .env file gitignored** (OK for dev, NOT for prod)
```bash
# .env (add to .gitignore)
API_KEY=sk-test123456789
```
- Why OK: Not in git
- Why not great: Stored in plain text on laptop, no rotation, hard to audit

**✅✅ Environment variables (BETTER for prod)
```bash
# Set in Vercel, Heroku, Railway UI
export API_KEY=sk-test123456789
```
- Why better: Not in code, different per environment (dev/staging/prod)
- Why not perfect: Still stored in plain text in deployment platform

**✅✅✅ Secrets manager (BEST for prod)**
```javascript
// Fetch from AWS Secrets Manager at runtime
const secret = await secretsManager.getSecretValue({
  SecretId: 'prod/api-keys/stripe'
}).promise();
const API_KEY = JSON.parse(secret.SecretString).STRIPE_KEY;
```
- Why best: Encrypted at rest, audit log, automatic rotation, fine-grained access control
- Tools: AWS Secrets Manager, GCP Secret Manager, HashiCorp Vault, Doppler

**Best practices**:
- Development: .env file (gitignored)
- Staging/Production: Secrets manager
- Never commit: Add .env to .gitignore from Day 1
- Rotate regularly: Change API keys every 90 days (or when employee leaves)
- Least privilege: Only give production access to who needs it

**See also**: Part 1: Security Assessment (secrets management)

---

## 15. How do I prepare for a SOC 2 audit? What evidence do auditors need?

**Short answer**: 6 months of logs, screenshots of controls, policy documents. Use Vanta/Secureframe to automate evidence collection.

**The 5 types of evidence auditors want**:

**1. Policies & procedures** (documents)
- What: 15 security policies (acceptable use, incident response, data handling, etc.)
- Format: PDF signed by CEO or CISO
- Where: Use our templates, customize for your company
- Review: Annually (update version, re-sign)

**2. System screenshots** (prove controls exist)
- Examples:
  - MFA enabled on AWS (screenshot of IAM settings)
  - Encryption enabled on databases (screenshot of RDS config)
  - Logging enabled (screenshot of CloudWatch/Datadog)
- When: Take screenshots during audit period (don't backdate)
- Tools: Vanta/Secureframe automate this (connect AWS, auto-screenshot)

**3. Audit logs** (prove controls work)
- Examples:
  - Access logs (who logged into production in last 6 months)
  - Change logs (who made changes to infrastructure)
  - Failed login attempts (MFA working)
- Retention: Keep 12 months minimum (SOC 2 Type 2 requires)
- Tools: CloudTrail (AWS), Stackdriver (GCP), Azure Monitor

**4. Training records** (prove employees trained)
- What: Security awareness training completion certificates
- When: All employees within 30 days of hire, annual refresh
- Tool: KnowBe4, SecurityIQ (auto-generates certificates)
- Evidence: Spreadsheet with employee name, training date, completion %

**5. Vendor assessments** (prove third-party security)
- What: Security questionnaires for critical vendors (Tier 1)
- When: Annual review
- Evidence: Completed questionnaire + vendor SOC 2 report
- Tools: Our vendor questionnaire template

**SOC 2 audit timeline**:
- Month 1-3: Implement controls, document policies
- Month 4-6: Collect evidence (logs, screenshots, training records)
- Month 7: Auditor reviews evidence
- Month 8: Fix findings (typically 5-10 items)
- Month 9: Receive SOC 2 report

**Evidence collection automation**:
- Vanta: $2K-$4K/month, connects to AWS/GCP/GitHub, auto-collects evidence
- Secureframe: $2K-$3K/month, similar to Vanta
- Drata: $2K-$3K/month, compliance automation platform
- DIY: $0, but requires 10-20 hours/week manual work

**Reality check**: Use Vanta/Secureframe if budget allows. Manual evidence collection is painful and error-prone.

**See also**: 90-Day Security Sprint, Month 3 (audit preparation)

---

## Summary

**Top 5 takeaways**:

1. **Get SOC 2 when targeting enterprise** ($100K+ ACVs). Before that, focus on policies and basic controls.

2. **10 Core Controls cover 80% of risk**: MFA, password manager, endpoint protection, logging, encryption, backups, inventory, incident response, policies, training. Cost: $5K-$20K/year.

3. **SEA data residency varies by country**: Singapore/Malaysia = US OK, Indonesia/Vietnam = local required. Use AWS regions accordingly.

4. **Breach costs $500K-$5M** for $2M-$50M ARR companies. Invest $50K-$100K in security to avoid $5M breach.

5. **90-Day Security Sprint** gets you to SOC 2 Type 1. Month 1 (10 controls), Month 2 (policies), Month 3 (audit).

**Next steps**:
- Start with Part 1: Security Assessment (identify your risks)
- Implement 10 Core Controls (Month 1 of Sprint)
- Copy-paste security policies (use our templates)
- Hire auditor when ready for SOC 2 (Month 3 of Sprint)
