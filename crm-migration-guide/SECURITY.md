# Security & Data Protection During CRM Migration

**For SEA Businesses**: Guidance on PDPA compliance, data handling, and secure migration practices for Malaysia, Singapore, Indonesia, and Thailand.

---

## Overview

When migrating CRM data, you're handling sensitive customer information. This guide covers:

1. **PDPA compliance** (Singapore, Malaysia, Thailand)
2. **Data protection** during migration
3. **Backup and rollback** procedures
4. **API token security**
5. **Post-migration cleanup**

---

## PDPA Compliance

### Singapore Personal Data Protection Act (PDPA)

**What it covers**: Personal data of Singapore residents (names, emails, phone numbers, addresses)

**Key requirements for CRM migration**:

1. **Data minimization**: Only export and migrate data you actually need
   - ✅ Export active customers from last 2 years
   - ❌ Don't export inactive records from 5+ years ago

2. **Consent**: Ensure you have consent to store customer data in new CRM
   - Most CRMs allow you to note consent status (custom field)
   - Migrate consent records along with customer data

3. **Data accuracy**: Clean data before importing to new CRM
   - Use our `data-cleanup.py` script to remove duplicates
   - Verify email addresses and phone numbers are current

4. **Security**: Protect data during migration
   - Don't email CSV files with customer data
   - Use encrypted file transfer (Google Drive with encryption, Dropbox, or direct upload to CRM)
   - Delete exported files after successful migration

**Good news**: All recommended CRMs (Zoho, Freshsales, Pipedrive, Attio) have Singapore data centers and are PDPA compliant.

---

### Malaysia Personal Data Protection Act (PDPA)

**What it covers**: Personal data of Malaysian residents

**Key requirements** (similar to Singapore):
- Data minimization
- User consent
- Security during processing
- Right to data access and deletion

**CRM considerations**:
- Zoho CRM has Malaysia data center option
- Freshsales (Freshworks) has APAC data centers
- Pipedrive and Attio use EU/US data centers (still compliant, but data stored outside Malaysia)

**Best practice**: Use Zoho CRM if you need data to physically reside in Malaysia.

---

### Thailand Personal Data Protection Act (PDPA)

**What it covers**: Personal data of Thai residents (similar to EU GDPR)

**Key requirements**:
- Explicit consent for data processing
- Right to data portability (easy export/import)
- Data breach notification (within 72 hours)

**CRM migration specific**:
- Ensure new CRM supports data export in standard formats (CSV, JSON)
- Verify CRM has data breach notification procedures
- All recommended CRMs support Thai PDPA requirements

---

### Indonesia Personal Data Protection (PDP Law)

**What it covers**: Personal data of Indonesian residents (law passed 2022, enforcement ongoing)

**Key requirements**:
- Consent-based data collection
- Data minimization
- Security safeguards

**CRM considerations**:
- Data may be stored outside Indonesia (most CRMs use Singapore/EU/US servers)
- WhatsApp integration critical for Indonesia (Zoho CRM recommended)

---

## Data Categories and Sensitivity

### Low Sensitivity Data (Generally Safe to Migrate)

- ✅ Company names
- ✅ Industry information
- ✅ Business email addresses
- ✅ Office phone numbers
- ✅ Deal stages and pipeline data

**Export/import freely**, following standard backup practices.

---

### Medium Sensitivity Data (Requires Care)

- ⚠️ Personal email addresses
- ⚠️ Mobile phone numbers
- ⚠️ Job titles
- ⚠️ LinkedIn profiles
- ⚠️ Communication history

**Best practices**:
- Encrypt CSV files if transferring via email/file sharing
- Use direct CRM-to-CRM migration when possible (Freshsales one-click)
- Verify consent exists before migrating

---

### High Sensitivity Data (Maximum Protection)

- 🔴 Payment information (credit cards, bank details)
- 🔴 Personal identity numbers (NRIC, passport numbers)
- 🔴 Health information
- 🔴 Financial records

**Best practices**:
- **DO NOT export/import payment information** - use payment processor (Stripe, PayPal) integrations instead
- **DO NOT store personal identity numbers** in CRM unless legally required
- If you must migrate sensitive data, use encrypted file transfer and delete files immediately after import

---

## Secure Migration Workflow

### Step 1: Backup Current CRM

**Before exporting anything**, create a full backup of your current CRM:

**HubSpot**:
1. Go to Settings → Data Management → Export
2. Export full database (contacts, companies, deals)
3. Download and save to encrypted external drive or Google Drive (encrypted folder)

