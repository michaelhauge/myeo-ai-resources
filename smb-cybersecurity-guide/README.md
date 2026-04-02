# SMB Cybersecurity Guide

**Practical cybersecurity for small and medium businesses without an IT department**

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

A comprehensive, non-technical guide to protecting your business from cyber threats. Implement enterprise-grade security in 90 days with affordable tools and clear step-by-step instructions.

---

## The Problem

**Most small businesses are dangerously vulnerable to cyberattacks:**

- 43% of cyberattacks target small businesses
- Average cost of a small business data breach: **$200,000**
- 60% of small businesses **close within 6 months** of a cyberattack
- 68% of small business owners feel vulnerable to cyber threats
- Only 14% rate their ability to mitigate cyber risks as "highly effective"

**Common vulnerabilities:**
- Weak passwords (81% of breaches involve weak or stolen passwords)
- No multi-factor authentication (MFA)
- Employee clicking phishing emails (91% of attacks start with email)
- No backup (ransomware can wipe everything)
- Unsecured devices and networks
- No incident response plan

Most business owners know they need better security, but don't know where to start or can't afford a dedicated IT team.

---

## The Solution: 90-Day Security Roadmap

This guide provides a **phased approach** to securing your business:

### Phase 1: Quick Wins (Week 1-2)
**Impact: 80% risk reduction**

✅ Password manager rollout
✅ Multi-factor authentication (MFA)
✅ Basic phishing training
✅ Inventory your devices and accounts

**Time**: 8-12 hours
**Cost**: $5-8/user/month
**Result**: Blocks most common attacks

### Phase 2: Core Security (Week 3-4)
**Impact: Additional 15% risk reduction**

✅ Endpoint protection on all devices
✅ Email security setup
✅ Full disk encryption
✅ Wi-Fi and network security

**Time**: 12-16 hours
**Cost**: $10-15/user/month
**Result**: Hardened infrastructure

### Phase 3: Resilience (Month 2)
**Impact**: 100% recovery capability

✅ Backup and recovery system
✅ Security policies and documentation
✅ Employee onboarding/offboarding procedures
✅ Phishing simulation program

**Time**: 16-20 hours
**Cost**: $15-20/user/month
**Result**: Can recover from attacks

### Phase 4: Ongoing (Month 3+)
**Impact**: Stay secure over time

✅ Regular security training
✅ Quarterly security audits
✅ Incident response testing
✅ Compliance as needed (PDPA, GDPR, PCI-DSS)

**Time**: 4 hours/month
**Cost**: Same as Phase 3
**Result**: Continuous protection

---

## Who This Is For

This guide is designed for:

✅ **Business owners** with 5-200 employees
✅ **Non-technical leaders** (no IT background required)
✅ **Limited budgets** ($50-500/month for security)
✅ **Mix of office and remote workers**
✅ **Common SaaS tools** (Google Workspace, Microsoft 365, Slack)
✅ **Singapore/Malaysia businesses** (PDPA compliance included)

---

## Who This Is NOT For

This guide may not be suitable if you:

❌ Have a dedicated IT security team
❌ Need full compliance (SOC 2, ISO 27001, FedRAMP)
❌ Work in heavily regulated industries (healthcare with PHI, finance with PCI Level 1)
❌ Have >500 employees (enterprise-scale needs)

For these scenarios, consider hiring a specialized security consultant or CISO.

---

## Quick Decision Tree

**Where should I start?**

```
START: How secure are you today?

├─ "We've been breached or suspect we have"
│  └─ Go to: Incident Response Guide (guides/08-incident-response.md)
│     Action: First 24 hours protocol
│
├─ "We have nothing in place"
│  └─ Go to: Assessment Guide (guides/01-assessment.md)
│     Then: Follow 90-Day Roadmap starting at Week 1
│
├─ "We have passwords and maybe some antivirus"
│  └─ Go to: Assessment Guide (guides/01-assessment.md)
│     Then: Likely start at Week 2-3
│
└─ "We're pretty secure, just need to validate"
   └─ Go to: Assessment Guide (guides/01-assessment.md)
      Action: Get security score, fill gaps, consider compliance
```

---

## Documentation Structure

### 📊 Core Guides

