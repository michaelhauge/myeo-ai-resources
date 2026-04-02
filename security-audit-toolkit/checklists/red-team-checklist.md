# Red Team Security Audit Checklist

A comprehensive checklist for performing security audits on developer workstations and servers.

## Quick Reference

| Category | Critical Items |
|----------|---------------|
| Network | Firewall, exposed ports, guest access |
| Credentials | .env permissions, API key rotation |
| System | Disk encryption, screen lock |

---

## Network Security

### Firewall
- [ ] Firewall is enabled
- [ ] Stealth mode is enabled (blocks ping responses)
- [ ] Only necessary applications are allowed incoming connections

### Exposed Services
- [ ] SSH (port 22) - Is it needed? If yes, is it key-only?
- [ ] SMB/File Sharing (port 445) - Guest access disabled?
- [ ] VNC/Screen Sharing (port 5900) - Only via VPN?
- [ ] Apple Remote Desktop (port 3283) - Disabled if not needed?
- [ ] Remote Apple Events (port 3031) - Disabled?
- [ ] Database ports (3306, 5432, 27017, 6379) - Localhost only?

### File Sharing
- [ ] Guest access is disabled on all shares
- [ ] Share permissions are restrictive (not "Everyone")
- [ ] Shares are password-protected

### VPN / Secure Access
- [ ] Remote access only via VPN (Tailscale, WireGuard, etc.)
- [ ] VPN is always-on when on untrusted networks
- [ ] Split tunneling is disabled (if security-critical)

---

## Credential Security

### .env Files
- [ ] All .env files have 600 permissions (owner read/write only)
- [ ] No .env files are tracked in git
- [ ] .gitignore includes `.env*` patterns
- [ ] Production secrets are not in local .env files

### API Keys & Tokens
- [ ] API keys are not hardcoded in source code
- [ ] API keys are not in shell history
- [ ] API keys are not in documentation or plan files
- [ ] Keys are rotated after any suspected exposure
- [ ] Separate keys for development vs production

### SSH Keys
- [ ] SSH private keys have 600 permissions
- [ ] SSH directory has 700 permissions
- [ ] Using ED25519 or RSA 4096+ keys (not DSA)
- [ ] Passphrase-protected keys for sensitive access

### Cloud Credentials
- [ ] AWS credentials file has 600 permissions
- [ ] GCP service account keys have 600 permissions
- [ ] No cloud credentials in source code
- [ ] IAM roles used instead of long-lived keys where possible

---

## Secret Detection

### Shell History
- [ ] No API keys in ~/.zsh_history or ~/.bash_history
- [ ] No passwords passed as command arguments
- [ ] HISTCONTROL=ignorespace is set (to hide sensitive commands)

### Git Repositories
- [ ] No .env files committed
- [ ] No secrets in commit messages
- [ ] Pre-commit hooks detect secrets
- [ ] git-secrets or similar tool installed

### Logs & Documentation
- [ ] No secrets in log files
- [ ] No secrets in plan files or documentation
- [ ] No screenshots containing secrets

---

## System Security

### Disk Encryption
- [ ] FileVault enabled (macOS)
- [ ] LUKS enabled (Linux)
- [ ] BitLocker enabled (Windows)

### Screen Lock
- [ ] Requires password immediately after sleep
- [ ] Auto-lock after 5 minutes or less
- [ ] Lock screen shortcut known (Cmd+Ctrl+Q on macOS)

### Updates
- [ ] Operating system is up to date
- [ ] Security updates are automatic
- [ ] Applications are up to date

### Authentication
- [ ] Strong password on user account
- [ ] No shared accounts
- [ ] 2FA enabled where possible

---

## Application Security

### Browsers
- [ ] Browser extensions reviewed (remove unnecessary)
- [ ] Saved passwords are in a password manager, not browser
- [ ] Private browsing for sensitive sessions

### Development Tools
- [ ] IDE extensions reviewed
- [ ] No malicious npm/pip packages
- [ ] Dependencies are regularly audited

### Messaging & Communication
- [ ] End-to-end encryption for sensitive discussions
- [ ] No secrets shared via unencrypted channels

---

## Backup & Recovery

### Backups
- [ ] Regular backups configured
- [ ] Backups are encrypted
- [ ] Backups are tested (can restore)

### Incident Response
- [ ] Know how to revoke API keys quickly
- [ ] Know how to rotate credentials
- [ ] Have a list of all services/keys to rotate if compromised

---

## Audit Commands Reference

### Network
```bash
# Check listening ports
netstat -an | grep LISTEN

# Check firewall (macOS)
/usr/libexec/ApplicationFirewall/socketfilterfw --getglobalstate

# Check sharing (macOS)
sharing -l
```

### Permissions
```bash
# Find insecure .env files
find ~/development -name ".env*" -perm 644

# Check SSH key permissions
ls -la ~/.ssh/
```

### Secrets
```bash
# Check shell history for secrets
grep -E 'sk-|AKIA|ghp_' ~/.zsh_history

# Check git for tracked .env files
git ls-files | grep -i env
```

---

## Scoring

| Score | Rating | Description |
|-------|--------|-------------|
| 0-5 failures | Excellent | Minor issues only |
| 6-10 failures | Good | Some improvements needed |
| 11-20 failures | Fair | Significant gaps to address |
| 20+ failures | Poor | Urgent remediation required |

---

## Next Steps After Audit

1. **Immediate** (within 1 hour)
   - Fix any exposed credentials
   - Enable firewall if disabled
   - Fix world-readable secrets files

2. **Today** (within 24 hours)
   - Rotate any potentially exposed API keys
   - Fix file permissions
   - Disable unnecessary services

3. **This Week**
   - Set up pre-commit hooks
   - Configure automated security checks
   - Document incident response procedures

4. **Ongoing**
   - Monthly security audits
   - Quarterly credential rotation
   - Stay updated on security best practices
