# Security Assessment Guide

**Evaluate your current security posture and create a personalized 90-day plan**

---

## What You'll Learn

- How to assess your company's security across 8 critical categories
- Calculate your security score (0-100)
- Identify your biggest vulnerabilities
- Create a prioritized 90-day action plan

**Time Required**: 1-2 hours
**Difficulty**: Easy (no technical knowledge required)
**Output**: Security score + personalized roadmap

---

## Why Assessment Matters

**You can't secure what you don't measure.**

Most small businesses don't know:
- Which accounts lack MFA
- Whether backups actually work
- Which employees can access sensitive data
- Whether devices are encrypted

This assessment gives you:
- ✅ Clear baseline of current security
- ✅ Prioritized list of fixes (high impact first)
- ✅ Specific action items (not vague "improve security")
- ✅ Progress tracking over time

---

## Assessment Categories

This assessment covers 8 critical security areas:

| # | Category | Focus | Weight |
|---|----------|-------|--------|
| 1 | **Access & Authentication** | Passwords, MFA, access control | 20% |
| 2 | **Email & Phishing** | Email security, phishing protection | 15% |
| 3 | **Device Security** | Endpoint protection, encryption | 15% |
| 4 | **Network Security** | VPN, firewall, Wi-Fi | 10% |
| 5 | **Backup & Recovery** | Backup systems, disaster recovery | 15% |
| 6 | **Cloud & SaaS** | Cloud tool security, shadow IT | 10% |
| 7 | **Policies & Training** | Security policies, employee awareness | 10% |
| 8 | **Monitoring & Response** | Logging, incident response | 5% |

---

## How to Complete the Assessment

### Step 1: Print This Guide or Use a Spreadsheet

Create a spreadsheet with columns:
- Category
- Question
- Answer (Yes/No/Partial)
- Score (points awarded)
- Notes

### Step 2: Answer Each Question Honestly

**Scoring**:
- **Yes** (✅): Full points
- **Partial** (⚠️): Half points (you're working on it or it's incomplete)
- **No** (❌): 0 points

**Don't cheat** - this is for your benefit. Overscoring means you miss critical vulnerabilities.

### Step 3: Calculate Your Total Score

Add up points across all categories.

**Maximum possible**: 100 points

### Step 4: Review Your Results

Your score indicates:
- **80-100 points**: Excellent (maintain + compliance focus)
- **60-79 points**: Good (fill specific gaps)
- **40-59 points**: Needs Work (follow 90-day plan)
- **0-39 points**: Critical (immediate action required)

---

## 1. Access & Authentication (20 points max)

**Why this matters**: 81% of breaches involve weak or stolen passwords. This is your #1 priority.

### Questions

**Q1.1: Do you use a password manager for business passwords?** (4 points)
- ✅ Yes, all employees use password manager (1Password, Bitwarden, etc.)
- ⚠️ Partial, some employees use one
- ❌ No, people manage their own passwords

**Q1.2: Are strong, unique passwords required?** (2 points)
- ✅ Yes, enforced via password manager
- ⚠️ Yes, but not consistently enforced
- ❌ No, people choose their own

**Q1.3: Is MFA enabled on email accounts (Gmail, Outlook)?** (4 points)
- ✅ Yes, required for all employees
- ⚠️ Yes, for some employees (managers, IT)
- ❌ No

**Q1.4: Is MFA enabled on critical business accounts?** (3 points)
- ✅ Yes, on banking, payroll, accounting, admin tools
- ⚠️ Yes, on some accounts
- ❌ No

**Q1.5: Is MFA enabled on admin/privileged accounts?** (3 points)
- ✅ Yes, all admin accounts require MFA
- ⚠️ Some admin accounts have MFA
- ❌ No

**Q1.6: Do you use SSO (Single Sign-On) for business apps?** (2 points)
- ✅ Yes, centralized login for most/all apps
- ⚠️ Yes, for some apps
- ❌ No

**Q1.7: Do you follow principle of least privilege (access controls)?** (2 points)
- ✅ Yes, employees only have access they need
- ⚠️ Mostly, but some over-permission
- ❌ No, most people have admin or broad access

**Category 1 Score**: _____ / 20 points