| Guide | Description | Time | Priority |
|-------|-------------|------|----------|
| [TOOLS.md](TOOLS.md) | Security tool comparison matrix (with 2026 pricing) | 30 min | High |
| [COMPLIANCE.md](COMPLIANCE.md) | PDPA, GDPR, PCI-DSS, HIPAA basics | 45 min | Medium |
| [FAQ.md](FAQ.md) | Common questions answered | 15 min | High |

### 📖 Implementation Guides

**Complete guides** with step-by-step instructions, ROI, and real-world examples:

| # | Guide | What You'll Learn | ROI | Priority |
|---|-------|-------------------|-----|----------|
| 01 | [Security Assessment](guides/01-assessment.md) | Assess current security posture, create 90-day plan | - | **START HERE** |
| 02 | [Passwords & Access](guides/02-passwords-access.md) | Password managers, MFA, SSO, least privilege | 80% ↓ account compromise | **Week 1** |
| 03 | [Email & Phishing](guides/03-email-phishing.md) | Phishing prevention, email security, DMARC | 70% ↓ phishing success | **Week 1-2** |
| 04 | [Device Security](guides/04-device-security.md) | Endpoint protection, encryption, MDM, patching | 60% ↓ device breaches | **Week 3** |
| 05 | [Network Security](guides/05-network-security.md) | VPN, firewall, Wi-Fi, home office security | 50% ↓ network intrusion | **Week 3-4** |
| 06 | [Backup & Recovery](guides/06-backup-recovery.md) | 3-2-1 rule, cloud backup, disaster recovery, testing | 100% ransomware recovery | **Month 2** |
| 07 | [Cloud Security](guides/07-cloud-security.md) | Google/M365 hardening, SaaS auditing, shadow IT | 40% ↓ cloud compromise | **Month 2** |
| 08 | [Incident Response](guides/08-incident-response.md) | Breach detection, first 24 hours, recovery | 50% ↓ breach costs | **Month 2-3** |

### 🛠️ Tools & Templates

**Ready-to-use resources** for your business:

| Template | Description | Use Case |
|----------|-------------|----------|
| [Security Policy](templates/security-policy.md) | Company-wide security acceptable use policy | Required for all employees |
| [Onboarding Checklist](templates/onboarding-checklist.md) | New employee security setup | Every new hire |
| [Offboarding Checklist](templates/offboarding-checklist.md) | Employee departure security | Every departure |
| [Vendor Questionnaire](templates/vendor-questionnaire.md) | Third-party security assessment | Before signing vendor contracts |
| [Incident Response Playbook](templates/incident-response.md) | Breach response checklist | When you're breached |

### 🤖 Scripts

| Script | Description | Usage |
|--------|-------------|-------|
| [security-audit.py](scripts/security-audit.py) | Interactive security assessment tool | `python3 scripts/security-audit.py --interactive` |
| [password-audit.sh](scripts/password-audit.sh) | Password strength checker | `bash scripts/password-audit.sh` |

---

## Expected Results

By following this guide, expect:

### Security Improvements
- **Week 1-2**: 80% reduction in common attack vectors
- **Month 1**: 95% reduction in successful breaches
- **Month 2**: 100% recovery capability from ransomware
- **Month 3+**: Continuous protection and compliance readiness

### Cost Savings
- **Prevent breaches**: Avoid $200K average breach cost
- **Lower insurance**: Cyber insurance premiums 20-40% lower
- **Productivity**: 5-10 hours/month saved on security issues
- **Peace of mind**: Sleep better knowing you're protected

### Business Benefits
- Customer trust (show you take security seriously)
- Compliance readiness (PDPA, GDPR when needed)
- Competitive advantage (security as differentiator)
- Scalable security (grows with your business)

### Total Investment

| Expense | Monthly Cost |
|---------|--------------|
| Password manager | $5-8/user |
| Endpoint protection | $5-12/user |
| Email security | $0-5/user (often included) |
| Backup | $7-9/month |
| VPN (if needed) | $0-8/user |
| Security training | $1.50/user ($18/year) |
| **Total** | **$18-45/user/month** |

**For 20 employees**: $360-900/month vs. $200,000 breach cost = **444x ROI**

---

## Common Questions

### "How much should I budget for security?"

**Minimum**: $15-20/user/month (passwords, antivirus, backup)
**Recommended**: $30-45/user/month (add VPN, training, MDM)
**Industry benchmark**: 3-7% of IT budget

