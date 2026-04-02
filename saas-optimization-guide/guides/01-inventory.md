# Step 1: Build Your SaaS Inventory

**Time required**: 2-4 hours
**Output**: Complete list of every SaaS tool your company pays for

---

## Why Build an Inventory?

You can't optimize what you don't measure. Most companies discover they're paying for 30-50% more tools than they thought.

**Common surprises**:
- Tools from employees who left 6+ months ago (still billing)
- Shadow IT (departments buying tools without IT approval)
- Forgotten trials that converted to paid (never canceled)
- Duplicate tools (3 people independently bought the same tool)
- Zombie integrations (API subscriptions for services you no longer use)

---

## What You'll Need

- [ ] Access to finance/accounting system (expense reports, credit card statements)
- [ ] Access to IT admin panels (Google Workspace, Okta, Azure AD)
- [ ] Department manager contact list (to survey teams)
- [ ] 2-4 hours of focused time
- [ ] Spreadsheet template ([saas-inventory.csv](../templates/saas-inventory.csv))

---

## Data Sources

### Source 1: Finance/Accounting System (Primary Source)

**Where to look**:
- Monthly credit card statements (last 3 months)
- Accounts payable reports (filter for software/SaaS vendors)
- Recurring charge report (most accounting systems can generate this)
- Expensify/Divvy/Ramp reports (if using expense management tool)

**What to record**:
- Vendor name (e.g., "Slack Technologies")
- Tool name (e.g., "Slack Business+")
- Monthly cost (or annual cost ÷ 12)
- Billing frequency (monthly, annual, other)
- Payment method (corporate card, invoice, PayPal)
- Card/account last 4 digits (to identify duplicate subscriptions)

**Example entries**:
```
Slack Technologies, Slack Business+, $125/month, Monthly, Amex *1234
Zoom Video Communications, Zoom Pro, $150/month, Monthly, Amex *1234
HubSpot Inc., HubSpot Marketing Professional, $800/month, Annual ($9,600/year), Invoice
```

**⚠️ Watch out for**:
- Tools billed under parent company names (e.g., "Intuit" for Mailchimp or QuickBooks)
- Multiple subscriptions to same tool (different departments buying separately)
- Annual charges that only appear once per year (easy to miss in monthly review)

**Time**: 1-2 hours

---

### Source 2: IT Admin Panels (SSO/Identity Management)

**Where to look**:
- **Google Workspace Admin**: Apps > Connected Apps
- **Microsoft 365 Admin**: Users > Active Users > Licenses
- **Okta**: Applications > Applications
- **Azure AD**: Enterprise Applications
- **OneLogin**: Apps > Company Apps

**What to record**:
- App name
- Number of users provisioned
- Last login date (identifies unused tools)
- SSO connection status

**Why this matters**:
- Shows which tools employees actually use (login data)
- Reveals shadow IT (apps connected without IT approval)
- Identifies unused licenses (provisioned but never logged in)

**Example**: If Okta shows "Asana - 15 users provisioned, last 30 days: 8 logins", you're paying for 7 unused licenses.

**Time**: 30-60 minutes

---

### Source 3: Department Surveys (Shadow IT Discovery)

**Email template to send to department heads**:

```
Subject: SaaS Tool Audit - Please List Your Department's Tools

Hi [Name],

We're conducting a company-wide audit of software tools to optimize our spending and improve security.

Please reply with a list of all SaaS tools your department currently uses, including:
1. Tool name (e.g., Canva, Asana, HubSpot)
2. Who uses it (names or "entire team")
3. Approximate monthly cost (if you know)
4. How critical it is (1=nice to have, 10=business breaks without it)

This includes:
- Tools you pay for with a company card
- Tools you pay for personally but expense
- Free tools your team relies on
- Browser extensions or plugins with paid tiers

Deadline: [3 days from now]

Thanks!
[Your Name]
```

**What you'll discover**:
- Tools finance doesn't know about (personal cards, expensed purchases)
- Free tools that teams love (potential paid upgrade opportunities)
- Duplicate tools (Marketing uses Asana, Product uses Monday, Engineering uses Jira)
- Shadow IT (tools bought without approval)

**Time**: 30 minutes to send survey + 2-3 days for responses

---

### Source 4: Browser Extensions (Personal Discovery)

**How to find**:
- Chrome: chrome://extensions
- Edge: edge://extensions
- Firefox: about:addons