**Action items if you scored <15**:
1. Implement password manager (Week 1) - [See guide](02-passwords-access.md)
2. Enable MFA on all email accounts (Week 1)
3. Enable MFA on financial/admin accounts (Week 2)

---

## 2. Email & Phishing (15 points max)

**Why this matters**: 91% of cyberattacks start with a phishing email.

### Questions

**Q2.1: Do you have email security filtering beyond basic (Gmail/Outlook)?** (3 points)
- ✅ Yes, advanced filtering (Mimecast, Proofpoint) or ATP add-on
- ⚠️ Using built-in protection with DMARC/DKIM/SPF configured
- ❌ No, just default Gmail/Outlook filtering

**Q2.2: Is DMARC configured for your domain?** (2 points)
- ✅ Yes, DMARC policy set to reject/quarantine
- ⚠️ DMARC set to monitor only
- ❌ No DMARC

**Q2.3: Have employees received phishing awareness training?** (4 points)
- ✅ Yes, formal training + regular phishing simulations
- ⚠️ Yes, basic training (one-time or informal)
- ❌ No formal training

**Q2.4: Do you run phishing simulation tests?** (3 points)
- ✅ Yes, monthly or quarterly automated tests
- ⚠️ Yes, but infrequent or manual
- ❌ No phishing simulations

**Q2.5: Is there a process to report suspicious emails?** (2 points)
- ✅ Yes, clear process (button, email address, Slack channel)
- ⚠️ Yes, but not well documented or communicated
- ❌ No formal process

**Q2.6: Do you review email rules and forwarders periodically?** (1 point)
- ✅ Yes, quarterly audit of rules
- ❌ No regular review

**Category 2 Score**: _____ / 15 points

**Action items if you scored <10**:
1. Set up DMARC/DKIM/SPF (Week 2) - [See guide](03-email-phishing.md)
2. Conduct phishing awareness training (Week 2)
3. Create phishing reporting process (Week 2)

---

## 3. Device Security (15 points max)

**Why this matters**: Endpoints (laptops, phones) are the entry point for 70% of breaches.

### Questions

**Q3.1: Do all devices have endpoint protection (antivirus/EDR)?** (4 points)
- ✅ Yes, business-grade endpoint protection on all devices
- ⚠️ Yes, but consumer antivirus or some devices missing
- ❌ No centralized endpoint protection

**Q3.2: Are all laptops/desktops encrypted (FileVault, BitLocker)?** (3 points)
- ✅ Yes, full disk encryption required and enforced
- ⚠️ Partial, some devices encrypted
- ❌ No encryption

**Q3.3: Are devices set to auto-update/auto-patch?** (2 points)
- ✅ Yes, automatic updates enabled on all devices
- ⚠️ Yes, but not consistently enforced
- ❌ No, manual updates

**Q3.4: Do company-issued mobile devices have MDM (Mobile Device Management)?** (2 points)
- ✅ Yes, MDM on all company phones/tablets
- ⚠️ Some devices managed
- ❌ No MDM

**Q3.5: Can you remotely wipe lost/stolen devices?** (2 points)
- ✅ Yes, remote wipe enabled for all devices
- ⚠️ Yes, for some devices
- ❌ No remote wipe capability

**Q3.6: Do you have a BYOD (Bring Your Own Device) policy?** (1 point)
- ✅ Yes, clear policy with security requirements
- ❌ No formal BYOD policy

**Q3.7: Do devices lock automatically after inactivity?** (1 point)
- ✅ Yes, enforced screen lock (5-15 min idle)
- ❌ No enforced screen lock

**Category 3 Score**: _____ / 15 points

**Action items if you scored <10**:
1. Deploy endpoint protection on all devices (Week 3) - [See guide](04-device-security.md)
2. Enable full disk encryption (Week 3)
3. Set up remote wipe for company devices (Week 4)

---

## 4. Network Security (10 points max)

**Why this matters**: Unsecured networks allow attackers to intercept data and gain access.

### Questions

**Q4.1: Do remote workers use a VPN when accessing company resources?** (3 points)
- ✅ Yes, VPN required for all remote access
- ⚠️ Yes, but not consistently enforced
- ❌ No VPN or N/A (no remote workers)

**Q4.2: Is your office Wi-Fi password-protected (WPA3 or WPA2)?** (2 points)
- ✅ Yes, WPA3 or WPA2 with strong password
- ⚠️ Yes, but weak password or WPA only
- ❌ No password or N/A (no office)

