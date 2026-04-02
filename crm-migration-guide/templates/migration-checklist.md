# CRM Migration Checklist

**Use this checklist to ensure a smooth, complete migration from HubSpot/Salesforce to your new CRM.**

Print this out or keep it open as you migrate. Check off each item as you complete it.

---

## Phase 1: Pre-Migration (Week 1)

### Research & Decision

- [ ] Read [COMPARISON.md](../COMPARISON.md) - understand CRM options
- [ ] Read [PRICING.md](../PRICING.md) - verify costs fit budget
- [ ] Read [choosing-crm.md](../guides/01-choosing-crm.md) - use decision framework
- [ ] Identify top 2 CRM choices based on your needs
- [ ] Sign up for free trials of top 2 CRMs
- [ ] Test each CRM with 50-100 sample contacts
- [ ] Get feedback from 2-3 team members who will use CRM daily
- [ ] Make final decision on which CRM to use
- [ ] Review [SECURITY.md](../SECURITY.md) - understand data protection requirements

### Current CRM Audit

- [ ] List all data currently in CRM (contacts, companies, deals, etc.)
- [ ] Identify custom fields you've created
- [ ] Document active workflows and automations (top 5 most critical)
- [ ] List all integrations currently in use (email, calendar, other tools)
- [ ] Note team members who actively use CRM (for training later)
- [ ] Count total records:
  - Contacts: _______
  - Companies: _______
  - Deals: _______
  - Activities: _______

### Backup Current CRM

