# Cloud Security: Hardening Google Workspace & Microsoft 365

**Why This Matters**: 93% of SMBs use cloud services (Google Workspace, Microsoft 365, Slack, Dropbox), but only 23% have security policies for SaaS applications. Cloud misconfigurations cause 65% of data breaches.

**Business Impact**:
- **Without cloud security**: Exposed customer data, regulatory fines, reputational damage
- **With cloud security**: Protected data, compliance-ready, employee productivity without risk
- **ROI**: $50K-$200K+ in prevented breaches per year

---

## Prerequisites

Before starting this guide:
- ✅ Password manager deployed (Guide 02)
- ✅ MFA enabled on admin accounts (Guide 02)
- ✅ You have admin access to Google Workspace or Microsoft 365
- ⏱️ **Time needed**: 4-6 hours for initial setup, 30 min/month for auditing

---

## Part 1: Google Workspace Security Hardening

### Step 1: Enable Advanced Security Settings

**Go to: Google Admin Console → Security → Overview**

**1.1: Enable 2-Step Verification (2SV) enforcement**
- Security → Authentication → 2-Step Verification
- Settings:
  - ☑ **Allow users to turn on 2-Step Verification** → ON
  - ☑ **Enforcement** → Set to "On" for all users
  - Grace period: 2-4 weeks (gives employees time to set up)
  - Methods allowed: ☑ Google Authenticator app, ☑ Security keys, ☐ SMS (disable - less secure)

**1.2: Configure password policies**
- Security → Password Management
- Settings:
  - Password length: **12 characters minimum** (up from default 8)
  - Password strength: **Enforce strong passwords** → ON
  - Password reuse: **Prevent password reuse** → ON (24 passwords)
  - Password expiration: **Never** (NIST recommends no expiration with MFA)