**What to look for**:
- Paid extensions (Grammarly Premium, Loom, etc.)
- Extensions with paid tiers (free now, but might upgrade later)
- Extensions that require subscriptions (password managers, VPNs)

**Why this matters**: Browser extensions often fly under the radar but can represent $10-50/user/month in spend.

**Time**: 15 minutes

---

### Source 5: Mobile App Subscriptions

**Where to look**:
- **iPhone**: Settings > [Your Name] > Subscriptions
- **Android**: Play Store > Menu > Subscriptions
- **Company App Stores**: MDM/EMM admin panel (if using Jamf, Intuit, etc.)

**What to look for**:
- Apps with business accounts (Slack, Zoom, Asana mobile)
- Productivity apps (Notability, GoodNotes, PDF Expert)
- Reference apps (LexisNexis, Bloomberg Terminal)

**Time**: 15 minutes

---

## Building Your Inventory Spreadsheet

### Step 1: Download Template

Get our pre-built template: [saas-inventory.csv](../templates/saas-inventory.csv)

**Columns included**:
- Tool Name
- Vendor
- Category (Communication, Project Management, CRM, etc.)
- Monthly Cost
- Annual Cost
- Users Licensed (how many you pay for)
- Users Active (how many actually use it)
- Utilization % (Active / Licensed)
- Plan Level (Starter, Professional, Enterprise, etc.)
- Renewal Date
- Owner/Champion (who manages this tool)
- Usage Score (1-10)
- Value Score (1-10)
- Overlap Score (1-10)
- Cost Efficiency (1-10)
- Strategic Fit (1-10)
- Overall Score (average of 5 scores)
- Decision (Keep, Negotiate, Consolidate, Cancel)
- Action Item
- Notes

---

### Step 2: Consolidate Data from All Sources

**Finance data** (primary):
1. Export recurring charges from accounting system
2. Copy into spreadsheet (Tool Name, Vendor, Monthly Cost, Annual Cost)

**IT admin data**:
1. Export user/license reports from SSO tools
2. Add Users Licensed and Users Active columns
3. Calculate Utilization % (=Active/Licensed)

**Department surveys**:
1. Add any tools not found in finance/IT data (shadow IT)
2. Flag these as "Shadow IT" in Notes column

**Personal discoveries**:
1. Add browser extensions and mobile subscriptions
2. Mark as "Personal subscription" in Notes if not company-paid

---

### Step 3: Categorize Tools

Use these categories:

| Category | Examples |
|----------|----------|
| **Communication** | Slack, Teams, Zoom, Google Meet |
| **Productivity** | Google Workspace, Microsoft 365, Notion |
| **Project Management** | Asana, Monday, Trello, Jira |
| **CRM** | HubSpot, Salesforce, Pipedrive, Zoho CRM |
| **Marketing** | Mailchimp, HubSpot Marketing, Brevo |
| **Email Marketing** | Mailchimp, SendGrid, Brevo |
| **Design** | Canva, Figma, Adobe Creative Cloud |
| **Development** | GitHub, GitLab, AWS, Vercel |
| **Finance** | QuickBooks, Xero, Stripe, Bill.com |
| **HR** | BambooHR, Gusto, Rippling |
| **Support** | Zendesk, Intercom, Freshdesk |
| **Analytics** | Google Analytics, Mixpanel, Amplitude |
| **Storage** | Dropbox, Google Drive, Box |
| **Security** | 1Password, LastPass, Okta, Duo |
| **Other** | Anything else |

---

### Step 4: Add Renewal Dates

