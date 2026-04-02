# Passwords & Access Control Guide

**Implement password managers, multi-factor authentication, and access controls**

---

## What You'll Learn

- How to deploy a password manager company-wide
- How to implement MFA on all critical accounts
- How to apply principle of least privilege
- How to manage admin access securely

**Time Required**: 4-8 hours (spread over Week 1-2)
**Difficulty**: Easy (step-by-step instructions)
**ROI**: 80% reduction in account compromise risk

---

## Why This Matters

**Passwords are the #1 attack vector:**

- 81% of breaches involve weak or stolen passwords
- Average person has 100+ accounts (impossible to remember unique passwords)
- Reused passwords = one breach compromises everything
- MFA blocks 99.9% of account takeovers even with stolen passwords

**Real breach examples:**
- **SolarWinds (2020)**: Weak password "solarwinds123" led to $100M+ breach
- **Twitter (2020)**: Employees with no MFA led to verified account takeovers
- **Colonial Pipeline (2021)**: Compromised VPN password (no MFA) shut down major pipeline, $4.4M ransom

**Good news**: This is the easiest fix with the highest impact. You can complete this in Week 1.

---

## Prerequisites

Before starting:
- [ ] Choose a password manager (recommendation: 1Password or Bitwarden)
- [ ] Get management buy-in (everyone must use it)
- [ ] Budget: $5-8/user/month
- [ ] Block 4-8 hours over 2 weeks

---

## Implementation Steps

### Step 1: Choose and Purchase Password Manager (1 hour)

**Recommended options:**

| Tool | Price | Best For | Pros | Cons |
|------|-------|----------|------|------|
| **1Password** | $8/user/mo | Most SMBs | Best UI, travel mode, excellent support | Slightly more expensive |
| **Bitwarden** | $5/user/mo | Budget-conscious | Open source, cheapest | More technical, less polished |

**Purchase checklist:**
- [ ] Sign up for business plan (not individual accounts)
- [ ] Add all employees as users
- [ ] Assign admin(s) - usually owner + 1 other
- [ ] Note: You'll invite users in Step 3

**Setup time**: 30 minutes

---

### Step 2: Set Up Admin Account and Policies (30 minutes)

