# Security for Remote Teams

**Time to complete**: 2-3 weeks (setup + team training)
**Cost**: $3-10/user/month (VPN, password manager, MDM)
**Prerequisites**: Remote team established
**Who owns this**: IT lead or operations manager

---

## Why Remote Security Matters

**Office security** (traditional):
- Physical security (locked doors, badge access)
- Controlled network (firewall, monitoring)
- Managed devices (IT department controls laptops)

**Remote security challenges**:
- ❌ Employees on home WiFi (insecure)
- ❌ Personal devices (no IT control)
- ❌ Public WiFi (coffee shops, airports)
- ❌ Weak passwords (reused across sites)
- ❌ Phishing attacks (targeting remote workers)

**The cost of a breach**:
- Average data breach: $4.45M USD (IBM 2023 report)
- Small business (<500 employees): $3M+ average
- Reputational damage, customer loss, regulatory fines

**ROI of security investment**: $5k/year security spend prevents $1M+ potential breach (200x ROI).

---

## The Security Stack for Remote Teams

### Essential Security Tools (Minimum)

| Tool Type | Purpose | Recommended Tools | Monthly Cost |
|-----------|---------|-------------------|--------------|
| **VPN** | Encrypt traffic, protect on public WiFi | NordLayer, Perimeter 81, Twingate | $3-8/user |
| **Password Manager** | Store passwords securely, prevent reuse | 1Password, Bitwarden | $3-8/user |
| **2FA/MFA** | Second authentication factor | Google Authenticator (free), Duo ($3/user) | Free - $3/user |
| **MDM (optional)** | Manage company devices | Jamf, Kandji (Mac), Intune (Windows) | $4-10/user |
| **Endpoint Protection** | Antivirus, malware detection | Built-in (Windows Defender, Mac) or Sophos ($5/user) | Free - $5/user |

**Total cost**: $6-24/user/month (depending on tools chosen).

**For 10-person company**: $60-240/month = $720-2,880/year.

---

## Phase 1: VPN Setup (Week 1)

### Why VPN?

**Problem**: Remote workers connect to company systems from:
- Home WiFi (may be insecure)
- Public WiFi (coffee shops, airports) ← **Very insecure**
- Hotel WiFi (unencrypted)

**Risk**: Man-in-the-middle attacks, data interception, credential theft.

**Solution**: VPN (Virtual Private Network) encrypts all traffic.

### VPN Tool Comparison

| VPN | Cost per User | Best For | Key Features |
|-----|---------------|----------|--------------|
| **NordLayer** | $8/user/mo | SMBs, easy setup | Good UI, multi-platform, affordable |
| **Perimeter 81** | $8/user/mo | SMBs, secure access | Zero-trust network, integrations |
| **Twingate** | $10/user/mo | Tech companies | Modern zero-trust, no legacy VPN |
| **CloudFlare Teams** | $7/user/mo | Developers | Fast, integrates with CloudFlare |
| **OpenVPN** | Free (self-hosted) | Tech teams with IT expertise | Open source, full control, complex setup |

**Our recommendation**: **NordLayer** ($8/user) - Easy to set up, affordable, works on all platforms (Mac, Windows, Linux, iOS, Android).

### Setup Instructions (NordLayer Example)

**Step 1: Create Account** (15 min)
1. Go to nordlayer.com
2. Sign up with work email
3. Choose plan (Business VPN)
4. Add payment method

**Step 2: Configure Network** (10 min)
1. Dashboard → Networks → Add Network
2. Name: "Company VPN"
3. Gateway location: Choose server near your team (e.g., Singapore)

**Step 3: Invite Team** (5 min)
1. Dashboard → Users → Invite
2. Enter team emails
3. They receive invitation to download NordLayer app

**Step 4: Install on Devices** (10 min per person)
1. Each team member downloads NordLayer app (Mac, Windows, iOS, Android)
2. Sign in with work email
3. Connect to VPN (one click)

**Step 5: Set Policy** (5 min)
1. Dashboard → Policies → Create Policy
2. Require VPN for:
   - Accessing company systems (internal tools, databases)
   - Working from public WiFi
3. Optional: Always-on VPN (VPN connects automatically)

**Total setup time**: 45 minutes + 10 minutes per team member.

### Best Practices

**When to use VPN**:
- ✅ Always on public WiFi (coffee shops, airports, hotels)
- ✅ When accessing company systems (internal dashboards, databases)
- ✅ When handling sensitive data (customer info, financial data)
- ❌ Not required for general web browsing from home (adds overhead)

