# Use Cases: Real Business Automation for SEA

**10 practical examples for businesses in Malaysia and Singapore**

---

## Overview

These use cases are designed for **small to medium businesses in Southeast Asia** across various industries. Each includes:

- Real-world scenario
- Workflow breakdown
- Time/money saved
- Difficulty level
- Estimated setup time

**Total Potential Savings**: Up to 71 hours/month = $3,550 value (at $50/hour)

---

## Use Case 1: Lead Capture & CRM Automation

### Scenario

Your marketing team runs Google/Facebook ads. Leads fill a Typeform, but manually adding them to HubSpot CRM takes 10-15 minutes per lead.

### Current Manual Process

1. Check Typeform submissions (daily)
2. Copy lead details
3. Check HubSpot for duplicates
4. Create contact in HubSpot
5. Tag contact appropriately
6. Assign to sales rep
7. Send welcome email
8. Notify sales team on Slack

**Time per lead**: 12 minutes
**Leads per month**: 100
**Monthly time spent**: 20 hours

### n8n Automation Workflow

```
1. Typeform Trigger (new submission)
   ↓
2. Extract form data
   ↓
3. HubSpot: Check for existing contact
   ↓
4. IF new contact → Create in HubSpot
   ↓
5. Add tags based on form answers
   ↓
6. Assign to sales rep (round-robin)
   ↓
7. Gmail: Send personalized welcome email
   ↓
8. Slack: Notify sales channel with lead details
   ↓
9. Google Sheets: Log for backup/reporting
```

### Results

- **Time saved**: 20 hours/month → 2 minutes/month (monitoring)
- **Value**: 20 hours × $50 = $1,000/month
- **Response time**: Instant (vs 24-48 hours)
- **Human errors**: Eliminated

### Setup

- **Difficulty**: Beginner
- **Time to build**: 45 minutes
- **Integrations needed**: Typeform, HubSpot, Gmail, Slack, Google Sheets

---

## Use Case 2: Invoice Processing & Accounting

### Scenario

Vendors email PDF invoices. Accounting team manually downloads, extracts data, and enters into Xero or QuickBooks. Very time-consuming and error-prone.

### Current Manual Process

1. Check email for invoices
2. Download PDF attachments
3. Read invoice details
4. Open Xero/QuickBooks
5. Create bill/invoice entry
6. Match to purchase order
7. Update cash flow tracker
8. File PDF in Drive

**Time per invoice**: 10 minutes
**Invoices per month**: 80
**Monthly time spent**: 13.3 hours

### n8n Automation Workflow

```
1. Gmail Trigger (new email with PDF from vendors@)
   ↓
2. Extract PDF attachment
   ↓
3. AI OCR: Extract invoice details
   (vendor, amount, invoice #, date, line items)
   ↓
4. Xero: Create draft bill
   ↓
5. Match to existing purchase order
   ↓
6. Google Sheets: Update cash flow tracker
   ↓
7. Google Drive: Save PDF to folder
   ↓
8. Slack: Notify finance team for approval
```

### Results

- **Time saved**: 13.3 hours/month → 1 hour/month (review drafts)
- **Value**: 12.3 hours × $50 = $615/month
- **Accuracy**: 99% (vs 85% manual)
- **Processing time**: Instant (vs 2-3 days)

### Setup

- **Difficulty**: Intermediate
- **Time to build**: 90 minutes
- **Integrations needed**: Gmail, PDF parser (OpenAI/Google Vision), Xero, Google Sheets, Google Drive, Slack

---

## Use Case 3: Social Media Scheduling

### Scenario

Marketing team manages Facebook, Instagram, LinkedIn, and TikTok. Manually posting to each platform daily is repetitive and easy to forget.

### Current Manual Process

1. Create post content
2. Log into Facebook
3. Post and schedule
4. Log into Instagram
5. Post and schedule
6. Repeat for LinkedIn, TikTok
7. Track engagement manually

**Time per post**: 20 minutes
**Posts per week**: 5
**Monthly time spent**: 6.7 hours

