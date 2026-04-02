# SaaS Audit FAQ

Common questions about SaaS audits, consolidation, negotiation, and governance.

---

## General Questions

### Q: How much can I realistically save?

**A**: Typical savings are 30-50% of current SaaS spend.

**Breakdown**:
- Immediate cancellations (unused tools): 5-10%
- Consolidations (overlapping tools): 15-25%
- Negotiations (better pricing): 10-20%

**Example**: Company spending $5,000/month → Save $1,500-2,500/month ($18,000-30,000/year)

---

### Q: How long does a full audit take?

**A**: 2-4 weeks for full audit, 8-16 hours of actual work.

**Timeline**:
- Week 1: Inventory (2-4 hours)
- Week 2: Usage analysis (2-3 hours)
- Week 3-4: Consolidation planning (2-4 hours)
- Ongoing: Negotiations (15-30 min per tool)

---

### Q: Do I need special tools or software?

**A**: No. A spreadsheet is sufficient.

**What you need**:
- Spreadsheet (our [saas-inventory.csv](./templates/saas-inventory.csv))
- Access to finance data (credit card statements)
- Access to IT admin panels (Google Workspace, Okta, etc.)

**Optional tools**:
- SaaS management platform (Torii, Zylo, Productiv) - $5-15/user/month
- Our Python script ([renewal-tracker.py](./scripts/renewal-tracker.py)) - Free

**Our recommendation**: Start with just a spreadsheet. Only buy SaaS management tool if you have 100+ tools.

---

### Q: Should I hire a consultant?

**A**: No, this guide is designed for DIY.

**When to hire consultant**:
- Company has 500+ employees
- SaaS spend >$100K/month
- Extremely complex tech stack (100+ tools)
- No internal resources available

**Typical consultant cost**: $10,000-50,000 for full audit

**DIY savings**: You save the consultant fee + learn the process

---

## Inventory Questions

### Q: How do I find shadow IT tools?

**A**: Survey department heads + check credit card statements.