**Where to find renewal dates**:
- Email search for "renewal" or "invoice" from vendor
- Check contract PDFs in Google Drive/Dropbox
- Look at credit card statements (when did annual charge hit?)
- Call vendor and ask (they'll tell you)

**Why this matters**: Renewal dates are critical for negotiation timing (start 60 days before renewal).

**Pro tip**: For annual contracts, set calendar reminder 60 days before renewal to start negotiation.

---

### Step 5: Identify Owners/Champions

**Owner** = Person who manages the tool (admin access, decides on usage, handles renewals)

**Why this matters**:
- Need owner input to assess tool value
- Owner will help with migration if you consolidate
- Owner can advocate for keeping tool (or confirm it's not needed)

**How to find**:
- Check SSO admin panels (who has admin role?)
- Ask department heads: "Who manages [Tool] in your team?"
- Email search for vendor communications (who receives renewal emails?)

---

## Common Inventory Challenges

### Challenge 1: "We have too many tools to track"

**Solution**: Start with high-value targets (>$50/month). You'll capture 80% of spend by tracking 20% of tools.

**Focus on**:
- Tools costing $100+/month (biggest savings opportunity)
- Tools with many licenses (even $10/user adds up with 50 users)
- Tools you know have alternatives (duplicate functionality)

**Skip for now**:
- One-off charges <$25
- Free tools (track later if you want)
- Domain names and hosting (separate category)

---

### Challenge 2: "I don't have access to finance data"

**Solution**: Ask finance for "software vendor spend report" for last 6 months.

**What to request**:
> "Can you pull a report of all recurring software/SaaS vendor charges from [Start Date] to [End Date]? I need Vendor Name, Amount, Frequency, and Payment Method. We're doing a SaaS audit to reduce costs."

Finance teams usually love this request (shows you're being cost-conscious).

---

### Challenge 3: "Departments won't respond to survey"

**Solution**: Get executive sponsor (CEO/CFO) to send the email instead of you.

**Executive email template**:
```
Subject: [Action Required] SaaS Tool Survey - Deadline [Date]

Team,

We're conducting a company-wide audit to optimize our software spending and improve security. This could save us $X,000+/year.

Please respond to [Your Name] by [Date] with a list of all SaaS tools your department uses. This includes paid tools, free tools, and anything your team relies on for daily work.

Non-response will result in [Your Name] making decisions without your input, which may impact tools your team uses.

Thanks,
[CEO/CFO Name]
```

**Response rate improvement**: 30% → 90% when sent by executive

---

### Challenge 4: "We don't have SSO/Identity Management"

**Solution**: Use these alternative sources:

1. **Password manager audit** - Export list from 1Password/LastPass (shows which SaaS tools employees have saved)
2. **Browser history** - Ask IT to sample browser history for common SaaS domains
3. **Network traffic** - IT can review firewall logs for SaaS API traffic
4. **Employee interviews** - Ask 5-10 employees: "What tools do you use daily?"

---

## Sample Inventory Workflow

### Day 1 (2 hours)

**9:00-10:00am**: Finance data
- Export recurring charges from accounting system
- Copy into spreadsheet (40-60 entries expected)

**10:00-11:00am**: IT admin panels
- Export user/license data from Google Workspace/Okta
- Add Users Licensed, Users Active, Utilization %

---

### Day 2 (1 hour)

**9:00-9:30am**: Send department survey
- Email all department heads
- Set deadline 3 days from now

**9:30-10:00am**: Personal discovery
- Check browser extensions
- Check mobile app subscriptions
- Add to spreadsheet

---

### Day 5 (1 hour)

**After survey responses come back**:
- Add shadow IT tools to spreadsheet
- Merge duplicate entries (departments might report same tools)
- Categorize all tools
- Add renewal dates (where known)
- Identify owners/champions

---

### Result

**Complete inventory** with:
- 50-100+ SaaS tools listed
- Monthly and annual costs calculated
- User counts (licensed vs active)
- Renewal dates tracked
- Categories assigned
- Owners identified

**Total spend** visible: $3,000-8,000/month (typical for 25-100 employee company)

---

## Quality Checks

Before moving to Step 2 (Usage Analysis), verify:

- [ ] All tools costing >$50/month are included
- [ ] User counts are accurate (licensed vs active)
- [ ] Monthly costs are calculated (convert annual to monthly if needed)
- [ ] Renewal dates added for top 20 tools by spend
- [ ] Categories assigned to all tools
- [ ] Owners identified for top 20 tools by spend

**Common missing data** (it's OK if you don't have these yet):
- Exact renewal dates for all tools (add during Step 2)
- Usage scores (calculate in Step 2)
- Utilization % for tools without SSO (estimate in Step 2)

---

## What's Next

Once your inventory is complete, proceed to:

**[Step 2: Usage Analysis](./02-usage-analysis.md)** - Score each tool and identify waste

**Key transition**: Your inventory shows WHAT you're paying for. Usage analysis shows what's actually being USED and where to optimize.

---

## Related Resources

- **[saas-inventory.csv](../templates/saas-inventory.csv)** - Template spreadsheet
- **[AUDIT-PROCESS.md](../AUDIT-PROCESS.md)** - Full 4-step methodology
- **[renewal-calendar.csv](../templates/renewal-calendar.csv)** - Track renewal dates separately
