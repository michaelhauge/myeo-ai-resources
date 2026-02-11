# Security Guide: n8n for Southeast Asia

**Addressing security concerns for business leaders in Malaysia and Singapore**

---

## Executive Summary

**Is n8n safe for my business?** Yes, when properly configured.

n8n is used by **thousands of businesses worldwide**, including Fortune 500 companies. When self-hosted, your data stays on **YOUR infrastructure** in **YOUR region**, giving you complete control.

**Key Security Facts**:
- ✅ Self-hosted = Data stays in Singapore/Malaysia
- ✅ AES-256 encryption for credentials
- ✅ OAuth support (no raw API keys)
- ✅ No access to your payment systems
- ✅ PDPA-compliant when self-hosted
- ✅ SOC 2 Type II certified (n8n Cloud)

---

## Common Security Concerns Addressed

### 1. "Someone will steal my business data"

**Reality**: Your data stays exactly where you put it.

**Self-Hosted (Recommended for Privacy)**:
```
Your Data Flow:
┌─────────────┐
│ Your Browser│
└──────┬──────┘
       │ HTTPS
       ↓
┌──────────────┐
│  n8n Server  │ ← Running on YOUR VPS in Singapore
│ (Singapore)  │
└──────┬───────┘
       │
       ↓
┌──────────────┐
│ PostgreSQL   │ ← YOUR database on YOUR server
│   Database   │
└──────────────┘
```

**What data is stored**:
- Workflow definitions (your automation logic)
- Execution logs (workflow runs)
- Credentials (encrypted with AES-256)

**What is NOT stored**:
- Your actual business data passes through n8n but isn't persisted
- Credit card information (n8n has zero access to payment systems)
- Raw API keys (OAuth tokens are encrypted)

**n8n Cloud**: Data stored on n8n's servers (Frankfurt, Germany or US) with SOC 2 compliance.

---

### 2. "My API keys will be exposed"

**Reality**: Multi-layer encryption protects credentials.

#### How n8n Protects Credentials

**Encryption at Rest**:
- All credentials encrypted with AES-256
- Encryption key stored separately from database
- Even with database access, credentials are unreadable

**OAuth 2.0 Support**:
- Most integrations use OAuth (no raw API keys)
- Tokens automatically refreshed
- Revocable from the source application

**Self-Hosted Additional Protection**:
```bash
# Environment variable for encryption key
N8N_ENCRYPTION_KEY=your-unique-encryption-key-here

# Never commit this to version control
# Store in secure location
```

#### Best Practices

1. **Use OAuth when available** (Google, Microsoft, Salesforce, etc.)
2. **Rotate credentials regularly** (every 90 days)
3. **Limit API scope** (only grant permissions needed)
4. **Monitor usage** (check logs for unusual activity)
5. **Use separate credentials** for production vs development

---

### 3. "Someone will access my credit cards or financial data"

**Reality**: n8n has **zero access** to payment systems.

**How it works**:
- n8n doesn't store credit card info
- Payment integrations use secure APIs (Stripe, PayPal, etc.)
- You authorize n8n to call APIs, not access accounts
- Can't make payments without explicit workflow actions

**Example: Stripe Integration**

```
What n8n CAN do (with your permission):
✅ Read transaction data
✅ Create invoices
✅ Update customer records

What n8n CANNOT do:
❌ Directly charge credit cards
❌ Access your Stripe balance
❌ Modify payment methods
❌ Withdraw funds
```

All payment actions require:
1. Explicit workflow setup by you
2. API credentials with limited scope
3. Auditcontroller logs

---

### 4. "PDPA compliance requirements for Singapore/Malaysia"

**Reality**: Self-hosted n8n gives you **full control** over data location and handling.

#### PDPA Compliance Checklist for Self-Hosted n8n