**Salesforce**:
1. Setup → Data → Data Export
2. Schedule weekly export or export now
3. Download and save securely

**Backup retention**: Keep backup for 90 days after successful migration.

---

### Step 2: Export with Minimal Data

**Only export what you need**:

```python
# Example: Export only active contacts (updated in last 2 years)
# Use filters in HubSpot/Salesforce UI:

Last Activity Date > 2 years ago
  └─ Export these contacts

Last Activity Date < 2 years ago
  └─ Skip (inactive, don't migrate)
```

**Why**: Reduces data security risk and makes migration faster.

---

### Step 3: Clean Data Locally

Use our `data-cleanup.py` script to:
- Remove duplicates
- Validate email addresses
- Standardize phone numbers
- Remove sensitive fields (if any were accidentally exported)

```bash
python3 scripts/data-cleanup.py \
  --input hubspot_export.csv \
  --output clean_export.csv \
  --remove-columns "credit_card,ssn,nric"  # Remove sensitive fields
```

**Important**: Script runs locally on your machine - data never leaves your computer.

---

### Step 4: Encrypt Files (If Transferring)

If you need to transfer CSV files via email or cloud storage:

**macOS**:
```bash
# Encrypt file with password
zip -e secure_export.zip clean_export.csv
# Enter password when prompted
```

**Windows**:
- Use 7-Zip with AES-256 encryption
- Right-click file → 7-Zip → Add to archive → Set password

**Google Drive** (recommended):
1. Upload CSV to Google Drive
2. Share only with specific email addresses
3. Set expiration date (e.g., 7 days)
4. Require sign-in to access

---

### Step 5: Import via Secure Connection

All recommended CRMs use HTTPS for secure import:
- ✅ Zoho CRM: https://crm.zoho.com (SSL/TLS encrypted)
- ✅ Freshsales: https://app.freshsales.io (SSL/TLS encrypted)
- ✅ Pipedrive: https://app.pipedrive.com (SSL/TLS encrypted)

**Never import via**:
- ❌ HTTP (unencrypted) connections
- ❌ Public WiFi without VPN
- ❌ Shared computers

---

### Step 6: Delete Export Files

**After successful import**:
1. Verify data imported correctly (run validation script)
2. Delete CSV files from local computer
3. Delete from cloud storage (Google Drive, Dropbox)
4. Empty Trash/Recycle Bin

**Secure deletion** (paranoid mode):
```bash
# macOS - securely delete file
srm -v exported_contacts.csv

# Windows - use Eraser or similar tool
```

---

## API Token Security

When using CRM APIs or migration tools, you'll generate API tokens/keys.

### Best Practices

1. **Generate tokens with minimal permissions**:
   - ✅ Read + Write for migration (temporary)
   - ❌ Don't use "Full Access" tokens

2. **Set expiration**:
   - Generate token, use for migration, revoke immediately after

3. **Never commit tokens to Git**:
   - Store in `.env` file (add to `.gitignore`)
   - Use environment variables

4. **Rotate tokens regularly**:
   - After migration completes, delete/revoke token
   - Generate new token for ongoing integrations

---

### Token Storage

**Good**:
```bash
# .env file (not committed to Git)
ZOHO_API_TOKEN=your-token-here
FRESHSALES_API_KEY=your-key-here
```

**Bad**:
```python
# NEVER hardcode tokens in scripts
api_token = "1234567890abcdef"  # DON'T DO THIS
```

---

## CRM Security Features Comparison

### Zoho CRM

| Feature | Availability | Notes |
|---------|--------------|-------|
| **Encryption at rest** | ✅ Yes | AES-256 |
| **Encryption in transit** | ✅ Yes | TLS 1.2+ |
| **Two-factor authentication** | ✅ Yes | SMS, authenticator apps |
| **IP whitelisting** | ✅ Enterprise+ | Restrict access by IP |
| **Audit logs** | ✅ Professional+ | Track all data changes |
| **Data center choice** | ✅ Yes | Singapore, Malaysia, EU, US, Australia |
| **PDPA/GDPR compliance** | ✅ Yes | Certified |
| **ISO 27001** | ✅ Yes | Information security certified |

**Best for**: Businesses needing SEA data residency and strong security.

---

### Freshsales

| Feature | Availability | Notes |
|---------|--------------|-------|
| **Encryption at rest** | ✅ Yes | AES-256 |
| **Encryption in transit** | ✅ Yes | TLS 1.2+ |
| **Two-factor authentication** | ✅ Yes | Authenticator apps |
| **IP whitelisting** | ✅ Enterprise | Restrict access |
| **Audit logs** | ✅ Enterprise | Track changes |
| **Data center choice** | ⚠️ Limited | APAC, EU, US (no specific country choice) |
| **PDPA/GDPR compliance** | ✅ Yes | Certified |
| **ISO 27001** | ✅ Yes | Certified |

