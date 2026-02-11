# Data Protection for AI Tools
**What AI Tools Can Access & How to Minimize Exposure (45-Minute Implementation)**

The best security is limiting what AI tools can access in the first place.

---

## Overview

**Time Required**: 45 minutes (initial setup) + ongoing practice
**Difficulty**: Easy (some tech knowledge helpful)
**Output**: Reduced blast radius, data exposure map
**Prerequisites**: Understanding of what AI tools you use

---

## The Core Principle

**Even "safe" AI tools can become compromised.** The question isn't "Will this tool steal my data?" It's "**What happens when** this tool gets compromised?"

**Blast radius minimization**: Limit damage from worst-case scenario.

**Example**:
- ❌ **Bad**: Production API keys on laptop with Claude Code skills → If malicious skill installed, entire production database exposed
- ✅ **Good**: Separate API keys for experimentation, production keys only on secure CI/CD → Malicious skill gets worthless dev keys

---

## What AI Tools Can Access

### Claude Code Skills

**Full access to**:
- ✅ All files in current working directory
- ✅ Files in parent directories (if you navigate there)
- ✅ `.env` files (API keys, secrets)
- ✅ `.aws/credentials`, `.config/gcloud/` (cloud credentials)
- ✅ `.ssh/` (SSH keys)
- ✅ Command execution (can run any bash command)
- ✅ Network access (can upload files anywhere)

