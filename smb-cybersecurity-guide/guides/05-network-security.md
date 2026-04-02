# Network Security Guide

**Secure your office Wi-Fi, implement VPN for remote workers, and protect your network perimeter**

---

## What You'll Learn

- How to secure office Wi-Fi and create guest networks
- How to implement VPN for remote workers
- How to configure firewall protection
- How to secure home office networks
- How to protect against public Wi-Fi threats

**Time Required**: 3-6 hours
**Difficulty**: Medium (some network configuration)
**ROI**: 50% reduction in network intrusion risk

---

## Why This Matters

**Unsecured networks are easy attack vectors:**

- Public Wi-Fi: 43% of data breaches involve eavesdropping on unsecured connections
- Default passwords: 80% of routers still use default admin passwords
- No VPN: Remote workers on home Wi-Fi are vulnerable to ISP-level monitoring and attacks
- Weak Wi-Fi passwords: Easily cracked with brute force attacks

**Real breach examples:**
- **Hilton Hotels (2015)**: Unencrypted Wi-Fi, attackers intercepted credit card data
- **Target (2013)**: $61M breach started via HVAC vendor accessing unsecured network
- **Zoom (2020)**: "Zoombombing" via unsecured home networks without VPN

**Good news**: Network security is mostly one-time setup with minimal ongoing maintenance.

---

## Prerequisites

Before starting:
- [ ] Access to office router/firewall (admin credentials)
- [ ] List of all remote workers
- [ ] Choose VPN solution (if needed)
- [ ] Budget: $0-8/user/month for VPN
- [ ] Block 3-6 hours for setup

---

## Part 1: Office Wi-Fi Security

### Step 1: Change Default Router Passwords (15 minutes)

**Why this matters**: Default passwords are publicly available. Attackers can find your router model and look up the default password.

**How to do it:**

1. **Find your router's IP address**
   - **Windows**: Open Command Prompt → `ipconfig` → Look for "Default Gateway"
   - **Mac**: System Preferences → Network → Advanced → TCP/IP → Router
   - Common IPs: `192.168.1.1`, `192.168.0.1`, `10.0.0.1`

