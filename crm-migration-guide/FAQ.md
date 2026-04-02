# CRM Migration FAQ

Answers to common questions about migrating from HubSpot or Salesforce to affordable alternatives for SEA businesses.

---

## General Questions

### Q: Why should I migrate from HubSpot or Salesforce?

**A**: Cost savings is the primary reason:
- HubSpot Professional: $900/month (10 users) → Freshsales Pro: $390/month = **$510/month savings**
- Salesforce Professional: $800/month (10 users) → Zoho CRM Pro: $230/month = **$570/month savings**

**Other reasons**:
- Better WhatsApp integration (Zoho CRM has native support)
- Simpler interface (lower training time)
- Better customer support responsiveness for SMBs
- Local payment methods (Zoho accepts GIRO, bank transfers in SEA)

**When NOT to migrate**:
- You heavily use HubSpot Marketing Hub with complex automation
- You have custom Salesforce Apex code or deep AppExchange dependencies
- You're an enterprise with 100+ users (economies of scale favor Salesforce)

---

### Q: How long does migration take?

**A**:
- **Freshsales one-click migration**: 1-2 hours (from HubSpot/Salesforce)
- **Manual CSV migration**: 2-4 hours (for 10-person team)
- **Large team (25+ users)**: 8-12 hours over 2-3 days

**Breakdown** (10-person team, manual migration):
- Export from current CRM: 30-60 min
- Clean data with scripts: 30 min
- Import to new CRM: 30-60 min
- Verify data: 30 min
- Team training: 1-2 hours

**Total**: 4-6 hours hands-on work, spread over 1-2 weeks with parallel run.

---

### Q: Will I lose data during migration?

**A**: No, if you follow our guides properly:

