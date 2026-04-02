# Device Security Guide

**Secure laptops, desktops, and mobile devices with endpoint protection and encryption**

---

## What You'll Learn

- How to deploy endpoint protection company-wide
- How to enable full disk encryption on all devices
- How to implement mobile device management (MDM)
- How to secure BYOD (bring your own device) scenarios
- How to handle lost or stolen devices

**Time Required**: 6-10 hours
**Difficulty**: Medium (some technical setup)
**ROI**: 60% reduction in device-based breaches

---

## Why This Matters

**Devices are the front door to your network:**

- 70% of breaches start at the endpoint (laptop, phone, desktop)
- Lost/stolen device with unencrypted data = data breach
- Average cost of lost laptop: $49,246 (not the hardware - the data on it)
- Ransomware typically enters via endpoint, not network

**Real breach examples:**
- **VA (2006)**: Unencrypted laptop stolen, 26.5M veterans' data exposed
- **Anthem (2015)**: Compromised laptop with admin credentials, 78.8M records breached
- **Equifax (2017)**: Unpatched endpoint software, 147M records exposed

**Good news**: Modern endpoint security is affordable and relatively easy to deploy.

---

## Prerequisites

Before starting:
- [ ] Inventory all company devices (laptops, desktops, phones, tablets)
- [ ] Choose endpoint protection tool
- [ ] Management buy-in for device policies
- [ ] Budget: $5-15/device/month
- [ ] Block 6-10 hours over 1-2 weeks

---

## Part 1: Endpoint Protection

### Step 1: Choose Endpoint Protection Tool (1 hour)

**What to look for:**
- Central management (see all devices in one dashboard)
- Real-time protection (stops threats before execution)
- Ransomware protection (detects and blocks encryption attempts)
- Cross-platform (Windows, Mac, Linux if needed)
- Reasonable price ($5-15/device/month)

**Recommended options:**

| Tool | Price | Best For | Pros | Cons |
|------|-------|----------|------|------|
| **Microsoft Defender** | $5/user (in M365 Business Premium) | Microsoft 365 users | Included, good integration | Less advanced than dedicated EDR |
| **Malwarebytes** | $8/device | Small teams (<20), Mac-heavy | Easy setup, good for Mac | Limited enterprise features |
| **SentinelOne** | $12/endpoint | Growing businesses (20-100) | AI-powered, excellent detection | Requires more management |
| **CrowdStrike** | $15/endpoint | High-security needs (100+) | Best-in-class, 24/7 SOC option | Most expensive, overkill for some SMBs |

**Decision matrix:**

**Choose Microsoft Defender if:**
- You already have M365 Business Premium
- Budget is tight
- You want "good enough" protection with minimal management

**Choose Malwarebytes if:**
- <20 employees
- Mac-heavy team
- Want simple, effective protection

**Choose SentinelOne if:**
- 20-100 employees
- Can afford $12/endpoint
- Want AI-powered threat detection
- Need detailed reporting

**Choose CrowdStrike if:**
- 100+ employees
- Handle sensitive data (financial, healthcare, legal)
- Need 24/7 monitoring
- Compliance requirements (SOC 2, ISO 27001)

---

### Step 2: Deploy Endpoint Protection (2-4 hours)

**Deployment methods:**

**Method 1: Manual install** (for <20 devices)
1. Create deployment email with download link
2. Employees install from portal
3. Track installation completion

**Method 2: Remote deployment** (for 20+ devices, recommended)
1. Use endpoint protection's deployment tools
2. Push install to all devices from admin console
3. No user action required

---

**Deployment steps** (SentinelOne example):

**1. Admin setup (30 minutes)**
1. Sign up for SentinelOne
2. Create account and add your organization
3. Download deployment package

**2. Create deployment policy (15 minutes)**
1. Admin console → Sentinels → Install
2. Choose OS (Windows, Mac, Linux)
3. Configure settings:
   - Real-time protection: ON
   - Ransomware protection: ON
   - Auto-update: ON
   - Automatic remediation: ON (recommended)
4. Download installer

**3. Deploy to devices (1-3 hours)**

**For Windows:**
- Use Group Policy, SCCM, or Intune to push MSI installer
- Or: Email installer link to employees with instructions

**For Mac:**
- Email PKG installer link
- Requires admin password to install

**For managed devices:**
- Use MDM (Jamf, Intune) to push install
- Silent installation, no user interaction

**4. Verify installation (30 minutes)**
1. Admin console → Sentinels → Agents
2. Check: All devices show "Protected" status
3. Test: Generate test detection (safe test file from vendor)