**Q4.3: Do you have a separate guest Wi-Fi network?** (1 point)
- ✅ Yes, guest network isolated from main network
- ❌ No separate guest network

**Q4.4: Do you have a firewall protecting your office network?** (2 points)
- ✅ Yes, business-grade firewall
- ⚠️ Yes, basic router firewall only
- ❌ No firewall or N/A (no office)

**Q4.5: Are admin interfaces (routers, NAS) password-protected and hidden from internet?** (2 points)
- ✅ Yes, strong passwords and not accessible from internet
- ⚠️ Yes, but default passwords or weak security
- ❌ No, or accessible from internet

**Category 4 Score**: _____ / 10 points

**Action items if you scored <7**:
1. Set up VPN for remote workers (Week 4) - [See guide](05-network-security.md)
2. Secure office Wi-Fi with strong password (Week 4)
3. Create guest Wi-Fi network (Week 4)

---

## 5. Backup & Recovery (15 points max)

**Why this matters**: Ransomware can encrypt all your data. Backups are your last line of defense.

### Questions

**Q5.1: Do you have automated cloud backup for critical data?** (5 points)
- ✅ Yes, automated daily backup to cloud (Backblaze, Google Vault, etc.)
- ⚠️ Yes, but manual or infrequent
- ❌ No cloud backup

**Q5.2: Do you follow the 3-2-1 rule (3 copies, 2 media types, 1 offsite)?** (3 points)
- ✅ Yes, 3 copies on 2 different media with 1 offsite
- ⚠️ Partial (e.g., cloud backup but no local)
- ❌ No

**Q5.3: Do you test backups regularly (monthly)?** (4 points)
- ✅ Yes, monthly restore tests
- ⚠️ Yes, but infrequent (quarterly or annual)
- ❌ No, never tested backups

**Q5.4: Are backups encrypted?** (2 points)
- ✅ Yes, encrypted backups
- ❌ No encryption

**Q5.5: Do you have a documented disaster recovery plan?** (1 point)
- ✅ Yes, written plan with RTOs and contact info
- ❌ No formal plan

**Category 5 Score**: _____ / 15 points

**Action items if you scored <10**:
1. Set up automated cloud backup (Month 2) - [See guide](06-backup-recovery.md)
2. Test backups this week (critical!)
3. Implement 3-2-1 backup rule (Month 2)

---

## 6. Cloud & SaaS Security (10 points max)

**Why this matters**: Cloud tools are now the primary workspace. Misconfigured cloud = major breach.

### Questions

**Q6.1: Have you hardened Google Workspace or Microsoft 365 security settings?** (3 points)
- ✅ Yes, followed security checklist (2FA required, advanced protections enabled)
- ⚠️ Partial, some settings configured
- ❌ No, using default settings

**Q6.2: Do you audit which employees have access to which cloud resources?** (2 points)
- ✅ Yes, quarterly access reviews
- ⚠️ Yes, but infrequent
- ❌ No regular audits

**Q6.3: Do you monitor for "shadow IT" (unauthorized SaaS tools)?** (2 points)
- ✅ Yes, actively monitor and enforce approved tool list
- ⚠️ Yes, but not consistently
- ❌ No monitoring

**Q6.4: Are external file shares reviewed regularly (public Google Drive/Dropbox links)?** (2 points)
- ✅ Yes, quarterly review of external shares
- ⚠️ Yes, but infrequent
- ❌ No regular review

**Q6.5: Do you have a list of approved SaaS tools?** (1 point)
- ✅ Yes, documented list of approved tools
- ❌ No approved tool list

**Category 6 Score**: _____ / 10 points

**Action items if you scored <7**:
1. Harden Google/M365 security settings (Month 2) - [See guide](07-cloud-security.md)
2. Audit user access to cloud resources (Month 2)
3. Create approved SaaS tool list (Month 2)

---

## 7. Policies & Training (10 points max)

**Why this matters**: Technology alone doesn't work. Employees need clear guidelines and training.

### Questions

**Q7.1: Do you have a written security policy?** (2 points)
- ✅ Yes, documented and shared with all employees
- ⚠️ Yes, but not well communicated
- ❌ No written security policy