- [ ] Create full backup of current CRM data
- [ ] Export backup to CSV files
- [ ] Save backup to encrypted folder or Google Drive
- [ ] Verify backup files are complete and readable
- [ ] Store backup safely (you'll keep this for 90 days)

**DON'T PROCEED UNTIL BACKUP IS COMPLETE!**

---

## Phase 2: Export & Preparation (Week 2)

### Export from Current CRM

**If migrating from HubSpot:**

- [ ] Export Contacts (follow [02-hubspot-export.md](../guides/02-hubspot-export.md))
- [ ] Export Companies
- [ ] Export Deals
- [ ] Export Activities (tasks, notes, emails)
- [ ] Export custom properties
- [ ] Verify all exports downloaded successfully
- [ ] Check CSV files open correctly in Excel/Google Sheets

**If migrating from Salesforce:**

- [ ] Export Accounts (follow [03-salesforce-export.md](../guides/03-salesforce-export.md))
- [ ] Export Contacts
- [ ] Export Opportunities
- [ ] Export Tasks and Events
- [ ] Export custom fields
- [ ] Extract CSV files from ZIP download
- [ ] Verify all exports are readable

### Clean & Prepare Data

- [ ] Install Python 3 (if not already installed)
- [ ] Install script dependencies: `pip3 install pandas email-validator`
- [ ] Run data cleanup script for each export file:
  ```bash
  python3 scripts/data-cleanup.py contacts_export.csv contacts_clean.csv
  python3 scripts/data-cleanup.py companies_export.csv companies_clean.csv
  python3 scripts/data-cleanup.py deals_export.csv deals_clean.csv
  ```
- [ ] Review cleanup reports (duplicates removed, invalid emails fixed)
- [ ] Manually review flagged records (if any)

### Map Fields

- [ ] List custom fields from old CRM
- [ ] Create matching custom fields in new CRM (do this BEFORE importing)
- [ ] Run field mapper script:
  ```bash
  python3 scripts/field-mapper.py --source hubspot --target zoho
  ```
- [ ] Review mapping report
- [ ] Note any fields that don't have equivalent in new CRM
- [ ] Decide: Create new custom fields OR skip those fields

**Field Mapping Checklist:**

- [ ] First Name → First Name ✅
- [ ] Last Name → Last Name ✅
- [ ] Email → Email ✅
- [ ] Phone → Phone ✅
- [ ] Company → Company/Account ✅
- [ ] Deal Stage → Pipeline Stage ✅
- [ ] Custom Field 1: _____________ → _____________
- [ ] Custom Field 2: _____________ → _____________
- [ ] Custom Field 3: _____________ → _____________

---

## Phase 3: Import to New CRM (Week 3)

### Prepare New CRM

- [ ] Finish new CRM free trial signup (if not already done)
- [ ] Set up admin account with strong password
- [ ] Enable two-factor authentication (CRITICAL for security)
- [ ] Create custom fields identified in field mapping phase
- [ ] Set up deal pipeline stages (match to old CRM stages)
- [ ] Configure basic settings (timezone, currency, date format)

### Import Data

**Choose your CRM and follow the guide:**

- [ ] **Zoho CRM**: Follow [04-zoho-import.md](../guides/04-zoho-import.md)
- [ ] **Freshsales**: Follow [05-freshsales-import.md](../guides/05-freshsales-import.md) (one-click!)
- [ ] **Pipedrive**: Follow [06-pipedrive-import.md](../guides/06-pipedrive-import.md)

**Import Order (do in this sequence):**

1. [ ] Import Companies/Accounts first
2. [ ] Import Contacts second (link to companies)
3. [ ] Import Deals third (link to contacts/companies)
4. [ ] Import Activities last (link to deals/contacts)

**After Each Import:**

- [ ] Verify record count matches export (use CRM's UI or reports)
- [ ] Spot-check 10 random records for accuracy
- [ ] Verify relationships preserved (contacts linked to companies, deals linked to contacts)

### Validation

- [ ] Run migration validator script:
  ```bash
  bash scripts/migration-validator.sh
  ```
- [ ] Review validation report
- [ ] Fix any errors found (re-import missing/incorrect data)
- [ ] Verify critical data imported correctly:
  - [ ] Top 10 customers are in new CRM
  - [ ] Open deals are in correct pipeline stages
  - [ ] Contact information is accurate (email, phone)
  - [ ] Custom fields populated correctly

---

## Phase 4: Configuration & Testing (Week 4)

### Recreate Workflows

**List your top 5 workflows from old CRM:**

1. Workflow 1: ______________________________
2. Workflow 2: ______________________________
3. Workflow 3: ______________________________
4. Workflow 4: ______________________________
5. Workflow 5: ______________________________

**Recreate in new CRM:**

- [ ] Workflow 1: Created and tested ✅
- [ ] Workflow 2: Created and tested ✅
- [ ] Workflow 3: Created and tested ✅
- [ ] Workflow 4: Created and tested ✅
- [ ] Workflow 5: Created and tested ✅

**Common workflows to recreate:**

- [ ] Send email when deal moves to specific stage
- [ ] Create task when contact is created
- [ ] Update contact owner based on criteria
- [ ] Send notification to sales manager for large deals
- [ ] Log activity when email is opened/clicked

### Set Up Integrations

- [ ] Email integration (Gmail or Outlook)
  - [ ] Admin setup complete
  - [ ] Test: Send email from CRM
  - [ ] Test: Email sync working (emails logged in CRM)
- [ ] Calendar integration
  - [ ] Sync calendar events to CRM
  - [ ] Test: Create meeting from CRM
- [ ] WhatsApp integration (if needed - Zoho CRM only native)
  - [ ] Connect WhatsApp Business API
  - [ ] Test: Send WhatsApp message from CRM
- [ ] Other integrations (list below):
  - [ ] Integration 1: _________________
  - [ ] Integration 2: _________________
  - [ ] Integration 3: _________________

### Team Training

- [ ] Admin watches CRM training videos (2-3 hours)
  - Zoho: https://learn.zoho.com/zoho-crm
  - Freshsales: https://www.freshworks.com/academy/
  - Pipedrive: https://www.pipedrive.com/academy
- [ ] Admin creates internal cheat sheet (1-page quick reference)
- [ ] Schedule team training session (1 hour)
- [ ] Conduct training session (walk through):
  - [ ] Adding contacts and companies
  - [ ] Creating and updating deals
  - [ ] Logging activities (calls, emails, meetings)
  - [ ] Running reports
  - [ ] Using mobile app
- [ ] Share training video links with team for self-paced learning
- [ ] Assign each team member a "practice task" to complete in new CRM

---

## Phase 5: Parallel Run (Days 1-30)

### Week 1: Both CRMs Running

- [ ] Use both old and new CRM simultaneously
- [ ] Enter new data in BOTH CRMs (temporary duplication)
- [ ] Compare data at end of week (ensure consistency)
- [ ] Note any issues or missing features in new CRM
- [ ] Team provides feedback on new CRM usability

**Daily Check-ins:**

- Day 1: [ ] Team using new CRM? Any blockers?
- Day 2: [ ] Any data sync issues?
- Day 3: [ ] Workflows working correctly?
- Day 4: [ ] Integrations stable?
- Day 5: [ ] Ready to continue parallel run?

### Week 2-3: Confidence Building

- [ ] Team is comfortable with new CRM interface
- [ ] Critical workflows are running smoothly
- [ ] No major data issues discovered
- [ ] Reports are being generated successfully
- [ ] Mobile app is being used (if applicable)

**Weekly Team Check:**

- [ ] Week 2: Any features missing in new CRM that are blockers?
- [ ] Week 3: Team ready to switch to new CRM 100%?

### Week 4: Decision Point

**Review Checklist:**

- [ ] All data verified in new CRM
- [ ] No missing or incorrect data
- [ ] Team is comfortable and productive in new CRM
- [ ] Workflows and automation are working
- [ ] Integrations are stable
- [ ] Mobile app works well (if team uses it)
- [ ] Reports provide the insights we need

**Decision:**

- [ ] ✅ **GO**: New CRM is working perfectly, proceed to cutover
- [ ] ⚠️ **WAIT**: Minor issues to fix, extend parallel run by 1-2 weeks
- [ ] ❌ **ROLLBACK**: Major issues, stay with old CRM (re-evaluate CRM choice)

---

## Phase 6: Cutover & Cleanup (Week 5)

### Final Cutover

- [ ] Announce to team: "We're switching to new CRM effective [date]"
- [ ] Stop using old CRM for new data entry (read-only mode)
- [ ] All new contacts, deals, activities go in new CRM only
- [ ] Update email signatures with new CRM links (if shared)
- [ ] Update any public forms to connect to new CRM

### Cancel Old CRM

**WAIT! Before canceling, verify:**

- [ ] 30-day parallel run completed successfully
- [ ] Final backup exported from old CRM
- [ ] Backup saved to encrypted folder/Google Drive
- [ ] All critical data verified in new CRM
- [ ] Team has no outstanding questions or concerns

**Now you can cancel:**

- [ ] Cancel old CRM subscription
- [ ] Save confirmation email (proof of cancellation)
- [ ] Note cancellation date: _______________
- [ ] Mark calendar for 90 days from now (when you can delete backup)

### Security Cleanup

- [ ] Delete all exported CSV files from local computer
- [ ] Delete CSV files from cloud storage (if used)
- [ ] Empty Trash/Recycle Bin
- [ ] Revoke any API tokens created for migration
- [ ] Review and revoke unnecessary user access to new CRM

### Post-Migration

- [ ] Run final validation report
  ```bash
  bash scripts/migration-validator.sh
  ```
- [ ] Archive validation report for records
- [ ] Send "migration complete" email to team
- [ ] Schedule 30-day check-in meeting to discuss any issues
- [ ] Update CRM documentation with new processes
- [ ] Add new CRM costs to budget tracking

---

## Post-Migration Follow-Up

### 30 Days After Cutover

- [ ] Team survey: How is the new CRM working?
- [ ] Any missing features causing problems?
- [ ] Any additional training needed?
- [ ] Review monthly cost savings vs old CRM
- [ ] Optimize workflows based on usage patterns

**Team Satisfaction Survey:**

Rate 1-5 (5 = excellent):

- Ease of use: ___
- Speed/performance: ___
- Mobile app quality: ___
- Feature completeness: ___
- Would you recommend new CRM? YES / NO

### 90 Days After Cutover

- [ ] Review quarterly CRM usage reports
- [ ] Archive or delete old CRM backup (no longer needed)
- [ ] Celebrate cost savings! 🎉
- [ ] Calculate actual savings vs projected:
  - Old CRM cost: $______/month
  - New CRM cost: $______/month
  - Monthly savings: $______
  - 3-month savings: $______

**Total money saved in 90 days: $__________**

---

## Troubleshooting Checklist

**If you encounter issues during migration:**

### Data Import Failed

- [ ] Check CSV file format (UTF-8 encoding, comma-delimited)
- [ ] Verify required fields are present (email, last name, etc.)
- [ ] Reduce batch size (try 1,000 records instead of 10,000)
- [ ] Contact CRM support (live chat/email)

### Missing Data After Import

- [ ] Re-export from old CRM (might have been filtered export)
- [ ] Check import success report in new CRM
- [ ] Look for records in "Unassigned" or "Imported" views
- [ ] Run migration validator script to identify gaps

### Relationships Broken (Deals not linked to contacts)

- [ ] Re-import with contact IDs mapped correctly
- [ ] Use CRM's "associate records" feature manually
- [ ] Check field mapping settings

### Team Resisting Change

- [ ] Schedule 1-on-1 training sessions
- [ ] Create video tutorials for common tasks
- [ ] Assign "CRM champions" to help peers
- [ ] Address specific pain points (what do they miss from old CRM?)

### Performance Issues (CRM slow)

- [ ] Check internet connection
- [ ] Clear browser cache
- [ ] Try different browser
- [ ] Contact CRM support (might be server issue)

---

## Resources

### Official Support

- **Zoho CRM**: https://help.zoho.com/portal/en/kb/crm
- **Freshsales**: https://support.freshsales.io/
- **Pipedrive**: https://support.pipedrive.com/
- **Attio**: https://help.attio.com/

### Community Forums

- **Zoho**: https://help.zoho.com/portal/en/community/zoho-crm
- **Freshworks**: https://community.freshworks.com/
- **Pipedrive**: https://community.pipedrive.com/

### This Guide

- [COMPARISON.md](../COMPARISON.md) - CRM feature comparison
- [PRICING.md](../PRICING.md) - Detailed pricing info
- [SECURITY.md](../SECURITY.md) - Data protection best practices
- [FAQ.md](../FAQ.md) - Common questions answered

---

## Success Criteria

**Your migration is successful when:**

- ✅ All critical data migrated accurately
- ✅ Team is productive in new CRM
- ✅ Workflows and automation working
- ✅ Integrations stable
- ✅ Cost savings realized ($200-500+/month)
- ✅ Team satisfaction is high
- ✅ No major functionality gaps

**If you hit 5+ of these, you've succeeded!** 🎉

---

**Print this checklist or save it as a working document. Check off items as you complete them.**

**Estimated total time**: 6-10 hours of hands-on work spread over 4-5 weeks.

**Estimated savings**: $2,400-$6,000 per year.

**ROI**: 200-500% in first year.

**Last Updated**: February 6, 2026