For a 20-person company:
- **Year 1**: $7,200-10,800 (includes setup time)
- **Year 2+**: $3,600-5,400 (ongoing only)

### "Do I need a dedicated IT person?"

**Not for 5-50 employees**. This guide is designed for non-technical owners to implement security themselves. Budget 2-4 hours/week initially, then 1-2 hours/week ongoing.

**For 50-200 employees**, consider a part-time IT person or fractional CIO to manage day-to-day.

### "What's the #1 thing I should do first?"

**Password manager + MFA** on all critical accounts. This alone prevents 80% of attacks and takes 2-4 hours to implement.

**See**: [Passwords & Access Guide](guides/02-passwords-access.md)

### "Is free antivirus enough?"

**No**. Free consumer antivirus:
- Lacks endpoint management (can't see all devices)
- No centralized control
- Limited or no support
- Often sells your data

Business endpoint protection costs $5-12/user/month and provides:
- Central management console
- Real-time threat protection
- Support when you need it
- Compliance reporting

**See**: [Device Security Guide](guides/04-device-security.md)

### "How do I know if I've been hacked?"

**Red flags**:
- Unexpected password reset emails
- Unauthorized charges or transactions
- Files encrypted or renamed (ransomware)
- Customers reporting phishing emails from you
- Slow computers or network
- Pop-ups or unfamiliar browser extensions

**If you see any of these**: [Incident Response Guide](guides/08-incident-response.md) (first 24 hours)

---

## Real-World Results: What Actually Happens

These are composite case studies based on real patterns from SEA small businesses implementing cybersecurity. Names and details are anonymized.

### Case Study 1: Malaysian Retail Chain (35 Employees, 4 Locations)

**Company**: Fashion retailer with 4 stores in KL and Penang, plus Shopee/Lazada e-commerce. 35 employees across retail, warehouse, and admin. No IT person — the owner's nephew "handled tech."

**The problem**: A ransomware attack encrypted the POS system and inventory database on a Friday evening. Attackers demanded RM 50,000 (~$11K USD). No backups existed. The owner lost 3 days of sales ($8K revenue) while scrambling to recover.

**What they tried**: After the attack, followed the 90-Day Security Roadmap. Started with Phase 1 (password manager + MFA) and Phase 3 (backup system). Budget: RM 2,500/month (~$550 USD) for 35 users.

**What went wrong**:
- Password manager rollout was chaotic — store staff shared one login for the POS system (4 people, 1 password). The password manager required individual accounts, which meant creating email accounts for every staff member first ($6/user/month for Google Workspace, unplanned)
- MFA caused daily frustration at the stores — staff forgot phones, ran out of battery, or couldn't receive SMS in the basement stockroom. Switched from SMS MFA to hardware security keys (YubiKey, $25 each) for POS terminals after 3 weeks of complaints
- The backup system worked perfectly for 6 weeks, then silently failed because the cloud storage filled up (free tier). Nobody noticed for 2 weeks until a manual check
- Staff ignored phishing training — retail employees considered it "not my job." The owner had to make it mandatory and tie it to quarterly bonuses to get 80% completion

**Actual results** (Month 3):
- All 4 POS systems on individual accounts with MFA (hardware keys at registers)
- Automated nightly backups to Backblaze B2 ($7/month, 500GB) with email alerts
- Password manager adopted by admin staff (12/12) but only 15/23 retail staff
- No security incidents in 90 days (previously: 3 phishing attempts, 1 ransomware)
- Cost: RM 2,800/month (~$620) including Google Workspace, Backblaze, endpoint protection
- But: Retail staff adoption is still a struggle — some share passwords verbally despite the policy

**Key takeaway**: For retail/multi-location businesses, hardware security keys work better than phone-based MFA for shared terminals. Budget for Google Workspace or Microsoft 365 first — you can't do password managers or MFA without individual email accounts for every employee.

---

### Case Study 2: Singapore Professional Services Firm (18 Employees)

**Company**: Recruitment agency placing candidates in banking and tech. 18 employees, all office-based. Handles sensitive candidate data (resumes, salary details, work permits, NRIC numbers) — a PDPA compliance obligation.

**The problem**: A recruiter fell for a phishing email disguised as a LinkedIn InMail. The attacker gained access to the recruiter's Google Workspace account, downloaded 2,000+ candidate resumes with personal details, and sent phishing emails to 300 candidates from the compromised account. Several candidates reported the breach to PDPC.

**What they tried**: After the incident, engaged a small cybersecurity consultancy ($5K for incident response), then implemented the 90-Day Roadmap. Prioritized email security (DMARC, SPF, DKIM), MFA, and employee training.

**What went wrong**:
- PDPC investigation was stressful and expensive — legal counsel cost $15K for the mandatory data breach notification. The fine was $20K (low end, but still painful for a small firm)
- Email security setup (DMARC) broke outgoing emails for 2 days because the DNS records were misconfigured — clients and candidates couldn't receive emails during a critical hiring week
- Advanced phishing simulation revealed that 6 of 18 employees (33%) clicked malicious links in the first test. Three were senior recruiters. The owner was shocked — these were experienced professionals
- Google Workspace Advanced Protection required hardware security keys ($25 each) — staff initially resisted carrying "another thing" until the owner demonstrated how easy it was

**Actual results** (Month 3):
- DMARC/SPF/DKIM fully configured (no more spoofed emails from their domain)
- MFA on all accounts (hardware keys for all 18 staff after initial resistance)
- Phishing click rate: 33% → 6% after 3 rounds of simulation training
- Google Workspace security settings hardened (OAuth app restrictions, mobile device management)
- PDPA compliance documentation completed (data inventory, processing activities, retention policy)
- Cost: $380/month ongoing (endpoint protection, backup, security training platform)
- But: The PDPC fine and legal costs totaled $40K — a painful lesson that could have been prevented with $4K/year in security tools

**Key takeaway**: The cost of a breach ($40K+ in fines, legal, and remediation for this small firm) dwarfs the cost of prevention ($4-5K/year). If you handle personal data (recruiters, accountants, healthcare), PDPA compliance isn't optional — and the PDPC will investigate if candidates or customers report you.

---

### Cross-Case Patterns

| Pattern | Evidence |
|---------|----------|
| Individual accounts are a prerequisite | MY: had to create Google Workspace accounts before password manager; SG: needed per-user accounts for MFA |
| Staff adoption requires incentives | MY: tied training to bonuses; SG: owner demonstrated security keys personally |
| Backup systems fail silently | MY: cloud storage filled up, nobody noticed for 2 weeks |
| Phishing hits experienced people too | SG: senior recruiters clicked 33% of test phishing; not just "naive" staff |
| Breach costs dwarf prevention costs | SG: $40K breach vs $5K/year prevention; MY: $8K lost revenue from 3-day ransomware |

---

## What Goes Wrong and How to Fix It

### "Staff refuse to use the password manager — they say it's too complicated"

**Symptom**: You rolled out 1Password or Bitwarden, but staff continue using their old passwords, sticky notes, or browser-saved passwords. Adoption is below 50%.

**Likely cause**: Staff see the password manager as extra work, not as something that makes their life easier. The initial setup (importing passwords, learning the interface) is a friction barrier.

**Fix**:
1. Do a 30-minute hands-on session (not a video — actually sit with each person and set up their vault)
2. Start with one use case they care about (e.g., "never type your Shopee seller login again")
3. Disable browser password saving on company devices (forces usage)
4. Make it the CEO's tool first — if the boss uses it, staff follow

**Prevention**: Roll out to the most tech-savvy 3-4 employees first. Let them become advocates. Then roll out company-wide with peer support, not top-down mandates.

---

### "We got hit by ransomware — are our backups safe?"

**Symptom**: Files are encrypted, ransom note demands payment, and you're not sure if your backups are intact or if the attacker also encrypted those.

**Likely cause**: Ransomware increasingly targets backup files and connected drives. If your backup drive was connected to the infected machine, it may also be encrypted.

**Fix**:
1. **Do NOT pay the ransom** — there's no guarantee you'll get your data back, and it funds more attacks
2. Disconnect all affected machines from the network immediately (Wi-Fi and ethernet)
3. Check cloud backups from a clean device (phone or unaffected computer) — cloud backups (Backblaze, Google Drive) are usually safe because they require separate authentication
4. If backups are intact: wipe affected machines, reinstall OS, restore from backup
5. If no backups exist: contact a data recovery specialist ($2K-$10K) — not guaranteed but sometimes possible

**Prevention**: Follow the 3-2-1 rule: 3 copies of data, on 2 different media types, with 1 offsite (cloud). Test your backup restoration monthly — a backup you've never tested is not a backup. Use immutable backups (Backblaze B2 with Object Lock) so ransomware can't delete them.

---

### "I completed the assessment and scored 25/100 — should I panic?"

**Symptom**: Your security assessment score is alarmingly low. You feel like everything needs to be fixed immediately and the task is overwhelming.

**Likely cause**: Most small businesses with no formal security program score 15-35/100 on first assessment. This is normal. The score reflects the absence of formal controls — not that you're actively being attacked.

**Fix**:
1. Don't try to fix everything at once — prioritize by impact
2. Focus on Phase 1 Quick Wins first: password manager + MFA alone can take you from 25 to 50/100
3. Schedule improvements over 90 days, not 9 days
4. Track your score weekly — seeing 25 → 35 → 50 → 65 is motivating

**Prevention**: Reframe the score as a starting point, not a judgment. Every business starts somewhere. A company at 25/100 that improves to 70/100 in 90 days is in a much better position than one that scores 60/100 and never improves.

---

### "Our cyber insurance application was denied — what now?"

**Symptom**: You applied for cyber insurance and the insurer said you don't meet their minimum security requirements, or quoted a premium that's 3-4x what you expected.

**Likely cause**: Cyber insurers now require basic security controls (MFA, endpoint protection, backups, employee training) before issuing policies. If you can't demonstrate these, you'll be denied or face very high premiums.

**Fix**:
1. Ask the insurer exactly which controls they require — most provide a checklist
2. Implement Phase 1 and Phase 2 of this guide (typically 30 days) — this usually meets insurer minimums
3. Re-apply with evidence (screenshots of MFA setup, backup configuration, endpoint protection console)
4. Shop around — requirements vary between insurers. Try CyberEdge, Coalition, or Chubb

**Prevention**: Implement basic security controls before applying for insurance. Having MFA, endpoint protection, and automated backups typically reduces premiums by 30-50% and avoids denial. Think of it like car insurance — having a clean driving record gets you better rates.

---

## Next Steps

Choose your path based on your situation:

### Path A: Emergency (Suspected Breach)
1. **Right now**: [Incident Response Guide](guides/08-incident-response.md)
2. Contain the damage (disconnect affected systems)
3. Contact cyber insurance and legal counsel
4. After recovery: Follow Path B

### Path B: Starting from Scratch (90-Day Plan)
1. **Day 1**: [Security Assessment](guides/01-assessment.md) → Get security score
2. **Week 1-2**: [Passwords & Access](guides/02-passwords-access.md) + [Email Security](guides/03-email-phishing.md)
3. **Week 3-4**: [Device Security](guides/04-device-security.md) + [Network Security](guides/05-network-security.md)
4. **Month 2**: [Backup & Recovery](guides/06-backup-recovery.md) + [Cloud Security](guides/07-cloud-security.md)
5. **Month 3**: [Incident Response](guides/08-incident-response.md) + ongoing monitoring

### Path C: Already Secure (Validation)
1. **Day 1**: [Security Assessment](guides/01-assessment.md) → Get security score
2. Review gaps identified in assessment
3. Fill specific gaps (use relevant guides)
4. Consider compliance: [COMPLIANCE.md](COMPLIANCE.md)
5. Setup ongoing monitoring and training

---

## Related Guides

This guide complements other **MyEO AI** resources:

- **[AI Implementation Playbook](../ai-implementation-playbook/)** - AI tools data classification aligns with security tiers
- **[SaaS Optimization Guide](../saas-optimization-guide/)** - SaaS audit includes security review and vendor assessment
- **[CRM Migration Guide](../crm-migration-guide/)** - CRM security considerations during migration
- **[n8n SEA Guide](../n8n-sea-guide/)** - Automation security best practices and secrets management

---

## Contributing

This guide is maintained by **MyEO AI** for the EO/YPO community. We welcome feedback and contributions:

- **Found an error?** Open an issue or submit a PR
- **Tool pricing outdated?** Let us know the current pricing
- **Want to suggest a new section?** Contact us

---

## License

This guide is licensed under the [MIT License](../LICENSE). You're free to use, modify, and distribute it with attribution.

---

**Last Updated**: February 2026
**Version**: 1.0
**Maintained by**: MyEO AI

**Questions?** Email: hello@myeo.ai