### n8n Automation Workflow

```
1. Google Sheets: Content calendar (trigger on new row)
   ↓
2. Extract post details (text, image URL, platforms, time)
   ↓
3. Download image from URL
   ↓
4. Facebook: Create scheduled post
   ↓
5. Instagram: Create scheduled post
   ↓
6. LinkedIn: Create scheduled post
   ↓
7. TikTok: Create scheduled post
   ↓
8. Google Sheets: Mark as "Scheduled"
   ↓
9. Slack: Confirm scheduling
```

**Advanced**: Add a step to track engagement after 24 hours and log to analytics sheet.

### Results

- **Time saved**: 6.7 hours/month → 30 minutes/month (planning content)
- **Value**: 6.2 hours × $50 = $310/month
- **Consistency**: 100% (never miss a scheduled post)
- **Multi-platform**: Simultaneous posting

### Setup

- **Difficulty**: Beginner
- **Time to build**: 60 minutes
- **Integrations needed**: Google Sheets, Facebook, Instagram, LinkedIn, TikTok, Slack

---

## Use Case 4: Customer Support Routing (WhatsApp/Telegram)

### Scenario

Customer messages come via WhatsApp and Telegram. Support team manually checks both, categorizes, and assigns. Slow and inconsistent.

### Current Manual Process

1. Check WhatsApp messages
2. Read and categorize (sales, support, billing)
3. Assign to team member
4. Create ticket in Zendesk
5. Respond to customer
6. Repeat for Telegram

**Time per day**: 2 hours
**Monthly time spent**: 44 hours

### n8n Automation Workflow

```
1. WhatsApp/Telegram Trigger (new message)
   ↓
2. AI Analysis (OpenAI): Categorize message
   - Sales inquiry
   - Technical support
   - Billing question
   - General query
   ↓
3. Check business hours (9 AM - 6 PM SGT)
   ↓
4. IF business hours:
   - Route to appropriate team member
   - Create Zendesk ticket
   - Send "We've received your message" reply
   ↓
5. IF after hours:
   - Send auto-reply: "We'll respond within 2 hours during business hours"
   - Log to queue for next morning
   ↓
6. Slack: Notify assigned team member
```

### Results

- **Time saved**: 44 hours/month → 10 hours/month (actual responses)
- **Value**: 34 hours × $50 = $1,700/month
- **Response time**: Instant acknowledgment
- **Customer satisfaction**: +25% (faster initial response)

### Setup

- **Difficulty**: Intermediate
- **Time to build**: 120 minutes
- **Integrations needed**: WhatsApp Business Cloud, Telegram, OpenAI, Zendesk, Slack

---

## Use Case 5: Expense Report Automation

### Scenario

Employees submit expense receipts via email or Telegram. Finance team manually extracts data and adds to spreadsheet for reimbursement.

### Current Manual Process

1. Collect receipts from email/Telegram
2. Read receipt details
3. Categorize expense
4. Enter into Google Sheets
5. Verify against budget
6. Approve/reject
7. Process reimbursement

**Time per receipt**: 5 minutes
**Receipts per month**: 200
**Monthly time spent**: 16.7 hours

### n8n Automation Workflow

```
1. Telegram Bot Trigger (employee sends receipt photo)
   ↓
2. AI OCR (Google Vision): Extract receipt data
   - Merchant name
   - Amount
   - Date
   - Category
   ↓
3. Google Sheets: Add row to expense tracker
   ↓
4. Check budget remaining for category
   ↓
5. IF within budget:
   - Mark as "Auto-Approved"
   - Telegram: Reply "Approved! Added to reimbursement queue"
   ↓
6. IF exceeds budget or unusual:
   - Slack: Notify finance manager for review
   - Telegram: Reply "Pending approval"
   ↓
7. Weekly summary email to finance team
```

### Results

- **Time saved**: 16.7 hours/month → 2 hours/month (reviewing exceptions)
- **Value**: 14.7 hours × $50 = $735/month
- **Processing time**: Instant (vs 3-5 days)
- **Employee satisfaction**: Higher (faster reimbursement)

