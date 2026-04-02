# Email & Phishing Security Guide

**Protect against phishing attacks and secure your email infrastructure**

---

## What You'll Learn

- How to identify and stop phishing attacks
- How to configure DMARC, DKIM, and SPF
- How to set up email security filtering
- How to train employees to recognize phishing
- What to do if someone clicks a phishing link

**Time Required**: 3-6 hours
**Difficulty**: Medium (some technical DNS configuration)
**ROI**: 70% reduction in successful phishing attacks

---

## Why This Matters

**Email is the #1 attack vector:**

- 91% of cyberattacks start with a phishing email
- Average cost of successful phishing: $14,768 per incident
- Phishing leads to: ransomware, wire fraud, data breaches, account takeovers
- 1 in 4 employees will click a phishing link without training

**Real breach examples:**
- **Google/Facebook scam (2013-2015)**: $100M stolen via fake invoices sent by email
- **Toyota (2019)**: $37M transferred after phishing email impersonated executive
- **Ubiquiti Networks (2015)**: $46.7M lost via business email compromise

**Good news**: Phishing is predictable. With training and email security, you can block 90%+ of attacks.

---

## Prerequisites

Before starting:
- [ ] Email hosted with Google Workspace or Microsoft 365 (required for most features)
- [ ] Access to DNS settings (domain registrar account)
- [ ] Management support for training rollout
- [ ] Budget: $0-4/user/month for advanced filtering (optional)

---

## Part 1: Understanding Phishing

### Anatomy of a Phishing Attack

**Typical phishing email flow:**

```
1. Attacker sends fake email
   ├─ Spoofs trusted sender (CEO, vendor, bank)
   ├─ Creates urgency ("Act now or account closed!")
   └─ Includes malicious link or attachment

2. Employee clicks link
   ├─ Taken to fake login page (looks real)
   ├─ Enters credentials
   └─ Attacker now has valid username/password

3. Attacker uses stolen credentials
   ├─ Logs into real account
   ├─ Sends phishing to employee's contacts
   ├─ Accesses sensitive data
   ├─ Wires money or initiates fraudulent transfers
   └─ Installs malware for persistent access
```

---

### 10 Red Flags of Phishing Emails

Train employees to recognize these warning signs:

#### 🚩 1. Urgent or Threatening Language

**Examples:**
- "Your account will be closed in 24 hours!"
- "Immediate action required or you'll lose access"
- "You've been locked out - verify identity now"

**Why it works**: Urgency bypasses critical thinking.

**What to do**: Legitimate companies don't threaten. Log in directly to check (don't click link).

---

#### 🚩 2. Unexpected Requests for Sensitive Information

**Examples:**
- "Verify your password to continue service"
- "Confirm your social security number"
- "Click here to update payment information"

**Why it works**: Looks like routine account maintenance.

**What to do**: Banks/companies never ask for passwords via email. Call them directly.

---

#### 🚩 3. Suspicious Sender Address

**What to check:**
- Hover over sender name to see actual email address
- Look for misspellings: `@googIe.com` (capital i instead of L) vs. `@google.com`
- Look for random domains: `ceo@secure-verify-account-123.com`

**Examples:**
- `ceo@company-name.com` (real) vs. `ceo@company-name.net` (fake)
- `noreply@paypal.com` (real) vs. `noreply@paypal-secure.com` (fake)