**Q7.2: Do new employees receive security training during onboarding?** (3 points)
- ✅ Yes, formal security training in first week
- ⚠️ Yes, but informal or inconsistent
- ❌ No formal security onboarding

**Q7.3: Do employees receive ongoing security training?** (2 points)
- ✅ Yes, quarterly or annual training
- ⚠️ Yes, but infrequent
- ❌ No ongoing training

**Q7.4: Do you have onboarding/offboarding checklists that include security?** (2 points)
- ✅ Yes, documented checklists
- ⚠️ Yes, but informal
- ❌ No formal checklists

**Q7.5: Do employees know how to report security incidents?** (1 point)
- ✅ Yes, clear process communicated
- ❌ No clear process

**Category 7 Score**: _____ / 10 points

**Action items if you scored <7**:
1. Create security policy (Month 2) - [Template](../templates/security-policy.md)
2. Add security to onboarding (Month 2) - [Template](../templates/onboarding-checklist.md)
3. Schedule quarterly security awareness sessions (Month 3)

---

## 8. Monitoring & Incident Response (5 points max)

**Why this matters**: Early detection = faster response = lower costs. Average breach takes 277 days to detect.

### Questions

**Q8.1: Do you have security monitoring/logging enabled?** (2 points)
- ✅ Yes, centralized logging and alerting
- ⚠️ Yes, but basic or scattered
- ❌ No monitoring

**Q8.2: Do you review security logs periodically?** (1 point)
- ✅ Yes, weekly or monthly review
- ❌ No regular review

**Q8.3: Do you have an incident response plan?** (2 points)
- ✅ Yes, documented plan with contact info
- ⚠️ Yes, but informal
- ❌ No incident response plan

**Category 8 Score**: _____ / 5 points

**Action items if you scored <3**:
1. Enable logging on critical systems (Month 3)
2. Create incident response plan (Month 3) - [Template](../templates/incident-response.md)

---

## Total Score Calculation

Add up your scores from all 8 categories:

| Category | Your Score | Max Score |
|----------|------------|-----------|
| 1. Access & Authentication | _____ | 20 |
| 2. Email & Phishing | _____ | 15 |
| 3. Device Security | _____ | 15 |
| 4. Network Security | _____ | 10 |
| 5. Backup & Recovery | _____ | 15 |
| 6. Cloud & SaaS | _____ | 10 |
| 7. Policies & Training | _____ | 10 |
| 8. Monitoring & Response | _____ | 5 |
| **TOTAL** | **_____** | **100** |

---

## Score Interpretation

### 80-100 Points: Excellent ✅

**You're in the top 10% of small businesses.**

**Strengths**:
- Strong foundation across all areas
- Low risk of common attacks
- Ready for compliance if needed

**Focus on**:
- Maintaining current practices
- Compliance (if customers require)
- Advanced security (if handling sensitive data)

**Next steps**:
1. Address any gaps in specific categories
2. Consider SOC 2 or ISO 27001 (if customers require)
3. Implement advanced monitoring and threat detection

---

### 60-79 Points: Good ⚠️

**You have solid basics but notable gaps.**

**Strengths**:
- Core protections in place
- Awareness of security importance
- Lower risk than most SMBs

**Gaps likely include**:
- Incomplete MFA deployment
- Backup not tested regularly
- Training inconsistent
- Monitoring limited

**Next steps**:
1. Focus on categories where you scored <70%
2. Follow 90-day plan starting at Week 3-4
3. Test backups THIS WEEK (critical!)
4. Enable MFA on all accounts within 2 weeks

---

### 40-59 Points: Needs Work 🚨

**You're vulnerable to common attacks. Immediate action needed.**

**High-risk areas** (likely):
- Passwords weak or reused
- No MFA on critical accounts
- No tested backups (ransomware = game over)
- Limited employee training
- No incident response plan

**Next steps**:
1. **Week 1**: Password manager + MFA on email/banking (4-6 hours)
2. **Week 2**: MFA on all other accounts, phishing training (4-6 hours)
3. **Week 3-4**: Follow complete 90-day plan ([README](../README.md))
4. Budget 2-4 hours/week for 3 months

**Consider**: Hiring security consultant for $5K-$10K to accelerate implementation.

---

### 0-39 Points: Critical ❌

**You're highly vulnerable. You may be breached already without knowing.**