**1.3: Enable security alerts**
- Security → Alert Center → Manage Rules
- Enable these critical alerts:
  - ☑ Suspicious login activity
  - ☑ Leaked password
  - ☑ User suspended (too many failed logins)
  - ☑ Device compromised
  - ☑ User granted Admin privilege
  - ☑ Government-backed attack warning
  - Send alerts to: security@yourcompany.com (create if doesn't exist)

**Time**: 30 minutes

### Step 2: Configure Data Loss Prevention (DLP)

**Go to: Admin Console → Security → Data Protection → Data Loss Prevention**

**2.1: Create DLP rule for credit card numbers**
- Click "Add Rule" → Use template "Credit card number"
- Settings:
  - Name: "Block credit card sharing"
  - Scope: Gmail, Drive, Chat
  - Conditions: Content contains → Credit card number
  - Action:
    - ☑ Block external sharing
    - ☑ Notify admin
    - ☑ Show warning to user
  - Apply to: Entire organization

**2.2: Create DLP rule for SSN/NRIC (Singapore)**
- Click "Add Rule" → Custom
- Name: "Block SSN/NRIC sharing"
- Conditions: Content contains → Custom detector
  - Pattern: `[STFG]\d{7}[A-Z]` (Singapore NRIC format)
  - Or: `\d{3}-\d{2}-\d{4}` (US SSN format)
- Action: Same as 2.1 (block, notify, warn)

**2.3: Create DLP rule for confidential documents**
- Click "Add Rule" → Custom
- Name: "Protect confidential documents"
- Conditions:
  - Document title contains: "confidential", "internal only", "proprietary"
  - OR Document contains: "CONFIDENTIAL" in header/footer
- Action:
  - ☑ Block external sharing
  - ☑ Notify document owner before external share
  - ☑ Require justification for external share

**Note**: DLP requires Google Workspace Enterprise or Business Plus. If you have Business Standard, upgrade ($18/user/month → $22/user/month) or rely on manual sharing controls.

**Time**: 45 minutes

### Step 3: Control External Sharing

**Go to: Admin Console → Apps → Google Workspace → Drive and Docs → Sharing settings**

**3.1: Default sharing permissions**
- Default link sharing: **Restricted** (only people with access)
- NOT "Anyone with the link" (major security risk)

**3.2: External sharing rules**
- Sharing options:
  - ☑ Allow users in [Your Domain] to share externally → ON
  - ☑ Allow external users to collaborate → ON
  - ☐ Allow public on the web → **OFF** (prevents accidental public docs)
- Warning on external shares: **ON** (users see warning before sharing outside org)
- Access checker: **ON** (Drive warns if file accessible to "Anyone")

**3.3: Link expiration**
- Security → Data Protection → Link Sharing
- Set expiration for external links: **30 days** (or 90 days for less sensitive data)
- Prevents old links from remaining active forever

**Time**: 20 minutes

### Step 4: Audit Account Activity

**Monthly audit (30 min/month):**

**4.1: Review admin activity**
- Admin Console → Security Audit → Admin log events
- Look for:
  - New admin accounts created (expected or suspicious?)
  - Permission changes (user promoted to admin)
  - Security settings changed (MFA disabled, password policy relaxed)
  - Data export events (someone downloaded all Gmail or Drive data)

**4.2: Review login activity**
- Reports → Audit → Login
- Filter by: Failed login attempts (>10 failures = possible attack)
- Look for:
  - Logins from unexpected countries (employee traveling or compromised?)
  - Logins at unusual times (3 AM activity)
  - Multiple concurrent sessions from different IPs

**4.3: Review suspicious file activity**
- Reports → Audit → Drive
- Look for:
  - Mass file downloads (employee downloading entire Drive before leaving?)
  - External shares of sensitive folders
  - Large file uploads to personal accounts

**Time**: 30 min/month

---

## Part 2: Microsoft 365 Security Hardening

### Step 1: Enable Security Defaults

**Go to: Azure AD Admin Center → Properties → Manage Security defaults**

**What security defaults enable:**
- ☑ MFA required for all users (especially admins)
- ☑ Legacy authentication blocked (old email clients like Outlook 2010)
- ☑ Admin MFA always enforced
- ☑ Users prompted for MFA when sign-in risk detected

**Enable security defaults:**
1. Azure AD → Properties → Manage Security defaults
2. Set "Enable Security defaults" → **Yes**
3. Save

**If you have Conditional Access policies** (Microsoft 365 Business Premium or E3+):
- Security defaults will be disabled
- Use Conditional Access instead (see Step 1B)

**Time**: 10 minutes

### Step 1B: Configure Conditional Access (Premium plans only)

**Go to: Azure AD → Security → Conditional Access**

**Policy 1: Require MFA for all users**
- Create new policy
- Name: "Require MFA - All Users"
- Assignments:
  - Users: All users
  - Cloud apps: All cloud apps
- Access controls:
  - Grant: Require multi-factor authentication
  - Session: Sign-in frequency → 30 days
- Enable policy: **Report-only** (test first), then **On**

**Policy 2: Block legacy authentication**
- Name: "Block Legacy Authentication"
- Assignments:
  - Users: All users
  - Client apps: Exchange ActiveSync clients, Other clients
- Access controls:
  - Block access
- Enable policy: **On**

**Policy 3: Require compliant devices for admins**
- Name: "Admins - Require Compliant Device"
- Assignments:
  - Users: Directory role → Global Administrator, Exchange Administrator, SharePoint Administrator
  - Cloud apps: All cloud apps
- Access controls:
  - Grant: Require device to be marked as compliant
  - OR: Require Hybrid Azure AD joined device
- Enable policy: **On**

**Time**: 60 minutes

### Step 2: Configure Data Loss Prevention (DLP)

**Go to: Microsoft Purview compliance portal → Data loss prevention → Policies**

**2.1: Enable DLP for credit cards**
- Create policy → Use template → Financial → "U.S. Financial Data"
- Settings:
  - Name: "Block credit card sharing"
  - Locations: Exchange email, SharePoint sites, OneDrive accounts, Teams chat
  - Conditions: Content contains → Credit Card Number
  - Actions:
    - ☑ Restrict access to content (blocks sending email or sharing file)
    - ☑ Send incident report to admin
    - ☑ Show policy tip to users
  - Apply to: All users

**2.2: Enable DLP for SSN/NRIC**
- Create policy → Use template → Privacy → "Singapore Personal Data"
- Settings:
  - Conditions: Content contains → Singapore NRIC, Passport numbers
  - Actions: Same as 2.1

**2.3: Custom DLP for confidential keywords**
- Create policy → Custom
- Name: "Confidential documents protection"
- Conditions:
  - Document properties → Classification label = "Confidential"
  - OR Document contains: "Confidential", "Internal Only", "Proprietary"
- Actions: Block external sharing, notify admin

**Note**: DLP requires Microsoft 365 Business Premium, E3, or E5. If you have Business Basic/Standard, upgrade or use manual controls.

**Time**: 45 minutes

### Step 3: Control External Sharing (SharePoint/OneDrive)

**Go to: SharePoint Admin Center → Policies → Sharing**

**3.1: Set default sharing level**
- External sharing:
  - SharePoint: **New and existing guests** (not "Anyone")
  - OneDrive: **New and existing guests** (not "Anyone")
- Rationale: "Anyone" links allow unauthenticated access (major risk)

**3.2: Advanced settings**
- Guest access:
  - ☑ Guests must sign in using the same account to which sharing invitations are sent
  - ☑ Allow guests to share items they don't own → **OFF**
- Link expiration:
  - Anyone links: **30 days** (or disable entirely)
  - Guest links: **90 days**
- Default link type: **Specific people** (not "Anyone with the link")

**3.3: Block file types**
- File types to block: `.exe`, `.bat`, `.cmd`, `.ps1` (prevents malware sharing)
- Advanced → Block file extensions → Add extensions

**Time**: 20 minutes

### Step 4: Enable Audit Logging

**Go to: Microsoft Purview → Audit**

**4.1: Turn on audit logging**
- Audit → Start recording user and admin activity
- Enable: **On**
- Retention: 90 days (default), or 1 year (with E5)

**4.2: Monthly audit review**
- Search audit log for:
  - User activities: "Shared file, folder, or site", "Downloaded file"
  - Admin activities: "Added user", "Changed user password", "Updated organization settings"
  - Suspicious: "Failed to access file", "Deleted user", "Changed retention policy"

**Time**: 10 min setup, 30 min/month review

---

## Part 3: Third-Party SaaS Security Audit

### Step 1: Discover Shadow IT

**Shadow IT** = Employees using unapproved SaaS apps (Dropbox, WeTransfer, personal Gmail) that create security risks.

**Method 1: Review Google Workspace / Microsoft 365 OAuth grants**

**For Google Workspace:**
1. Admin Console → Security → API Controls → App access control
2. View "Third-party apps with account access"
3. Look for apps like:
   - Personal cloud storage (Dropbox, Box, pCloud)
   - File transfer services (WeTransfer, SendAnywhere)
   - Email services (personal Gmail forwarding)
   - Unknown apps with broad permissions

**For Microsoft 365:**
1. Azure AD → Enterprise applications → All applications
2. Filter by "User assigned" = Yes
3. Review permissions granted:
   - Red flags: "Read all files", "Send email as user", "Access contacts"

**Method 2: Review browser extensions (if you use Chrome Enterprise)**
- Chrome Admin Console → Devices → Chrome → Apps & extensions
- Review installed extensions:
   - Password managers (other than approved one)
   - VPNs (personal, not company-approved)
   - Screenshot tools (could capture sensitive data)

**Time**: 60 minutes

### Step 2: Approve or Block Apps

**For each discovered app, ask:**
1. **Is this app necessary for business?** (Yes → approve with policy, No → block)
2. **Does it handle customer data?** (Yes → vendor security review required)
3. **Is there a company-approved alternative?** (e.g., use company Dropbox, not personal)

**Google Workspace: Block or allow apps**
- Admin Console → Security → API Controls → App access control
- Settings:
  - ☑ Trust internal apps (your own org's apps)
  - ☐ Trust domain-owned apps (third-party apps in your domain)
  - ☑ Manage third-party app access → **Restricted** (admin approval required)
- To block specific app:
  - App access control → Configure new app → Block access to [app name]

**Microsoft 365: Block or allow apps**
- Azure AD → Enterprise applications → [App name]
- To block: Properties → Enabled for users to sign in? → **No**
- To restrict: Permissions → Admin consent required → Yes

**Time**: 30 minutes

### Step 3: Implement SaaS Security Policy

**Create policy document** (see `templates/security-policy.md` for full template):

**SaaS Usage Policy (summary):**
1. **Approved apps**: [List your approved tools - Google Workspace, Slack, Notion, etc.]
2. **Approval required**: Any app that:
   - Stores customer data
   - Integrates with company email or drive
   - Costs >$50/month
3. **Prohibited apps**:
   - Personal cloud storage (Dropbox, iCloud, OneDrive personal accounts)
   - File transfer services (WeTransfer, Filemail)
   - Personal email forwarding
   - Unapproved AI tools (ChatGPT, Claude) if handling customer data
4. **How to request approval**:
   - Email IT/operations with: App name, purpose, cost, data it will access
   - Decision within 3 business days

**Communicate policy:**
- Email all employees
- Add to employee handbook
- Include in onboarding (see `templates/onboarding-checklist.md`)

**Time**: 90 minutes (policy creation and rollout)

---

## Part 4: Regular Security Audits

### Monthly Audit Checklist (30-45 min/month)

**Week 1: Admin activity review**
- ☐ Review admin log (new admins, permission changes, config changes)
- ☐ Check for suspicious logins (unusual locations, failed attempts)
- ☐ Review MFA enrollment status (who hasn't enrolled yet?)

**Week 2: Data sharing review**
- ☐ Review external file shares (anything overshared?)
- ☐ Check DLP alerts (what data was blocked or flagged?)
- ☐ Audit public links (any files accidentally public?)

**Week 3: Third-party app audit**
- ☐ Review new OAuth grants (what apps did users authorize this month?)
- ☐ Check for shadow IT (unapproved apps accessing company data)
- ☐ Review browser extensions (new extensions installed?)

**Week 4: User account review**
- ☐ Offboard departed employees (remove access, transfer data ownership)
- ☐ Review stale accounts (inactive >90 days → suspend)
- ☐ Check for shared accounts (sales@, support@ → convert to group or alias)

**Automation tip**: Use Google Apps Script or Microsoft Power Automate to email monthly reports automatically.

---

## Common Pitfalls

### ❌ Mistake 1: Enabling "Anyone with the link" as default sharing
**Why it's bad**: Files shared with "Anyone" are accessible without authentication. One leaked link = anyone can access.

**Fix**:
- Google Workspace: Default to "Restricted"
- Microsoft 365: Default to "Specific people"

**Real example**: "A sales team shared a pricing spreadsheet with 'Anyone' link. Link was posted on a public forum. Competitors accessed pricing data for 6 months before we discovered it."

---

### ❌ Mistake 2: Not enforcing MFA on admin accounts
**Why it's bad**: Admin accounts have god-mode access. If admin password is compromised without MFA, attacker controls your entire cloud tenant.

**Fix**:
- Google Workspace: Enforce 2SV for "Super Admin" group
- Microsoft 365: Security defaults or Conditional Access with MFA required

**Real example**: "Our IT admin reused a password that was in a breach. Attacker logged in, deleted all users, wiped all files. $150K in recovery costs. Would have been prevented by MFA."

---

### ❌ Mistake 3: Ignoring shadow IT
**Why it's bad**: Employees use unapproved apps (personal Dropbox, WeTransfer) to bypass company security. Company data leaks to uncontrolled locations.

**Fix**:
- Monthly audit of OAuth grants
- Block unapproved apps via admin console
- Provide approved alternatives (if you block Dropbox, provide Google Drive training)

**Real example**: "Employees used personal Gmail to forward work emails (easier on mobile). Customer PII was in personal Gmail inboxes. PDPA violation, $50K fine."

---

### ❌ Mistake 4: Setting DLP rules too strict (false positives)
**Why it's bad**: If DLP blocks legitimate work (e.g., sales team can't email contracts), employees find workarounds (screenshots, personal email).

**Fix**:
- Start with "Alert only" mode (no blocking) for 2-4 weeks
- Review alerts to tune false positives
- Then enable blocking for truly sensitive data (credit cards, SSN, contracts with "Confidential" label)

**Real example**: "We blocked all external document shares. Sales team couldn't send proposals. They started using personal Dropbox. DLP defeated."

---

### ❌ Mistake 5: Not monitoring audit logs
**Why it's bad**: You won't know about breaches, data exfiltration, or insider threats until it's too late.

**Fix**:
- Set up monthly calendar reminder (30 min/month)
- Automate alerts for critical events (new admin, mass file download, MFA disabled)
- Use Microsoft 365 Secure Score or Google Workspace Security Center for automated recommendations

**Real example**: "Employee downloaded all customer data 2 weeks before resigning. We only discovered it 3 months later during routine audit. Data was already sold to competitor."

---

## Testing & Verification

### Test 1: External sharing restrictions (15 min)

**Google Workspace:**
1. Create test document in Drive
2. Click "Share" → Try to set sharing to "Anyone with the link"
3. **Expected result**:
   - If DLP enabled: Warning appears or option is disabled
   - If not enforced: You can still do it (need to fix settings)

**Microsoft 365:**
1. Create test file in OneDrive
2. Click "Share" → Try to create "Anyone" link
3. **Expected result**:
   - If configured correctly: "Anyone" option is not available
   - Only "Specific people" or "People in [your org]" available

---

### Test 2: MFA enforcement (10 min)

**Test user MFA requirement:**
1. Ask employee to log out of Google/Microsoft
2. Log back in
3. **Expected result**:
   - If MFA enforced: Prompted to set up MFA (if not already done)
   - If not enforced: Can log in with just password (need to fix)

---

### Test 3: DLP rule (10 min)

**Google Workspace:**
1. Create test email with fake credit card number: `4532-1234-5678-9010`
2. Send to external Gmail address (personal email)
3. **Expected result**:
   - If DLP working: Email blocked or warning shown
   - If not working: Email sends normally (need to fix DLP rule)

**Microsoft 365:**
1. Create test email with fake SSN: `123-45-6789`
2. Try to send to external address
3. **Expected result**: Email blocked with policy tip explaining why

---

### Test 4: Shadow IT detection (20 min)

**Test OAuth grant visibility:**
1. Install test Chrome extension (e.g., Grammarly)
2. Grant it access to Google Workspace / Microsoft 365
3. Check admin console: App should appear in third-party apps list within 24 hours

---

## Success Metrics

### Week 1:
- ✅ MFA enforced for 100% of users (Google/Microsoft)
- ✅ External sharing default changed to "Restricted" / "Specific people"
- ✅ DLP rules created for credit cards and SSN/NRIC
- ✅ Audit logging enabled

### Month 1:
- ✅ 90%+ of employees completed MFA setup
- ✅ Zero files publicly accessible (no "Anyone" links)
- ✅ Shadow IT audit completed (list of unapproved apps)
- ✅ First monthly security audit completed

### Month 3:
- ✅ DLP rules tuned (false positives reduced by 50%)
- ✅ All unapproved apps blocked or approved with policy
- ✅ Security alerts reviewed weekly (no longer ignored)
- ✅ Zero successful phishing attacks resulting in account compromise

---

## Real-World Examples

### Example 1: Google Workspace DLP prevents data breach
**Company**: 30-person accounting firm (Singapore)
**Problem**: Employees emailed tax returns containing SSN/NRIC to clients without encryption

**Solution implemented**:
- Enabled DLP rule: Block emails containing Singapore NRIC pattern `[STFG]\d{7}[A-Z]`
- Alternative: Encrypted file sharing via Google Drive with expiration links

**Result**:
- 15 attempts to email NRIC data blocked in first month
- PDPA compliance improved
- **Prevented**: Potential $50K-$100K PDPA fine for data breach

---

### Example 2: Microsoft 365 Conditional Access stops credential stuffing
**Company**: 50-person e-commerce company (Malaysia)
**Problem**: Attacker obtained employee password from breach of unrelated service. Attempted to log in from Russia.

**Solution implemented**:
- Conditional Access policy: Require MFA for all sign-ins
- Risk-based Conditional Access: Block sign-ins from high-risk locations

**Result**:
- Login attempt from Russia was blocked (MFA required)
- Admin alerted via email within 5 minutes
- Employee's password was reset
- **Prevented**: Potential $200K+ breach (access to Shopify admin, customer data, payment processing)

---

### Example 3: Shadow IT audit discovers massive data leak
**Company**: 80-person SaaS startup (Singapore)
**Problem**: Routine audit revealed employees using personal Dropbox accounts

**Discovery**:
- Reviewed OAuth grants in Google Workspace
- Found 23 employees had granted personal Dropbox access to company Google Drive
- Estimated 500+ GB of company data synced to personal Dropbox accounts

**Solution implemented**:
- Blocked personal Dropbox via Google Workspace admin console
- Upgraded company Dropbox Business plan (was only using Google Drive)
- Policy: All file sharing must use approved apps only

**Result**:
- Recovered and deleted files from personal Dropbox accounts
- **Prevented**: Potential data breach if any employee's personal Dropbox was compromised
- **Cost**: $2,400/year for Dropbox Business vs. $500K+ potential breach cost

---

## Next Steps

### Immediate (today):
1. [ ] Enable MFA enforcement (Google Workspace or Microsoft 365)
2. [ ] Change default sharing to "Restricted" / "Specific people"
3. [ ] Enable audit logging

### This week:
1. [ ] Create DLP rules (credit cards, SSN/NRIC)
2. [ ] Conduct shadow IT audit (review third-party apps)
3. [ ] Test MFA and DLP with sample data

### This month:
1. [ ] Complete first monthly security audit (admin activity, sharing, apps)
2. [ ] Block or approve all discovered shadow IT apps
3. [ ] Create SaaS security policy document
4. [ ] Communicate policy to all employees

### This quarter:
1. [ ] Tune DLP rules based on false positives
2. [ ] Implement Conditional Access policies (Microsoft 365) or Context-Aware Access (Google Workspace)
3. [ ] Set up automated monthly audit reports
4. [ ] Review and update approved apps list

---

## Related Guides

- **Guide 02: Passwords & Access Control** - MFA setup before cloud hardening
- **Guide 03: Email Security & Phishing** - Email-specific security (DMARC, SPF, DKIM)
- **Guide 08: Incident Response** - What to do if cloud account is compromised
- **Template: Vendor Security Questionnaire** - How to vet third-party SaaS apps
- **Template: Security Policy** - Full company security policy including SaaS usage

---

## Frequently Asked Questions

**Q: Do I need Google Workspace Business Plus or Microsoft 365 Premium for these security features?**

**A**:
- **DLP**: Yes, requires Google Workspace Business Plus ($22/user/mo) or Microsoft 365 Business Premium ($22/user/mo)
- **MFA**: No, included in all plans (Business Basic and up)
- **Audit logging**: No, included in all plans (90-day retention)
- **Conditional Access**: Yes, requires Microsoft 365 Business Premium or E3 ($36/user/mo)

**If you have Basic/Standard plan**: Focus on MFA, sharing restrictions, and manual audit reviews. Upgrade when company grows past 20-30 employees or handles sensitive data (PII, financial, health).

---

**Q: Should I block all third-party app access to prevent shadow IT?**

**A**: **No**. Blocking all third-party apps breaks legitimate integrations (Slack, Zoom, DocuSign, accounting software).

**Better approach**:
1. Allow apps by default
2. Audit monthly to discover new apps
3. Block or approve apps case-by-case
4. Educate employees on why unapproved apps are risky (they'll comply if they understand)

---

**Q: How do I know if my current sharing settings are insecure?**

**Run this quick audit:**

**Google Workspace**:
1. Admin Console → Security → Security Health → Data Protection
2. Look for: "Files shared publicly" (red flag if >0)
3. Look for: "Files shared externally" (review list)

**Microsoft 365**:
1. SharePoint Admin Center → Policies → Sharing
2. Check: External sharing = "Anyone" (red flag, change to "New and existing guests")
3. Run report: PowerShell command `Get-SPOSite | Select Url, SharingCapability` (shows all sites with "Anyone" enabled)

---

**Q: Can employees still share files with clients and partners after enabling these restrictions?**

**A**: **Yes**. These settings don't prevent external sharing—they add guardrails:

**What employees can still do**:
- Share with specific external email addresses (john@clientcompany.com)
- Create guest accounts for frequent partners
- Share with expiration dates (links expire after 30-90 days)

**What employees can't do**:
- Create "Anyone" links that work without authentication (major security risk)
- Share files containing credit cards or SSNs externally (blocked by DLP)
- Bypass security warnings

**If employees complain**: Train them on secure alternatives. Most complaints come from lack of knowledge, not actual limitations.

---

## Conclusion

Cloud security is not a one-time setup—it's an ongoing practice. The initial hardening (MFA, DLP, sharing restrictions) takes 4-6 hours, but monthly audits (30-45 minutes) are critical for catching new risks.

**The 80/20 of cloud security:**
- 80% of breaches prevented by: MFA enforcement + restricted default sharing
- 20% additional protection from: DLP rules + shadow IT audits + monthly reviews

**Cost vs. benefit**:
- Setup time: 4-6 hours + 30 min/month
- Cost: $0-$50/month (if upgrading to Business Plus/Premium for DLP)
- Potential breach cost prevented: $50K-$500K

Start with MFA and sharing restrictions this week. Add DLP and audits this month.