### Setup

- **Difficulty**: Intermediate
- **Time to build**: 90 minutes
- **Integrations needed**: Telegram, Google Vision API, Google Sheets, Slack, Gmail

---

## Use Case 6: Appointment Reminders

### Scenario

Clinic/salon has many no-shows because patients/clients forget appointments. Staff spends time calling to remind.

### Current Manual Process

1. Check tomorrow's Google Calendar
2. Manually send WhatsApp reminders
3. Log responses

**Time per day**: 45 minutes
**Monthly time spent**: 15.5 hours

### n8n Automation Workflow

```
1. Schedule Trigger (runs daily at 10 AM)
   ↓
2. Google Calendar: Get tomorrow's appointments
   ↓
3. FOR EACH appointment:
   ↓
4. Extract client phone and appointment details
   ↓
5. WhatsApp: Send reminder
   "Hi [Name], reminder of your appointment tomorrow at [Time].
   Reply Y to confirm or R to reschedule."
   ↓
6. Google Sheets: Log reminder sent
   ↓
7. Wait for customer reply
   ↓
8. IF reply = "R":
   - Slack: Notify staff to call for rescheduling
   ↓
9. IF reply = "Y":
   - Calendar: Add confirmation note
   ↓
10. Next day summary: No-show rate tracking
```

### Results

- **Time saved**: 15.5 hours/month → 1 hour/month (handling reschedules)
- **Value**: 14.5 hours × $50 = $725/month
- **No-show rate**: -60% (from 20% to 8%)
- **Revenue saved**: Depends on appointment value

### Setup

- **Difficulty**: Beginner
- **Time to build**: 45 minutes
- **Integrations needed**: Google Calendar, WhatsApp Business Cloud, Google Sheets, Slack

---

## Use Case 7: Competitive Monitoring

### Scenario

You need to monitor competitor websites for price changes, new products, or blog posts. Manual checking is inconsistent.

### Current Manual Process

1. Visit 5 competitor websites weekly
2. Check for changes
3. Take screenshots
4. Email team

**Time per week**: 2 hours
**Monthly time spent**: 8 hours

### n8n Automation Workflow

```
1. Schedule Trigger (runs daily at 8 AM)
   ↓
2. FOR EACH competitor URL:
   ↓
3. HTTP Request: Fetch website HTML
   ↓
4. Extract key elements (prices, product listings, headlines)
   ↓
5. Compare with yesterday's snapshot
   ↓
6. IF changes detected:
   - Take screenshot
   - Highlight what changed
   - Slack: Notify marketing team with screenshot
   - Google Sheets: Log change
   ↓
7. Weekly summary report via email
```

### Results

- **Time saved**: 8 hours/month → 30 minutes/month (reviewing alerts)
- **Value**: 7.5 hours × $50 = $375/month
- **Response time**: Same day (vs weekly)
- **Competitive advantage**: Faster reaction to market changes

### Setup

- **Difficulty**: Intermediate
- **Time to build**: 75 minutes
- **Integrations needed**: HTTP Request, screenshot tool, Slack, Google Sheets, Gmail

---

## Use Case 8: HR Onboarding Automation

### Scenario

New employee onboarding involves 15+ manual steps across multiple systems. HR spends 3-4 hours per new hire.

### Current Manual Process

1. Create email account
2. Add to company directory
3. Set up Slack account
4. Grant system access (CRM, accounting, etc.)
5. Order laptop/equipment
6. Send welcome pack
7. Schedule orientation
8. Assign mentor
9. Create onboarding checklist

**Time per employee**: 4 hours
**New hires per month**: 3
**Monthly time spent**: 12 hours

### n8n Automation Workflow

