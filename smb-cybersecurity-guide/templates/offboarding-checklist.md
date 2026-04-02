# Employee Offboarding Security Checklist

**Purpose**: Ensure company data and systems are protected when an employee leaves (resignation, termination, or end of contract).

**CRITICAL**: Complete this checklist on or before the employee's last day. Delayed offboarding creates security risks (former employees retaining access, data exfiltration).

---

## Employee Information

- **Employee name**: _______________________________
- **Position/Title**: _______________________________
- **Department**: _______________________________
- **Manager**: _______________________________
- **Last working day**: _______________________________
- **Separation type**: ☐ Resignation ☐ Termination ☐ Contract end ☐ Layoff ☐ Retirement
- **Exit interview completed**: ☐ Yes ☐ No Date: _______________________________

---

## Risk Assessment

**Before starting offboarding, assess risk level** (determines urgency and thoroughness):

### Risk Factors (check all that apply):
- ☐ Employee had admin/privileged access
- ☐ Employee had access to financial systems or bank accounts
- ☐ Employee had access to customer PII or sensitive data
- ☐ Employee departure was unexpected or contentious (termination, sudden resignation)
- ☐ Employee expressed dissatisfaction or made threats
- ☐ Employee had access to intellectual property (code, product designs, trade secrets)
- ☐ Employee is joining a competitor
- ☐ Employee had remote access (VPN, remote desktop)

### Risk Level:
- **Low Risk** (0-1 factors checked): Standard offboarding, complete within 24 hours of last day
- **Medium Risk** (2-4 factors): Expedited offboarding, complete within 4 hours of last day
- **High Risk** (5+ factors OR sudden termination): Immediate offboarding, complete within 1 hour

**Risk level determined**: ☐ Low ☐ Medium ☐ High

**Offboarding deadline**: _______________________________ (date and time)

---

## IMMEDIATE: Day 0 (Last Working Day - Complete BEFORE Employee Departs)

### Access Revocation (Complete in Order)

**CRITICAL: If high-risk termination, complete this section BEFORE informing employee of termination.**

☐ **1. Revoke admin/privileged access FIRST** (if applicable):
  - ☐ Google Workspace admin: Account suspended
  - ☐ Microsoft 365 admin: Account blocked
  - ☐ AWS/cloud infrastructure: Access removed
  - ☐ Domain registrar: Access removed
  - ☐ Payment processor admin: Access removed
  - ☐ [Other admin access]: _______________________________ Removed: ☐

☐ **2. Revoke financial system access** (if applicable):
  - ☐ Bank accounts: User removed or permissions revoked
  - ☐ Credit cards: Card canceled
  - ☐ Accounting software: [QuickBooks / Xero] Access removed
  - ☐ Payment processors: [Stripe / Square] Access removed
  - ☐ Payroll system: Access removed
  - ☐ [Other financial access]: _______________________________ Removed: ☐

☐ **3. Suspend email account**:
  - ☐ Email suspended (not deleted - preserve for records)
  - ☐ Out-of-office auto-reply set up:
    - Message: "[Name] is no longer with [Company]. For assistance, contact [manager email] or [general email]."
  - ☐ Email forwarding set up (if requested by manager):
    - Forward to: _______________________________
    - Duration: ☐ 30 days ☐ 60 days ☐ 90 days ☐ Other: _______
  - ☐ Remove from all distribution lists and groups

☐ **4. Revoke remote access**:
  - ☐ VPN access: User removed from [VPN tool]
  - ☐ Remote desktop: Access removed
  - ☐ SSH keys: Removed from servers
  - ☐ VPN server logs reviewed for recent activity: ☐

