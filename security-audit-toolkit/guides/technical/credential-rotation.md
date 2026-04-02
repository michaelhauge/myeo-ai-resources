# Credential Rotation Best Practices

A guide to safely rotating API keys, tokens, and other credentials.

---

## Why Rotate Credentials?

- **After exposure**: Key appeared in logs, git history, or documentation
- **After team changes**: Employee leaves or changes roles
- **Preventively**: Regular rotation limits exposure window
- **After security incident**: Any suspected compromise

---

## The Golden Rule

> **Never** type credentials directly in the terminal. They end up in shell history.

### Wrong Way
```bash
# DON'T DO THIS - key goes to shell history
export API_KEY=sk-abc123...
curl -H "Authorization: Bearer sk-abc123..." https://api.example.com
```

### Right Way
```bash
# Use read -s for hidden input
read -s API_KEY
export API_KEY
# Or use a .env file
source .env
```

---

## Rotation Workflow

### Step 1: Generate New Credential
- Go to the service's dashboard/console
- Generate a new key (don't revoke the old one yet!)
- Copy the new key securely (password manager, not clipboard for long)

### Step 2: Update All Locations
- Environment variables
- .env files
- CI/CD secrets
- Deployed services

### Step 3: Test New Credential
- Verify the new key works in all locations
- Check logs for authentication errors

### Step 4: Revoke Old Credential
- Only after confirming new key works everywhere
- Monitor for any failures

### Step 5: Document
- Note when rotation happened
- Update rotation schedule

---

## Service-Specific Guides

### OpenAI

**Console:** https://platform.openai.com/api-keys

1. Click "Create new secret key"
2. Copy the key immediately (shown only once)
3. Update your `.env`:
   ```bash
   # Use hidden input
   read -s NEW_KEY && sed -i '' "s/OPENAI_API_KEY=.*/OPENAI_API_KEY=$NEW_KEY/" .env && unset NEW_KEY
   ```
4. Test: `curl https://api.openai.com/v1/models -H "Authorization: Bearer $OPENAI_API_KEY"`
5. Delete old key in console

### Anthropic

**Console:** https://console.anthropic.com/settings/keys

1. Click "Create Key"
2. Copy the key
3. Update `.env` or config
4. Test: `curl https://api.anthropic.com/v1/messages ...`
5. Delete old key

### GitHub Personal Access Token

**Console:** https://github.com/settings/tokens

1. Click "Generate new token (classic)" or fine-grained
2. Select required scopes
3. Copy token
4. Update git credentials:
   ```bash
   # macOS Keychain
   git credential-osxkeychain erase
   host=github.com
   protocol=https
   # Then push/pull to re-authenticate
   ```
5. Delete old token

### AWS Access Keys

**Console:** https://console.aws.amazon.com/iam/

1. IAM > Users > Your User > Security credentials
2. Create new access key
3. Update `~/.aws/credentials`:
   ```ini
   [default]
   aws_access_key_id = AKIA...
   aws_secret_access_key = ...
   ```
4. Test: `aws sts get-caller-identity`
5. Deactivate, then delete old key

### Notion Integration Token

**Console:** https://www.notion.so/my-integrations

1. Click on your integration
2. Click "Show" next to Internal Integration Token
3. Click "Regenerate token"
4. Update your config
5. Old token is automatically invalidated

### Stripe API Keys

**Console:** https://dashboard.stripe.com/apikeys

1. Click "Create secret key" or roll existing
2. Update `.env`
3. Test with Stripe CLI or API call
4. Rolling keys: Stripe keeps both active during transition

---

## Secure Storage Options

### Environment Variables (Development)
```bash
# .env file (chmod 600!)
API_KEY=sk-...

# Load in app
source .env
# or use dotenv library
```

### Secret Managers (Production)

| Service | Best For |
|---------|----------|
| AWS Secrets Manager | AWS infrastructure |
| HashiCorp Vault | Multi-cloud, on-prem |
| 1Password | Small teams, CLI integration |
| Doppler | Developer-focused |

### macOS Keychain (Local Development)
```bash
# Store
security add-generic-password -a "$USER" -s "my-api-key" -w "sk-..."

# Retrieve
security find-generic-password -a "$USER" -s "my-api-key" -w
```

---

## Rotation Schedule

| Credential Type | Frequency | Trigger |
|-----------------|-----------|---------|
| API Keys (production) | 90 days | Or on exposure |
| API Keys (development) | 180 days | Or on exposure |
| Database passwords | 90 days | Or on team change |
| SSH keys | Annually | Or on compromise |
| OAuth secrets | 180 days | Or on exposure |
| Service account keys | 90 days | Or on team change |

---

## Emergency Rotation

If you suspect a key is compromised:

1. **Immediately** revoke/regenerate the key
2. Generate new key
3. Update all locations
4. Check logs for unauthorized usage
5. Assess damage (what could attacker access?)
6. Document incident

### Quick Revocation Links

- OpenAI: https://platform.openai.com/api-keys
- GitHub: https://github.com/settings/tokens
- AWS: https://console.aws.amazon.com/iam/
- Stripe: https://dashboard.stripe.com/apikeys
- Anthropic: https://console.anthropic.com/settings/keys

---

## Preventing Future Exposures

1. **Pre-commit hooks**: Detect secrets before commit
2. **Git history scanning**: Use git-secrets or truffleHog
3. **Environment separation**: Different keys for dev/staging/prod
4. **Least privilege**: Keys should have minimal permissions
5. **Short-lived tokens**: Use OAuth flows that generate temporary tokens

---

## Checklist After Rotation

- [ ] New key generated
- [ ] Old key NOT yet revoked
- [ ] All .env files updated
- [ ] CI/CD secrets updated
- [ ] Deployed services restarted
- [ ] Functionality tested
- [ ] Old key revoked
- [ ] Rotation documented
