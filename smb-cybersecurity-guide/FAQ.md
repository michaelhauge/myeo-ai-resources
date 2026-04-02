# Frequently Asked Questions

**Common cybersecurity questions for small and medium business owners**

---

## General Security

### "How much should I budget for cybersecurity?"

**Minimum (Essential protection)**:
- **$15-20/user/month**: Password manager, endpoint protection, backup
- **For 20 employees**: $300-400/month or $3,600-4,800/year

**Recommended (Complete protection)**:
- **$30-45/user/month**: Add VPN, email security, security training
- **For 20 employees**: $600-900/month or $7,200-10,800/year

**Industry benchmark**: 3-7% of IT budget

**ROI**: Average data breach costs $200,000. Even the "complete" package pays for itself if it prevents just one breach every 5 years.

**See**: [Tool Bundles](TOOLS.md#recommended-tool-bundles) for specific recommendations

---

### "Do I need a dedicated IT person or security expert?"

**For 5-50 employees**: No dedicated person needed

This guide is designed for non-technical owners to implement security themselves. Budget:
- **Setup**: 20-40 hours over 90 days (2-4 hours/week)
- **Ongoing**: 4-8 hours/month (password resets, user management, monitoring)

**For 50-200 employees**: Consider part-time IT or fractional CIO
- **Part-time IT**: $2,000-$4,000/month (20 hours/month at $100-200/hour)
- **Fractional CIO/CISO**: $5,000-$10,000/month (1-2 days/month)

**For 200+ employees**: Hire full-time IT staff
- **IT Manager**: $80K-$120K/year
- **Security Specialist**: $100K-$150K/year (if handling sensitive data)

---

### "What's the #1 thing I should do first?"

**Password manager + Multi-Factor Authentication (MFA)** on all critical accounts.

**Why**:
- 81% of breaches involve weak or stolen passwords
- MFA blocks 99.9% of account takeover attacks
- Takes only 2-4 hours to implement
- Costs $5-8/user/month

**Implementation**: [Passwords & Access Guide](guides/02-passwords-access.md)

**Quick wins after that**:
1. Enable MFA on email (Gmail, Outlook)
2. Enable MFA on banking and financial accounts
3. Enable MFA on admin accounts for business tools (Slack, Trello, etc.)

---

### "Is free antivirus enough for my business?"

**No**. Free consumer antivirus is insufficient for businesses.

**Problems with free antivirus**:
- ❌ No centralized management (can't see all devices)
- ❌ No admin control (employees can disable it)
- ❌ Limited or no support
- ❌ Often sells your browsing data
- ❌ Lacks advanced features (ransomware protection, EDR)

**Business endpoint protection** ($5-12/user/month) provides:
- ✅ Central management console (see all devices)
- ✅ Real-time threat protection
- ✅ Ransomware protection
- ✅ Support when you need it
- ✅ Compliance reporting (for audits)
- ✅ Remote management

**Recommendation**:
- **Budget**: Microsoft Defender (included with M365 Business Premium at $22/user/month)
- **Better**: SentinelOne ($12/endpoint/month) or CrowdStrike ($15/endpoint/month)

**See**: [Endpoint Protection Comparison](TOOLS.md#3-endpoint-protection)

---

### "How do I know if I've been hacked?"

**Red flags to watch for**:

🚨 **Immediate threats**:
- Files encrypted or renamed (ransomware)
- Unexpected password reset emails
- Unauthorized financial transactions
- Bank alerts for suspicious activity

⚠️ **Suspicious activity**:
- Slow computers or network (crypto mining malware)
- Pop-ups or unfamiliar browser extensions
- Customers reporting phishing emails "from you"
- Unexpected software installations
- Unusual outbound network traffic

📧 **Email compromises**:
- Sent emails you didn't write
- Rules you didn't create (forwarding, deleting)
- Password changed without your action
- Unusual login locations (check Gmail/Outlook activity)

**If you see ANY of these**:
1. **Immediately**: Disconnect affected devices from network
2. **Within 1 hour**: [Incident Response Guide](guides/08-incident-response.md) - First 24 Hours
3. **Contact**: Cyber insurance, legal counsel, IT support

**Prevention**: [Security Assessment](guides/01-assessment.md) to identify vulnerabilities before breach

---

### "What should I do if I clicked a phishing link?"

**Within 5 minutes**:
1. **Disconnect from internet** (Wi-Fi off, ethernet unplugged)
2. **Don't enter any passwords** if prompted
3. **Take a photo of the email/link** (for IT investigation)

**Within 1 hour**:
1. **Change passwords** for any accounts you entered credentials for
   - Use a different device (not the compromised one)
   - Use password manager to generate new passwords
2. **Enable MFA** if not already enabled
3. **Scan device** with antivirus/endpoint protection
4. **Check for suspicious activity**:
   - Email rules (forwarding, auto-delete)
   - Sent items (did they send phishing to your contacts?)
   - Financial accounts (unauthorized transactions)

**Within 24 hours**:
1. **Notify IT/security** (or follow [Incident Response](guides/08-incident-response.md))
2. **Monitor accounts** for 30 days
3. **Report phishing email** to your email provider
4. **Warn colleagues** (similar phishing may target them)

**Prevention**: [Phishing Training](guides/03-email-phishing.md) - Learn to spot phishing before clicking

---

### "Do I need cyber insurance?"

**Yes, most businesses should have cyber insurance.**

**Why you need it**:
- Average breach costs $200,000 (far more than annual premiums)
- Covers: forensics, legal fees, customer notification, PR, regulatory fines
- Some breaches require notification (PDPA, GDPR) - expensive without insurance
- Customers increasingly require it (vendor contracts)

**Typical costs**:
- **$1,000-$3,000/year** for $1M coverage (small business)
- **$3,000-$7,000/year** for $5M coverage (growing business)

**What it covers**:
- Breach response (forensics, legal, notification)
- Business interruption (lost revenue during downtime)
- Cyber extortion (ransomware payments)
- Data recovery
- Liability (if your breach affects customers)
- Regulatory fines and penalties

**Requirements for coverage**:
Most insurers require:
- ✅ MFA on all admin accounts
- ✅ Endpoint protection on all devices
- ✅ Regular backups (tested monthly)
- ✅ Security awareness training
- ✅ Incident response plan

**Good news**: If you follow this guide, you'll meet most requirements.

**Recommendation**: Get quotes from **Coalition**, **Cowbell**, or **At-Bay** (cyber-specific insurers)

---

## Technical Questions

### "What's the difference between antivirus and endpoint protection?"

**Antivirus** (old model):
- Signature-based detection (known threats only)
- Runs on device, no central management
- Consumer-focused
- Example: Norton, McAfee

**Endpoint Protection / EDR** (modern model):
- AI/behavior-based detection (unknown threats too)
- Central management console
- Business-focused (admin controls, reporting)
- Advanced features: ransomware rollback, threat hunting
- Example: CrowdStrike, SentinelOne

**For businesses**: Always use endpoint protection, not consumer antivirus.

**See**: [Endpoint Protection Comparison](TOOLS.md#3-endpoint-protection)

---

### "Do I need a VPN?"

**You need a VPN if**:
- ✅ Employees work remotely (home, cafes, coworking)
- ✅ Employees travel and use public Wi-Fi
- ✅ You have on-premise servers employees need to access
- ✅ You operate in countries with internet restrictions

**You don't need a VPN if**:
- ❌ Everyone works in the same office
- ❌ You use only cloud tools (Google Workspace, Slack, etc.)
- ❌ No remote access to company resources

**Modern alternative**: Zero Trust Access (like Cloudflare Zero Trust)
- Free for <50 users
- No VPN client needed
- More secure than traditional VPN
- Easier for employees

**Cost**: $0-8/user/month

**See**: [VPN Comparison](TOOLS.md#6-vpn)

---

### "What's the 3-2-1 backup rule?"

**The 3-2-1 rule** ensures you can recover from any disaster:

**3** copies of your data:
- 1 primary (working copy on your computer)
- 2 backups

**2** different types of media:
- Example: Cloud backup (Backblaze) + External drive
- Not: Two external drives (same media type)

**1** copy off-site:
- Cloud backup (automatic off-site)
- Or: External drive stored at different location

**Example setup** ($15/month):
- **Primary**: MacBook with 500GB
- **Backup 1**: Backblaze cloud backup ($9/month, automatic)
- **Backup 2**: 1TB external drive ($60 one-time), backed up weekly, stored at home (if office) or office (if working from home)

**Test your backups monthly** - most people only discover backup failures when they need to restore.

**See**: [Backup & Recovery Guide](guides/06-backup-recovery.md)

---

### "What's MFA and why is it better than a strong password?"

**MFA (Multi-Factor Authentication)** requires two things to log in:
1. Something you **know** (password)
2. Something you **have** (phone, hardware key)

**Why it's better**:
- Even if password is stolen, attacker can't log in without your phone
- Blocks 99.9% of account takeover attacks
- Stops credential stuffing (reused passwords from other breaches)

**MFA types** (from weakest to strongest):
1. **SMS/Text** (⚠️ can be intercepted, but better than nothing)
2. **TOTP App** (Google Authenticator, Microsoft Authenticator) - ✅ Recommended
3. **Push Notification** (Duo, Okta) - ✅ Best user experience
4. **Hardware Key** (YubiKey) - ✅ Most secure

**Setup time**: 5 minutes per account

**See**: [MFA Setup Guide](guides/02-passwords-access.md#multi-factor-authentication-setup)

---

### "Should I encrypt my laptop? Will it slow it down?"

**Yes, you should encrypt your laptop**. No, it won't noticeably slow it down on modern hardware.

**Why encrypt**:
- If laptop is lost or stolen, data is protected
- Required for PDPA, GDPR, HIPAA compliance
- Required for cyber insurance
- Takes 10 minutes to enable

**Built-in encryption** (free):
- **Mac**: FileVault (built into macOS)
- **Windows**: BitLocker (included with Windows 10/11 Pro)
- **Linux**: LUKS (during installation)

**Performance impact**:
- On modern computers (2018+): 0-2% performance impact (unnoticeable)
- On older computers (pre-2015): 5-10% slower (still worth it)

**Setup**:
- Mac: System Settings → Privacy & Security → FileVault → Turn On
- Windows: Settings → Privacy & Security → Device Encryption → On

**Important**: Save your recovery key in password manager (if you forget password, you'll need this)

**See**: [Device Security Guide](guides/04-device-security.md#full-disk-encryption)

---

## Compliance & Regulations

### "Does PDPA apply to my business?"

**Yes, if you collect personal data from Singapore or Malaysia residents.**

**Personal data** = any information that can identify a person:
- Name, email, phone number
- IC/Passport number, address
- Photos, videos with faces
- Employee records

**You need PDPA compliance if you**:
- Have a website with contact forms (collecting emails)
- Have employees (storing employee data)
- Have customers (storing customer information)
- Use analytics (Google Analytics with personally identifiable data)

**Exceptions** (very narrow):
- Only collect business contact info (company emails, not personal)
- Purely anonymous data (aggregated statistics)

**Quick compliance steps**:
1. Post a Privacy Policy on your website
2. Get consent before collecting data (checkbox on forms)
3. Implement security measures (this guide!)
4. Train employees on handling personal data
5. Have a process for data access/deletion requests

**See**: [PDPA Compliance](COMPLIANCE.md#pdpa-personal-data-protection-act)

---

### "Do I need SOC 2 certification?"

**You need SOC 2 if**:
- ✅ B2B SaaS company selling to enterprises
- ✅ Customers are asking for it in RFPs/contracts
- ✅ Handling sensitive customer data at scale
- ✅ Raising Series A+ funding (investors often require)

**You don't need SOC 2 if**:
- ❌ B2C consumer product
- ❌ Selling to small businesses (they don't ask for it)
- ❌ Early-stage startup (pre-revenue, <10 employees)
- ❌ Not handling sensitive customer data

**Timeline & cost**:
- **6-18 months** to implement controls and complete audit
- **$40K-$100K** in Year 1 (including consultant and auditor)
- **$20K-$50K** per year ongoing (annual re-audit)

**Before pursuing SOC 2**:
1. Implement basic security (this guide) first
2. Document your security practices
3. Hire a consultant for readiness assessment ($5K-$10K)
4. Then decide if you're ready for full audit

**Alternatives**:
- Fill out customer security questionnaires (free)
- ISO 27001 (similar but international standard)
- Self-assessment (not a real audit, but shows you're serious)

**See**: [SOC 2 Overview](COMPLIANCE.md#soc-2-service-organization-control-2)

---

### "Can I handle credit card payments without PCI compliance?"

**Yes! Use Stripe, Square, or PayPal** and you avoid PCI compliance entirely.

**How it works**:
1. You embed Stripe/Square payment form on your website
2. Customer enters card directly into Stripe's form (not your server)
3. Stripe handles card data, PCI compliance, and fraud
4. You receive a token (safe to store) and payment confirmation

**Cost**: 2.9% + $0.30 per transaction (standard for most payment processors)

**You're not PCI compliant if**:
- ❌ You store full credit card numbers
- ❌ You run card terminals without tokenization
- ❌ You email customers asking for card details
- ❌ You handle card-on-file payments yourself

**If you must be PCI compliant** (Level 4 for <20K transactions/year):
- Annual self-assessment questionnaire
- Quarterly vulnerability scans
- Follow PCI-DSS 12 requirements
- Cost: $10K-$30K/year

**Recommendation**: Use Stripe/Square and avoid this complexity.

**See**: [PCI-DSS Overview](COMPLIANCE.md#pci-dss-payment-card-industry-data-security-standard)

---

## Implementation & Process

### "How long does it take to implement this guide?"

**Phase 1: Quick Wins (Week 1-2)**
- Password manager rollout: 4-6 hours
- MFA setup: 2-4 hours
- Basic phishing training: 2 hours
- **Total: 8-12 hours** over 2 weeks

**Phase 2: Core Security (Week 3-4)**
- Endpoint protection deployment: 4-6 hours
- Email security configuration: 2-3 hours
- Device encryption: 1-2 hours
- Network security: 2-3 hours
- **Total: 9-14 hours** over 2 weeks

**Phase 3: Resilience (Month 2)**
- Backup system setup: 3-4 hours
- Security policies: 4-6 hours
- Employee procedures: 3-4 hours
- Phishing simulation: 2-3 hours
- **Total: 12-17 hours** over 1 month

**Phase 4: Ongoing (Month 3+)**
- Monthly tasks: 2-4 hours/month
- Quarterly reviews: 4 hours/quarter
- Annual training: 8 hours/year

**Total for 90-day implementation: 29-43 hours** (equivalent to 1 week of work spread over 3 months)

---

### "Can I do this myself or should I hire someone?"

**You can do it yourself if**:
- ✅ You're comfortable using computers and software
- ✅ You can follow step-by-step instructions
- ✅ You have 2-4 hours/week to dedicate
- ✅ Your team is <50 employees

**This guide is designed for non-technical owners.** You don't need IT background.

**Hire help if**:
- ❌ You have >100 employees (too complex to DIY)
- ❌ You have zero time (but you'll still need to approve decisions)
- ❌ You have compliance requirements (HIPAA, SOC 2) - need audits anyway
- ❌ You've been breached and need forensics

**Hiring options**:
- **Security consultant**: $150-$300/hour or $10K-$30K fixed fee for implementation
- **Fractional CIO/CISO**: $5K-$10K/month (1-2 days/month, ongoing support)
- **Managed Security Service Provider (MSSP)**: $2K-$5K/month (monitoring, management)

**Hybrid approach** (recommended for 20-50 employees):
- You implement Phase 1 and 2 (Weeks 1-4) following this guide
- Hire consultant for Phase 3 review and Phase 4 setup
- Cost: $5K-$10K for consultant time

---

### "How do I train employees on security?"

**Minimum (free)**:
1. **Welcome email** when new employee starts
   - Link to [Phishing Guide](guides/03-email-phishing.md)
   - Password manager setup instructions
   - MFA setup instructions
2. **Monthly security tips** via email or Slack
   - "How to spot phishing"
   - "Why MFA matters"
   - "Safe browsing habits"
3. **Manual phishing tests** (quarterly)
   - Send fake phishing emails
   - See who clicks
   - Retrain those who fail

**Recommended (paid)**:
- **Security awareness platform**: $5-18/user/year
- Automated training modules
- Phishing simulations
- Compliance reporting

**Tools**:
- **Budget**: Curricula ($5/user/year)
- **Standard**: KnowBe4 ($18/user/year)

**Training frequency**:
- **New hires**: First week (1 hour)
- **All employees**: Quarterly (15-30 min sessions)
- **Phishing simulations**: Monthly

**See**: [Employee Training Guide](guides/07-cloud-security.md#security-awareness-training)

---

### "What should I do if an employee leaves?"

**Within 24 hours**:
1. **Disable accounts** immediately (all systems)
   - Email (Google Workspace, Microsoft 365)
   - Slack, Zoom, project management
   - Financial/banking access
   - Social media accounts
2. **Collect devices**
   - Laptop, phone, tablet
   - Access cards, keys
   - Hardware tokens (YubiKey)
3. **Change shared passwords**
   - Wi-Fi passwords (if they had them)
   - Shared accounts they accessed
   - Admin passwords (if they were admin)

**Within 1 week**:
1. **Remove from groups and distributions**
   - Email distribution lists
   - Slack channels (especially private ones)
   - Google Drive / OneDrive shared folders
2. **Review access logs**
   - Check for suspicious activity before departure
   - Review file downloads/exports
   - Check for data exfiltration
3. **Backup/transfer data**
   - Transfer Google Drive files to manager
   - Forward email to manager
   - Document handoff

**Use template**: [Offboarding Checklist](templates/offboarding-checklist.md)

---

## Related Resources

- [90-Day Security Roadmap](README.md#the-solution-90-day-security-roadmap) - Start here
- [Security Assessment](guides/01-assessment.md) - Determine your current security posture
- [Tools Comparison](TOOLS.md) - Compare and choose security tools
- [Compliance Overview](COMPLIANCE.md) - Understand PDPA, GDPR, PCI-DSS requirements

---

**Last Updated**: February 2026
**Have a question not answered here?** Email: hello@myeo.ai