**Best for**: Businesses prioritizing ease of use with good security.

---

### Pipedrive

| Feature | Availability | Notes |
|---------|--------------|-------|
| **Encryption at rest** | ✅ Yes | AES-256 |
| **Encryption in transit** | ✅ Yes | TLS 1.2+ |
| **Two-factor authentication** | ✅ Yes | Authenticator apps |
| **IP whitelisting** | ✅ Enterprise | Restrict access |
| **Audit logs** | ✅ Professional+ | Track changes |
| **Data center choice** | ❌ No | EU/US only |
| **PDPA/GDPR compliance** | ✅ Yes | GDPR certified |
| **ISO 27001** | ✅ Yes | Certified |

**Note**: Pipedrive stores data in EU (Frankfurt) or US. No SEA data center option.

---

### Attio

| Feature | Availability | Notes |
|---------|--------------|-------|
| **Encryption at rest** | ✅ Yes | AES-256 |
| **Encryption in transit** | ✅ Yes | TLS 1.3 |
| **Two-factor authentication** | ✅ Yes | Authenticator apps |
| **IP whitelisting** | ✅ Enterprise | Restrict access |
| **Audit logs** | ✅ Pro+ | Track changes |
| **Data center choice** | ❌ No | US/EU only |
| **PDPA/GDPR compliance** | ✅ Yes | GDPR certified |
| **ISO 27001** | ⚠️ In progress | SOC 2 Type II certified |

**Note**: Newer platform, security features actively developing.

---

## Rollback Procedures

### What if migration fails?

**Scenario 1: Data doesn't import correctly**

**Solution**:
1. Don't panic - your old CRM data is still intact
2. Delete imported records in new CRM (or reset trial account)
3. Review error logs from import
4. Fix data issues in CSV file
5. Re-import

**Time to fix**: 1-2 hours

---

**Scenario 2: Critical data is missing**

**Solution**:
1. Check export completeness (did all records export?)
2. Use backup from Step 1 to identify missing records
3. Export missing records separately
4. Import to new CRM

**Prevention**: Run record count verification before and after migration:
```bash
bash scripts/migration-validator.sh
```

---

**Scenario 3: Team hates new CRM**