**Admin setup:**
1. Create your admin account with strong master password
   - Use [1Password Strong Password Generator](https://1password.com/password-generator/)
   - Minimum 16 characters, mixed case, numbers, symbols
   - Write it down and store in safe (yes, physically)
2. Enable MFA on admin account
   - Use authenticator app (Google Authenticator, Microsoft Authenticator)
   - Save backup codes in safe place

**Configure company policies** (in admin console):
1. **Require MFA** for all users (enforce after 7 days)
2. **Master password requirements**:
   - Minimum 12 characters
   - Must include uppercase, lowercase, number
3. **Session timeout**: 15 minutes idle
4. **Password strength**: Require "Good" or better for saved passwords
5. **Restrict data export**: Only admins can export vault data

**1Password-specific settings:**
- Enable Travel Mode (users can hide sensitive vaults when traveling)
- Enable Watchtower (monitors for compromised passwords)
- Set up shared vaults (see Step 5)

**Bitwarden-specific settings:**
- Enable Password Strength Policy
- Enable Master Password Policy
- Set up Collections (see Step 5)

---

### Step 3: Invite and Onboard Users (2-4 hours for 20 employees)

**Create onboarding email:**

```
Subject: Action Required: Set Up [Company] Password Manager

Hi Team,

We're implementing 1Password [or Bitwarden] to improve our security and make
your life easier - no more remembering dozens of passwords!

WHAT TO DO (15 minutes):

1. Check your email for invite from 1Password/Bitwarden
2. Click "Accept Invitation"
3. Download the app:
   - Desktop: https://1password.com/downloads
   - Phone: App Store or Google Play
   - Browser extension: Chrome/Firefox/Safari
4. Create your Master Password (you'll need to remember this one!)
   - Minimum 12 characters
   - Write it down and store safely
5. Complete the setup wizard

DEADLINE: Friday [DATE] - after this date, you'll be required to use MFA to
access company accounts.

SUPPORT: [ADMIN NAME] is available for help at [EMAIL/SLACK]

Video tutorial: [link to 1Password or Bitwarden getting started video]

Questions? Reply to this email or message [ADMIN] on Slack.

Thanks,
[YOUR NAME]
```

**Onboarding support:**
- Schedule 30-minute group training session (optional, but helpful)
- Be available for 1:1 help during first week
- Share tutorial videos:
  - 1Password: https://support.1password.com/getting-started/
  - Bitwarden: https://bitwarden.com/learning/

**Installation checklist per user:**
- [ ] Desktop app installed
- [ ] Browser extension installed
- [ ] Mobile app installed
- [ ] Master password created and saved securely
- [ ] MFA enabled (authenticator app)

**Track adoption:**
Create a spreadsheet:
- Employee name
- Invited (date)
- Account created (date)
- MFA enabled (date)
- Status (Pending / Active)

**Follow up with stragglers** after 3 days.

---

### Step 4: Migrate Existing Passwords (1-2 hours per user, self-service)

**Employee instructions:**

**Easy method** (recommended):
1. **Use browser password import**
   - 1Password: Can import from Chrome, Firefox, Safari
   - Bitwarden: Can import from Chrome, Firefox, Edge, Safari
2. **In password manager**: Settings → Import → Choose browser
3. **Review imported passwords**: Delete duplicates, update weak passwords

**Manual method** (if import doesn't work):
1. **Visit each website** as you normally would
2. **Log in** with existing password
3. **Password manager will prompt** to save password
4. **Click "Save"** - done!

**Priority accounts to migrate first** (Week 1):
- [ ] Email (Gmail, Outlook)
- [ ] Banking and financial accounts
- [ ] Payroll (ADP, Gusto, etc.)
- [ ] Accounting (QuickBooks, Xero)
- [ ] Admin tools (Slack admin, Google Workspace admin)

**Less critical accounts** (Week 2+):
- [ ] SaaS tools (Trello, Asana, Zoom)
- [ ] Social media business accounts
- [ ] Customer portals
- [ ] Other services

**Update weak passwords as you go**:
- Use password manager's "Generate Password" feature
- Aim for 16+ characters
- Use suggested strong password, don't create your own

---

### Step 5: Set Up Shared Vaults/Collections (1 hour)

**Shared vaults** allow teams to share passwords without seeing the actual password.

**Example structure:**

| Vault/Collection Name | Who Has Access | What's In It |
|----------------------|----------------|--------------|
| **Executive** | CEO, COO, CFO | Banking, investor access, board docs |
| **Finance** | Finance team | Accounting software, payroll, credit cards |
| **Marketing** | Marketing team | Social media, advertising platforms, analytics |
| **Sales** | Sales team | CRM, sales tools, customer portals |
| **IT/Admin** | IT, admins | Domain registrar, hosting, DNS, SSL certs |
| **Shared Services** | Everyone | Wi-Fi password, Zoom, Slack, general tools |

**Create shared vaults:**

**1Password:**
1. Admin console → Vaults → Create Vault
2. Name it (e.g., "Marketing")
3. Add users/groups who should have access
4. Set permissions (Can View, Can Edit, Can Manage)

**Bitwarden:**
1. Admin console → Collections → New Collection
2. Name it (e.g., "Marketing")
3. Add users/groups
4. Set permissions (Read Only, Read/Write)

**Move passwords to shared vaults:**
1. Identify passwords that should be shared (e.g., company social media)
2. Move from personal vault to shared vault
3. Remove from personal vault

**Best practices:**
- ✅ Use shared vaults for business accounts
- ✅ Use personal vault for individual accounts
- ❌ Don't share personal passwords
- ❌ Don't create "Everyone" vault with admin passwords

---

### Step 6: Enable MFA on Critical Accounts (2-4 hours)

**Priority 1: Email** (do this first)

**Google Workspace:**
1. Admin console → Security → 2-Step Verification
2. Enable 2SV for all users
3. Choose: "Allow users to turn on 2SV" → Change to "Enforce 2SV"
4. Set grace period: 7 days (gives users time to set up)
5. Users will be prompted to set up MFA at next login

**Microsoft 365:**
1. Admin center → Users → Active users
2. Multi-factor authentication → Enable MFA
3. Select all users → Enable
4. Users will be prompted at next login

**Priority 2: Financial Accounts**

**Banking:**
- Most banks require MFA already
- If not, enable in Security Settings
- Use authenticator app, not SMS if possible

**Payroll (ADP, Gusto, etc.):**
- Log in as admin
- Settings → Security → Two-Factor Authentication → Enable
- Enforce for all users

**Accounting (QuickBooks, Xero):**
- QuickBooks: Profile → Security → 2-Step Verification → Enable
- Xero: Settings → Security → Two-Factor Authentication → Enable

**Priority 3: Admin Accounts**

**Google Workspace admin:**
1. Already enforced if you enabled 2SV in Priority 1
2. Consider requiring security key for super admins

**Microsoft 365 admin:**
1. Already required if you enabled MFA in Priority 1
2. Consider Conditional Access for admins

**Slack workspace admin:**
1. Workspace settings → Authentication → Two-Factor Authentication
2. Enable "Require 2FA for all members"
3. Set grace period: 7 days

**Domain registrar (GoDaddy, Namecheap, Cloudflare):**
- Critical: Controls your domain (can redirect email, website)
- Enable 2FA in account settings
- Use hardware key if available (YubiKey)

**Hosting/Cloud (AWS, Digital Ocean, Vercel):**
- Enable MFA in account security settings
- Use authenticator app or hardware key

**Priority 4: Other SaaS Tools** (Week 2)

For each tool:
1. Go to account settings → Security
2. Look for "Two-Factor Authentication" or "2FA" or "MFA"
3. Enable with authenticator app
4. Save backup codes in password manager

**Common tools:**
- GitHub/GitLab (if you use)
- Stripe/payment processors
- Social media (Facebook Business, LinkedIn, Twitter)
- Project management (Asana, Trello, Monday)
- Communication (Zoom, Google Meet)

---

## Access Control Best Practices

### Principle of Least Privilege

**What it means**: Give people only the access they need to do their job, nothing more.

**How to implement:**

**1. Map roles to access levels:**

| Role | Needs Access To | Doesn't Need |
|------|-----------------|--------------|
| **Sales Rep** | CRM, email, calendar, Slack | Financials, payroll, admin settings |
| **Marketing** | Social media, analytics, design tools | CRM, financials, HR |
| **Finance** | Accounting, banking, payroll | CRM, development tools |
| **Developer** | GitHub, hosting, APIs | Financials, HR, customer data |
| **Admin/IT** | Everything (carefully) | Some things should need 2 people |

**2. Review access quarterly:**
- Who has admin access to each system?
- Do they still need it?
- Have they changed roles?
- Are there inactive accounts?

**3. Create a request process:**
```
To request access:
1. Slack @it-admin or email it@company.com
2. Specify: Tool name, access level needed, business justification
3. Manager approval required for admin access
4. Access provisioned within 1 business day
```

---

### Admin Account Management

**Separate admin from daily accounts:**

**Why**: If your daily account is compromised (phishing), attacker doesn't automatically get admin access.

**How**:
1. **Create separate admin account**: `admin-yourname@company.com` or `yourname-admin@company.com`
2. **Use admin account only for**:
   - Provisioning users
   - Changing settings
   - Sensitive operations
3. **Use daily account for**:
   - Email
   - Regular work
   - Non-admin tasks

**Admin account protections:**
- ✅ MFA required (authenticator app or hardware key)
- ✅ Hardware key (YubiKey) for extra protection
- ✅ Strong password (20+ characters)
- ✅ Used only when needed (not daily)
- ✅ Logged and monitored

**Break glass accounts:**
- Create emergency admin account
- Store credentials in safe (physical)
- Use only if primary admins locked out
- Check quarterly that it still works

---

### SSO (Single Sign-On)

**What is SSO**: Log in once, access all tools. No separate passwords for each app.

**Benefits:**
- ✅ Users only remember one password (or use SSO provider's MFA)
- ✅ Central control (disable one account = disable everything)
- ✅ Better security (one place to enforce MFA)
- ✅ Easier onboarding/offboarding

**When to implement SSO:**
- You have 20+ employees
- You use 10+ SaaS tools
- You're serious about security
- Budget allows ($5-10/user/month extra)

**SSO providers:**

| Provider | Price | Best For |
|----------|-------|----------|
| **Google Workspace** | Included | If already using Google |
| **Microsoft 365** | Included with Business Premium | If already using M365 |
| **Okta** | $2-5/user/mo | Enterprise features |
| **OneLogin** | $2-4/user/mo | Mid-market |

**Setup** (Google Workspace example):
1. Admin console → Apps → Web and mobile apps
2. Add app → Search for tool (e.g., "Slack")
3. Configure SAML SSO
4. Test with your account
5. Roll out to users

**Apps that support SSO:**
- Slack, Zoom, Asana, Trello, Monday
- GitHub, GitLab, Bitbucket
- Salesforce, HubSpot, Pipedrive
- Most modern SaaS tools (check their docs)

---

## Testing and Verification

### Week 1 Checklist

- [ ] Password manager purchased and admin set up
- [ ] All employees invited
- [ ] 80%+ employees have created accounts
- [ ] MFA enabled on email (Google/M365)
- [ ] MFA enabled on financial accounts
- [ ] Priority passwords migrated to password manager

### Week 2 Checklist

- [ ] 100% employees using password manager
- [ ] MFA enabled on all admin accounts
- [ ] MFA enabled on all SaaS tools (or 80%+)
- [ ] Shared vaults created and passwords organized
- [ ] Access review completed (who has access to what)

### Test Your Setup

**Test 1: Try to log in without MFA**
- Try logging into email without authenticator app
- Should be blocked ✅

**Test 2: Password manager works on all devices**
- Log into a website on laptop → Should autofill ✅
- Log into same website on phone → Should autofill ✅

**Test 3: Shared vaults work**
- Have non-admin log into shared account (e.g., company social media)
- They should see login in their vault ✅
- They should be able to log in ✅

**Test 4: Offboarding works**
- Remove test user from password manager
- Test user should lose access to all shared vaults ✅

---

## Common Pitfalls

### ❌ Pitfall #1: Writing Down Master Password Insecurely

**Problem**: Storing master password in unencrypted note, email, or weak location.

**Solution**:
- Write on paper, store in safe or locked drawer
- Or use password hint that only you understand
- Never email master password
- Never store in plain text file

---

### ❌ Pitfall #2: Not Enforcing MFA

**Problem**: "Allowing" MFA but not requiring it = 20% adoption.

**Solution**:
- Enforce MFA after 7-day grace period
- No exceptions for "I don't want to"
- Management must lead by example

---

### ❌ Pitfall #3: Sharing Passwords Outside Password Manager

**Problem**: "Just Slack me the password" bypasses the whole system.

**Solution**:
- Never share passwords via email, Slack, text
- Use password manager's sharing feature
- Or use shared vault/collection

---

### ❌ Pitfall #4: Using SMS for MFA

**Problem**: SMS can be intercepted (SIM swapping attacks).

**Solution**:
- Use authenticator app (Google Authenticator, Microsoft Authenticator)
- Or push notification (Duo)
- Or hardware key (YubiKey for admins)
- SMS is better than nothing, but avoid for critical accounts

---

### ❌ Pitfall #5: Not Having Backup Codes

**Problem**: Lose phone, can't access MFA, locked out of everything.

**Solution**:
- When enabling MFA, save backup codes
- Store backup codes in password manager
- Or print and store in safe
- Test backup codes periodically

---

## Success Metrics

Track these KPIs:

| Metric | Target | How to Measure |
|--------|--------|----------------|
| **Password manager adoption** | 100% | Admin dashboard |
| **MFA enabled on email** | 100% | Google/M365 admin console |
| **MFA enabled on admin accounts** | 100% | Manually verify |
| **MFA enabled on SaaS tools** | 80%+ | Audit log |
| **Password reuse** | 0% | Watchtower / Password Health report |
| **Weak passwords** | <5% | Password Health report |

**Check monthly:**
- [ ] All active employees in password manager
- [ ] MFA enforced on all critical systems
- [ ] No passwords reused across accounts
- [ ] Shared vaults organized and up to date

---

## Real-World Examples

### Example 1: Tech Startup (15 employees)

**Situation**: No password manager, mix of strong and weak passwords, no MFA except on banking.

**Implementation**:
- Chose 1Password ($8/user = $120/month)
- Onboarded all 15 employees in 1 week
- Enabled MFA on Google Workspace (company email)
- Enabled MFA on 12 SaaS tools
- **Total time**: 8 hours (1 person)

**Results**:
- 0 account compromises in 18 months (vs. 2 in previous year)
- Employees love not remembering passwords
- Onboarding new hires 30% faster (auto-provision access)

**ROI**: Previous breach cost $15K (forensics, downtime). 1Password costs $1,440/year. **10x ROI in year 1.**

---

### Example 2: Professional Services Firm (40 employees)

**Situation**: Using LastPass (consumer), no enforced MFA, 40% using reused passwords.

**Implementation**:
- Migrated to 1Password Business ($8/user = $320/month)
- Enforced MFA company-wide with 7-day deadline
- Created 5 shared vaults (Finance, Operations, Marketing, Sales, IT)
- Conducted access review and removed 15 unnecessary admin accounts
- **Total time**: 16 hours (2 people)

**Results**:
- 0 password-related incidents in 2 years
- Passed SOC 2 audit (auditor praised password management)
- Cyber insurance premium reduced 20% ($4K/year savings)

**ROI**: $3,840/year cost - $4,000/year insurance savings = **+$160/year** (net positive) plus prevented breaches

---

### Example 3: E-commerce Company (80 employees)

**Situation**: No password manager, inconsistent MFA, had recent credential stuffing attack on admin account.

**Implementation**:
- Deployed Bitwarden ($5/user = $400/month, chose for budget)
- Purchased YubiKeys for 8 admin accounts ($400 one-time)
- Enabled MFA on all 45 SaaS tools (took 2 weeks)
- Implemented SSO via Google Workspace for 30 tools
- **Total time**: 32 hours (4 people)

**Results**:
- Previous breach cost $50K (sales lost during downtime, forensics, PR)
- 0 breaches in 2 years after implementation
- Employee satisfaction up (less password friction with SSO)

**ROI**: $5,200/year cost vs. $50K breach every ~2 years = **~17x ROI**

---

## Next Steps

**Immediate (this week)**:
1. Choose password manager (1Password or Bitwarden)
2. Purchase and set up admin account
3. Invite all employees
4. Enable MFA on company email

**Week 2**:
1. Ensure 100% employee adoption
2. Enable MFA on all admin and financial accounts
3. Set up shared vaults
4. Begin MFA rollout on other SaaS tools

**Week 3**:
- Move to [Device Security Guide](04-device-security.md) - Endpoint protection and encryption

---

## Related Resources

- [Security Assessment](01-assessment.md) - Check your password security score
- [Email Security](03-email-phishing.md) - Protect the accounts you just secured
- [Tools Comparison](../TOOLS.md#1-password-managers) - Detailed password manager comparison
- [Onboarding Checklist](../templates/onboarding-checklist.md) - Include password manager setup

---

**Last Updated**: February 2026
**Estimated Time**: 4-8 hours over 2 weeks
**Expected ROI**: 80% reduction in account compromise risk
