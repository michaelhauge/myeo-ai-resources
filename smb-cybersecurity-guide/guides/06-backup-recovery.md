# Backup & Disaster Recovery Guide

**Implement the 3-2-1 backup rule and create a disaster recovery plan**

---

## What You'll Learn

- How to implement the 3-2-1 backup rule
- How to choose and configure cloud backup solutions
- How to test backups (most critical step)
- How to create a disaster recovery plan
- How to recover from ransomware

**Time Required**: 4-8 hours
**Difficulty**: Medium (some technical setup + planning)
**ROI**: 100% recovery from ransomware (vs. $200K average ransom + downtime)

---

## Why This Matters

**Backups are your last line of defense:**

- 60% of small businesses close within 6 months of major data loss
- Average ransomware ransom: $200,000+
- Average downtime from ransomware: 21 days
- 93% of companies without backup that suffer major data loss go out of business within 1 year
- **But**: 58% of backups fail when you actually need them (because they're never tested)

**Real breach examples:**
- **Maersk (2017)**: Ransomware, $300M loss, 4,000 servers, 45,000 PCs encrypted. Recovered because 1 domain controller in Ghana survived (power outage saved it).
- **Colonial Pipeline (2021)**: Ransomware, $4.4M ransom paid, 6-day shutdown, gas shortage on East Coast. Had backups but restoration would take too long.
- **Garmin (2020)**: Ransomware, $10M ransom paid (reported), 5-day outage, production halted. Backups existed but were infected too.

**Good news**: With proper backups and testing, you can recover from ransomware in hours, not weeks, without paying ransom.

---

## Prerequisites

Before starting:
- [ ] Inventory all critical data (where it lives, who owns it)
- [ ] Calculate data size (how many GB/TB to back up)
- [ ] Choose backup solution(s)
- [ ] Budget: $10-20/month per computer + $0-50/month for servers
- [ ] Block 4-8 hours for setup + monthly 1 hour for testing

---

## Part 1: Understanding the 3-2-1 Rule

### The 3-2-1 Backup Rule

**3 copies** of your data:
- 1 primary (working copy on your computer)
- 2 backups

**2 different media** types:
- Example 1: Cloud backup + External hard drive
- Example 2: Cloud backup + NAS (Network Attached Storage)
- Not acceptable: 2 external drives (same media type)

**1 copy offsite:**
- Cloud backup (automatically offsite)
- Or: External drive stored at different physical location

**Why this works:**
- **Fire/theft**: Offsite backup survives
- **Ransomware**: Clean backup to restore from
- **Hardware failure**: Multiple copies ensure recovery
- **Human error**: Accidentally deleted files can be restored

---

### What Data to Back Up

**Priority 1: Critical (must back up)**
- [ ] Financial data (QuickBooks, Xero, invoices)
- [ ] Customer data (CRM, databases, customer files)
- [ ] Source code (if you're a dev shop) - use Git + cloud backup
- [ ] Contracts and legal documents
- [ ] Employee records (HR files, payroll)
- [ ] Email (if using POP3 - if using Gmail/M365, it's already backed up)

**Priority 2: Important (should back up)**
- [ ] Marketing materials (logos, brand assets, templates)
- [ ] Project files (work in progress)
- [ ] Internal documentation (SOPs, policies, wikis)
- [ ] Communication history (Slack exports if critical)

**Priority 3: Nice to have (optional)**
- [ ] Old archived files
- [ ] Non-critical apps and settings

**Don't need to back up:**
- ❌ Operating system (can reinstall)
- ❌ Applications (can reinstall)
- ❌ Files already in cloud (Google Drive, OneDrive, Dropbox) - they're already backed up
- ❌ Temporary files, cache

---

## Part 2: Cloud Backup Implementation

### Step 1: Choose Cloud Backup Solution (30 minutes)

| Tool | Price | Storage | Best For |
|------|-------|---------|----------|
| **Backblaze B2** | $9/computer | Unlimited | Individual computers, simple setup |
| **Acronis Cyber Protect** | $8/device | 250GB-1TB | Backup + antivirus in one |
| **Veeam Backup** | $10/workload | Varies | Servers, VMs, large scale |
| **Google Vault** | Included with Workspace | Depends on plan | Email/Drive archiving (not full backup) |
| **Microsoft 365 Archive** | Included | Depends on plan | Email/OneDrive retention (not full backup) |

**Choose Backblaze if:**
- Backing up individual computers (laptops, desktops)
- Want unlimited storage for flat rate
- Simple setup, no frills

**Choose Acronis if:**
- Want backup + antivirus combined
- Need image-based backup (full system restore)
- Budget allows $8/device

**Choose Veeam if:**
- Backing up servers or VMs
- Need enterprise features
- 50+ employees

**Google Vault / M365 Archive:**
- Only backs up email and cloud files
- NOT a full backup solution
- Use as supplement, not primary backup

---

### Step 2: Deploy Cloud Backup (2-4 hours for 20 computers)

**Backblaze deployment example:**

**1. Admin setup (30 minutes)**
1. Sign up at [Backblaze.com](https://www.backblaze.com/)
2. Create business account
3. Purchase licenses (1 per computer)

**2. Install on first device (test, 30 minutes)**
1. Download Backblaze installer
2. Install and enter license key
3. Select files to back up:
   - ✅ Documents
   - ✅ Desktop
   - ✅ Pictures
   - ✅ Videos (if business-related)
   - ❌ Operating System
   - ❌ Applications
4. Start initial backup (will take hours/days in background)

**3. Configure settings (15 minutes)**
- Backup schedule: Continuous (recommended) or Once daily
- Retention: Keep deleted files for 30 days (default) or Forever ($2/month extra)
- Encryption: Use Backblaze encryption key (easier) or your own key (more secure, but if you lose key, you lose data)
- Threads: Automatic (uses available bandwidth)

**4. Roll out to all devices (2-3 hours)**
- Email install instructions to all employees
- Or: Use deployment tool (MDM, Group Policy) to push install
- Track installation via Backblaze dashboard

**5. Monitor initial backup (1-7 days)**
- Backblaze dashboard → Check progress
- Initial backup can take days depending on data size
- Happens in background, doesn't slow down work

---

### Step 3: Configure Backup Retention (30 minutes)

**Retention policy** = How long to keep old versions and deleted files

**Recommended retention:**
- **Current files**: Forever (as long as subscription active)
- **Deleted files**: 30-90 days
- **File versions**: 30-90 days

**Why retention matters:**
- Ransomware can encrypt files weeks before you notice
- If backup only keeps 7 days, and ransomware encrypted 10 days ago, you have no clean backup
- **Recommendation**: 90-day retention minimum for businesses

**Backblaze retention:**
- Default: 30 days for deleted files
- Extended: "Forever" (really 1 year after file deleted) - $2/month/computer extra

**Where to configure:**
- Backblaze dashboard → Settings → Retention

---

## Part 3: Local Backup Implementation

**Why local backup:**
- ✅ Faster restore (no download from cloud)
- ✅ Offline protection (if cloud is down or compromised)
- ✅ Redundancy (satisfies "2 different media" in 3-2-1 rule)

### Step 1: Choose Local Backup Media (30 minutes)

**Options:**

| Media | Price | Capacity | Best For |
|-------|-------|----------|----------|
| **External hard drive** | $60-$150 | 1-4TB | Small data sets (<1TB) |
| **NAS (Network Attached Storage)** | $300-$1,000 | 4-20TB | Offices, shared backup |
| **Server with RAID** | $1,500+ | 10TB+ | Large organizations, mission-critical |

**Choose external hard drive if:**
- <1TB of data
- <20 employees
- Budget is tight
- Each person backs up their own device

**Choose NAS if:**
- 1-10TB of data
- 20-100 employees
- Want centralized backup (all devices backup to one NAS)
- Budget allows $300-$1,000

**Choose server with RAID if:**
- >10TB of data
- 100+ employees
- Mission-critical data
- Budget allows $1,500+

---

### Step 2: Set Up Local Backup (2-4 hours)

**External drive setup (per device):**

**macOS - Time Machine:**
1. Connect external drive to Mac
2. System Settings → General → Time Machine
3. Click "+" → Add backup disk
4. Select external drive
5. Encrypt backup (recommended)
6. Time Machine backs up hourly (keeps deleted files for 30 days)

**Windows - File History:**
1. Connect external drive to Windows
2. Settings → Update & Security → Backup
3. Add drive → Select external drive
4. Turn on "Automatically back up my files"
5. Backs up hourly (keeps versions for 1 year by default)

**Best practice**:
- Backup weekly
- Store drive offsite (take home from office, or vice versa)
- Rotate 2 drives: Week 1 uses Drive A (stored offsite), Week 2 uses Drive B (stored offsite)

---

**NAS setup (centralized backup):**

**Example: Synology NAS**

**1. Hardware setup (1 hour)**
1. Purchase Synology NAS (e.g., DS220+ ~$300 + 2x 4TB drives ~$200 = $500 total)
2. Install hard drives into NAS
3. Connect NAS to office network
4. Power on and follow setup wizard

**2. Configure RAID (30 minutes)**
- Choose RAID 1 (mirroring) for 2-bay NAS
- Provides redundancy: if 1 drive fails, data is safe on other drive
- Trade-off: 2x 4TB drives = 4TB usable space (other 4TB is redundancy)

**3. Install backup software (30 minutes)**
- Synology Active Backup for Business (free)
- Supports Windows, Mac, VMs, servers

**4. Deploy backup to devices (2 hours)**
- Install Synology backup agent on each device
- Configure backup schedule (nightly)
- Devices backup to NAS automatically

**5. Configure NAS cloud backup (offsite copy)**
- Synology can backup itself to cloud (Synology C2, Backblaze B2, Wasabi)
- This satisfies "1 offsite" requirement
- Cost: ~$5-$10/month/TB

---

## Part 4: Testing Backups (MOST CRITICAL)

**58% of backups fail when you need them. Testing is non-negotiable.**

### Monthly Backup Test (1 hour per month)

**Test every month, rotating through scenarios:**

**Month 1: Test file restore**
1. Delete a non-critical file
2. Restore from backup
3. Verify file content is correct
4. Time how long restore took

**Month 2: Test folder restore**
1. Delete a folder (Documents folder test)
2. Restore entire folder from backup
3. Verify all files restored correctly

**Month 3: Test deleted file recovery** (file deleted 2+ weeks ago)
1. Find file deleted weeks ago (check backup retention)
2. Restore file
3. Verify it's the correct version

**Month 4: Test bare-metal restore** (full system restore)
1. On test device (old laptop, VM)
2. Wipe device
3. Restore entire system from backup
4. Boot and verify all programs and data work
5. Time how long full restore took

**Repeat cycle:**
- Month 5: File restore
- Month 6: Folder restore
- Etc.

---

### Document Test Results

**Create backup test log spreadsheet:**

| Date | Test Type | Result | Time to Restore | Issues | Actions Taken |
|------|-----------|--------|-----------------|---------|---------------|
| 2026-02-15 | File restore | ✅ Pass | 2 min | None | - |
| 2026-03-15 | Folder restore | ⚠️ Partial | 15 min | 3 files missing | Increased retention to 90 days |
| 2026-04-15 | Deleted file | ✅ Pass | 5 min | None | - |
| 2026-05-15 | Full system | ❌ Fail | - | Backup corrupted | Switched to Acronis |

**If test fails:**
1. **Immediately fix the problem** (don't wait until you need backup in emergency)
2. Document what went wrong
3. Re-test after fix
4. Review backup configuration (are you backing up the right files?)

---

### Backup Monitoring

**Set up alerts:**
- ✅ Email if backup fails (Backblaze, Acronis, etc. can send alerts)
- ✅ Weekly backup status report (review in team meeting)
- ✅ Dashboard showing: Last backup time, data size, failed backups

**Red flags to watch for:**
- 🚨 Backup hasn't run in 48+ hours
- 🚨 Backup size suddenly dropped (did files get deleted?)
- 🚨 Backup size suddenly spiked (did ransomware encrypt files?)
- 🚨 Backup failing repeatedly

---

## Part 5: Disaster Recovery Plan

**Disaster recovery** = What to do when the worst happens.

### Step 1: Define RTO and RPO (30 minutes)

**RTO (Recovery Time Objective)**: How long can you be down?
- Example: "We need to be back online within 24 hours"
- Affects: What backup/restore solution you choose

**RPO (Recovery Point Objective)**: How much data can you afford to lose?
- Example: "We can't lose more than 1 hour of work"
- Affects: How frequently you backup (continuous vs. daily)

**SMB recommendations:**
- **RTO**: 24-48 hours (for most SMBs)
- **RPO**: 24 hours (daily backup acceptable for most)

**Mission-critical systems** (if you have them):
- **RTO**: 4-8 hours
- **RPO**: 1 hour or less (continuous backup)

---

### Step 2: Create Recovery Runbook (2-3 hours)

**Runbook** = Step-by-step instructions for recovering from disaster.

**Template:**

```markdown
# Disaster Recovery Runbook

## Scenario 1: Ransomware Attack

**Detection:**
- Files encrypted, ransom note appears
- Endpoint protection alerts
- Users report cannot open files

**Immediate Actions (within 1 hour):**
1. Disconnect infected devices from network (Wi-Fi off, unplug ethernet)
2. Identify patient zero (first infected device)
3. Contact IT/security: [NAME], [PHONE], [EMAIL]
4. Do NOT pay ransom yet
5. Do NOT delete encrypted files (may need for forensics)

**Containment (1-4 hours):**
1. Scan all other devices with endpoint protection
2. Isolate any infected devices
3. Change all passwords (assume credentials compromised)
4. Check backups (are they infected too?)

**Recovery (4-48 hours):**
1. Identify last known good backup (before encryption)
2. Test backup restore on isolated device first
3. Wipe infected devices (factory reset)
4. Restore from backup
5. Apply latest patches (prevent reinfection)
6. Reconnect to network
7. Monitor for 48 hours

**Communication:**
- Internal: [EMAIL TEMPLATE]
- Customers: [EMAIL TEMPLATE IF NEEDED]
- Insurance: [POLICY NUMBER], [PHONE]
- Legal: [LAW FIRM], [PHONE]

## Scenario 2: Hardware Failure (server crash, laptop stolen)

[Similar format...]

## Scenario 3: Natural Disaster (fire, flood, earthquake)

[Similar format...]
```

**Key elements:**
- Who to contact (with phone numbers, not just emails)
- Step-by-step actions
- Decision points ("If X, then Y")
- Communication templates
- Backup location and access instructions

**Store runbook:**
- [ ] Printed copy in safe
- [ ] Password manager (encrypted)
- [ ] Cloud storage (accessible from anywhere)
- [ ] With offsite backup drive

---

### Step 3: Assign Roles and Train Team (1 hour)

**Disaster recovery roles:**

**Incident Commander** (usually IT or Owner):
- Makes final decisions
- Coordinates response
- Communicates with stakeholders

**Technical Lead** (IT or technical employee):
- Executes recovery steps
- Manages backup restore
- Troubleshoots issues

**Communications Lead** (Marketing or HR):
- Communicates with employees
- Communicates with customers (if needed)
- Handles media (if disaster is public)

**Document Handler**:
- Documents everything (actions taken, timestamps, decisions)
- Maintains incident log
- Collects evidence (for insurance, legal)

**Train team:**
- Review runbook annually
- Run tabletop exercise (simulate disaster, walk through response)
- Update contact information quarterly

---

## Part 6: Recovering from Ransomware

### If You Get Hit by Ransomware

**DO:**
1. ✅ Disconnect infected devices immediately
2. ✅ Contact IT/security/incident response firm
3. ✅ Restore from backup (if you have clean backup)
4. ✅ Report to authorities (FBI IC3, local police)
5. ✅ Notify insurance (cyber insurance)
6. ✅ Document everything (for insurance claim)

**DON'T:**
1. ❌ Pay ransom immediately (explore all options first)
2. ❌ Delete encrypted files (may need for decryption key or forensics)
3. ❌ Reconnect to network until devices are clean
4. ❌ Assume single device infected (check all)

---

### Should You Pay the Ransom?

**Consider paying if:**
- You have no backup (data is unrecoverable otherwise)
- Backup is also encrypted
- Downtime cost exceeds ransom cost
- Legal/regulatory pressure (HIPAA, GDPR - must restore quickly)

**Don't pay if:**
- You have clean backup (restore instead)
- Ransom is extremely high (>$500K)
- Data is not critical
- Principle (paying encourages attackers)

**If you pay:**
- Use escrow service (prevents being scammed)
- Negotiate (initial ransom is usually 2-3x final price)
- Get decryption key and test before final payment
- Still restore from backup after (don't trust decrypted files)

**Typical negotiation:**
- Initial demand: $500K
- Counter offer: $50K
- Final price: $100-150K
- Time to decrypt: 1-7 days (slow)

**Why you still need backup even if you pay:**
- 40% of ransomware decryption fails (doesn't restore all files)
- Decryption takes days to weeks
- Attackers may have left backdoor (reinfection risk)

---

## Testing and Verification

### Week 1 Checklist (Setup)

- [ ] Cloud backup solution chosen and purchased
- [ ] Cloud backup deployed to all devices
- [ ] Initial backup started (will take days)
- [ ] Local backup method chosen
- [ ] First local backup completed

### Month 1 Checklist (Implementation)

- [ ] All devices backing up to cloud successfully
- [ ] Local backups configured (weekly minimum)
- [ ] Retention policy set (90 days recommended)
- [ ] Backup monitoring/alerts set up
- [ ] First backup test completed (file restore)

### Month 2 Checklist (Testing)

- [ ] Second backup test completed (folder restore)
- [ ] Backup test log started
- [ ] Disaster recovery runbook created
- [ ] DR roles assigned
- [ ] RTO/RPO defined

### Ongoing

- [ ] Monthly backup tests (rotate scenarios)
- [ ] Quarterly runbook review
- [ ] Annual DR tabletop exercise
- [ ] Local backup stored offsite (verify weekly)

---

## Common Pitfalls

### ❌ Pitfall #1: Never Testing Backups

**Problem**: Backup runs daily, shows "Success," but when you need to restore, it fails. Corrupted backup went unnoticed for months.

**Solution**:
- Test monthly (minimum)
- Document test results
- Fix failed tests immediately
- Test full restore (not just file restore) quarterly

---

### ❌ Pitfall #2: Backing Up to Same Location as Original

**Problem**: Backup external drive connected to infected computer, ransomware encrypts both.

**Solution**:
- Use cloud backup (offsite)
- Or: Disconnect external drive after backup, store offsite
- Never leave backup drive connected 24/7

---

### ❌ Pitfall #3: Short Retention (7-14 days)

**Problem**: Ransomware can lay dormant for weeks. By the time you notice, all backups within 7-day retention window are infected.

**Solution**:
- 90-day retention minimum for businesses
- Longer for critical data (1 year)
- Cost: $2-$5/month extra (worth it!)

---

### ❌ Pitfall #4: Backup Uses Same Credentials as Production

**Problem**: Attacker steals admin credentials, accesses backup system, deletes backups before encrypting files.

**Solution**:
- Separate backup admin account
- MFA on backup admin account
- Immutable backups (cannot be deleted, even by admin) - Backblaze B2, AWS S3 Glacier

---

### ❌ Pitfall #5: No Disaster Recovery Plan

**Problem**: Ransomware hits, team panics, no idea what to do, wasted hours/days figuring it out.

**Solution**:
- Write DR runbook (even simple 2-page version)
- Print and store in safe
- Review annually
- Run tabletop exercise

---

## Success Metrics

| Metric | Target | How to Measure |
|--------|--------|----------------|
| **Backup coverage** | 100% of critical data | Backup dashboard |
| **Backup success rate** | 100% (all devices backing up) | Backup monitoring |
| **Test pass rate** | 100% (all monthly tests pass) | Backup test log |
| **RTO** (recovery time) | <24 hours | Disaster recovery test |
| **RPO** (data loss) | <24 hours | Backup frequency |
| **Offsite backup** | 100% of data | Verify cloud or offsite drive |

---

## Real-World Examples

### Example 1: Architecture Firm (22 employees)

**Situation**: No backup, relied on "cloud storage" (Dropbox), ransomware encrypted local files and synced to Dropbox (deleted backups).

**Disaster**: $180K in recovery costs, 3 weeks downtime, lost 2 major clients.

**Post-disaster implementation**:
- Backblaze ($9/computer = $198/month)
- Synology NAS ($600 one-time + $200/year drives)
- 90-day retention
- Monthly backup tests

**Results**:
- Ransomware hit again 1 year later
- Restored from backup in 12 hours
- $0 ransom paid
- 0 data lost

**ROI**: First disaster cost $180K. Prevention cost $2,976/year. **60x ROI.**

---

### Example 2: Professional Services (40 employees)

**Situation**: Had backup (Backblaze) but never tested it. Ransomware hit, discovered backups were corrupted.

**Disaster**: Paid $75K ransom, 18 days downtime, decryption only recovered 60% of files.

**Post-disaster fixes**:
- Switched to Acronis Cyber Protect ($8/device = $320/month)
- Added NAS with weekly backups
- Implemented monthly backup tests
- Created DR runbook

**Results**:
- No ransomware since (3 years)
- But: Tested recovery (full restore) annually - works every time
- Sleep better knowing backups work

**ROI**: Previous disaster cost $75K + $500K in lost revenue. Prevention cost $3,840/year. **149x ROI.**

---

### Example 3: E-commerce Startup (8 employees)

**Situation**: No formal backup, relied on GitHub (code) and Google Drive (docs), but customer database not backed up.

**Implementation** (proactive, before disaster):
- Backblaze ($9/computer = $72/month)
- Daily database dump to Google Cloud Storage ($5/month)
- Quarterly full restore test
- Simple 1-page DR runbook

**Results**:
- Hard drive failure (laptop): Restored in 3 hours
- Accidental database deletion: Restored from backup (1 hour old)
- Total downtime: 4 hours (vs. potential weeks)

**ROI**: $852/year cost vs. potential $200K+ disaster. **234x ROI** (prevented).

---

## Next Steps

**This week (Month 2):**
1. Choose cloud backup solution
2. Deploy to all devices
3. Choose local backup method
4. Complete first backup (cloud + local)

**Next week:**
1. Verify all devices backing up successfully
2. Configure retention (90 days)
3. Set up backup monitoring/alerts
4. Run first backup test (file restore)

**Month 3:**
- Continue to [Cloud Security Guide](07-cloud-security.md) - Secure the cloud services your backups protect

---

## Related Resources

- [Security Assessment](01-assessment.md) - Check your backup security score
- [Incident Response Guide](08-incident-response.md) - Full breach response (including ransomware)
- [Tools Comparison](../TOOLS.md#5-backup--recovery) - Backup solution comparison
- [Incident Response Template](../templates/incident-response.md) - Include recovery procedures

---

**Last Updated**: February 2026
**Estimated Time**: 4-8 hours setup + 1 hour/month testing
**Expected ROI**: 100% recovery capability from ransomware (vs. $200K average disaster cost)