**Limited only by**:
- Your operating system permissions (if you're admin, skills are admin)
- What you navigate to in Claude Code

---

### MCP Servers

**Access depends on configuration**, but typically:
- ✅ File system (configurable scope)
- ✅ Environment variables (`process.env.*`)
- ✅ Network access (configurable)
- ✅ APIs you configure (GitHub, databases, etc.)

**Runs continuously** (not just when invoked)

---

### ChatGPT Plugins & GPTs

**Limited access** (sandboxed):
- ✅ What you share in conversation
- ✅ Files you upload to ChatGPT
- ✅ APIs you authorize (OAuth)
- ❌ **Cannot** access your local files
- ❌ **Cannot** execute commands

**Risk**: Data leakage through conversation

---

### Browser Extensions

**Depends on permissions**, but can include:
- ✅ All text on web pages (including password fields)
- ✅ Cookies (session hijacking)
- ✅ Form data (credit cards, personal info)
- ✅ Browsing history
- ❌ **Usually cannot** access local files outside browser
- ❌ **Usually cannot** execute commands

---

## Data Exposure Mapping

**Exercise**: Map what data is accessible to each AI tool category.

### Step 1: Identify Sensitive Data Locations

**On your computer**:
```bash
# Find .env files
find ~ -name ".env*" -type f 2>/dev/null

# Find credential files
ls -la ~/.aws/credentials ~/.config/gcloud/ ~/.ssh/ 2>/dev/null

# Find database dumps
find ~ -name "*.sql" -o -name "*.dump" 2>/dev/null
```

**Make a list**:
| File/Folder | Contains | Risk Level | AI Tool Access? |
|-------------|----------|------------|-----------------|
| `~/development/app/.env` | Production API keys | 🔴 Critical | ✅ Claude Code can access |
| `~/.aws/credentials` | AWS keys | 🔴 Critical | ✅ Claude Code can access |
| `~/Downloads/customers.csv` | Customer data | 🔴 Critical | ✅ Claude Code can access |
| `~/Documents/Contracts/` | Legal docs | 🟡 Sensitive | ✅ Claude Code can access |

### Step 2: Map AI Tool Access

**For each sensitive file/folder, answer**:
- [ ] Can Claude Code skills access this? (If in working dir: YES)
- [ ] Can MCP servers access this? (Check MCP config)
- [ ] Could I accidentally share this with ChatGPT? (If you might open it: YES)
- [ ] Can browser extensions see this? (If it's a web page/form: YES)

### Step 3: Calculate Blast Radius

**Worst-case scenario**: A malicious AI tool activates today.

**Questions**:
1. What's the most valuable data it could access?
2. How many customer records exposed?
3. What API keys could it steal?
4. What's the financial impact? (AWS bill if keys stolen, ransom demand, etc.)

**Example calculation**:
- Malicious Claude Code skill activates
- Steals `~/development/app/.env` (has Stripe API key)
- Attacker uses key to initiate refunds to their own accounts
- **Blast radius**: $500k in fraudulent refunds before detected

---

## Protection Strategies

### Strategy 1: Separate Environments (CRITICAL)

**Never use production credentials on laptops with AI tools.**

#### Implementation

**Production credentials**:
- ✅ Only on secure CI/CD servers (GitHub Actions secrets, etc.)
- ✅ Only on production servers (with strict access controls)
- ❌ **NEVER on developer laptops**

**Development credentials**:
- ✅ Separate API keys with limited permissions
- ✅ On laptops (OK to expose to AI tools)
- ✅ If stolen, no real damage

**Example `.env` files**:

`.env.production` (on CI/CD only, NOT on laptop):
```bash
AWS_ACCESS_KEY=AKIA-PRODUCTION-KEY
STRIPE_KEY=sk_live_REAL_KEY
DATABASE_URL=postgresql://prod-db.company.com
```

`.env.development` (on laptop, AI tools can access):
```bash
AWS_ACCESS_KEY=AKIA-DEV-KEY-LIMITED
STRIPE_KEY=sk_test_TEST_KEY
DATABASE_URL=postgresql://localhost/dev_db
```

**Dev key permissions**:
- AWS: Read-only access to staging S3 bucket (not production)
- Stripe: Test mode only (no real money)
- Database: Local dev database (fake data)

**If dev keys stolen**: Attacker gets access to fake test data. No real impact.

---

### Strategy 2: Directory Isolation

**Don't keep sensitive files in your code working directory.**

#### Before (BAD)

```
~/development/
├── app/                    # Working directory for Claude Code
│   ├── .env               # ❌ PRODUCTION keys here
│   ├── src/
│   └── customers.csv      # ❌ Real customer data
└── Documents/
    └── contracts/         # ✅ Safe (outside working dir)
```

Claude Code skill running in `~/development/app/` can access everything in that folder.

#### After (GOOD)

```
~/development/
├── app/                    # Working directory for Claude Code
│   ├── .env.development   # ✅ Only dev keys
│   ├── src/
│   └── sample-data.csv    # ✅ Fake data for testing
└── secure/                # ❌ NOT in working directory
    ├── .env.production    # Stored securely, not in code dir
    └── customers.csv      # Real data, isolated

~/Documents/
└── contracts/             # ✅ Far from code directories
```

**Rule**: Production secrets and sensitive data should be **outside** any directory where you use AI tools.

---

### Strategy 3: API Key Best Practices

#### a) Separate Keys per Environment

**Minimum**:
- Production keys (on secure servers only)
- Development keys (on laptop, safe to expose)

**Better**:
- Production keys
- Staging keys
- Development keys
- Personal experimentation keys (most permissive, least valuable)

#### b) Least Privilege

**Each key should have minimal permissions needed.**

**Example AWS keys**:

❌ **Bad** (single key with full access):
```json
{
  "Effect": "Allow",
  "Action": "*",
  "Resource": "*"
}
```
If stolen: Attacker can delete entire AWS account.

✅ **Good** (separate keys with limited permissions):

**Production key** (on CI/CD):
```json
{
  "Effect": "Allow",
  "Action": ["s3:PutObject", "s3:GetObject"],
  "Resource": "arn:aws:s3:::production-bucket/*"
}
```

**Dev key** (on laptop):
```json
{
  "Effect": "Allow",
  "Action": ["s3:GetObject"],
  "Resource": "arn:aws:s3:::dev-bucket/*"
}
```

If dev key stolen: Attacker can read dev bucket. Can't write, can't access production.

#### c) Key Rotation

**Rotate keys every 90 days** (or immediately after installing untrusted tool).

**Automation**:
```bash
# Set calendar reminder for quarterly rotation
# Or use AWS/GCP features:
# - AWS: IAM key rotation policies
# - GCP: Service account key expiration
```

#### d) Monitoring

**Set up alerts for unusual API usage**:
- AWS CloudWatch alarms (unusual spending)
- Stripe dashboard (unusual transaction volume)
- Database query monitoring (unusual patterns)

**Example alerts**:
- "AWS bill >$500/day" (crypto mining detection)
- "Stripe refunds >10/hour" (fraud detection)
- "Database queries from unusual IP" (credential theft)

---

### Strategy 4: Data Classification

**Not all data is equally sensitive.** Classify and handle accordingly.

#### Classification Levels

| Level | Examples | AI Tool Policy |
|-------|----------|----------------|
| **Public** | Marketing content, public docs | ✅ OK to share with any AI tool |
| **Internal** | Internal processes, non-sensitive data | ✅ OK with vetted AI tools |
| **Confidential** | Customer PII, contracts, financials | ⚠️ Only with trusted, enterprise-grade AI (ChatGPT Team, Claude for Work) |
| **Secret** | API keys, passwords, trade secrets | ❌ **NEVER share with AI tools** |

#### Handling Rules

**Public**:
- Use ChatGPT, Claude, skills freely
- Example: "Summarize this blog post"

**Internal**:
- Use vetted AI tools only
- Example: "Help me write internal documentation" (OK with approved tools)

**Confidential**:
- Use only enterprise AI with DPAs (Data Processing Agreements)
- Anonymize before sharing if possible
- Example: "Analyze customer churn" → Use anonymized data (no names, emails)

**Secret**:
- **NEVER paste into AI chat**
- **NEVER store in files AI tools can access**
- Example: ❌ "Here's my AWS key, what's wrong with my code?"

---

### Strategy 5: File System Permissions (Advanced)

**Use OS permissions to restrict AI tool access.**

#### macOS/Linux: Restrict Claude Code

```bash
# Create secure directory that Claude Code can't access
mkdir ~/secure
chmod 700 ~/secure

# Move sensitive files there
mv ~/development/app/.env.production ~/secure/
mv ~/.aws/credentials ~/secure/.aws-credentials

# Claude Code running as your user still has access
# BUT: Creates awareness barrier (you must explicitly navigate there)
```

**More effective**: Use separate user account for AI experiments.

```bash
# Create limited user account (macOS)
sudo dscl . -create /Users/ai-experiments
sudo dscl . -create /Users/ai-experiments UserShell /bin/bash
sudo dscl . -create /Users/ai-experiments RealName "AI Experiments"
sudo dscl . -create /Users/ai-experiments UniqueID 502
sudo dscl . -create /Users/ai-experiments PrimaryGroupID 20

# Log into that account for AI tool testing
# That user can't access your main user's files
```

**Windows**: Use separate Windows user account for AI experiments.

---

### Strategy 6: Network Segmentation (Advanced)

**Isolate AI tools from production networks.**

#### For MCP Servers

**Use Docker network isolation**:
```yaml
# docker-compose.yml
services:
  mcp-server:
    networks:
      - isolated-network
    # No access to host network

networks:
  isolated-network:
    driver: bridge
    internal: true  # No internet access
```

#### For Development

**Use VPN or separate network for production access**:
- Development laptop: On home/office WiFi, runs AI tools
- Production access: Via VPN, only specific IP whitelisted
- If laptop compromised: Attacker can't access production (not on VPN)

---

## Practical Workflows

### Workflow 1: Safe Claude Code Usage

**Setup** (one-time):
1. Create `~/development/` for code
2. Create `~/secure/` for production secrets
3. Keep production `.env` in `~/secure/`, symlink to dev

**Daily practice**:
1. Work in `~/development/app/` with dev credentials
2. Use Claude Code skills freely (worst case: dev keys stolen)
3. Deploy via CI/CD (which has production credentials)
4. **Never** bring production credentials into development directory

---

### Workflow 2: Safe ChatGPT Usage

**Before pasting anything into ChatGPT**:
1. Ask: "What classification level is this?" (Public/Internal/Confidential/Secret)
2. If Confidential: Anonymize first
3. If Secret: **Don't paste** (find alternative approach)

**Anonymization example**:
```
❌ BAD:
"Customer john@example.com churned because pricing was too high.
Invoice #12345 shows they paid $5,000/mo."

✅ GOOD:
"Customer [REDACTED] churned due to pricing concerns.
Contract value ~$5k/mo, SaaS product."
```

---

### Workflow 3: Browser Extension Profiles

**Separate browser profiles by risk**:

**Profile 1: "Work - Sensitive"**
- No AI extensions
- Banking, HR systems, admin panels
- Use for production AWS console, Stripe dashboard, etc.

**Profile 2: "Work - General"**
- Approved AI extensions only (vetted per guide)
- Email, Slack, Notion
- AI writing assistants OK here

**Profile 3: "Personal/Experimental"**
- Any extensions (test new AI tools here)
- No work data
- Separate Google account

**How to create** (Chrome):
1. Chrome → Profiles → Add
2. Name profiles clearly
3. Install different extensions in each
4. Use appropriate profile for task

---

## Incident Response: Data Exposure

**If you suspect AI tool accessed sensitive data**:

### Immediate (Next 1 hour)

1. **Assume breach**:
   - What's the worst data that tool could have accessed?
   - List all files in its access scope

2. **Rotate credentials**:
   - Change all API keys that tool could have seen
   - Revoke tokens, reset passwords

3. **Monitor for abuse**:
   - Check AWS/GCP billing (crypto mining?)
   - Check Stripe for fraud (unusual transactions?)
   - Check database logs (unauthorized access?)

### Next 24 Hours

4. **Assess damage**:
   - Was customer data exposed? (PDPA notification required)
   - Financial loss?
   - Compliance violation?

5. **Contain**:
   - Remove malicious tool
   - Scan for persistence (backdoors)
   - See [Incident Response Guide](08-incident-response.md)

6. **Notify if required**:
   - Customers (if PII exposed)
   - Regulators (PDPA: within 72 hours)
   - Insurance (if you have cyber insurance)

---

## Monitoring & Auditing

### Weekly Checks

- [ ] Review active API keys (are there any you don't recognize?)
- [ ] Check cloud bills (unexpected usage?)
- [ ] Review AI tool installations (anything new you didn't approve?)

### Monthly Checks

- [ ] Run [permissions-audit.sh](../scripts/permissions-audit.sh)
- [ ] Review what data is in your working directories
- [ ] Move sensitive files to secure locations

### Quarterly Checks

- [ ] Full data exposure mapping (re-do Step 1-3 above)
- [ ] Rotate all dev API keys
- [ ] Review and update data classification

---

## Checklist: Am I Protected?

**Environment Separation**:
- [ ] Production API keys are NOT on my laptop
- [ ] I use separate dev/test keys for local development
- [ ] Dev keys have limited permissions (least privilege)

**Directory Isolation**:
- [ ] Sensitive data is outside my code working directories
- [ ] Production `.env` file is not in Git or code folders
- [ ] Customer data (CSV, database dumps) is isolated

**API Key Hygiene**:
- [ ] Each environment has its own API keys
- [ ] Keys are rotated quarterly (or have expiration)
- [ ] Monitoring/alerts set up for unusual API usage

**Data Classification**:
- [ ] I know what data is Public/Internal/Confidential/Secret
- [ ] I never share Secret data with AI tools
- [ ] I anonymize Confidential data before sharing with AI

**Access Auditing**:
- [ ] I've run permissions-audit.sh this month
- [ ] I know what AI tools can access what data
- [ ] No AI tool has access to production credentials

---

## Common Mistakes

❌ **"It's OK, this is just a test key"** → Then label it clearly, set expiration, limit permissions
❌ **"I'll be careful not to use the skill in that directory"** → You'll forget. Automate protection.
❌ **"This AI tool is safe, it's from OpenAI/Anthropic"** → Even safe tools can be compromised via supply chain
❌ **"I don't have any secrets on my laptop"** → Check `.env`, `.aws/credentials`, `.ssh/`, Git history
❌ **"I'll rotate keys after I finish this project"** → You'll forget. Rotate now, set recurring reminder.

---

## 🔗 Related Resources

**Before reading this guide**:
- [Assessment](01-assessment.md) - See Section 6: API Key Protection

**Implementation guides**:
- [Skill Vetting](02-skill-vetting.md) - Review permissions before installing
- [MCP Servers](03-mcp-servers.md) - Sandbox MCP servers with Docker
- [Incident Response](08-incident-response.md) - What to do if data is exposed

**External resources**:
- [AWS IAM Best Practices](https://docs.aws.amazon.com/IAM/latest/UserGuide/best-practices.html)
- [OWASP API Security](https://owasp.org/www-project-api-security/)

---

**Last Updated**: February 2026

---

**Remember**: The goal isn't to prevent all AI tool access (that's impossible if you want to use AI tools). The goal is to ensure that when a malicious tool inevitably appears, it can only access worthless data (dev keys, test data), not production secrets.

**Golden Rule**: If you wouldn't want it published on the front page of the newspaper, don't let an AI tool access it.