**What to do**: If suspicious, go to website directly (don't click links in email).

---

#### 🚩 4. Generic Greetings

**Examples:**
- "Dear Customer" (vs. "Dear John Smith")
- "Hello User"
- "Valued Client"

**Why it's suspicious**: Legitimate companies use your name.

**Exception**: Marketing emails may use generic greetings, but shouldn't ask for sensitive actions.

---

#### 🚩 5. Spelling and Grammar Mistakes

**Examples:**
- "You're account has been compromise"
- "Please to verify you're identity"
- "Urgent: Confirm informations"

**Why it happens**: Phishing often comes from non-native speakers or automated tools.

**What to do**: Professional companies proofread emails. Errors = red flag.

---

#### 🚩 6. Suspicious Links

**How to check:**
1. **Hover** over link (don't click!)
2. **Check URL** in tooltip/status bar
3. **Look for**:
   - Misspelled domain: `microosft.com` vs. `microsoft.com`
   - Random subdomain: `microsoft.random-site.com`
   - IP address instead of domain: `http://192.168.1.1/login`
   - URL shorteners: `bit.ly`, `tinyurl.com` (can hide real destination)

**Safe example**: `https://www.google.com/accounts/login`

**Unsafe examples**:
- `http://google.com.phishing-site.ru/login`
- `https://accounts-google.random123.com`
- `http://bit.ly/123abc` (can't see real destination)

---

#### 🚩 7. Unexpected Attachments

**Dangerous file types:**
- `.exe`, `.bat`, `.cmd`, `.scr` (executables - run malware)
- `.zip`, `.rar` with password (hides malware from scanners)
- `.doc`, `.xls` with macros enabled (can run malicious code)
- `.pdf` from unknown sender (can exploit vulnerabilities)

**What to do**:
- ❌ Never open attachments from unknown senders
- ⚠️ Verify with sender via phone before opening (even if you know them - they may be compromised)
- ✅ Scan with antivirus before opening

---

#### 🚩 8. Too Good to Be True

**Examples:**
- "You've won the lottery!" (didn't enter)
- "Nigerian prince needs help transferring $10M"
- "Free iPhone - just pay shipping"
- "You've been selected for exclusive offer"

**What to do**: If it sounds too good to be true, it is. Delete.

---

#### 🚩 9. Impersonation of Executives (CEO Fraud / BEC)

**Example email:**
```
From: John Smith (CEO)
To: Finance Team
Subject: Urgent Wire Transfer

Sarah,

I'm in a meeting with our acquisition target and need to wire $50,000 immediately
to secure the deal. Please process the attached wire transfer form ASAP. This is
time-sensitive and confidential.

Thanks,
John
```

**Red flags**:
- Unusual request (CEO doesn't normally email finance directly)
- Urgency + confidentiality (don't verify)
- Sent from personal email or external domain

**What to do**:
- ✅ Verify via phone call (known number, not number in email)
- ✅ Confirm via Slack/Teams direct message
- ✅ Follow company wire transfer approval process (never bypass)
- ❌ Never wire money based solely on email request

---

#### 🚩 10. Requests to Click Links from Mobile Devices

**Why it's dangerous**: On mobile, it's harder to see full URL before clicking.

**What to do**:
- Be extra cautious on mobile
- If unsure, wait until you're on computer
- Use mobile apps instead of email links when possible

---

## Part 2: Technical Email Security

### Step 1: Configure DMARC, DKIM, and SPF (1-2 hours)

**What these do**: Prevent attackers from spoofing your domain (sending fake emails that look like they're from you).

**SPF (Sender Policy Framework)**:
- Lists which mail servers are allowed to send email from your domain
- Example: Only Google/Microsoft servers can send as `@yourcompany.com`

**DKIM (DomainKeys Identified Mail)**:
- Adds digital signature to emails
- Verifies email wasn't modified in transit

**DMARC (Domain-based Message Authentication, Reporting & Conformance)**:
- Tells receiving servers what to do if SPF/DKIM fail
- Options: Monitor, Quarantine (spam folder), Reject (block entirely)
- Sends reports on authentication failures

---

### Configure SPF (15 minutes)

**For Google Workspace:**

1. Log into your domain registrar (GoDaddy, Namecheap, Cloudflare, etc.)
2. Find DNS settings → TXT records
3. Add new TXT record:
   - **Name/Host**: `@` or leave blank (represents your root domain)
   - **Value**: `v=spf1 include:_spf.google.com ~all`
   - **TTL**: 3600 (1 hour)

4. Save and wait 1-24 hours for DNS propagation

**For Microsoft 365:**

- **Value**: `v=spf1 include:spf.protection.outlook.com ~all`

**If you use multiple email services** (e.g., Google + marketing tool):
```
v=spf1 include:_spf.google.com include:sendgrid.net ~all
```

**Verify SPF**:
- Send email to yourself
- View email headers (Gmail: Show original, Outlook: View message source)
- Look for `spf=pass`

---

### Configure DKIM (15 minutes)

**For Google Workspace:**

1. Google Admin console → Apps → Google Workspace → Gmail → Authenticate email
2. Click "Generate new record"
3. Copy the DKIM TXT record
4. Add to your DNS:
   - **Name/Host**: (Google provides, looks like `google._domainkey`)
   - **Value**: (long string starting with `v=DKIM1...`)
   - **TTL**: 3600

5. Back in Google Admin: Click "Start authentication"

**For Microsoft 365:**

1. Microsoft 365 admin center → Setup → Domains → Select your domain
2. DNS records → Add DNS records
3. Add two CNAME records provided by Microsoft
4. Microsoft auto-enables DKIM after DNS propagates

**Verify DKIM**:
- Send email to yourself
- View headers
- Look for `dkim=pass`

---

### Configure DMARC (30 minutes)

**Start with monitoring, then escalate to quarantine/reject.**

**Phase 1: Monitor (Week 1-2)**

Add DNS TXT record:
- **Name/Host**: `_dmarc`
- **Value**: `v=DMARC1; p=none; rua=mailto:dmarc-reports@yourcompany.com; ruf=mailto:dmarc-failures@yourcompany.com; pct=100`
- **TTL**: 3600

**What this does**:
- `p=none`: Monitor only, don't block anything
- `rua=`: Send aggregate reports to this email
- `ruf=`: Send failure reports to this email
- `pct=100`: Apply policy to 100% of emails

**Phase 2: Quarantine (Week 3-4, after reviewing reports)**

Change value to:
```
v=DMARC1; p=quarantine; rua=mailto:dmarc-reports@yourcompany.com; pct=100
```

- `p=quarantine`: Send failing emails to spam folder

**Phase 3: Reject (Month 2, after confirming legitimate email passes)**

Change value to:
```
v=DMARC1; p=reject; rua=mailto:dmarc-reports@yourcompany.com; pct=100
```

- `p=reject`: Block failing emails entirely

**Analyze DMARC reports**:
- Use tools like [DMARC Analyzer](https://www.dmarcanalyzer.com/) or [Postmark DMARC](https://dmarc.postmarkapp.com/)
- Reports show: Which servers sent email as your domain, SPF/DKIM results
- Look for: Legitimate servers that are failing (fix SPF/DKIM), unauthorized servers (attackers spoofing you)

---

### Step 2: Enable Advanced Email Filtering (30 minutes, optional)

**Built-in protection** (Google Workspace / Microsoft 365) is good, but not perfect.

**When to add advanced filtering**:
- You receive >10 phishing emails per week that get through
- You've had successful phishing attacks
- You handle sensitive data (financial, healthcare)
- Budget allows ($4-5/user/month)

**Recommended add-ons:**

| Tool | Price | Best For |
|------|-------|----------|
| **Proofpoint Essentials** | $4/user/mo | SMBs, good detection, training included |
| **Mimecast** | $5/user/mo | Advanced features, archiving |
| **Barracuda** | $3/user/mo | Budget option, good for <50 employees |

**Setup** (Proofpoint example):
1. Sign up for Proofpoint Essentials
2. Add your domain
3. Update MX records to point to Proofpoint (they provide values)
4. Proofpoint filters email, then forwards to Google/M365
5. Configure policies (block/quarantine/warn)

**Time**: 30-60 minutes for DNS changes + testing

---

## Part 3: Employee Training

### Step 1: Conduct Initial Phishing Awareness Session (1 hour)

**Format**: 30-45 minute group session + Q&A

**Agenda:**

**1. Why phishing matters** (5 min)
- Show breach statistics
- Real-world examples from your industry
- Cost of successful phishing

**2. 10 red flags walkthrough** (15 min)
- Go through each red flag from Part 1
- Show real phishing email examples
- Interactive: Have employees identify red flags

**3. What to do if you receive suspicious email** (5 min)
- Don't click links or open attachments
- Report to IT/security (show them how)
- Delete email
- If you clicked: Immediately report (no judgment!)

**4. What to do if you clicked a phishing link** (5 min)
- Disconnect from internet
- Change passwords (from different device)
- Report to IT/security immediately
- Scan device with antivirus

**5. Q&A** (10 min)

**6. Demo: How to check sender address, hover over links** (5 min)

**Materials to share:**
- Email with summary of 10 red flags (they can reference later)
- Link to report phishing (email address or button)
- IT/security contact info

---

### Step 2: Set Up Phishing Reporting Process (30 minutes)

**Make it easy for employees to report suspicious emails.**

**Option 1: Dedicated email address**
- Create `phishing@yourcompany.com` or `security@yourcompany.com`
- Employees forward suspicious emails
- IT reviews and responds

**Option 2: Gmail/Outlook add-on button**

**For Gmail:**
1. Install [Phishing Reporter](https://workspace.google.com/marketplace/app/phishing_reporter/662946441983) add-on (free)
2. Adds "Report Phishing" button to Gmail
3. Forwards to security team
4. Automatically removes from user's inbox

**For Outlook:**
1. Use built-in "Report Message" button
2. Admin center → Security → Submissions → User reported messages
3. Employees click "Report phishing"
4. Microsoft reviews + notifies security team

**Process when phishing reported:**
1. **Review email** (IT/security)
2. **If confirmed phishing**:
   - Send alert to all employees: "Delete email with subject X"
   - Block sender domain (if possible)
   - Report to email provider
3. **Thank reporter** (positive reinforcement - they did the right thing!)
4. **Track metrics**: How many phishing emails caught per month

---

### Step 3: Run Phishing Simulations (ongoing)

**Why simulate**: Training sticks better when employees actually experience (safe) phishing.

**Frequency**: Monthly or quarterly

**Free method** (manual):
1. **Create fake phishing email** (low stakes)
   - Example: "Update your Zoom profile" → links to internal page saying "This was a test!"
2. **Send to team**
3. **Track who clicks** (use link tracking like Bit.ly)
4. **Retrain clickers** (no punishment, just education)

**Paid method** (automated):

**Tools:**
- **KnowBe4** ($18/user/year) - Industry leader
- **Curricula** ($5/user/year) - Budget option
- **Proofpoint Security Awareness** ($24/user/year) - Integrated with email filtering

**How it works:**
1. Platform sends simulated phishing emails
2. If employee clicks:
   - They see "This was a training exercise" page
   - Automatically enrolled in microtraining (5-10 min)
3. Platform tracks results (who clicked, who reported)
4. You see dashboard: "80% passed, 20% clicked"

**Phishing simulation campaign flow:**

**Month 1**: Easy phish (obvious red flags)
- Subject: "You've won a free iPad!"
- Goal: Establish baseline, see who clicks obvious phishing

**Month 2**: Medium difficulty
- Subject: "Action required: Update your password"
- Goal: Test if training is sticking

**Month 3**: Advanced (CEO fraud simulation)
- From: CEO name
- Subject: "Urgent: Need you to process wire transfer"
- Goal: Test BEC awareness

**Month 4**: Repeat easy phish
- Goal: Measure improvement vs. Month 1

**Success metrics:**
- **Month 1**: 30% click rate (baseline)
- **Month 6**: <10% click rate
- **Month 12**: <5% click rate

**Best practices:**
- ✅ Make it educational, not punitive
- ✅ Send micro-training immediately after click
- ✅ Vary difficulty and types of phishing
- ✅ Track trends over time
- ❌ Don't shame employees who click
- ❌ Don't tie results to performance reviews (discourages reporting)

---

## Part 4: Incident Response

### What to Do If Employee Clicks Phishing Link

**Immediate actions (within 5 minutes):**

1. **Disconnect from network**
   - Turn off Wi-Fi
   - Unplug ethernet
   - Don't shut down computer (may need forensics)

2. **Don't enter any credentials**
   - If fake login page is still open, close it
   - Don't try to "undo" by logging in

3. **Report to IT/security immediately**
   - Call (don't email - email may be compromised)
   - Provide: What email, what link, what information entered

---

**Within 1 hour:**

**If employee entered password:**
1. **Change password** (from different device, not compromised one)
2. **Check for suspicious activity**:
   - Email rules (forwarding, auto-delete)
   - Sent items (did they send phishing to contacts?)
   - Login history (unusual locations)
3. **Enable MFA** if not already enabled
4. **Change security questions** if exposed

**If employee entered financial info (credit card, bank):**
1. **Call bank immediately** to freeze card / monitor account
2. **Place fraud alert** on credit report
3. **Monitor accounts** for 30 days

**If employee downloaded attachment:**
1. **Scan with antivirus** (from safe mode if possible)
2. **Consider re-imaging device** (wipe and reinstall OS) if high-value target
3. **Check for malware**: keyloggers, ransomware, remote access trojans

---

**Within 24 hours:**

1. **Alert other employees**
   - "Be aware of phishing email with subject X"
   - Don't shame the victim
   - Remind of reporting process

2. **Review email logs**
   - Did attacker access email?
   - Did they send phishing to contacts?
   - Did they access sensitive files?

3. **Block attacker**
   - Block sender domain
   - Block phishing site (if possible)
   - Report to Google/Microsoft/email provider

4. **Document incident**
   - What happened, when, who was affected
   - What data was exposed
   - Actions taken
   - Lessons learned

5. **Retrain affected employee**
   - No punishment, just education
   - Review what red flags they missed
   - Practice identifying phishing

---

## Testing and Verification

### Week 1-2 Checklist

- [ ] SPF record configured and verified
- [ ] DKIM configured and verified
- [ ] DMARC set to monitor (p=none)
- [ ] Initial phishing awareness training conducted
- [ ] Phishing reporting process set up
- [ ] Employees know how to report phishing

### Month 1 Checklist

- [ ] DMARC reports reviewed
- [ ] DMARC set to quarantine (p=quarantine)
- [ ] First phishing simulation sent (if using)
- [ ] 80%+ employees can identify basic phishing

### Month 2 Checklist

- [ ] DMARC set to reject (p=reject)
- [ ] Advanced email filtering deployed (if using)
- [ ] Phishing click rate <15% (if simulating)
- [ ] 0 successful phishing attacks

---

### Test Your Email Security

**Test 1: SPF/DKIM/DMARC**
- Use [MXToolbox](https://mxtoolbox.com/dmarc.aspx)
- Enter your domain
- Should show: SPF Pass, DKIM Pass, DMARC Pass ✅

**Test 2: Send test phishing email**
- Send suspicious-looking email to yourself
- Should be flagged as spam or blocked ✅

**Test 3: Try to send email as your domain from external account**
- Use Gmail personal account
- Try to send email "from" your company domain
- Should be blocked or marked as spam ✅

---

## Common Pitfalls

### ❌ Pitfall #1: Setting DMARC to "reject" too early

**Problem**: Blocking legitimate email (newsletters, automated systems).

**Solution**:
- Start with `p=none` (monitor) for 2 weeks
- Review DMARC reports
- Fix SPF/DKIM for legitimate senders
- Then escalate to quarantine → reject

---

### ❌ Pitfall #2: Punishing employees who click phishing

**Problem**: Employees hide mistakes, don't report breaches, makes problem worse.

**Solution**:
- Make reporting safe and encouraged
- Focus on education, not punishment
- Reward people who report phishing
- "Thank you for reporting - this helps protect everyone!"

---

### ❌ Pitfall #3: One-and-done training

**Problem**: People forget training after 1-2 months.

**Solution**:
- Quarterly refresher training
- Monthly phishing simulations (keeps it top of mind)
- Send security tips in weekly newsletter
- Make security part of culture

---

### ❌ Pitfall #4: Not testing DMARC configuration

**Problem**: Misconfigured DMARC blocks legitimate email, you don't notice until customer complains.

**Solution**:
- Test before deploying
- Monitor DMARC reports weekly for first month
- Have external partner send you email and verify receipt

---

## Success Metrics

| Metric | Baseline | Target (3 months) | How to Measure |
|--------|----------|-------------------|----------------|
| **Phishing click rate** | 30% | <10% | Phishing simulations |
| **Phishing reported by users** | 0-5/month | 20+/month | Phishing reports |
| **Successful phishing attacks** | 1-2/year | 0 | Incident log |
| **DMARC policy** | None | p=reject | DNS check |
| **Employees trained** | 0% | 100% | Training attendance |

---

## Real-World Examples

### Example 1: Accounting Firm (25 employees)

**Situation**: Received 50+ phishing emails per week, 2 employees clicked phishing in past year (one led to ransomware).

**Implementation**:
- Configured SPF, DKIM, DMARC (p=reject)
- Conducted phishing training
- Deployed Proofpoint filtering ($4/user = $100/month)
- Monthly phishing simulations via KnowBe4

**Results**:
- Phishing emails getting through: 50/week → 2/week (96% reduction)
- Employee phishing click rate: 35% → 4% (Month 6)
- 0 successful phishing attacks in 18 months

**ROI**: Previous ransomware cost $75K. New costs: $2,850/year. **26x ROI.**

---

### Example 2: E-commerce Startup (12 employees)

**Situation**: No email security, relying on Gmail defaults, no training.

**Implementation** (free/low-cost):
- Configured SPF, DKIM, DMARC (2 hours)
- Conducted internal phishing training (1 hour)
- Manual phishing simulations quarterly (internal IT)
- Used Gmail's built-in reporting button

**Results**:
- Phishing emails reduced from 20/week → 5/week (75% reduction)
- Employees reported 30+ phishing emails in 3 months
- Click rate: 40% → 12% (Month 3)
- **Cost**: $0 (all free tools)

**ROI**: Prevented potential BEC fraud ($50K average). Cost: $0. **Infinite ROI.**

---

### Example 3: Professional Services (60 employees)

**Situation**: Had DMARC but at p=none (monitoring only), minimal training, 3 BEC attempts in past year.

**Implementation**:
- Escalated DMARC from p=none → p=reject (1 week)
- Deployed Curricula training ($5/user = $300/year)
- Added phishing reporting button to Outlook
- Quarterly phishing simulations

**Results**:
- DMARC blocks 40-60 spoofed emails per month
- Employees report 15-20 phishing emails per month
- 0 BEC attempts succeeded (vs. 1 success previous year costing $28K)
- Click rate: 28% → 7% (Month 6)

**ROI**: $300/year cost vs. $28K saved = **93x ROI.**

---

## Next Steps

**This week:**
1. Configure SPF (15 min)
2. Configure DKIM (15 min)
3. Configure DMARC at p=none (15 min)
4. Schedule phishing awareness training

**Next week:**
1. Conduct phishing awareness training
2. Set up phishing reporting process
3. Review DMARC reports

**Month 2:**
1. Escalate DMARC to p=quarantine
2. Run first phishing simulation
3. Consider advanced email filtering

**Month 3:**
- Move to [Device Security Guide](04-device-security.md) - Endpoint protection

---

## Related Resources

- [Passwords & Access Guide](02-passwords-access.md) - Secure the accounts you're protecting
- [Incident Response Guide](08-incident-response.md) - Full breach response protocol
- [Security Policy Template](../templates/security-policy.md) - Include phishing response
- [Tools Comparison](../TOOLS.md#4-email-security) - Email security tool comparison

---

**Last Updated**: February 2026
**Estimated Time**: 3-6 hours
**Expected ROI**: 70% reduction in successful phishing attacks