**How we prevent data loss**:
1. Export creates copy (original data stays in old CRM)
2. Import adds data to new CRM (doesn't delete from old)
3. Run old + new CRM in parallel for 30 days
4. Verify data with validation scripts before canceling old CRM

**Backup strategy**:
- Keep full backup of old CRM before exporting
- Don't cancel old CRM until new CRM verified working
- Keep old CRM backup for 90 days after migration

**Bottom line**: Migration is additive, not destructive. Your old CRM data remains untouched.

---

### Q: Can I migrate in stages?

**A**: Yes, recommended approach for larger teams:

**Week 1**: Import contacts and companies only
**Week 2**: Import deals and opportunities
**Week 3**: Import activities, notes, and attachments
**Week 4**: Recreate workflows and automations

**Why staged migration is better**:
- Lower risk (verify each stage before continuing)
- Team learns new CRM gradually
- Easier to troubleshoot issues

---

### Q: What if I choose the wrong CRM?

**A**: You can migrate again! CRMs support CSV export, so you can:

1. Try CRM A (use free trial)
2. If not satisfied, export data (CSV)
3. Try CRM B (another free trial)
4. Import your data to CRM B

**Free trials**:
- Zoho CRM: 15 days
- Freshsales: 21 days
- Pipedrive: 14 days
- Attio: Free tier indefinitely

**Recommendation**: Test top 2 choices with free trials before committing.

---

## HubSpot-Specific Questions

### Q: I use HubSpot Marketing Hub heavily. Can I still migrate?

**A**: Probably not worth it. HubSpot's strength is marketing automation integration.

**If you need marketing + CRM**:
- Option A: Keep HubSpot (it's worth the cost for you)
- Option B: Separate CRM + marketing tool (e.g., Zoho CRM + Mailchimp)
- Option C: Use Zoho ONE bundle (CRM + Campaigns + Social) for $37/user

**Decision rule**: If >50% of your HubSpot usage is marketing automation, stick with HubSpot.

---

### Q: How do I export from HubSpot?

**A**: Two methods:

**Method 1: HubSpot UI Export** (easiest)
1. Go to Contacts → All Contacts
2. Click "Export" → "Export all contacts"
3. Repeat for Companies and Deals
4. Download CSV files

**Method 2: Freshsales One-Click Migration** (recommended)
1. Sign up for Freshsales trial
2. Go to Settings → Data Migration
3. Connect your HubSpot account (OAuth)
4. Click "Migrate" (Freshsales handles everything)

**See full guide**: [02-hubspot-export.md](./guides/02-hubspot-export.md)

---

### Q: Will HubSpot email history migrate?

**A**: Partially:
- ✅ Email metadata (subject, date, sender/recipient)
- ⚠️ Email bodies may not export (depends on how emails were logged)
- ❌ Email templates stay in HubSpot

**Workaround**: Keep HubSpot in read-only mode for 90 days to reference email history.

---

### Q: What happens to HubSpot sequences and workflows?

**A**: They don't auto-migrate. You'll need to recreate them in new CRM.

**Good news**: Most CRMs have equivalent features:
- HubSpot Sequences → Freshsales Sales Sequences
- HubSpot Workflows → Zoho Workflow Rules
- HubSpot Tasks → Pipedrive Activities

**Time estimate**: 2-4 hours to recreate top 5 workflows.

---

## Salesforce-Specific Questions

### Q: How do I export from Salesforce?

**A**: Use Data Export feature:

1. Setup → Data → Data Export
2. Choose "Export Now" or schedule weekly export
3. Select objects (Accounts, Contacts, Opportunities, etc.)
4. Download ZIP file when ready (email notification)
5. Extract CSV files from ZIP

**See full guide**: [03-salesforce-export.md](./guides/03-salesforce-export.md)

---

### Q: Will my Salesforce custom objects migrate?

**A**: Standard objects yes, custom objects require mapping:

**Standard objects** (auto-migrate with Freshsales):
- ✅ Accounts → Companies
- ✅ Contacts → Contacts
- ✅ Opportunities → Deals
- ✅ Tasks → Activities

**Custom objects**: You'll need to:
1. Map to standard objects in new CRM (if possible)
2. Or create custom modules/fields in new CRM first
3. Then import data with field mapper

**Example**: Salesforce "Projects" custom object → Create "Projects" custom module in Zoho CRM

---

### Q: What about my Salesforce reports and dashboards?

**A**: They don't migrate. You'll recreate them in new CRM.

**Good news**: All recommended CRMs have custom reporting:
- Zoho CRM: Custom reports and dashboards (Professional+)
- Freshsales: Custom reports (Pro+)
- Pipedrive: Custom reports (Professional+)

**Time estimate**: 3-5 hours to recreate top 10 reports.

---

### Q: Will my AppExchange apps still work?

**A**: No, AppExchange is Salesforce-only.

**Alternatives**:
- Find equivalent integrations in new CRM's marketplace
- Use n8n or Zapier to rebuild custom integrations
- Check if app vendor supports other CRMs

**Example replacements**:
- Salesforce CPQ → Zoho CPQ / Pipedrive Products
- Salesforce Pardot (marketing) → Zoho Campaigns / Freshmarketer
- Salesforce Chatter → Slack (integrate with any CRM)

---

## Migration Technical Questions

### Q: Do I need technical skills to migrate?

**A**: Minimal technical skills needed:

**What you need to know**:
- ✅ How to export/import CSV files (like Excel)
- ✅ How to use Terminal/Command Prompt (for running scripts)
- ✅ Basic understanding of your CRM fields (contact name, email, etc.)

**What you DON'T need to know**:
- ❌ Programming (our scripts are pre-written, just run them)
- ❌ Database management
- ❌ API integration (except for advanced use cases)

**If you're not technical**: Hire a freelancer on Upwork ($50-200) to run migration using our guides.

---

### Q: What is a CSV file?

**A**: CSV (Comma-Separated Values) is a simple spreadsheet format that all CRMs support.

**Example CSV**:
```
First Name,Last Name,Email,Phone
John,Doe,john@example.com,+65 9123 4567
Jane,Smith,jane@example.com,+60 12 345 6789
```

**You can open CSV files with**:
- Excel (Microsoft Office)
- Google Sheets
- Numbers (macOS)
- Any text editor

**Why CSV?**: Universal format that works with all CRMs. Easy to edit and clean data.

---

### Q: How do I run the Python scripts?

**A**: Easy, even for non-programmers:

**One-time setup**:
```bash
# Install Python 3 (if not already installed)
# macOS: Already installed
# Windows: Download from python.org

# Install script dependencies
pip3 install pandas email-validator
```

**Run script**:
```bash
python3 scripts/data-cleanup.py input.csv output.csv
```

**That's it!** Script processes data and creates cleaned file.

**See**: Each script has detailed usage instructions in comments.

---

### Q: What if my import fails?

**A**: Common causes and fixes:

**Problem 1: "Invalid email format"**
- **Cause**: Email addresses contain spaces or missing @ symbol
- **Fix**: Use `data-cleanup.py` script to validate emails before importing

**Problem 2: "Missing required field"**
- **Cause**: CRM requires certain fields (e.g., Last Name) but your CSV doesn't have them
- **Fix**: Add missing columns to CSV or map to existing fields

**Problem 3: "Duplicate records detected"**
- **Cause**: Trying to import contacts that already exist in CRM
- **Fix**: Use CRM's "skip duplicates" option or merge duplicate records

**Problem 4: "File too large"**
- **Cause**: CSV file >100MB or >50,000 rows
- **Fix**: Split into smaller files (10,000 rows each) and import in batches

---

### Q: Can I keep my old CRM while testing the new one?

**A**: Yes! Absolutely recommended.

**Parallel run strategy**:
1. Keep old CRM active (don't cancel subscription yet)
2. Import data to new CRM
3. Use both CRMs for 30 days
4. Train team on new CRM during this period
5. After 30 days, choose: stay with new CRM or rollback to old
6. Only cancel old CRM after you're 100% confident

**Cost**: One extra month of old CRM subscription (worth it for safety net).

---

## Cost & Pricing Questions

### Q: Are there hidden costs I should know about?

**A**: Yes, a few to watch out for:

**Zoho CRM**:
- WhatsApp messages: $0.005-0.01 per message (only pay for what you send)
- Zoho Books (invoicing): $15/org/month (optional)
- Additional storage: $5 per 10GB (1GB/user included)

**Freshsales**:
- Freshcaller (phone): $15/user/month (optional)
- SMS credits: Pay-as-you-go (varies by country)
- Freshdesk (support): $15/user/month (optional)

**Pipedrive**:
- LeadBooster (chatbot): $39/company/month
- Campaigns (email marketing): $16/user/month
- Phone integration: Third-party (e.g., Aircall $30/user/month)

**See**: [PRICING.md](./PRICING.md) for detailed breakdown.

---

### Q: Can I negotiate CRM pricing?

**A**: Depends on vendor and team size:

**Small teams (<10 users)**:
- Zoho, Freshsales, Pipedrive: Listed prices are firm
- Ask for "startup discount" or "first-year discount" (worst case they say no)

**Medium teams (10-50 users)**:
- Zoho: May offer 10-15% discount for annual commitment
- Freshsales: May bundle Freshdesk/Freshcaller at discount
- Pipedrive: Occasionally offers promotions

**Large teams (50+ users)**:
- All vendors negotiate (expect 15-30% off for multi-year contracts)

**Nonprofits**:
- All offer 50-95% discounts (see [PRICING.md](./PRICING.md))

---

### Q: What's the ROI of migrating?

**A**: Pays for itself in 1-2 months:

**Example**: 10-user team migrating from HubSpot Pro to Freshsales Pro

**Costs**:
- Migration time: 6 hours × $50/hour = $300 (your time)
- Old CRM overlap: $900 × 1 month = $900 (parallel run)
- **Total migration cost**: $1,200

**Savings**:
- Monthly: $510 ($900 HubSpot → $390 Freshsales)
- **Payback period**: 2.4 months
- **Year 1 net savings**: $6,120 - $1,200 = $4,920
- **Year 2-3 savings**: $6,120/year (no migration costs)

**ROI**: 410% in Year 1, 510% in Year 2

---

### Q: Are free CRM tiers worth using?

**A**: Depends on team size and needs:

**Zoho CRM Free** (3 users max):
- ✅ Good for solo founders testing CRM concepts
- ❌ Too limited for growing teams (no integrations)

**Freshsales Free** (unlimited users):
- ✅ Good for early-stage startups (<1,000 contacts)
- ✅ Basic features work well
- ❌ No phone integration, limited workflows

**Attio Free** (unlimited users):
- ✅ Best free tier (flexible data model)
- ✅ Great for small teams (5-10 people)
- ❌ Limited integrations

**Recommendation**: Use free tiers for testing, but upgrade to paid plan ($14-39/user) for production use.

---

## Post-Migration Questions

### Q: How do I train my team on the new CRM?

**A**: Use free resources from CRM vendors:

**Zoho CRM**:
- [Zoho Learn](https://learn.zoho.com/zoho-crm) - Free video tutorials
- Duration: 2-3 hours for basic training
- Advanced: Zoho CRM certification (free)

**Freshsales**:
- [Freshworks Academy](https://www.freshworks.com/academy/) - Free courses
- Duration: 1-2 hours for basic training
- Interactive demos included

**Pipedrive**:
- [Pipedrive Academy](https://www.pipedrive.com/academy) - Free videos
- Duration: 1-2 hours for basic training
- Very beginner-friendly

**Training plan**:
1. Week 1: Admin watches full training course (2-3 hours)
2. Week 2: Admin trains team (1 hour live session)
3. Week 3: Team uses CRM with admin support
4. Week 4: Team is self-sufficient

**Total time per person**: 2-3 hours

---

### Q: When should I cancel my old CRM?

**A**: After 30-day parallel run is successful:

**Checklist before canceling**:
- [x] All data verified in new CRM (run validation script)
- [x] Team is comfortable with new CRM
- [x] Key workflows recreated and tested
- [x] Integrations working (email, calendar, etc.)
- [x] No critical features missing
- [x] Final backup exported from old CRM

**Timeline**:
- Day 0: Import to new CRM
- Day 1-30: Parallel run (use both CRMs)
- Day 30: Review checklist above
- Day 31: Cancel old CRM if all checks pass
- Day 31-120: Keep old CRM backup (don't delete)

**Don't rush**: Better to pay one extra month of old CRM than cancel too early and regret it.

---

### Q: What if I find missing data after canceling old CRM?

**A**: This is why you keep a backup!

**Recovery steps**:
1. Check your final backup from old CRM (exported before canceling)
2. Find missing records in backup CSV files
3. Import missing records to new CRM
4. Verify data is now complete

**Prevention**: Use our `migration-validator.sh` script BEFORE canceling old CRM. It checks:
- Record counts match (contacts, companies, deals)
- Relationships preserved (deals linked to contacts)
- No critical fields empty

---

### Q: Can I rollback to my old CRM after migrating?

**A**: Yes, if you haven't canceled it yet:

**Within 30-day parallel run**:
- Simply continue using old CRM
- Abandon new CRM (or downgrade to free tier)
- No data loss (old CRM never changed)

**After canceling old CRM**:
- Re-subscribe to old CRM (usually possible within 90 days)
- Import data from backup
- Most CRMs retain data for 30-90 days after cancellation

**Best practice**: Don't cancel old CRM until you're 100% confident in new CRM.

---

## Integration Questions

### Q: Will my email integration still work?

**A**: Yes, all recommended CRMs integrate with Gmail and Outlook:

**Gmail/Google Workspace**:
- ✅ Zoho CRM: Native integration (emails sync automatically)
- ✅ Freshsales: Native integration
- ✅ Pipedrive: Native integration
- ✅ Attio: Native integration

**Outlook/Office 365**:
- ✅ All CRMs support Outlook integration (sync emails, calendar, contacts)

**Setup time**: 5-10 minutes per user (follow CRM's setup wizard)

---

### Q: How do I integrate WhatsApp with my CRM?

**A**: Depends on CRM:

**Zoho CRM** (easiest):
1. Go to Settings → Channels → WhatsApp
2. Connect WhatsApp Business API (Meta approval required)
3. Start sending/receiving WhatsApp messages in CRM
4. Cost: $0.005-0.01 per message

**Other CRMs** (requires n8n or Zapier):
1. Set up n8n (workflow automation) - [See n8n guide](../n8n-sea-guide/)
2. Create workflow: WhatsApp → CRM (log messages as activities)
3. Create workflow: CRM → WhatsApp (send messages from CRM)
4. Cost: $0-6/month (n8n hosting) + WhatsApp message costs

**Bottom line**: If WhatsApp is critical, choose Zoho CRM (only native integration).

---

### Q: Can I connect my CRM to Shopify/e-commerce?

**A**: Yes, all CRMs integrate with e-commerce platforms:

**Zoho CRM**:
- Native Shopify, WooCommerce, Magento integration
- Syncs orders, customers, products automatically

**Freshsales**:
- Shopify via Freshworks Marketplace
- WooCommerce via third-party apps

**Pipedrive**:
- Shopify via Pipedrive Marketplace
- WooCommerce via third-party apps

**Attio**:
- Custom integration via API or n8n

**Setup time**: 15-30 minutes (follow integration guide from CRM)

---

## Troubleshooting

### Q: My import is stuck at "Processing..."

**A**: This is normal for large datasets. Patience!

**Import times**:
- <1,000 records: 5-10 minutes
- 1,000-10,000 records: 15-30 minutes
- 10,000-50,000 records: 1-2 hours
- 50,000+ records: 3-6 hours

**If stuck >6 hours**:
- Refresh page (import continues in background)
- Check CRM status page (system issues?)
- Contact CRM support (live chat)

**Prevention**: Import in batches of 10,000 records instead of all at once.

---

### Q: Some of my custom fields didn't import

**A**: You need to create custom fields BEFORE importing:

**Fix**:
1. Identify missing custom fields (check old CRM)
2. Create matching custom fields in new CRM (Settings → Customize → Fields)
3. Re-import data (CRM will map to new custom fields)

**Example**:
- Old CRM: Custom field "WhatsApp Number"
- New CRM: Create custom field "WhatsApp Number" (type: Phone)
- Import CSV with "WhatsApp Number" column → auto-maps to custom field

**Prevention**: Use our `field-mapper.py` script BEFORE importing. It flags missing fields.

---

### Q: My deals aren't linked to contacts anymore

**A**: Relationship mappings failed during import.

**Fix**:
1. Re-export deals with contact IDs
2. Use CRM's "associate deals with contacts" import option
3. Or manually link critical deals (if only a few)

**Prevention**: Use Freshsales one-click migration (preserves relationships automatically).

---

### Q: I'm getting "Rate limit exceeded" errors

**A**: You're importing too fast. CRMs have API limits:

**Zoho CRM**: 5,000 records/hour (Standard), 10,000/hour (Professional)
**Freshsales**: 10,000 records/hour
**Pipedrive**: 100 requests/minute

**Fix**:
- Wait 1 hour, then continue importing
- Import in smaller batches (1,000 records at a time)
- Use scheduled imports (overnight)

**Prevention**: Don't try to import 50,000 records at once. Batch it.

---

## Still Have Questions?

### Need Help?

1. **Check guides**: See [guides folder](./guides/) for step-by-step instructions
2. **CRM support**: All recommended CRMs have free support (live chat, email)
3. **Community forums**: Zoho, Freshworks, Pipedrive have active communities
4. **Hire help**: Freelancers on Upwork can handle migration for $50-200

### Useful Links

- [Zoho CRM Community](https://help.zoho.com/portal/en/community/zoho-crm)
- [Freshworks Community](https://community.freshworks.com/)
- [Pipedrive Community](https://community.pipedrive.com/)
- [Attio Help Center](https://help.attio.com/)

---

**Document Version**: 1.0
**Last Updated**: February 6, 2026
**Maintained by**: MyEO AI