☐ **5. Revoke access to critical business systems**:
  - ☐ CRM ([Salesforce / HubSpot]): User deactivated
  - ☐ Customer support ([Zendesk / Intercom]): User removed
  - ☐ Code repositories ([GitHub / GitLab / Bitbucket]):
    - User removed from organization
    - Review recent commits (any suspicious activity): ☐
    - Review SSH keys and personal access tokens: Revoked ☐
  - ☐ Project management ([Asana / Monday / Jira]): User removed
  - ☐ Communication tools ([Slack / Teams]):
    - User deactivated
    - Review recent DMs for data exfiltration signs: ☐
  - ☐ Cloud storage ([Google Drive / OneDrive / Dropbox]):
    - User access revoked
    - File ownership transferred (see Data Transfer section below)
  - ☐ [Other systems]: _______________________________ Access removed: ☐
  - ☐ [Other systems]: _______________________________ Access removed: ☐

☐ **6. Revoke shared account access** (if employee had access):
  - ☐ Change passwords for shared accounts:
    - ☐ Social media accounts (LinkedIn, Twitter, Facebook)
    - ☐ Shared email accounts (info@, sales@, support@)
    - ☐ Shared tool accounts
    - ☐ [Other]: _______________________________
  - ☐ Review password manager shared vaults:
    - ☐ Remove employee from shared vaults
    - ☐ Identify which passwords employee had access to: _______________________________
    - ☐ Change critical shared passwords (prioritize financial, admin, customer-facing)

☐ **7. Revoke OAuth/API tokens and app integrations**:
  - ☐ Google Workspace: Review third-party app access → Revoke all
  - ☐ Microsoft 365: Azure AD → Enterprise applications → Review employee's OAuth grants → Revoke all
  - ☐ Review API tokens/keys created by employee: _______________________________
  - ☐ Revoke all personal access tokens (GitHub, GitLab, cloud platforms)

### Physical Security

☐ **8. Retrieve company property**:
  - ☐ Laptop: Serial _______________________ Returned: ☐ Shipped: ☐ Not returned: ☐
  - ☐ Phone: Serial _______________________ Returned: ☐ Shipped: ☐ Not returned: ☐
  - ☐ Tablet/iPad: Serial _______________________ Returned: ☐ Shipped: ☐ Not returned: ☐
  - ☐ Monitor(s): Quantity _______ Returned: ☐
  - ☐ Keyboard/mouse: Returned: ☐
  - ☐ Headset: Returned: ☐
  - ☐ Security key (YubiKey, etc.): Returned: ☐
  - ☐ Access card/key fob: ID _______________________ Returned: ☐
  - ☐ Office keys: Returned: ☐
  - ☐ Parking pass: Returned: ☐
  - ☐ Company credit card: Returned: ☐ Shredded: ☐
  - ☐ [Other items]: _______________________________ Returned: ☐

☐ **9. For returned devices - immediate actions**:
  - ☐ Remove from MDM ([Intune / Jamf / Kandji / Hexnode])
  - ☐ Perform data backup (if needed for transition): Saved to: _______________________________
  - ☐ Wipe device (factory reset or secure wipe):
    - Mac: System Settings → Erase All Content and Settings
    - Windows: Settings → System → Recovery → Reset PC (remove everything)
    - Phone: Settings → General → Reset → Erase All Content and Settings
  - ☐ Verify wipe completed successfully
  - ☐ Remove from asset inventory
  - ☐ Prepare for reissue or disposal

☐ **10. For devices not returned** (employee kept personal device with company data):
  - ☐ Remotely wipe company data via MDM
  - ☐ Verify wipe succeeded (check MDM logs)
  - ☐ If wipe fails: Escalate to manager and legal
  - ☐ Document in employee file: Date/time of wipe attempt, success/failure

☐ **11. Physical access revocation**:
  - ☐ Deactivate access card (building, office, server room)
  - ☐ Change door codes (if employee knew them)
  - ☐ Remove from visitor log/guest list
  - ☐ Notify reception/security: Employee no longer authorized
  - ☐ Remove parking access

---

## Day 0-1: Data Transfer and Backup

### File Ownership Transfer