| Requirement | How n8n Helps |
|------------|---------------|
| **Data localization** | Deploy in Singapore/Malaysia datacenter |
| **Access controls** | User authentication, role-based access |
| **Audit logging** | All workflow executions logged |
| **Data encryption** | AES-256 for credentials, HTTPS for transit |
| **Data retention** | Configurable (delete old executions) |
| **Right to be forgotten** | Delete workflows and execution data |
| **Consent management** | Build consent workflows as needed |

#### Recommended Setup for PDPA Compliance

**1. Singapore Hosting**:
- Oracle Cloud Singapore (free tier)
- DigitalOcean Singapore ($24/month)
- Contabo Singapore (~$5.50/month)

**2. Data Retention Policy**:
```json
// In your n8n config
{
  "executions": {
    "pruneData": true,
    "pruneDataMaxAge": 90  // Days (adjust as needed)
  }
}
```

**3. Access Control**:
- Enable authentication (username/password or SSO)
- Use HTTPS only
- Limit access to authorized personnel
- Regular access audits

**4. Documentation**:
- Document data flows in your workflows
- Maintain list of integrations and data types
- Create data processing agreements for third-party integrations

---

### 5. "What if n8n gets hacked?"

**Reality**: Self-hosted n8n's security depends on **your** infrastructure security.

#### Security Layers

**1. Server Security** (Your Responsibility):
```bash
# Essential security measures
- Regular system updates
- Firewall configuration (UFW, iptables)
- SSH key authentication (disable password login)
- fail2ban for brute force protection
- Regular backups (encrypted)
```

**2. Application Security** (n8n Provides):
- Regular security updates
- Vulnerability scanning
- Secure coding practices
- Community security audits

**3. Network Security** (Your Responsibility):
- HTTPS/TLS encryption
- VPN for admin access (optional but recommended)
- IP whitelisting for admin interface

**4. Database Security**:
- PostgreSQL authentication
- Network isolation (only n8n can access)
- Encrypted backups

#### n8n Cloud Security

If using n8n Cloud:
- SOC 2 Type II certified
- Regular penetration testing
- 24/7 monitoring
- Managed by professional security team
- Frankfurt (Germany) or US datacenters

---

### 6. "Integration security risks"

**Reality**: You control which apps connect and what permissions they have.

#### How to Safely Connect Integrations

**Step 1: Evaluate the Integration**
```
Questions to ask:
- Do I trust this service?
- What data will it access?
- What actions can it perform?
- Can I limit the scope?
```

**Step 2: Use Minimum Permissions**
```
Example: Google Sheets
❌ Don't: Full Google Drive access
✅ Do: Specific spreadsheet access only
```

**Step 3: Monitor Usage**
```bash
# Check n8n execution logs regularly
# Look for:
- Unexpected workflow executions
- Failed authentication attempts
- Unusual data volumes
```

**Step 4: Regular Audits**
```
Monthly checklist:
□ Review connected integrations
□ Remove unused credentials
□ Check access logs
□ Verify workflow owners
□ Test credential rotation
```

---

## Security Best Practices

### For Self-Hosted n8n

#### Essential (Do These First)

1. **Enable HTTPS**
   ```bash
   # Use Caddy for automatic HTTPS
   caddy reverse-proxy --from your-domain.com --to localhost:5678
   ```

2. **Enable Authentication**
   ```bash
   # Set in docker-compose.yml or .env
   N8N_BASIC_AUTH_ACTIVE=true
   N8N_BASIC_AUTH_USER=admin
   N8N_BASIC_AUTH_PASSWORD=strong-password-here
   ```

3. **Set Unique Encryption Key**
   ```bash
   # Generate strong key
   openssl rand -base64 32

   # Set in .env
   N8N_ENCRYPTION_KEY=your-generated-key-here
   ```

4. **Regular Updates**
   ```bash
   # Update n8n monthly
   docker-compose pull
   docker-compose up -d
   ```

#### Recommended (Do These Soon)

5. **Configure Firewall**
   ```bash
   # Allow only necessary ports
   sudo ufw allow 22/tcp    # SSH
   sudo ufw allow 443/tcp   # HTTPS
   sudo ufw allow 80/tcp    # HTTP (redirects to HTTPS)
   sudo ufw enable
   ```