**5. Configure policies (30 minutes)**
1. Anti-ransomware: Enable with automatic rollback
2. USB device control: Block unknown USB drives (optional)
3. Application control: Block unauthorized apps (optional, advanced)
4. Network protection: Block known malicious IPs
5. Behavioral AI: Enable (uses ML to detect unknown threats)

---

### Step 3: Configure Endpoint Protection Settings (1 hour)

**Essential settings for all tools:**

**Scanning:**
- ✅ Real-time protection: ON
- ✅ Cloud-delivered protection: ON
- ✅ Automatic sample submission: ON
- ✅ Scheduled full scans: Weekly (weekends)
- ✅ Quick scans: Daily

**Updates:**
- ✅ Automatic virus definition updates: ON
- ✅ Automatic software updates: ON
- ⚠️ Reboot required: Outside business hours

**Exclusions:**
- Add only if performance issues (e.g., exclude development folders, database files)
- ❌ Don't exclude: Downloads folder, email attachments, USB drives

**User permissions:**
- ❌ Users cannot disable protection
- ❌ Users cannot modify settings
- ✅ Users can run manual scans
- ⚠️ Users can submit false positives (review process)

**Notifications:**
- ✅ Alert admins on threats detected
- ✅ Alert users on scans completed (optional)
- ❌ Don't spam users with every update

---

## Part 2: Full Disk Encryption

**Why encrypt:** If device is lost/stolen, data is protected even if someone removes the hard drive.

### Step 1: Enable Encryption on All Devices (1-2 hours)

**macOS - FileVault:**

**Enable FileVault (per device):**
1. System Settings → Privacy & Security → FileVault
2. Click "Turn On FileVault"
3. Choose recovery method:
   - **iCloud account** (easiest, recommended for most)
   - **Recovery key** (manual, store in password manager)
4. Restart computer (encryption happens in background)

**Time to encrypt**: 1-4 hours depending on drive size (happens in background)

**Verify encryption**:
```bash
fdesetup status
```
Should show: "FileVault is On"

**Deploy to all Macs** (if using MDM like Jamf):
1. Jamf Pro → Computers → Configuration Profiles
2. Create profile → FileVault
3. Enable FileVault
4. Set recovery key escrow (store in Jamf)
5. Deploy to all Macs

---

**Windows - BitLocker:**

**Enable BitLocker (per device):**
1. Settings → Privacy & Security → Device encryption
2. Turn on Device encryption (Windows 11)
3. Or: Control Panel → BitLocker Drive Encryption → Turn on BitLocker (Windows 10 Pro)
4. Choose recovery method:
   - **Save to Microsoft account** (easiest)
   - **Save to file** (store in password manager)
   - **Print recovery key** (store in safe)
5. Choose encryption mode:
   - **Used disk space only** (faster, new devices)
   - **Full disk** (slower, more secure, used devices)
6. Run encryption (takes 20 minutes to 2 hours)

**Verify encryption**:
```powershell
manage-bde -status
```
Should show: "Percentage Encrypted: 100%"

**Deploy to all Windows** (if using Intune/Group Policy):
1. Intune admin center → Endpoint security → Disk encryption
2. Create policy → BitLocker
3. Enable BitLocker on OS drives
4. Set recovery key escrow (store in Azure AD / Intune)
5. Deploy to all Windows devices

---

**Important: Store Recovery Keys Securely**

**Where to store:**
- ✅ Password manager (1Password, Bitwarden)
- ✅ MDM (Jamf, Intune) - auto-escrowed
- ✅ Printed copy in safe (as backup)

**Don't store:**
- ❌ On the encrypted device itself
- ❌ Plain text file in email or cloud storage
- ❌ Sticky note on laptop

**When you need recovery key:**
- Forgot password
- Hardware failure (move drive to new computer)
- OS corruption

---

### Step 2: Test Encryption (30 minutes)

**Test FileVault (Mac):**
1. Restart Mac
2. Should prompt for password before login screen
3. Enter password → macOS loads

**Test BitLocker (Windows):**
1. Restart Windows
2. (May not prompt on first boot)
3. To force prompt: Remove device from network, restart, enter recovery mode
4. Enter recovery key → Windows loads

**Test recovery key:**
1. On test device, simulate forgetting password
2. Boot to recovery
3. Enter recovery key
4. Should unlock ✅

---

## Part 3: Mobile Device Management (MDM)

**When you need MDM:**
- You issue company phones/tablets
- Employees access company email on personal devices (BYOD)
- You need to remotely wipe lost devices
- You want to enforce security policies (PIN, encryption)

**When you don't need MDM:**
- Employees only use company laptops (not phones)
- No BYOD
- No company-issued mobile devices