**Solution**:
1. Continue using old CRM (you haven't canceled it yet!)
2. Re-evaluate CRM choice
3. Test another CRM option from free trials
4. Migrate to better-fit CRM

**Why 30-day parallel run matters**: Gives you safety net to rollback if needed.

---

## Post-Migration Cleanup

### Week 1 After Migration

- [x] Verify all data imported correctly
- [x] Test critical workflows (email sending, deal updates)
- [x] Ensure integrations work (Zapier, n8n, email sync)
- [x] Delete exported CSV files from computer
- [x] Revoke API tokens used for migration

---

### Week 4 After Migration

- [x] Full team is comfortable with new CRM
- [x] All workflows recreated and tested
- [x] Old CRM no longer needed
- [x] **Cancel old CRM subscription**
- [x] Export final backup from old CRM before canceling
- [x] Store backup securely for 90 days (compliance requirement)

---

### 90 Days After Migration

- [x] No issues reported with new CRM
- [x] Delete old CRM backup (no longer needed)
- [x] Migration complete! 🎉

---

## Security Checklist

Use this checklist during migration:

### Pre-Migration

- [ ] Backup current CRM data
- [ ] Review data to be migrated (remove unnecessary/sensitive fields)
- [ ] Enable two-factor authentication on new CRM
- [ ] Generate API tokens with minimal permissions
- [ ] Verify new CRM has adequate security features for your needs

### During Migration

- [ ] Export data to encrypted folder or secure cloud storage
- [ ] Clean data locally (don't upload to third-party cleaning services)
- [ ] Use HTTPS connections only
- [ ] Don't use public WiFi for migration
- [ ] Verify import success before deleting exports

### Post-Migration

- [ ] Delete exported CSV files
- [ ] Revoke migration API tokens
- [ ] Set up audit logging in new CRM
- [ ] Configure IP whitelisting (if needed)
- [ ] Train team on security best practices
- [ ] Schedule first security audit (30 days after migration)

---

## Common Security Mistakes

### Mistake 1: Emailing CSV files

**Problem**: Email is not encrypted, and CSV files can be intercepted.

**Solution**: Use Google Drive, Dropbox, or direct CRM upload. If you must email, use encrypted ZIP file.

---

### Mistake 2: Not deleting export files

**Problem**: CSV files with customer data sitting on laptop for months.

**Solution**: Delete immediately after successful import. Set calendar reminder if you forget.

---

### Mistake 3: Using admin API tokens

**Problem**: If token is leaked, attacker has full access to CRM.

**Solution**: Generate tokens with minimum required permissions. Revoke after migration.

---

### Mistake 4: Skipping 2FA

**Problem**: Password-only access is vulnerable to phishing.

**Solution**: Enable two-factor authentication on new CRM before importing data.

---

### Mistake 5: Not testing rollback

**Problem**: Assume migration works perfectly, cancel old CRM immediately.

**Solution**: Run old + new CRM in parallel for 30 days. Verify everything before canceling.

---

## Data Breach Response

**If you suspect data breach during migration**:

1. **Immediately stop migration**
2. **Revoke all API tokens**
3. **Change passwords** on both old and new CRM
4. **Review access logs** (who accessed what data, when)
5. **Notify affected customers** (PDPA requirement within 72 hours)
6. **Report to authorities** (PDPC in Singapore, JPDP in Malaysia)

**Prevention is better than response**: Follow security checklist above.

---

## Resources

### Official Security Documentation

- [Zoho Security](https://www.zoho.com/security.html)
- [Freshworks Security](https://www.freshworks.com/security/)
- [Pipedrive Security](https://www.pipedrive.com/en/features/security)
- [Attio Security](https://attio.com/security)

### Regulatory Bodies

- **Singapore**: [Personal Data Protection Commission (PDPC)](https://www.pdpc.gov.sg/)
- **Malaysia**: [Department of Personal Data Protection (JPDP)](https://www.pdp.gov.my/)
- **Thailand**: [Personal Data Protection Committee](https://www.mdes.go.th/digital-economy-society-ministry)
- **Indonesia**: [Ministry of Communication and IT](https://www.kominfo.go.id/)

### Security Tools

- [Have I Been Pwned](https://haveibeenpwned.com/) - Check if emails in your CRM have been in data breaches
- [Google Drive Encryption](https://workspace.google.com/security/) - Secure file sharing
- [1Password](https://1password.com/) or [Bitwarden](https://bitwarden.com/) - Password managers for team API tokens

---

## FAQs

### Q: Where is my CRM data physically stored?

**A**:
- **Zoho CRM**: Choose from Singapore, Malaysia, EU, US, Australia data centers
- **Freshsales**: APAC (Singapore region most likely), EU, or US
- **Pipedrive**: EU (Frankfurt, Germany) or US
- **Attio**: US (AWS) or EU

**Recommendation**: For SEA businesses, choose Zoho CRM with Singapore/Malaysia data center for lowest latency and local data residency.

---

### Q: Is my data encrypted?

**A**: Yes, all recommended CRMs use:
- **Encryption at rest**: AES-256 (industry standard)
- **Encryption in transit**: TLS 1.2+ (HTTPS)

Your data is encrypted both when stored in CRM databases and when transferred over internet.

---

### Q: Can CRM employees see my customer data?

**A**: Technically yes (for support purposes), but:
- All CRMs have strict access controls and audit logs
- Employees sign NDAs and confidentiality agreements
- Access is logged and monitored
- PDPA/GDPR compliance requires data protection

**If this concerns you**: Use self-hosted CRM like SuiteCRM (requires technical setup).

---

### Q: What happens to my data if CRM company is acquired?

**A**:
- PDPA/GDPR requires notification before data is transferred to new owner
- You have right to export data and move to different CRM
- All recommended CRMs allow easy data export (CSV, API)

**Example**: Salesforce acquired Slack, but Slack users were notified and had option to export data.

---

### Q: How long should I keep old CRM backup?

**A**:
- **Minimum**: 90 days (covers most compliance requirements)
- **Recommended**: 1 year (covers annual audit cycles)
- **Permanent**: If you have regulatory requirements (financial services, healthcare)

Store backups in encrypted external drive or secure cloud storage (Google Drive with encryption).

---

## Next Steps

1. **Review this guide** before starting migration
2. **Follow security checklist** during migration
3. **Enable two-factor authentication** on new CRM
4. **Run migration in secure environment** (trusted WiFi, private computer)
5. **Delete export files** immediately after successful import

**Security is not an afterthought** - integrate these practices into your migration workflow from Day 1.

---

**Last Updated**: February 6, 2026
**Version**: 1.0