6. **Set Up Backups**
   ```bash
   # Automated daily backups
   # See installation guides for specific commands
   ```

7. **IP Whitelisting** (If accessing from fixed location)
   ```nginx
   # In nginx config
   location / {
     allow 203.0.113.0/24;  # Your office IP range
     deny all;
   }
   ```

#### Advanced (Optional but Stronger)

8. **SSO Integration** (Enterprise plan required)
9. **VPN Access** (Access n8n only through VPN)
10. **Database Encryption** (Encrypt PostgreSQL data at rest)

---

## Security Checklist

### Before Going Live

- [ ] HTTPS enabled and working
- [ ] Strong authentication configured
- [ ] Unique encryption key set
- [ ] Firewall configured
- [ ] Backups automated
- [ ] Test credential rotation
- [ ] Review all workflow permissions
- [ ] Document data flows
- [ ] Train team on security practices

### Monthly Maintenance

- [ ] Update n8n to latest version
- [ ] Review user access
- [ ] Check execution logs for anomalies
- [ ] Test backup restoration
- [ ] Rotate critical credentials
- [ ] Review integration permissions
- [ ] Update security documentation

---

## Incident Response

### If You Suspect a Security Issue

**1. Immediate Actions**:
```bash
# Stop n8n immediately
docker-compose down

# Review logs for suspicious activity
docker logs n8n_container_name

# Check database for unauthorized access
# Review PostgreSQL logs
```

**2. Investigation**:
- Review execution logs for unusual workflows
- Check credential access times
- Verify integration API usage
- Analyze firewall logs

**3. Remediation**:
- Rotate all credentials
- Update n8n to latest version
- Review and tighten access controls
- Consider changing encryption key (requires credential re-entry)

**4. Prevention**:
- Document what happened
- Update security practices
- Train team on lessons learned
- Consider additional security layers

---

## Comparison: n8n Cloud vs Self-Hosted Security

| Aspect | n8n Cloud | Self-Hosted |
|--------|-----------|-------------|
| **Data Location** | Frankfurt/US | Your chosen datacenter |
| **Physical Security** | SOC 2 datacenter | Depends on VPS provider |
| **Compliance** | SOC 2 Type II | Your responsibility |
| **Updates** | Automatic | Manual (but easy) |
| **Monitoring** | 24/7 professional | Your responsibility |
| **Credential Encryption** | AES-256 | AES-256 |
| **Cost** | €24-800/month | $0-30/month |
| **Control** | Limited | Complete |
| **PDPA Compliance** | Requires DPA | Full control |

---

## Red Flags to Avoid

### Insecure Practices (Never Do These)

❌ **Exposing n8n without authentication**
```bash
# DON'T
N8N_BASIC_AUTH_ACTIVE=false
```

❌ **Using HTTP instead of HTTPS**
```
# Never access n8n over HTTP in production
http://your-server.com:5678  # ← INSECURE
```

❌ **Committing credentials to version control**
```bash
# DON'T commit .env files
# Add to .gitignore
echo ".env" >> .gitignore
```

❌ **Using default or weak passwords**
```bash
# DON'T
N8N_BASIC_AUTH_PASSWORD=admin123
```

❌ **Ignoring security updates**
```bash
# Update regularly (at least monthly)
docker-compose pull && docker-compose up -d
```

---

## Conclusion

**Is n8n secure?** Yes, when configured properly.

**Key Takeaways**:
1. Self-hosted gives maximum control and PDPA compliance
2. Enable HTTPS, authentication, and encryption (all easy)
3. Regular updates and monitoring are essential
4. You control data location and integration permissions
5. n8n Cloud offers professional management (SOC 2 certified)

**Start Secure**:
- Follow the installation guides exactly
- Use the security checklist
- Review monthly maintenance tasks
- Document your security practices

---

**Ready to install securely? → [Prerequisites](guides/01-prerequisites.md)**