---

### Step 1: Choose MDM Solution (30 minutes)

| Tool | Price | Best For |
|------|-------|----------|
| **Microsoft Intune** | Included with M365 Business Premium | Microsoft 365 users, Windows + iOS/Android |
| **Jamf** | $4/device | Apple-heavy organizations (Mac + iOS) |
| **Kandji** | $4/device | Modern Apple management (easier than Jamf) |
| **Hexnode** | $3/device | Budget option, cross-platform |

**Choose Microsoft Intune if:**
- You already have M365 Business Premium
- You manage Windows laptops + iPhones/Androids
- Budget is tight (it's included)

**Choose Jamf if:**
- 100% Apple devices (Mac + iPhone + iPad)
- Need advanced Apple-specific features
- 100+ devices

**Choose Kandji if:**
- 100% Apple devices
- Want easier management than Jamf
- <100 devices

**Choose Hexnode if:**
- Mixed environment (iOS + Android + some Windows)
- Budget-conscious
- <50 devices

---

### Step 2: Deploy MDM (2-4 hours)

**Intune deployment example:**

**1. Set up Intune (1 hour)**
1. Microsoft 365 admin center → Setup → Intune
2. Enable Intune for your organization
3. Configure automatic enrollment (link to Azure AD)

**2. Create device policies (30 minutes)**

**iOS/iPadOS policy:**
- Require passcode (6+ digits)
- Require Face ID / Touch ID
- Auto-lock after 5 minutes
- Encrypt device (required)
- Allow MDM to erase device

**Android policy:**
- Require PIN (6+ digits)
- Encrypt device
- Block unknown app sources
- Allow MDM to erase device

**3. Enroll devices (1-2 hours for 20 devices)**

**Company-owned devices:**
- Intune admin center → Devices → Enroll → iOS/Android
- Use Apple Business Manager (iOS) or Android Enterprise (Android)
- Devices auto-enroll when activated

**BYOD (employee personal devices):**
1. Employees install **Company Portal** app (iOS App Store / Google Play)
2. Log in with work email
3. Follow enrollment wizard
4. MDM installs profile
5. Policies applied automatically

**4. Verify enrollment**
1. Intune admin center → Devices → All devices
2. Check: All devices show "Compliant" status
3. Test: Remote locate, remote wipe (on test device)

---

### Step 3: Configure MDM Policies (1 hour)

**Essential policies:**

**Security:**
- ✅ Require device encryption
- ✅ Require passcode/PIN (6+ digits)
- ✅ Auto-lock after 5 minutes idle
- ✅ Require biometric (Face ID, Touch ID, fingerprint) if available
- ✅ Max failed passcode attempts: 10 (then wipe device)

**App management:**
- ✅ Require Company Portal for work apps
- ✅ Block jailbroken/rooted devices
- ⚠️ Block app installation from unknown sources (Android)
- ⚠️ Block sideloading (iOS) - only if high security needs

**Data protection:**
- ✅ Require work data in approved apps only (Outlook, Teams, OneDrive)
- ✅ Block copy/paste between work and personal apps
- ✅ Block screenshots of work data (optional, may annoy users)

**Remote actions:**
- ✅ Remote locate
- ✅ Remote wipe (factory reset)
- ✅ Remote lock
- ⚠️ Selective wipe (remove work data only, keep personal)

---

## Part 4: BYOD (Bring Your Own Device)

**The challenge:** Employees want to use personal devices for work. You need to protect company data without invading privacy.

### BYOD Policy Template

**What's allowed:**
- ✅ Check work email on personal phone (via Company Portal / MDM)
- ✅ Access cloud files (Google Drive, OneDrive) via browser or app
- ✅ Join video calls (Zoom, Teams)
- ✅ Use approved SaaS apps (Slack, Asana, Trello)

**What's required:**
- ✅ Enroll device in MDM if accessing company email
- ✅ Install Company Portal app (iOS/Android)
- ✅ Use strong passcode (6+ digits)
- ✅ Enable auto-lock (5 minutes)
- ✅ Keep OS updated
- ✅ Allow IT to remotely wipe work data (not personal data)

**What's not allowed:**
- ❌ Download confidential files to personal device (unless approved)
- ❌ Jailbroken / rooted devices
- ❌ Public Wi-Fi without VPN for sensitive work

**Employee acceptance:**
When enrolling personal device:
```
By enrolling this device:
- IT can view device compliance (OS version, passcode enabled)
- IT can remotely wipe WORK DATA ONLY (not personal photos, apps, etc.)
- IT CANNOT view personal data, browsing history, or location
- You can unenroll at any time (but will lose access to work email)
```

---

## Part 5: Device Lifecycle Management

### Onboarding New Employees

**Checklist for new employee device setup:**

- [ ] Order device (or confirm BYOD)
- [ ] Install endpoint protection
- [ ] Enable full disk encryption
- [ ] Enroll in MDM (if mobile device or BYOD)
- [ ] Install approved apps (Office, Slack, etc.)
- [ ] Configure email/calendar
- [ ] Test: Can access all systems needed for role
- [ ] Add to device inventory spreadsheet

**Time**: 30-60 minutes per device

**Template**: [Onboarding Checklist](../templates/onboarding-checklist.md)

---

### Offboarding Departing Employees

**Immediate actions (within 24 hours):**

- [ ] Collect all company devices (laptop, phone, tablet, accessories)
- [ ] Disable all accounts (email, SaaS, VPN)
- [ ] Remove from MDM (if personal device, selective wipe only)
- [ ] Change passwords for shared accounts they accessed
- [ ] Review access logs for suspicious activity

**If device not returned:**
- [ ] Remote wipe device (via MDM or Find My Device)
- [ ] Block device serial number (prevent re-activation)
- [ ] Police report if theft suspected

**Data preservation:**
- [ ] Export/transfer Google Drive / OneDrive files to manager
- [ ] Forward email to manager
- [ ] Document handoff

**Device refurbishment (if returned):**
- [ ] Wipe device (factory reset)
- [ ] Verify data erased (don't just "delete files" - true secure erase)
- [ ] Reinstall OS
- [ ] Prepare for next employee

**Template**: [Offboarding Checklist](../templates/offboarding-checklist.md)

---

### Lost or Stolen Device Protocol

**If employee reports lost/stolen device:**

**Within 1 hour:**
1. **Attempt to locate device**
   - macOS: iCloud → Find My
   - Windows: Microsoft account → Find My Device
   - MDM: Intune/Jamf → Locate device
2. **If located**: Lock device remotely, display message with contact info
3. **If not located or in suspicious location**: Proceed to wipe

**Within 4 hours:**
1. **Remote wipe device** (factory reset)
   - macOS: iCloud → Erase
   - Windows: Microsoft account → Wipe
   - MDM: Intune/Jamf → Wipe device
2. **Change passwords** for accounts accessed from that device (especially if no encryption)
3. **Review recent activity** (email, file access) for suspicious behavior

**Within 24 hours:**
1. **File police report** (if theft suspected)
2. **Notify insurance** (if cyber insurance or device insurance)
3. **Document incident** (what device, what data, when lost, actions taken)
4. **Assess data exposure risk**:
   - Was device encrypted? ✅ = low risk
   - Did employee have MFA? ✅ = lower risk
   - What sensitive data was on device?

**If device had unencrypted confidential data:**
- May require breach notification (PDPA, GDPR)
- Consult legal counsel
- See [Incident Response Guide](08-incident-response.md)

---

## Testing and Verification

### Week 1 Checklist (Endpoint Protection)

- [ ] Endpoint protection tool chosen and purchased
- [ ] Deployed to all Windows devices
- [ ] Deployed to all Mac devices
- [ ] Admin console shows all devices "Protected"
- [ ] Test detection: Run test malware file (from vendor)
- [ ] Policies configured (real-time protection, auto-update, etc.)

### Week 2 Checklist (Encryption)

- [ ] FileVault enabled on all Macs
- [ ] BitLocker enabled on all Windows PCs
- [ ] Recovery keys stored securely (password manager or MDM)
- [ ] Tested recovery process on one device
- [ ] All devices show "Encrypted" in admin dashboard

### Week 3 Checklist (MDM, if applicable)

- [ ] MDM tool chosen and set up
- [ ] Company-owned mobile devices enrolled
- [ ] BYOD policy created and communicated
- [ ] BYOD devices enrolled (if any)
- [ ] Tested remote locate and wipe on test device
- [ ] All devices show "Compliant" in MDM dashboard

---

## Common Pitfalls

### ❌ Pitfall #1: Deploying Endpoint Protection Without Testing

**Problem**: Software conflicts with existing tools, causes performance issues, blocks legitimate apps.

**Solution**:
- Test on 2-3 devices first (different OS, different roles)
- Monitor for 1 week
- Fix any conflicts or false positives
- Then deploy company-wide

---

### ❌ Pitfall #2: Not Storing Recovery Keys

**Problem**: Employee forgets password, device encrypted, recovery key not saved = data lost.

**Solution**:
- Auto-escrow recovery keys to MDM (Intune, Jamf)
- Or: Store manually in password manager
- Test recovery process quarterly

---

### ❌ Pitfall #3: Allowing Users to Disable Endpoint Protection

**Problem**: User disables antivirus because "it's slowing down my computer" → device infected.

**Solution**:
- Configure endpoint protection to not allow user disable
- Set policy in admin console: "User cannot turn off protection"
- Monitor dashboard for devices with protection disabled

---

### ❌ Pitfall #4: Not Having Remote Wipe Capability Before Device Lost

**Problem**: Device lost, no way to wipe it, unencrypted data exposed.

**Solution**:
- Enable Find My Device (macOS, Windows) or MDM BEFORE device lost
- Test remote wipe on old device before employee leaves
- Make remote wipe capability a requirement for BYOD

---

## Success Metrics

| Metric | Target | How to Measure |
|--------|--------|----------------|
| **Endpoint protection coverage** | 100% of devices | Admin dashboard |
| **Devices encrypted** | 100% | Admin dashboard or manual check |
| **MDM enrollment** (company devices) | 100% | MDM dashboard |
| **BYOD enrollment** (if accessing email) | 100% | MDM dashboard |
| **Malware detections** | 0 successful infections | Admin dashboard |
| **Unpatched devices** | 0% | Endpoint protection dashboard |
| **Lost device response time** | <4 hours to remote wipe | Incident log |

---

## Real-World Examples

### Example 1: Design Agency (18 employees, Mac-heavy)

**Situation**: All Macs, no endpoint protection except built-in, no encryption, 1 laptop stolen (data breach reported to clients).

**Implementation**:
- Deployed Malwarebytes for Mac ($8/device = $144/month)
- Enabled FileVault on all Macs (via Jamf)
- Enrolled all devices in Jamf MDM ($4/device = $72/month)
- Total: $216/month

**Results**:
- 0 malware infections in 2 years
- Laptop stolen: Remotely wiped within 2 hours (no breach)
- Clients satisfied with security posture

**ROI**: Previous breach cost $25K (legal, notification, client loss). Annual cost: $2,592. **9.6x ROI.**

---

### Example 2: Professional Services (45 employees, mixed Windows/Mac)

**Situation**: Mix of Windows and Mac, consumer-grade antivirus, no encryption, no MDM.

**Implementation**:
- Deployed SentinelOne ($12/endpoint = $540/month)
- Enabled BitLocker (Windows) and FileVault (Mac)
- Deployed Microsoft Intune (included with M365 Business Premium)
- Created BYOD policy, enrolled 25 personal phones

**Results**:
- Detected and blocked 3 ransomware attempts in 18 months
- 0 successful breaches
- 2 phones lost: Remotely wiped in <1 hour
- Passed cyber insurance audit (premium reduced 15% = $3K/year)

**ROI**: $6,480/year cost - $3,000/year insurance savings = $3,480 net. Plus prevented 3 ransomware attacks (avg cost $100K each). **97x ROI.**

---

### Example 3: E-commerce Startup (8 employees)

**Situation**: Bootstrapped startup, tight budget, all Mac laptops, no mobile security.

**Implementation** (budget approach):
- Used Microsoft Defender (included with M365 Business Standard they already had)
- Enabled FileVault manually on all Macs (no MDM)
- Used Apple's built-in "Find My" for remote wipe
- BYOD: Required strong passcodes, no MDM enrollment

**Results**:
- $0 additional cost (used included tools)
- 0 malware infections
- 1 laptop lost: Remotely wiped via Find My

**ROI**: $0 cost, prevented potential breach. **Infinite ROI.**

---

## Next Steps

**This week (Week 3):**
1. Choose endpoint protection tool
2. Deploy to all Windows devices
3. Deploy to all Mac devices
4. Enable BitLocker on Windows
5. Enable FileVault on Mac

**Next week (Week 4):**
1. Verify all devices encrypted
2. Store recovery keys securely
3. Set up MDM (if applicable)
4. Create BYOD policy

**Month 2:**
- Move to [Network Security Guide](05-network-security.md) - VPN and Wi-Fi security

---

## Related Resources

- [Security Assessment](01-assessment.md) - Check your device security score
- [Onboarding Checklist](../templates/onboarding-checklist.md) - Device setup for new hires
- [Offboarding Checklist](../templates/offboarding-checklist.md) - Secure device removal
- [Tools Comparison](../TOOLS.md#3-endpoint-protection) - Endpoint protection comparison

---

**Last Updated**: February 2026
**Estimated Time**: 6-10 hours
**Expected ROI**: 60% reduction in device-based breaches