**Train team**:
- "Turn on VPN when on public WiFi or accessing company systems"
- Show how to toggle VPN on/off
- Explain why (protect company data + personal data)

**Monitor usage** (optional):
- Dashboard → Analytics → See who's connected
- Useful to ensure team is using VPN (but don't surveil)

---

## Phase 2: Password Manager (Week 1)

### Why Password Manager?

**Problem**: People reuse passwords.
- "Password123" on 20 sites
- If one site is breached, attacker has access to all accounts

**Data**: 81% of data breaches involve weak/reused passwords (Verizon DBIR).

**Solution**: Password manager generates and stores unique passwords.

### Password Manager Comparison

| Tool | Cost per User | Best For | Key Features |
|------|---------------|----------|--------------|
| **1Password** | $7.99/user/mo | Teams, best UX | Beautiful UI, family sharing, Watchtower (breach alerts) |
| **Bitwarden** | Free - $3/user/mo | Budget-conscious | Open source, affordable, full features on free tier |
| **Dashlane** | $5/user/mo (Business) | Teams needing VPN + password manager | Includes VPN (but not as good as dedicated VPN) |
| **LastPass** | $4/user/mo | Used to be popular | Suffered breaches, not recommended anymore |

**Our recommendation**: **1Password** ($8/user) for best experience, or **Bitwarden** (free or $3/user) for budget option.

### Setup Instructions (1Password Example)

**Step 1: Create Team Account** (10 min)
1. Go to 1password.com/teams
2. Sign up with work email
3. Create team name (e.g., "Acme Corp")
4. Add payment method

**Step 2: Invite Team** (5 min)
1. Dashboard → People → Invite
2. Enter team emails
3. They receive invitation to create 1Password account

**Step 3: Install on Devices** (10 min per person)
1. Each team member downloads 1Password app (Mac, Windows, iOS, Android)
2. Sign in with work email
3. Install browser extension (Chrome, Firefox, Safari, Edge)

**Step 4: Create Shared Vaults** (10 min)
1. Vaults → Create Vault → "Shared - Engineering" (for team secrets)
2. Create vaults by team/project
3. Add team members to relevant vaults

**Step 5: Migrate Passwords** (30 min - 2 hours per person)
1. Each person imports existing passwords (1Password can import from browser)
2. Generate strong passwords for important accounts (email, banking, company tools)
3. Update passwords to unique, strong passwords (gradually, not all at once)

**Total setup time**: 1-2 hours per person (gradual migration over days).

### Best Practices

**What to store**:
- ✅ All work passwords (Slack, Asana, Gmail, GitHub, AWS, etc.)
- ✅ Shared team secrets (API keys, database passwords)
- ✅ Personal passwords (optional, but recommended)

**What NOT to store**:
- ❌ Master password (memorize it, don't write it down)
- ❌ 2FA backup codes in same vault as password (keep separately)

**Shared vaults**:
- Create vaults by team (Engineering, Sales, Marketing)
- Share company-wide accounts (Slack admin, Zoom admin)
- Don't share personal accounts

**Watchtower** (1Password feature):
- Alerts if password was in a breach
- Alerts if password is weak/reused
- Use this to gradually improve password hygiene

**Training**:
- Show how to generate passwords (click generator, copy, paste)
- Show how to autofill (browser extension)
- Show how to share passwords (add to shared vault)

---

## Phase 3: Two-Factor Authentication (2FA/MFA) (Week 2)

### Why 2FA?

**Problem**: Password alone is not secure.
- Attacker steals password (phishing, breach) → Account compromised

**Solution**: 2FA (Two-Factor Authentication) requires second factor.
- Something you know (password) + Something you have (phone with authenticator app)

**Effectiveness**: 2FA blocks 99.9% of automated attacks (Google research).

### 2FA Options

| Method | Security Level | Ease of Use | Cost |
|--------|----------------|-------------|------|
| **Authenticator App** (Google Auth, Authy) | High | Easy | Free |
| **SMS codes** | Medium (SIM swap risk) | Very easy | Free |
| **Hardware key** (YubiKey) | Highest | Medium (carry key) | $25-50/key |
| **Push notification** (Duo, Okta Verify) | High | Very easy | Free - $3/user |

**Our recommendation**: **Authenticator App** (free, secure) for most accounts. **Hardware keys** (YubiKey) for admins and high-privilege accounts.

### Setup Instructions

**Step 1: Choose Authenticator App**
- Google Authenticator (simple, widely supported)
- Authy (backup to cloud, multi-device)
- 1Password (includes TOTP, if you use 1Password)

**Recommendation**: **Google Authenticator** or **Authy** (both free).

**Step 2: Enable 2FA on Critical Accounts** (30 min per person)

**Priority accounts** (enable 2FA first):
1. Email (Gmail, Outlook) ← **Most critical**
2. Password manager (1Password, Bitwarden)
3. Communication (Slack, Teams)
4. Finance (banking, payment processors, PayPal)
5. Cloud infrastructure (AWS, GCP, Azure, Railway, Vercel)
6. Code repositories (GitHub, GitLab)
7. Project management (Asana, Linear, ClickUp)

**How to enable** (example: Gmail):
1. Google Account → Security → 2-Step Verification
2. Add phone number (SMS backup)
3. Add authenticator app (scan QR code)
4. Save backup codes (store in 1Password)

**Step 3: Enforce 2FA Company-Wide** (optional, for compliance)

**Tools that support 2FA enforcement**:
- Google Workspace: Admin console → Force 2FA for all users
- Microsoft 365: Azure AD → Conditional Access → Require MFA
- Slack: Workspace Settings → Require 2FA
- GitHub: Organization settings → Require 2FA

**Implementation**:
1. Announce to team (2 weeks notice)
2. Provide training (how to set up)
3. Enable enforcement (deadline: 2 weeks from announcement)
4. Help anyone who has trouble

### Best Practices

**Backup codes**:
- Every service provides backup codes when you enable 2FA
- Store backup codes in password manager (1Password vault)
- If you lose phone, use backup code to regain access

**Don't lock yourself out**:
- Add backup phone number (SMS)
- Store backup codes securely
- Test backup methods occasionally

**Hardware keys** (for high-privilege accounts):
- Buy 2 YubiKeys ($50 each = $100)
- Register both keys (primary + backup)
- Keep backup key in safe place (not with primary)

---

## Phase 4: Mobile Device Management (MDM) (Optional - Week 3)

### When You Need MDM

**MDM (Mobile Device Management)** = Tool to manage company-owned devices remotely.

**When to use**:
- ✅ Company provides laptops/phones
- ✅ Team of 10+ people
- ✅ Need to enforce security policies (auto-lock, encryption, remote wipe)
- ✅ Compliance requirements (finance, healthcare)

**When NOT needed**:
- Small team (<10 people)
- Personal devices (BYOD)
- Startup without compliance requirements

### MDM Tools

| Tool | Cost per Device | Best For | Platforms |
|------|-----------------|----------|-----------|
| **Jamf** | $4-10/device/mo | Mac, iPhone, iPad | Apple only |
| **Kandji** | $5-10/device/mo | Mac (modern MDM) | Apple only |
| **Microsoft Intune** | $6/user/mo | Windows, Android | Included with M365 |
| **Jumpcloud** | $10/user/mo | Cross-platform | Mac, Windows, Linux |

**Our recommendation**:
- **Jamf** or **Kandji** if Mac/iPhone only
- **Microsoft Intune** if Windows + M365
- **Jumpcloud** if mixed (Mac + Windows + Linux)

### What MDM Does

**Enforce policies**:
- ✅ Require screen lock (auto-lock after 5 min)
- ✅ Require disk encryption (FileVault on Mac, BitLocker on Windows)
- ✅ Require OS updates (automatically install security patches)
- ✅ Require VPN for network access
- ✅ Block unapproved apps

**Remote actions**:
- ✅ Remote wipe (if device is lost/stolen)
- ✅ Remote lock
- ✅ Track device location (if enabled)

**Inventory**:
- See all company devices
- See which OS versions, apps installed
- Compliance reporting (who hasn't updated OS?)

### Setup (Jamf Example for Mac)

**Step 1: Create Account** (15 min)
1. Go to jamf.com
2. Sign up for Jamf Now (simplified MDM) or Jamf Pro (advanced)
3. Add payment method

**Step 2: Enroll Devices** (15 min per device)
1. Send enrollment invitation to each device
2. User follows link, installs Jamf profile
3. Device appears in Jamf dashboard

**Step 3: Create Policies** (30 min)
1. Dashboard → Policies → Create Policy
2. Examples:
   - Require FileVault (disk encryption)
   - Auto-lock after 5 minutes
   - Install company apps (Slack, 1Password, VPN)
   - Block app installation from unknown sources

**Step 4: Monitor Compliance** (ongoing)
1. Dashboard → Devices → See compliance status
2. Alert if device is not compliant (e.g., OS not updated)

---

## Phase 5: Security Training (Week 3)

### Biggest Security Risk: People

**Technology is only part of security**. Biggest risk: **Phishing** and **Social Engineering**.

**Phishing** = Fake email pretending to be from trusted source (bank, CEO, IT department) asking for password or clicking link.

**Example phishing email**:
```
From: ceo@acmecorp.com (fake email)
Subject: Urgent: Update your payroll information

Hi [Name],

We're updating our payroll system. Please update your direct deposit info by clicking here: [malicious link]

Thanks,
[CEO Name]
```

**If employee clicks link and enters password** → Account compromised.

### Security Training Topics (30-60 min session)

**1. Phishing Awareness** (15 min)
- Show examples of phishing emails
- Red flags: Urgency ("Urgent action required"), suspicious links, grammar errors
- What to do: Don't click links in emails. Go directly to website. Report to IT.

**2. Password Hygiene** (10 min)
- Use password manager (1Password)
- Never reuse passwords
- Use strong, unique passwords (generated by password manager)

**3. 2FA Importance** (5 min)
- Enable 2FA on all critical accounts
- Don't share 2FA codes
- Backup codes stored in 1Password

**4. VPN Usage** (5 min)
- Turn on VPN on public WiFi
- Turn on VPN when accessing company systems

**5. Physical Security** (5 min)
- Lock laptop when stepping away (Cmd+Ctrl+Q on Mac, Win+L on Windows)
- Don't leave laptop unattended in public
- Use privacy screen (optional, for high-sensitivity roles)

**6. Reporting Security Issues** (5 min)
- If you suspect phishing, report to IT (Slack channel: #security)
- If you clicked suspicious link, report immediately (not your fault, but we need to act fast)
- If device is lost/stolen, report immediately (we'll remote wipe)

### Phishing Simulation (Optional)

**Advanced**: Run phishing simulation to test team.

**Tools**:
- KnowBe4 ($5/user/year)
- GoPhish (open source, self-hosted)

**How it works**:
1. Send fake phishing email to team
2. Track who clicks link (no judgment, just training)
3. Clicked link → Redirected to training page ("This was a test. Here's what to look for...")
4. Quarterly simulations to keep team sharp

---

## Compliance & Regulatory Requirements

### When Compliance Matters

**Industry-specific requirements**:
- **Finance**: PCI-DSS (payment card data), SOC 2, local regulations (MAS in Singapore)
- **Healthcare**: HIPAA (US), PDPA (Singapore, Malaysia, Thailand)
- **SaaS/Tech**: SOC 2 (customers may require this)

**Data privacy laws in SEA**:
- **Singapore**: PDPA (Personal Data Protection Act)
- **Malaysia**: PDPA (Personal Data Protection Act)
- **Thailand**: PDPA (Personal Data Protection Act)
- **Indonesia**: PDP (Personal Data Protection)
- **Philippines**: Data Privacy Act
- **Vietnam**: PDPL (Personal Data Protection Law)

**What these laws require** (simplified):
- ✅ Secure storage of personal data
- ✅ Access controls (not everyone can access all data)
- ✅ Encryption (at rest and in transit)
- ✅ Breach notification (within 72 hours)
- ✅ Data minimization (don't collect data you don't need)

**For most SMBs**: Basic security measures (VPN, password manager, 2FA) are sufficient. If you handle sensitive data (finance, health, payment cards), consult local lawyer.

---

## Security Incident Response Plan

### What is an Incident?

**Examples**:
- Employee clicks phishing link, enters password
- Laptop is lost or stolen
- Unauthorized access to company account (AWS, GitHub, database)
- Data breach (customer data exposed)

### Incident Response Workflow

**Step 1: Detect** (ongoing)
- Monitoring tools alert (login from unusual location, failed login attempts)
- Employee reports suspicious activity

**Step 2: Contain** (within 1 hour)
- Change compromised passwords immediately
- Revoke access tokens
- Disable compromised accounts
- Remote wipe lost/stolen devices (via MDM)

**Step 3: Investigate** (within 24 hours)
- What happened?
- What data was accessed?
- How did attacker gain access?

**Step 4: Remediate** (within 1 week)
- Fix vulnerability (patch system, improve process)
- Notify affected parties (customers, regulators)
- Document incident for future reference

**Step 5: Review** (within 1 month)
- Post-mortem: What went wrong? How to prevent next time?
- Update incident response plan

### Incident Response Contact

**Create emergency contact list**:
- IT lead: [Name, phone number]
- CEO: [Name, phone number]
- Lawyer: [Law firm, contact]
- EOR provider (if applicable): [Deel/Remote support]

**Post in Notion/Confluence**: "Security Incident Response Plan"

**Slack channel**: #security (for reporting incidents)

---

## Budget Breakdown

### 10-person company (Essential Security Stack)

| Tool | Monthly Cost | Annual Cost | Notes |
|------|--------------|-------------|-------|
| **VPN (NordLayer)** | $80 ($8/user) | $960 | Protect on public WiFi, encrypt traffic |
| **Password Manager (1Password)** | $80 ($8/user) | $960 | Secure password storage |
| **2FA (Authenticator App)** | $0 | $0 | Google Authenticator (free) |
| **MDM (optional)** | $0-100 | $0-1,200 | Only if you provide company devices |
| **Endpoint Protection** | $0 | $0 | Windows Defender / Mac built-in (free) |
| **TOTAL (Essential)** | **$160/mo** | **$1,920/yr** | |
| **TOTAL (with MDM)** | **$260/mo** | **$3,120/yr** | |

**ROI**: Prevents data breach ($3M+ average for SMB). Investment: $2k-3k/year. **ROI: 1000x+**

### 30-person company

| Tool | Monthly Cost | Annual Cost |
|------|--------------|-------------|
| **VPN** | $240 | $2,880 |
| **Password Manager** | $240 | $2,880 |
| **2FA** | $0-90 (if using Duo) | $0-1,080 |
| **MDM** | $300 (if needed) | $3,600 |
| **TOTAL (Essential)** | **$480/mo** | **$5,760/yr** |
| **TOTAL (with MDM)** | **$780/mo** | **$9,360/yr** |

---

## Common Pitfalls & Solutions

### Pitfall 1: "Security is too complicated, we'll skip it"

**Symptom**: No VPN, weak passwords, no 2FA.

**Risk**: Data breach, account compromise, customer data exposure.

**Solution**: Start with essentials (VPN, password manager, 2FA). Takes 2-3 weeks to set up. Cost: $2k-3k/year. Worth it to prevent $1M+ breach.

### Pitfall 2: "Team finds VPN annoying, so they don't use it"

**Symptom**: VPN is installed but no one turns it on.

**Cause**: Poor training, or VPN is too slow/buggy.

**Solution**:
1. Train team: "Turn on VPN on public WiFi and when accessing company systems"
2. Choose fast VPN (NordLayer, Cloudflare Teams are fast)
3. Split-tunnel VPN (only company traffic goes through VPN, not all internet traffic)
4. Monitor usage (gently remind people who aren't using it)

### Pitfall 3: "Password manager is too much effort"

**Symptom**: Team continues using "Password123" on all sites.

**Cause**: Change aversion, not seeing immediate benefit.

**Solution**:
1. Lead by example (executives use it first)
2. Show benefits: "No more forgotten passwords, auto-fill is faster"
3. Gradual migration (don't force changing all passwords at once)
4. Provide 1:1 help for anyone struggling

### Pitfall 4: "We got breached but didn't know for 6 months"

**Symptom**: Attacker has been in your systems for months, exfiltrating data.

**Cause**: No monitoring, no alerts.

**Solution**:
1. Enable login alerts (email when login from new device)
2. Monitor AWS/GCP logs (use CloudWatch, CloudTrail)
3. Use security monitoring tool (if budget allows: Wiz, Lacework)
4. Set up alerting (Slack, email) for suspicious activity

---

## Success Metrics

### Month 1 (Essential Security Setup)
- ✅ VPN set up, team using it
- ✅ Password manager set up, passwords migrating
- ✅ 2FA enabled on critical accounts (email, Slack, finance)
- ✅ Security training completed (30-60 min session)

### Month 3 (Adoption & Compliance)
- ✅ 90% of team uses VPN regularly (when on public WiFi)
- ✅ 80% of passwords in password manager (unique, strong)
- ✅ 100% of team has 2FA on email and critical accounts
- ✅ MDM deployed (if using company devices)
- ✅ No security incidents

### Month 6 (Mature Security Posture)
- ✅ 100% compliance with security policies
- ✅ Incident response plan documented and tested
- ✅ Regular security training (quarterly refreshers)
- ✅ No breaches or incidents
- ✅ Team reports security measures are easy to use (not painful)

---

## Next Steps

After security setup:

1. ✅ **Set up VPN** - NordLayer ($8/user) or equivalent
2. ✅ **Set up password manager** - 1Password ($8/user) or Bitwarden (free)
3. ✅ **Enable 2FA** - On all critical accounts
4. ✅ **Train team** - 30-60 min security training session
5. ✅ **Set up MDM** (optional) - If company-owned devices
6. ✅ **Document incident response plan** - In Notion/Confluence
7. ➡️ **Build team cohesion** - See `guides/10-team-cohesion.md`

**Questions?** See `FAQ.md` section "Security" for common security questions.