**Sources**:
1. Send survey to all department heads (see [01-inventory.md](./guides/01-inventory.md#source-3-department-surveys-shadow-it-discovery))
2. Review personal credit card expenses (submitted for reimbursement)
3. Check SSO admin panels for unauthorized app connections
4. Review browser extensions on company devices
5. Ask IT to check network traffic for SaaS API calls

**Tip**: Get CEO/CFO to send the survey (higher response rate)

---

### Q: What if I don't have access to finance data?

**A**: Ask finance for "software vendor spend report".

**What to request**:
> "Can you pull a report of all recurring software/SaaS charges from [Start Date] to [End Date]? I need Vendor Name, Amount, Frequency, and Payment Method. We're doing a SaaS audit to reduce costs."

Finance teams usually love this request (shows you're being cost-conscious).

---

### Q: How do I handle tools paid for personally?

**A**: Add them to inventory, flag as "Personal subscription".

**Why track them**:
- Personal tools may need company approval
- If critical, company should pay (proper budgeting)
- Helps identify shadow IT patterns

**Action**: Decide if company should:
- Take over payment (make it official)
- Find alternative (if unauthorized)
- Leave as personal (if truly optional)

---

## Consolidation Questions

### Q: Should I use an all-in-one platform or pick best-in-class tools?

**A**: Depends on your priorities.

**All-in-One (Zoho ONE, Microsoft 365)**:
- ✅ Maximum consolidation (10-40 tools → 1 platform)
- ✅ Maximum savings (60-80% cost reduction)
- ✅ Deep integration (everything connected)
- ❌ Features may be "good" but not "best in class"
- ❌ High migration effort
- **Best for**: Companies wanting simplicity, 10-100 employees, willing to compromise on features

**Best-in-Class (Pick #1 tool per category)**:
- ✅ Best features in each category
- ✅ Easier team adoption (keep tools they love)
- ❌ Less consolidation (still have 10-20 tools)
- ❌ Lower savings (30-40% vs 60-80%)
- **Best for**: Companies wanting best tools, larger teams, feature-sensitive workflows

**Our recommendation**: Hybrid approach
- All-in-one for commodities (email, docs, storage)
- Best-in-class for differentiators (design, engineering, sales)

**See**: [CONSOLIDATION.md](./CONSOLIDATION.md) for detailed comparison

---

### Q: How do I handle team resistance to new tools?

**A**: Get executive buy-in, provide training, show benefits.

**Strategy**:
1. **Get CEO/CFO endorsement** - Send announcement from leadership
2. **Explain the why** - "We're paying for 3 tools that do the same thing"
3. **Show what's better** - Highlight new tool's advantages
4. **Provide training** - Live sessions + recordings + documentation
5. **Create templates** - Don't start from blank slate
6. **Offer support** - Slack/Teams channel for questions
7. **Pilot first** - Test with 5-10 users before company-wide rollout

**If resistance persists**: Evaluate if consolidation is worth it. Sometimes keeping team happy > cost savings.

**See**: [03-consolidation.md](./guides/03-consolidation.md#handling-resistance) for scripts

---

### Q: What if we lose critical data during migration?

**A**: Export backups before migrating, keep old tool active 30 days.

**Risk mitigation**:
1. Export full backup from old tool BEFORE starting
2. Test import with sample data first
3. Keep old tool active during pilot (run both in parallel)
4. Verify all critical data migrated successfully
5. Keep old tool active 30 days after migration (safety net)
6. Archive old tool data for 1-2 years (compliance)

**Reality**: Modern SaaS tools have excellent import/export. Data loss is rare if you follow this process.

---

## Negotiation Questions

### Q: Will vendors actually negotiate with me?

**A**: Yes. Most vendors expect negotiation and have 20-40% margin built into list price.

**Why vendors negotiate**:
- Retention is cheaper than acquisition (acquiring new customer costs 5-7x more)
- Predictable revenue beats higher price (multi-year commitments valued)
- End of quarter pressure (sales reps have quotas)

**Expected outcomes**:
- 15-30% discount on most renewals
- 30-50% for enterprise tools at quarter end
- 5-10% if you have little leverage

**See**: [NEGOTIATION.md](./NEGOTIATION.md) for tactics

---

### Q: What if the vendor says "this is our best price"?

**A**: It's almost never their best price. Counter-offer.

**Response script**:
> "I understand that's your standard pricing. However, we've received competitive quotes 30% lower. Can you check with your manager about matching those rates? We'd prefer to stay with [Tool] but need the economics to work."

**Then**: Wait for their response. They'll usually come back with a better offer.

**See**: [negotiation-emails.md](./templates/negotiation-emails.md) for full templates

---

### Q: How much leverage do I have as a small company?

**A**: More than you think.

**Leverage factors**:
- Renewal timing (60 days before renewal)
- Competitive alternatives (can credibly switch)
- Multi-year commitment (predictable revenue for vendor)
- End of quarter (vendor has targets to hit)
- Loyalty (2+ year customer)

**Even with 5 users**, you can get 10-20% discount by:
- Timing negotiation for vendor's quarter end
- Getting competitive quote
- Offering 2-year contract

**Bigger companies (50+ users)** should expect 25-40% discounts with proper negotiation.

---

### Q: Should I lie about having competitive quotes?

**A**: No. Vendors can tell when you're bluffing.

**Why not to bluff**:
- Vendors check if you actually contacted competitor
- Your credibility drops (hurts future negotiations)
- Better to have one real quote than fake multiple

**Better approach**: Actually GET competitive quotes
- Takes 30 minutes to request quotes from 2-3 vendors
- Gives you real leverage
- You might actually prefer the alternative

**See**: [ALTERNATIVES.md](./ALTERNATIVES.md) for competitor options

---

## Governance Questions

### Q: How do I prevent shadow IT?

**A**: Require approval for SaaS purchases, make approval fast.

**Policy**:
- All SaaS purchases >$50/month require approval
- Approval process takes <2 business days (fast enough that teams don't bypass)
- Block personal credit card expenses for SaaS (enforce through finance)

**Key insight**: If approval is too slow, teams will bypass it. Make it fast.

**See**: [05-governance.md](./guides/05-governance.md) for full framework

---

### Q: How often should I audit my SaaS tools?

**A**: Quarterly reviews (1 hour) + Annual audit (8 hours/year).

**Quarterly review** (1st week of Jan/Apr/Jul/Oct):
- Remove unused licenses
- Check for new duplicate tools
- Update renewal calendar
- Flag upcoming renewals for negotiation

**Annual audit** (same month every year):
- Rebuild full inventory
- Re-score all tools
- Identify new consolidation opportunities
- Negotiate renewals
- Update governance policies

**See**: [06-annual-review.md](./guides/06-annual-review.md) for checklist

---

### Q: What if employees keep buying unauthorized tools?

**A**: Enforce consequences + speed up approval process.

**Enforcement**:
- Deny expense reimbursement for unauthorized SaaS
- Send violations to employee's manager
- Track repeat offenders (escalate to HR if needed)

**Root cause fix**:
- Make approval process faster (2 business day SLA)
- Explain WHY governance matters (security, cost, data silos)
- Get CEO/CFO buy-in (send company-wide email)

**Reality**: Some shadow IT is inevitable. Target <10% unauthorized purchases.

---

## Technical Questions

### Q: How do I export data from old tools?

**A**: Most SaaS tools have export features or APIs.

**Common export methods**:
- Admin panel: "Export" or "Download data" button
- API: Use vendor's API to pull data programmatically
- Support: Ask vendor for full data export
- Third-party tools: Zapier, Make, n8n can extract data

**What to export**:
- Users/contacts
- Projects/tasks
- Documents/files
- Historical data (for compliance)

**Format**: Request CSV or JSON (easiest to import elsewhere)

**See**: Our [n8n SEA Guide](../n8n-sea-guide/) for building custom export scripts

---

### Q: How do I migrate data between tools?

**A**: Most modern SaaS tools have import features.

**Migration methods**:
1. **Native import** - New tool has "Import from [Old Tool]" button (easiest)
2. **CSV import** - Export from old tool → Import CSV to new tool (common)
3. **API migration** - Use API to pull from old tool, push to new tool (technical)
4. **Third-party migration** - Use Zapier/Make/n8n to transfer data (flexible)
5. **Vendor assistance** - Some vendors offer free migration help (ask)

**Example**: ClickUp has one-click import from Asana, Monday, Trello

**Tip**: Test with sample data before migrating everything

---

### Q: What about SSO integration?

**A**: Modern SaaS tools support SAML/OIDC SSO.

**SSO providers**:
- Okta (most popular, $2-8/user/month)
- Google Workspace (built-in for Google apps, free)
- Azure AD (built-in for Microsoft apps, free with Microsoft 365)
- OneLogin ($2-8/user/month)

**Why SSO matters**:
- Centralized user provisioning/deprovisioning
- Better security (MFA, password policies)
- Usage tracking (who logged in, when)
- Easier offboarding (remove SSO access → removes all app access)

**Recommendation**: If you have 25+ employees, invest in SSO ($50-200/month). Savings from easier license management pay for itself.

---

### Q: Can I automate renewal reminders?

**A**: Yes. Use our [renewal-tracker.py](./scripts/renewal-tracker.py) script.

**Setup**:
1. Fill out [renewal-calendar.csv](./templates/renewal-calendar.csv) with renewal dates
2. Configure email settings in script
3. Run monthly via cron job or GitHub Actions

**Result**: Automatic email 60 days before each renewal (optimal negotiation timing)

**Alternative**: Google Calendar reminders (manual but simpler)

---

## ROI Questions

### Q: Is this worth my time?

**A**: Yes. 10-20x ROI is typical.

**Time investment**: 8-16 hours for initial audit

**Typical savings**: $1,500-4,000/month ($18,000-48,000/year)

**ROI calculation**:
- 16 hours × $100/hour = $1,600 time cost
- $18,000/year savings ÷ $1,600 cost = **11x ROI**

**Payback period**: <1 quarter

**Ongoing**: 2-4 hours/quarter to maintain savings

---

### Q: What if I only find $500/month in savings?

**A**: $500/month = $6,000/year is still excellent ROI.

**Even small savings matter**:
- $6,000/year pays for 1-2 conferences
- $6,000/year is 50-100 hours of contractor work
- $6,000/year is new equipment/software budget

**Our experience**: Companies with $3,000+/month SaaS spend almost always find $1,000+/month savings (30%+).

If you're only finding $500/month, you either:
- Have very lean SaaS stack already (congrats!)
- Haven't looked closely enough (check shadow IT, unused licenses)
- Are on great pricing already (re-check alternatives)

---

### Q: How do I prove ROI to leadership?

**A**: Show before/after comparison in dollars.

**Simple ROI report**:
```
SaaS Audit ROI Report

Time invested: 12 hours

Savings identified:
- Immediate cancellations (unused tools): $400/month
- Consolidations (duplicates removed): $800/month
- Negotiations (better pricing): $600/month
- License removal (departed employees): $200/month

Total monthly savings: $2,000/month
Annual savings: $24,000/year

ROI: $24,000 / (12 hours × $100/hour) = 20x

Payback period: <1 month
```

**Present to CEO/CFO**: Most executives LOVE seeing 20x ROI projects.

---

## Related Resources

- **[README.md](./README.md)** - Overview and quick start
- **[AUDIT-PROCESS.md](./AUDIT-PROCESS.md)** - Complete 4-step methodology
- **[ALTERNATIVES.md](./ALTERNATIVES.md)** - 50+ tool alternatives
- **[NEGOTIATION.md](./NEGOTIATION.md)** - Vendor negotiation playbook
- **[CONSOLIDATION.md](./CONSOLIDATION.md)** - Consolidation strategies
- **[guides/](./guides/)** - Step-by-step guides for each phase

---

## Still have questions?

- Open an issue on GitHub
- Check our related guides:
  - [n8n SEA Guide](../n8n-sea-guide/) - Replace Zapier, save 90-98%
  - [CRM Migration Guide](../crm-migration-guide/) - Migrate from expensive CRMs
  - [OpenClaw SEA Guide](../openclaw-sea-guide/) - Self-hosted AI assistant

---

**Last Updated**: February 6, 2026
