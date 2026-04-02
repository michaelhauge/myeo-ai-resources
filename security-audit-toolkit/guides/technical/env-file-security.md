# .env File Security Guide

Best practices for managing environment files securely.

---

## The Basics

### What is a .env file?
A file containing environment variables, typically secrets like API keys:
```
DATABASE_URL=postgres://user:pass@localhost/db
API_KEY=sk-abc123...
SECRET_KEY=super-secret-value
```

### Why are they risky?
- Often created with default permissions (644 = world-readable)
- Easy to accidentally commit to git
- Can contain production secrets in development

---

## File Permissions

### The Problem
By default, many tools create files with 644 permissions:
```
-rw-r--r--  .env  (644 - anyone can read!)
```

### The Fix
```bash
# Set secure permissions on existing files
chmod 600 .env
chmod 600 .env.*

# Verify
ls -la .env
# Should show: -rw-------
```

### Prevent Future Issues
Add to your shell profile (`~/.zshrc` or `~/.bashrc`):
```bash
# Always create files with secure permissions
umask 077
```

---

## Git Protection

### .gitignore (Required)
Every project should have:
```gitignore
# .gitignore
.env
.env.*
.env.local
.env.*.local
!.env.example
```

### Pre-commit Hook
Create `.git/hooks/pre-commit`:
```bash
#!/bin/bash
# Prevent committing .env files

if git diff --cached --name-only | grep -qE '^\.env'; then
    echo "ERROR: Attempting to commit .env file!"
    echo "Remove it from staging: git reset HEAD .env"
    exit 1
fi

# Check for secrets in staged files
if git diff --cached | grep -qE '(sk-[a-zA-Z0-9]{20,}|AKIA[A-Z0-9]{16})'; then
    echo "ERROR: Potential secret detected in staged changes!"
    exit 1
fi
```

Make it executable:
```bash
chmod +x .git/hooks/pre-commit
```

### If You Already Committed Secrets

**WARNING:** This rewrites git history. Coordinate with your team.

```bash
# Remove file from all history
git filter-branch --force --index-filter \
  'git rm --cached --ignore-unmatch .env' \
  --prune-empty --tag-name-filter cat -- --all

# Force push (coordinate with team!)
git push origin --force --all
```

Then **immediately rotate** the exposed credentials.

---

## .env File Structure

### Recommended Format
```bash
# .env

# ===================
# Database
# ===================
DATABASE_URL=postgres://localhost/myapp
DATABASE_POOL_SIZE=10

# ===================
# API Keys
# ===================
# OpenAI - rotate every 90 days
OPENAI_API_KEY=sk-...

# Stripe - test mode
STRIPE_SECRET_KEY=sk_test_...
STRIPE_PUBLISHABLE_KEY=pk_test_...

# ===================
# Application
# ===================
APP_SECRET=generated-secret-here
APP_ENV=development
```

### Create a Template
Always provide `.env.example`:
```bash
# .env.example (commit this!)

# Database
DATABASE_URL=postgres://localhost/myapp

# API Keys (get from team lead)
OPENAI_API_KEY=
STRIPE_SECRET_KEY=

# Application
APP_SECRET=run-openssl-rand-hex-32
APP_ENV=development
```

---

## Environment Separation

### Don't Mix Environments
```
.env              # Local development
.env.test         # Test environment
.env.staging      # Staging (DON'T commit)
.env.production   # Production (DON'T commit)
```

### Loading Order (typical)
1. `.env` (base)
2. `.env.local` (local overrides)
3. `.env.{environment}` (environment-specific)
4. `.env.{environment}.local` (local environment overrides)

### Framework-Specific

**Next.js:**
```
.env                # All environments
.env.local          # Local overrides (gitignored)
.env.development    # Development
.env.production     # Production
```

**Rails:**
```
.env
.env.development.local
.env.test.local
```

---

## Secure Alternatives

### For Production

| Solution | Pros | Cons |
|----------|------|------|
| AWS Secrets Manager | Native AWS integration | AWS lock-in |
| HashiCorp Vault | Flexible, audit logs | Complex setup |
| Doppler | Easy, good DX | Third-party dependency |
| 1Password CLI | Team-friendly | Requires 1Password |

### Example: AWS Secrets Manager
```javascript
// Instead of process.env.API_KEY
const { SecretsManager } = require('@aws-sdk/client-secrets-manager');
const client = new SecretsManager();
const secret = await client.getSecretValue({ SecretId: 'my-api-key' });
```

### Example: 1Password CLI
```bash
# In your app startup script
eval $(op signin)
export API_KEY=$(op read "op://Vault/API Key/credential")
```

---

## Auditing .env Files

### Find All .env Files
```bash
find ~/development -name ".env*" -type f 2>/dev/null
```

### Check Permissions
```bash
find ~/development -name ".env*" -type f -exec ls -la {} \;
```

### Find Insecure Files
```bash
find ~/development -name ".env*" -type f -perm 644 2>/dev/null
```

### Fix All at Once
```bash
find ~/development -name ".env*" -type f -exec chmod 600 {} \;
```

---

## Common Mistakes

### 1. Committing .env to git
**Fix:** Add to .gitignore, remove from history, rotate secrets

### 2. World-readable permissions
**Fix:** `chmod 600 .env`

### 3. Same secrets in dev and prod
**Fix:** Use different API keys per environment

### 4. Secrets in error logs
**Fix:** Sanitize logs, use secret redaction

### 5. Copying .env between machines via email/Slack
**Fix:** Use password manager or secure file transfer

### 6. Hardcoding fallback secrets
```javascript
// DON'T DO THIS
const apiKey = process.env.API_KEY || 'sk-default-key';
```
**Fix:** Fail fast if secrets are missing

---

## Checklist

- [ ] All .env files have 600 permissions
- [ ] .gitignore includes `.env*` patterns
- [ ] .env.example exists with dummy values
- [ ] Pre-commit hook prevents .env commits
- [ ] Different credentials for each environment
- [ ] Production secrets not on local machines
- [ ] Team knows how to get/update secrets