**Critical gaps**:
- No password management
- No MFA
- No backups (or untested backups)
- No employee training
- No basic protections

**Immediate actions** (this week):
1. **Today**: Enable MFA on email and banking (1 hour)
2. **This week**: Set up cloud backup (2 hours) + TEST it
3. **This week**: Change all passwords to unique, strong passwords (4 hours)
4. **Next week**: Deploy endpoint protection (2 hours)

**Strongly consider**:
- Hiring security consultant ($10K-$20K) for rapid remediation
- Cyber insurance (will require implementing basics first)
- Security audit to check if already breached

**Budget**: 20-40 hours over next month + $500-1,000/month for tools.

---

## Create Your 90-Day Action Plan

Based on your assessment, create a prioritized plan:

### Step 1: List Your Gaps

For each category where you scored <70%, list specific items you answered "No" to.

**Example**:
- ❌ No MFA on email accounts (Q1.3)
- ❌ No cloud backup (Q5.1)
- ❌ Backups never tested (Q5.3)
- ❌ No security training (Q7.2)

### Step 2: Prioritize by Impact

Use this priority framework:

**Priority 1 (Week 1-2)**: Quick wins, high impact
- MFA on email and financial accounts
- Password manager deployment
- Basic phishing awareness

**Priority 2 (Week 3-4)**: Core security
- Endpoint protection
- Full disk encryption
- Backup system

**Priority 3 (Month 2)**: Resilience
- Backup testing
- Security policies
- Employee training program

**Priority 4 (Month 3+)**: Ongoing
- Monitoring
- Incident response
- Compliance

### Step 3: Map to This Guide

For each gap, map to the relevant implementation guide:

| Gap | Guide | Timeline |
|-----|-------|----------|
| No MFA on email | [Passwords & Access](02-passwords-access.md) | Week 1 |
| No cloud backup | [Backup & Recovery](06-backup-recovery.md) | Month 2 |
| No phishing training | [Email & Phishing](03-email-phishing.md) | Week 2 |

### Step 4: Block Calendar Time

**Don't rely on "finding time" - schedule it.**

Week 1-2: 4-6 hours
Week 3-4: 4-6 hours
Month 2: 10-15 hours
Month 3: 10-15 hours

Total: 28-42 hours over 90 days

---

## Track Progress

**Re-run this assessment every quarter** to track improvement:

| Date | Score | Notes |
|------|-------|-------|
| Today | _____ | Initial assessment |
| +3 months | _____ | After 90-day plan |
| +6 months | _____ | Maintenance phase |
| +12 months | _____ | Annual review |

**Goal**: Reach 80+ points within 6 months, maintain 85+ ongoing.

---

## Common Pitfalls

### ❌ Pitfall #1: Overestimating Current Security

"We have antivirus, so we're secure."

**Reality**: Antivirus alone stops <50% of modern attacks. You need MFA, backups, employee training, etc.

### ❌ Pitfall #2: Analysis Paralysis

"We need to research more tools before starting."

**Reality**: Start with basics (password manager, MFA) while researching advanced tools. Perfect is the enemy of good.

### ❌ Pitfall #3: Assuming Employees Will Follow Rules

"We told people to use strong passwords."

**Reality**: Without enforcement (password manager, MFA), compliance is <20%. Use technology to enforce.

### ❌ Pitfall #4: Ignoring Backups Until It's Too Late

"We'll set up backups next month."

**Reality**: Ransomware strikes when you least expect it. Set up cloud backup THIS WEEK (takes 1 hour).

---

## Next Steps

1. **Calculate your total score** (add all 8 categories)
2. **Review interpretation** for your score range
3. **Create action plan** mapping gaps to guides
4. **Block calendar time** for implementation
5. **Start with Week 1 tasks** (password manager + MFA)

**Primary next guide**: [Passwords & Access](02-passwords-access.md) - Start here for 80% risk reduction in Week 1.

---

## Related Resources

- [90-Day Security Roadmap](../README.md#the-solution-90-day-security-roadmap) - Complete timeline
- [Security Tools](../TOOLS.md) - Tool recommendations and pricing
- [All Implementation Guides](../README.md#implementation-guides) - Step-by-step guides

---

**Last Updated**: February 2026
**Time to Complete**: 1-2 hours
**Reassessment Frequency**: Quarterly