```
1. Google Forms Trigger (HR submits new hire form)
   ↓
2. Extract employee details (name, role, start date, department)
   ↓
3. Google Workspace: Create email account
   ↓
4. Slack: Create account and add to channels
   ↓
5. Monday.com/Asana: Create onboarding task list
   ↓
6. Notion: Add to employee directory
   ↓
7. Gmail: Send welcome email with credentials
   ↓
8. Google Calendar: Schedule orientation meetings
   ↓
9. Telegram: Message IT team to prepare equipment
   ↓
10. Slack: Notify department manager
    ↓
11. Assign mentor (round-robin from department)
    ↓
12. Send day-1 agenda to new hire
```

### Results

- **Time saved**: 12 hours/month → 2 hours/month (verification)
- **Value**: 10 hours × $50 = $500/month
- **New hire experience**: More professional and organized
- **Errors**: Eliminated (no forgotten steps)

### Setup

- **Difficulty**: Advanced
- **Time to build**: 150 minutes
- **Integrations needed**: Google Forms, Google Workspace, Slack, Monday.com, Notion, Gmail, Google Calendar, Telegram

---

## Use Case 9: E-Commerce Order Sync (Shopee/Lazada)

### Scenario

Selling on Shopee, Lazada, and own website. Manually updating inventory across platforms leads to overselling.

### Current Manual Process

1. Check orders on each platform
2. Update inventory in main spreadsheet
3. Manually adjust stock on other platforms
4. Export for fulfillment
5. Update tracking numbers

**Time per day**: 90 minutes
**Monthly time spent**: 39 hours

### n8n Automation Workflow

```
1. Webhook Trigger (new order from Shopee/Lazada/Website)
   ↓
2. Extract order details (product, quantity, customer)
   ↓
3. Google Sheets: Update master inventory
   ↓
4. Check stock levels
   ↓
5. IF stock < reorder point:
   - Slack: Alert procurement team
   ↓
6. Update stock on all platforms:
   - Shopee API: Update quantity
   - Lazada API: Update quantity
   - WooCommerce/Shopify: Update quantity
   ↓
7. Google Sheets: Log order
   ↓
8. Fulfillment system: Send order details
   ↓
9. WHEN tracking number added:
   - Update customer on each platform
   - Send WhatsApp notification to customer
```

### Results

- **Time saved**: 39 hours/month → 5 hours/month (handling exceptions)
- **Value**: 34 hours × $50 = $1,700/month
- **Overselling**: Eliminated
- **Customer satisfaction**: +30% (faster updates)

### Setup

- **Difficulty**: Advanced
- **Time to build**: 180 minutes
- **Integrations needed**: Shopee API, Lazada API, WooCommerce/Shopify, Google Sheets, Slack, WhatsApp

---

## Use Case 10: Weekly Report Generation

### Scenario

Management needs weekly reports combining data from Google Analytics, HubSpot CRM, Xero accounting, and ad platforms. Analyst spends 3 hours every Monday compiling.

### Current Manual Process

1. Export data from Google Analytics
2. Export data from HubSpot
3. Export data from Xero
4. Export ad performance from Meta/Google
5. Compile in Excel
6. Create charts
7. Write summary
8. Email to management

**Time per week**: 3 hours
**Monthly time spent**: 13 hours

### n8n Automation Workflow

```
1. Schedule Trigger (every Monday at 8 AM)
   ↓
2. Google Analytics: Fetch last week's data
   ↓
3. HubSpot: Fetch deals and pipeline data
   ↓
4. Xero: Fetch revenue and expenses
   ↓
5. Meta Ads: Fetch ad performance
   ↓
6. Google Ads: Fetch campaign data
   ↓
7. Combine all data
   ↓
8. Google Sheets: Update dashboard
   ↓
9. Create charts (Google Charts API)
   ↓
10. AI Summary (OpenAI): Generate insights
    - Key wins
    - Concerns
    - Recommendations
    ↓
11. Gmail: Send formatted report to management
    ↓
12. Slack: Post summary to #leadership channel
```

### Results

- **Time saved**: 13 hours/month → 30 minutes/month (reviewing insights)
- **Value**: 12.5 hours × $50 = $625/month
- **Timeliness**: 8 AM Monday (vs noon Monday)
- **Quality**: Consistent format, AI-powered insights

### Setup