2. **Log into router**
   - Open browser → Enter router IP
   - Log in with current credentials (if default, find at [RouterPasswords.com](https://www.routerpasswords.com/))
   - Common defaults: admin/admin, admin/password

3. **Change admin password**
   - Settings → Administration → Change Password
   - Use strong password (16+ characters)
   - Store in password manager

4. **Change Wi-Fi password** (if weak)
   - Settings → Wireless → Security
   - Create strong password (16+ characters, mix of letters/numbers/symbols)
   - Update password in company password manager

---

### Step 2: Enable WPA3 or WPA2 Encryption (10 minutes)

**Encryption levels** (from best to worst):
- **WPA3**: Latest standard, strongest encryption (use if router supports)
- **WPA2**: Industry standard, strong encryption (minimum acceptable)
- **WPA**: Outdated, easily cracked (upgrade router if this is max)
- **WEP**: Ancient, trivially broken (never use)
- **Open**: No encryption (never use for business)

**How to enable:**
1. Router settings → Wireless → Security
2. Set Security Mode to: **WPA3** or **WPA2-PSK [AES]**
3. Set strong password (see Step 1)
4. Save settings
5. Reconnect all devices with new password

---

### Step 3: Create Separate Guest Network (30 minutes)

**Why**: Guests (clients, visitors, delivery people) shouldn't have access to your internal network (printers, shared drives, work devices).

**Benefits:**
- ✅ Isolates guest traffic from business traffic
- ✅ Protects internal resources
- ✅ Easy to disable if compromised
- ✅ Can limit bandwidth for guests

**How to set up:**

**1. Enable Guest Network**
- Router settings → Wireless → Guest Network → Enable
- Name it: `[Company Name] Guest` (e.g., "Acme Corp Guest")
- Security: WPA2 minimum
- Password: Different from main Wi-Fi (store in password manager)

**2. Configure Guest Network Settings**
- ☑ **Enable AP isolation** (guests can't see each other)
- ☑ **Block access to intranet** (guests can't access 192.168.x.x or 10.x.x.x)
- ☑ **Enable guest network portal** (optional: requires accepting terms before internet)
- ☑ **Limit bandwidth** (optional: e.g., 50% of total bandwidth)

**3. Test Guest Network**
- Connect phone to guest network
- Try to access: company website (should work ✅)
- Try to ping office printer: `192.168.1.100` (should fail ❌)
- Try to access internal drive (should fail ❌)

---

### Step 4: Disable WPS and Remote Management (10 minutes)

**WPS (Wi-Fi Protected Setup)**:
- Allows devices to connect by pressing button on router
- ❌ Vulnerable to brute force attacks
- ❌ Should be disabled on business networks

**Remote Management**:
- Allows accessing router from internet
- ⚠️ Only enable if you need remote access AND you secure it (VPN, strong password)
- ❌ Usually not needed, safer to disable

**How to disable:**
1. Router settings → Wireless → WPS → Disable
2. Router settings → Administration → Remote Management → Disable
3. Save settings

---

### Step 5: Change Default SSID (Network Name) (5 minutes)

**Why**:  Default SSIDs (like "NETGEAR-5G" or "Linksys") reveal your router model, making targeted attacks easier.

**How to change:**
1. Router settings → Wireless → SSID
2. Change from default to: `[Company Name] Office` (e.g., "Acme Corp Office")
3. **Don't hide SSID** (contrary to myth, hidden SSIDs are less secure and more annoying)
4. Save and reconnect devices

---

### Step 6: Update Router Firmware (30 minutes)

**Why**: Router firmware updates patch security vulnerabilities.

**How to update:**
1. Router settings → Administration → Firmware Update
2. Check for updates (may need to download from manufacturer website)
3. Follow update wizard (router may reboot 2-3 times)
4. Verify version after update

**Enable auto-updates** (if available):
- Settings → Administration → Auto Update Firmware → Enable

**Frequency**: Check monthly or enable auto-updates

---

## Part 2: VPN for Remote Workers

### When You Need a VPN

**You need VPN if:**
- ✅ Employees work remotely (home, cafes, coworking)
- ✅ Employees travel
- ✅ Employees use public Wi-Fi
- ✅ You have on-premise servers/resources to access remotely

**You don't need VPN if:**
- ❌ Everyone works in the same office
- ❌ You use only cloud tools (Google Workspace, Slack, etc.) with HTTPS
- ❌ All your data is in SaaS applications

**Modern alternative**: Zero Trust Access (like Cloudflare Zero Trust) - easier and more secure than traditional VPN.

---

### Step 1: Choose VPN Solution (30 minutes)

| Tool | Price | Best For | Type |
|------|-------|----------|------|
| **Cloudflare Zero Trust** | Free for <50 users | Startups, cloud-only | Zero Trust (modern) |
| **NordLayer** | $8/user/mo | SMBs, easy setup | Business VPN (traditional) |
| **Perimeter 81** | $10/user/mo | Advanced features | Zero Trust + VPN |
| **Tailscale** | Free (unlimited) | Technical teams | Mesh VPN (modern) |

**Choose Cloudflare Zero Trust if:**
- <50 employees
- All work is in cloud (no on-premise servers)
- Want simplest setup (no VPN client needed)
- Free tier meets needs

**Choose NordLayer if:**
- Need traditional VPN
- Want easy setup with desktop app
- Need site-to-site VPN (connect offices)
- Budget allows $8/user/month

**Choose Perimeter 81 if:**
- Need advanced features (conditional access, DLP)
- Want both zero trust and VPN capabilities
- Budget allows $10/user/month

**Choose Tailscale if:**
- Technical team (comfortable with networking)
- Need mesh VPN (peer-to-peer)
- Want free solution with no limits

---

### Step 2: Deploy VPN (2-4 hours)

**Cloudflare Zero Trust setup example:**

**1. Sign up and configure (1 hour)**
1. Sign up at [Cloudflare Zero Trust](https://www.cloudflare.com/zero-trust/)
2. Add your domain
3. Configure identity provider (Google Workspace, Microsoft 365, or email)
4. No VPN client needed - access via browser

**2. Protect applications (30 minutes)**
1. Cloudflare Zero Trust dashboard → Access → Applications
2. Add application (e.g., internal tool, admin panel)
3. Set authentication rules (e.g., only employees can access)
4. Share URL with employees

**3. Deploy WARP client** (optional, for network-level protection)
1. Download WARP app from Cloudflare
2. Employees install on laptop and phone
3. Log in with work email
4. All traffic routed through Cloudflare (filters malware, enforces policies)

---

**NordLayer setup example:**

**1. Sign up and deploy (1 hour)**
1. Sign up at [NordLayer](https://nordlayer.com/)
2. Create organization
3. Invite employees via email

**2. Install client (per employee, 10 minutes each)**
1. Employee receives email invite
2. Download NordLayer app (Windows, Mac, Linux, iOS, Android)
3. Log in with work email
4. Connect to VPN server (auto-selects closest)

**3. Configure policies (30 minutes)**
1. NordLayer dashboard → Policies
2. Create policy: "Require VPN for Accessing Internal Resources"
3. Set allowed IPs (only company IPs can access)
4. Enable split tunneling (route only work traffic through VPN, not Netflix)

---

### Step 3: Configure VPN Policies (1 hour)

**Essential policies:**

**1. Split tunneling** (recommended)
- Work traffic: Through VPN
- Personal traffic: Direct to internet
- Benefit: Faster performance, lower bandwidth costs

**How to configure**:
- List internal resources: `192.168.1.0/24`, `10.0.0.0/8`
- List work domains: `company.com`, `*.company.com`
- All else: Direct

**2. Kill switch**
- If VPN disconnects, block internet until reconnected
- Prevents leaking work traffic outside VPN

**3. Auto-connect**
- VPN auto-connects when employee opens laptop
- Reduces friction, increases compliance

**4. Multi-factor authentication**
- Require MFA to connect to VPN
- Prevents stolen credentials from granting VPN access

---

## Part 3: Firewall Protection

### Step 1: Understand Your Firewall (15 minutes)

**You likely already have a firewall:**
- **Home router**: Basic firewall (NAT)
- **Windows**: Windows Defender Firewall
- **Mac**: Built-in firewall (disabled by default)
- **Business router**: More advanced firewall

**What firewall does:**
- ✅ Blocks unsolicited inbound connections (internet → your devices)
- ✅ Allows outbound connections (your devices → internet)
- ⚠️ Basic firewall does NOT: inspect traffic, block malware, prevent data exfiltration

---

### Step 2: Enable Host-Based Firewalls (30 minutes)

**Windows Defender Firewall:**
1. Settings → Privacy & Security → Windows Security → Firewall & network protection
2. Ensure firewall is ON for:
   - Domain networks (if on corporate domain)
   - Private networks
   - Public networks
3. Click "Allow an app through firewall" → Review list (remove unnecessary apps)

**macOS Firewall:**
1. System Settings → Network → Firewall → Turn On
2. Options → Enable stealth mode (blocks ping and unauthorized probes)
3. Add approved apps as needed

**Verify all devices have firewall enabled** (spot check 10-20% of devices).

---

### Step 3: Upgrade to Business Firewall (optional, for offices)

**When to upgrade:**
- You have an office with >10 employees
- You have on-premise servers
- You need VLANs (network segmentation)
- You want advanced threat protection (IDS/IPS)

**Business firewall options:**

| Device | Price | Best For |
|--------|-------|----------|
| **Ubiquiti UniFi Dream Machine** | $299 one-time | Small offices, easy management |
| **pfSense (DIY)** | Free (hardware ~$300) | Technical teams, custom needs |
| **Sophos XG Firewall** | $300-$500/year | Advanced features, threat protection |
| **Fortinet FortiGate** | $500-$1,000/year | Enterprise-grade, 50+ employees |

**What you get:**
- ✅ Advanced firewall rules (whitelist/blacklist IPs, ports)
- ✅ IDS/IPS (intrusion detection/prevention)
- ✅ Content filtering (block malicious sites)
- ✅ VPN server (built-in)
- ✅ Network segmentation (separate IoT, guest, work networks)

---

## Part 4: Home Office Security (for Remote Workers)

**The challenge**: You can't control employee home networks, but you can give guidance.

### Home Office Security Checklist

**Share this checklist with remote employees:**

**Wi-Fi Security:**
- [ ] Change router admin password from default
- [ ] Use WPA2 or WPA3 encryption
- [ ] Create strong Wi-Fi password (16+ characters)
- [ ] Disable WPS
- [ ] Keep router firmware updated

**Network Isolation:**
- [ ] Separate guest network for family/visitors
- [ ] Work devices on main network only
- [ ] IoT devices (smart TV, Alexa, cameras) on guest network (if possible)

**VPN Usage:**
- [ ] Always connect to company VPN before accessing work resources
- [ ] Use VPN on public Wi-Fi (cafes, airports, hotels)
- [ ] Enable VPN kill switch

**Physical Security:**
- [ ] Lock home office door when not present
- [ ] Don't leave devices unattended in public spaces
- [ ] Use privacy screen for laptop in public

---

## Part 5: Public Wi-Fi Safety

### Risks of Public Wi-Fi

**What attackers can do on public Wi-Fi:**
- Eavesdrop on unencrypted traffic
- Steal login credentials
- Inject malware
- Create fake networks ("Starbucks WiFi2" → looks legit, is attacker-controlled)

**How to stay safe:**

**1. Use VPN on all public Wi-Fi**
- Encrypts all traffic between you and VPN server
- Attacker only sees encrypted data

**2. Only visit HTTPS websites**
- Check for padlock in address bar
- HTTPS encrypts traffic between browser and website
- HTTP (no S) is unencrypted → avoid on public Wi-Fi

**3. Don't access sensitive accounts**
- Banking, payroll, email (if possible)
- Wait until on secure network
- Or: Use VPN + MFA

**4. Forget network after use**
- Don't save public Wi-Fi networks
- Prevents auto-connecting to fake networks with same name

**5. Verify network name with staff**
- "Is the Wi-Fi called 'StarbucksGuest'?"
- Prevents connecting to attacker-controlled network

**6. Turn off file sharing and AirDrop**
- Windows: Settings → Network → Change advanced sharing settings → Turn off file sharing
- Mac: System Settings → General → AirDrop → Off (or Contacts Only)

---

## Testing and Verification

### Week 1 Checklist (Office Wi-Fi)

- [ ] Router admin password changed from default
- [ ] WPA2 or WPA3 enabled
- [ ] Strong Wi-Fi password set
- [ ] Guest network created and isolated
- [ ] WPS disabled
- [ ] Remote management disabled
- [ ] Firmware updated

### Week 2 Checklist (VPN)

- [ ] VPN solution chosen and purchased (if applicable)
- [ ] VPN deployed to all remote workers
- [ ] Employees can connect to VPN successfully
- [ ] Internal resources accessible via VPN
- [ ] Split tunneling configured (if applicable)
- [ ] Kill switch enabled

### Week 3 Checklist (Firewalls)

- [ ] All Windows devices have firewall enabled
- [ ] All Mac devices have firewall enabled
- [ ] Business firewall deployed (if applicable)
- [ ] Firewall rules configured

---

### Test Your Network Security

**Test 1: Check Wi-Fi encryption**
- Windows: Network settings → Click Wi-Fi → Properties → Check "Security type"
- Mac: Option-click Wi-Fi icon → Check "Security"
- Should show: WPA2 or WPA3 ✅

**Test 2: Try to access router from guest network**
- Connect to guest Wi-Fi
- Try to access router IP (e.g., `192.168.1.1`)
- Should be blocked ❌ or timeout

**Test 3: VPN connection**
- Connect to VPN
- Visit [WhatIsMyIP.com](https://www.whatismyip.com/)
- Should show VPN server IP, not your home/office IP ✅
- Visit internal resource (should be accessible ✅)

**Test 4: VPN kill switch**
- Connect to VPN
- Manually disconnect VPN (simulate VPN failure)
- Try to access internet
- Should be blocked until VPN reconnects ✅

**Test 5: Firewall**
- Visit [ShieldsUP!](https://www.grc.com/shieldsup) from GRC
- Run port scan
- All ports should show "Stealth" or "Closed" ✅

---

## Common Pitfalls

### ❌ Pitfall #1: Using Same Password for Wi-Fi and Router Admin

**Problem**: If Wi-Fi password is leaked, attacker can also access router admin.

**Solution**:
- Use different passwords for:
  - Router admin login
  - Main Wi-Fi network
  - Guest Wi-Fi network

---

### ❌ Pitfall #2: VPN Slows Down Work, Employees Disable It

**Problem**: VPN adds latency, employees disable it to "work faster."

**Solution**:
- Use split tunneling (route only work traffic through VPN)
- Choose VPN with fast servers (NordLayer, Cloudflare)
- Educate on importance (security > speed)
- Consider zero trust (Cloudflare) - no VPN client, no slowdown

---

### ❌ Pitfall #3: Forgetting to Secure Home Office Routers

**Problem**: Company requires VPN but employee home router has default password = attacker can still intercept.

**Solution**:
- Provide home office security checklist
- Optional: Reimburse employees for upgraded home router
- Require VPN usage even on "trusted" home networks

---

### ❌ Pitfall #4: Not Testing Guest Network Isolation

**Problem**: Guest network not actually isolated, guests can access work devices.

**Solution**:
- Test guest network after setup
- Try to ping work devices from guest device (should fail)
- Try to access shared drives from guest device (should fail)

---

## Success Metrics

| Metric | Target | How to Measure |
|--------|--------|----------------|
| **Office Wi-Fi encryption** | WPA2+ | Router settings check |
| **Guest network isolation** | 100% isolated | Test (cannot access work devices) |
| **VPN adoption** (remote workers) | 100% | VPN dashboard |
| **Firewall enabled** | 100% of devices | Spot check devices |
| **Router firmware** | Up to date | Check router version vs. latest |
| **Public Wi-Fi incidents** | 0 | Incident log |

---

## Real-World Examples

### Example 1: Law Firm (12 employees, hybrid work)

**Situation**: Office Wi-Fi unsecured (WPA encryption, default password), no VPN for remote workers.

**Implementation**:
- Upgraded office router ($200)
- Configured WPA3, strong password, guest network
- Deployed NordLayer VPN ($8/user = $96/month)
- Created home office security guide

**Results**:
- 0 network intrusions in 2 years
- Client audit: Praised network security posture
- Employees report VPN "just works"

**ROI**: Previous breach (no VPN, intercepted client data on public Wi-Fi) cost $50K in legal fees and client compensation. Annual VPN cost: $1,152. **43x ROI.**

---

### Example 2: Startup (8 employees, fully remote)

**Situation**: No network security (everyone works from home), using public Wi-Fi frequently.

**Implementation** (free/low-cost):
- Provided home office security checklist
- Deployed Cloudflare Zero Trust (free for <50 users)
- Deployed WARP app to all employees (free)
- No VPN setup needed (all SaaS apps accessed via HTTPS + Cloudflare)

**Results**:
- $0 cost
- 0 security incidents on public Wi-Fi
- Cloudflare blocked 200+ malicious connections in 6 months

**ROI**: $0 cost, prevented potential breach. **Infinite ROI.**

---

### Example 3: Professional Services (35 employees, office + remote)

**Situation**: Office with weak Wi-Fi, employees using default ISP router at home, public Wi-Fi unsafe.

**Implementation**:
- Upgraded office to UniFi Dream Machine ($299)
- Created VLAN for guest network
- Deployed Perimeter 81 VPN ($10/user = $350/month)
- Reimbursed remote employees $100 for upgraded home routers

**Results**:
- Office network segmented (work, guest, IoT)
- 100% VPN adoption
- Passed cyber insurance audit (reduced premium 10% = $2K/year)
- 0 network breaches in 18 months

**ROI**: $4,200/year VPN cost - $2,000/year insurance savings + $3,500 router upgrades = $5,700 net year 1. Year 2+: $2,200/year. Prevented potential breach (avg $150K). **68x ROI.**

---

## Next Steps

**This week (Week 4):**
1. Secure office Wi-Fi (change passwords, enable WPA2/WPA3)
2. Create guest network
3. Disable WPS and remote management
4. Update router firmware

**Next week:**
1. Choose VPN solution (if applicable)
2. Deploy VPN to remote workers
3. Test VPN connectivity
4. Enable firewalls on all devices

**Month 2:**
- Move to [Backup & Recovery Guide](06-backup-recovery.md) - 3-2-1 rule, disaster recovery

---

## Related Resources

- [Security Assessment](01-assessment.md) - Check your network security score
- [Device Security](04-device-security.md) - Complement network security with device security
- [Tools Comparison](../TOOLS.md#6-vpn) - VPN tool comparison
- [Security Policy Template](../templates/security-policy.md) - Include network usage policy

---

**Last Updated**: February 2026
**Estimated Time**: 3-6 hours
**Expected ROI**: 50% reduction in network intrusion risk