☐ **12. Identify employee's files and documents**:
  - ☐ Google Drive: Review files owned by employee
  - ☐ OneDrive: Review files owned by employee
  - ☐ Dropbox: Review files owned by employee
  - ☐ Shared network drives: Review files created by employee
  - ☐ Local device storage: Backup before wiping device

☐ **13. Transfer file ownership**:
  - **Google Drive**:
    - Admin Console → Users → [Employee] → More → Transfer ownership
    - Transfer to: _______________________________
    - Files transferred: ☐ All files ☐ Selected folders only
  - **OneDrive**:
    - Microsoft 365 Admin Center → Active users → [Employee] → OneDrive → Get access to files
    - Transfer to: _______________________________
  - **Dropbox**:
    - Admin Console → Members → [Employee] → Transfer files
    - Transfer to: _______________________________

☐ **14. Document critical files/knowledge**:
  - ☐ Create list of employee's key projects/responsibilities: _______________________________
  - ☐ Identify critical files that need handoff: _______________________________
  - ☐ Transfer to successor or manager: _______________________________
  - ☐ Document any passwords/credentials ONLY employee knew: _______________________________

### Email and Communication Backup

☐ **15. Email backup** (if needed for records or transition):
  - ☐ Export employee's mailbox:
    - Google Workspace: Google Vault or Google Takeout
    - Microsoft 365: eDiscovery or Outlook export (.pst file)
  - ☐ Save export file to: _______________________________
  - ☐ Retention period: ☐ 1 year ☐ 2 years ☐ 7 years (legal requirements) ☐ Other: _______

☐ **16. Slack/Teams message review** (if high-risk departure):
  - ☐ Export employee's direct messages (if permitted by policy)
  - ☐ Review for:
    - Data exfiltration (sending files to personal accounts)
    - Intellectual property theft (code, designs, customer lists)
    - Recruitment of other employees (trying to poach team)
    - Customer poaching (contacting customers about competitor)
  - ☐ Document findings: _______________________________
  - ☐ If suspicious activity found: Escalate to legal

---

## Week 1: Account Cleanup and Monitoring

### Account Status

☐ **17. Verify all access revoked**:
  - ☐ Audit log review:
    - Google Workspace: Admin Console → Reporting → Audit → Login
    - Microsoft 365: Azure AD → Sign-in logs
    - Look for login attempts after termination date
  - ☐ VPN logs: No activity after last day ☐
  - ☐ SSH/server logs: No activity after last day ☐
  - ☐ Application logs: No activity after last day ☐

☐ **18. Deactivate accounts** (after access verification):
  - ☐ Set email account to "Deactivated" or "Archived" status
  - ☐ Convert to shared mailbox (if ongoing access needed): Assigned to: _______________________________
  - ☐ Remove licenses (cost savings):
    - ☐ Google Workspace / Microsoft 365 license removed
    - ☐ [Other licenses]: _______________________________ Removed: ☐

☐ **19. External service notifications** (if employee had external-facing role):
  - ☐ Update website (remove employee from team page)
  - ☐ Update LinkedIn (remove employee from company page)
  - ☐ Update email signatures (remove from group signature)
  - ☐ Notify key clients/partners (if appropriate):
    - New point of contact: _______________________________
    - Notification sent: ☐

### Monitoring for Suspicious Activity

☐ **20. Monitor for data exfiltration** (first 2 weeks after departure):
  - ☐ Review cloud storage audit logs:
    - Large file downloads before departure?
    - Files shared to personal accounts?
    - Mass file copies/moves?
  - ☐ Review email logs:
    - Large attachments sent to personal email?
    - Auto-forwarding rules set up?
    - Mass email exports?
  - ☐ Review code repository:
    - Large code downloads/clones?
    - New SSH keys added before departure?
    - Suspicious commits (removing code, adding backdoors)?
  - ☐ If suspicious activity detected:
    - Document: _______________________________
    - Notify: ☐ Manager ☐ Legal ☐ CEO
    - Consider forensic investigation: ☐