- **Difficulty**: Advanced
- **Time to build**: 120 minutes
- **Integrations needed**: Google Analytics, HubSpot, Xero, Meta Ads, Google Ads, Google Sheets, OpenAI, Gmail, Slack

---

## Summary: Total Value

| Use Case | Hours Saved/Month | Value ($50/hour) |
|----------|------------------|------------------|
| 1. Lead Capture | 19.7 hours | $985 |
| 2. Invoice Processing | 12.3 hours | $615 |
| 3. Social Media | 6.2 hours | $310 |
| 4. Customer Support | 34 hours | $1,700 |
| 5. Expense Reports | 14.7 hours | $735 |
| 6. Appointment Reminders | 14.5 hours | $725 |
| 7. Competitive Monitoring | 7.5 hours | $375 |
| 8. HR Onboarding | 10 hours | $500 |
| 9. E-commerce Sync | 34 hours | $1,700 |
| 10. Report Generation | 12.5 hours | $625 |
| **TOTAL (if implementing all)** | **165.4 hours/month** | **$8,270/month** |

**Average implementation**: 5-7 workflows = **71 hours/month saved** = **$3,550/month value** (at full maturity — see note below)

**n8n Cost (self-hosted)**: ~$5.50/month

> **Reality check**: These time savings represent the theoretical maximum once all workflows are running smoothly. In practice, expect 50-70% of these savings in months 1-3 as you build, test, and refine workflows. Budget 2-4 hours/month for workflow maintenance. The cost savings vs alternatives (Zapier, Make) are real and substantial — but the time-value numbers assume perfect automation, which takes time to achieve.

---

## Implementation Roadmap

### Phase 1: Quick Wins (Month 1)

Start with easiest, highest-impact workflows:

1. **Appointment Reminders** (Beginner, 45 min)
2. **Social Media Scheduling** (Beginner, 60 min)
3. **Lead Capture** (Beginner, 45 min)

**Time investment**: 2.5 hours
**Monthly savings**: 40 hours ($2,000 value)

---

### Phase 2: Process Automation (Month 2)

Add intermediate workflows:

4. **Invoice Processing** (Intermediate, 90 min)
5. **Expense Reports** (Intermediate, 90 min)
6. **Competitive Monitoring** (Intermediate, 75 min)

**Time investment**: 4.25 hours
**Monthly savings**: +34 hours ($1,725 value)

---

### Phase 3: Advanced Integration (Month 3)

Implement complex workflows:

7. **Customer Support Routing** (Intermediate, 120 min)
8. **HR Onboarding** (Advanced, 150 min)
9. **E-commerce Sync** (Advanced, 180 min)
10. **Report Generation** (Advanced, 120 min)

**Time investment**: 9.5 hours
**Monthly savings**: +91 hours ($4,545 value)

---

### Total 3-Month Implementation

**Time invested**: 16.25 hours (setup only — budget additional 2-4 hours/month for maintenance)
**Monthly value after 3 months**: Up to $8,270 (at full maturity with all 10 workflows running)
**Realistic monthly value**: $4,000-6,000 (accounting for maintenance, imperfect automation, and workflows that need iteration)

**The bottom line**: 16 hours of setup work can save you 40-100+ hours per month once workflows mature. Even conservative estimates show this is one of the highest-leverage investments a small business can make.

---

## Industry-Specific Recommendations

### F&B / Restaurants
- Appointment reminders (reservations)
- Social media scheduling
- Customer support routing
- Expense reports

### Retail / E-Commerce
- E-commerce order sync
- Lead capture
- Invoice processing
- Report generation

### Professional Services (Law, Consulting)
- Lead capture & CRM
- Appointment reminders
- Invoice processing
- Report generation

### Healthcare / Clinics
- Appointment reminders (critical!)
- Customer support routing
- Expense reports
- Report generation

### Real Estate
- Lead capture & CRM
- Appointment reminders (property viewings)
- Social media scheduling
- Competitive monitoring

---

**Ready to implement? Start with [Prerequisites](guides/01-prerequisites.md) →**