---

## Week 2-4: Final Cleanup

### Vendor and Third-Party Notifications

☐ **21. Notify vendors** (if employee was point of contact):
  - ☐ [Vendor 1]: _______________________________ New contact: _______________________________
  - ☐ [Vendor 2]: _______________________________ New contact: _______________________________
  - ☐ [Vendor 3]: _______________________________ New contact: _______________________________

☐ **22. Remove from external accounts**:
  - ☐ LinkedIn (remove admin access if applicable)
  - ☐ Twitter/X (remove from corporate account)
  - ☐ Facebook business page (remove admin access)
  - ☐ Domain registrar (Namecheap, GoDaddy, Cloudflare): Remove user
  - ☐ Hosting providers (AWS, Azure, GCP): Remove user
  - ☐ Payment processors (Stripe, Square, PayPal): Remove user
  - ☐ [Other external accounts]: _______________________________

### Documentation and Compliance

☐ **23. Update documentation**:
  - ☐ Remove employee from internal org chart
  - ☐ Remove employee from on-call rotation (if applicable)
  - ☐ Remove employee from emergency contact list
  - ☐ Update project documentation (reassign responsibilities)
  - ☐ Update runbooks/playbooks (replace employee's name with role or successor)

☐ **24. HR and legal compliance**:
  - ☐ Final paycheck processed
  - ☐ Benefits termination confirmed (health insurance, etc.)
  - ☐ Unemployment paperwork (if applicable)
  - ☐ Non-compete/NDA reminder sent (if applicable):
    - Sent by: ☐ HR ☐ Legal Date: _______________________________
    - Covers: ☐ Non-compete ☐ Non-solicitation ☐ Confidentiality
  - ☐ Employee acknowledged non-compete/NDA obligations: ☐

☐ **25. Security audit follow-up** (30 days post-departure):
  - ☐ Review audit logs one final time (any lingering access?)
  - ☐ Confirm no suspicious activity in past 30 days
  - ☐ Close offboarding ticket/case
  - ☐ File completed checklist in employee's HR record

---

## HIGH-RISK TERMINATION: Additional Security Measures

**Complete these additional steps ONLY for high-risk terminations** (sudden termination, employee expressed threats, access to highly sensitive data):

☐ **26. Immediate enhanced monitoring** (first 48 hours):
  - ☐ Review ALL audit logs hourly for first 24 hours
  - ☐ Monitor for login attempts (should be zero)
  - ☐ Monitor for VPN connection attempts
  - ☐ Monitor firewall logs for traffic from employee's known IP addresses
  - ☐ Set up alerts for any activity from employee's accounts

☐ **27. Change additional credentials**:
  - ☐ Change Wi-Fi password (if employee had access)
  - ☐ Change router admin password
  - ☐ Rotate API keys and secrets (if employee had access)
  - ☐ Change encryption keys (if employee had access)
  - ☐ Update SSL/TLS certificates (if employee had private keys)

☐ **28. Legal and forensic considerations**:
  - ☐ Notify legal team immediately
  - ☐ Preserve all evidence:
    - ☐ Email export
    - ☐ Slack/Teams message export
    - ☐ Audit log exports
    - ☐ Device forensic image (before wiping)
  - ☐ Consider hiring forensic investigator (if significant IP or data theft suspected)
  - ☐ Document timeline of all actions taken

☐ **29. Customer and partner monitoring**:
  - ☐ Monitor for employee contacting customers (poaching attempts)
  - ☐ Alert key customers: "If [Employee] contacts you about [competitor], please notify us"
  - ☐ Review CRM activity logs (did employee export customer lists?)
  - ☐ Check for unusual customer data access before departure

☐ **30. Credit and financial monitoring** (if employee had financial access):
  - ☐ Review all financial transactions from past 90 days
  - ☐ Look for unauthorized transactions
  - ☐ Verify no new credit cards or accounts opened
  - ☐ Check for unauthorized vendor additions
  - ☐ Audit expense reports for past 6 months (any fraudulent expenses?)

---

## Checklist Completion

☐ **All checklist items completed**

**Completed by**: _______________________________
**Completion date**: _______________________________
**Time to complete**: _______ hours (from start to full access revocation)

**Notes/issues encountered**:
_______________________________
_______________________________
_______________________________
_______________________________

**Manager sign-off**: _______________________________
**Manager date**: _______________________________

**HR sign-off**: _______________________________
**HR date**: _______________________________

---

## Common Issues and Solutions

### Issue: Employee refuses to return company devices
**Solution**:
- Remotely wipe via MDM (first priority)
- Send formal demand letter (HR or legal)
- If device not returned in 7 days: Deduct from final paycheck (if legally permitted in your jurisdiction)
- If high-value device: File police report (theft)

### Issue: Can't access employee's files (encrypted, password-protected)
**Solution**:
- Check password manager (may have encryption keys)
- Check for recovery keys (FileVault, BitLocker)
- If no recovery possible: Document loss, move on
- Prevention: Implement company-managed encryption keys

### Issue: Employee set up auto-forwarding to personal email before departure
**Solution**:
- Admin Console → Check for forwarding rules → Delete immediately
- Review what was forwarded (audit logs show forwarded emails)
- If sensitive data was forwarded: Treat as data breach (see Incident Response template)

### Issue: Employee was sole admin of critical service, no one else has access
**Solution**:
- Contact vendor support immediately (have company documentation ready)
- Vendor can verify company ownership and reset admin access
- Prevention: Always have 2+ admins for critical services

### Issue: Discovery of data exfiltration after employee departure
**Solution**:
1. Document all evidence (audit logs, file copies, email forwards)
2. Notify legal team immediately
3. Consider forensic investigation
4. Send cease-and-desist letter (legal)
5. If employee joined competitor: Enforce non-compete (legal)
6. If customer data stolen: May trigger breach notification requirements (PDPA/GDPR)

---

## Post-Offboarding: Lessons Learned

☐ **Conduct post-offboarding review** (within 1 week):
  - What went well:
    _______________________________
    _______________________________
  - What could be improved:
    _______________________________
    _______________________________
  - Process improvements to implement:
    _______________________________
    _______________________________

☐ **Update offboarding procedures** (if improvements identified):
  - Changes made to checklist: _______________________________
  - Changes communicated to: ☐ IT ☐ HR ☐ Managers

---

## Related Documents

- **Security Policy**: templates/security-policy.md
- **Onboarding Checklist**: templates/onboarding-checklist.md
- **Incident Response Playbook**: templates/incident-response.md (if data theft suspected)
- **Access Control Guide**: guides/02-passwords-access.md
- **Cloud Security Guide**: guides/07-cloud-security.md (for audit log reviews)

---

## Appendix: Offboarding Timeline Reference

| Timeline | Actions | Priority |
|----------|---------|----------|
| **Hour 0** (Last day - before employee leaves) | Revoke admin access, financial access, suspend email, revoke remote access, retrieve devices | CRITICAL |
| **Hour 0-4** | Revoke all system access, retrieve physical items, set up out-of-office | HIGH |
| **Day 1** | Transfer file ownership, email backup, wipe devices | HIGH |
| **Week 1** | Verify access revoked, deactivate accounts, monitor for suspicious activity | MEDIUM |
| **Week 2-4** | Notify vendors, update documentation, final audit log review | MEDIUM |
| **Day 30** | Final security audit, close offboarding case | LOW |

---

**End of Offboarding Security Checklist**

**Critical reminder**: The faster you complete offboarding (especially access revocation), the lower your security risk. High-risk terminations should have ALL access revoked within 1 hour.
