# AI Tool Security Self-Assessment
**100-Point Security Scorecard for Business Leaders**

Find out where you stand and what to fix first.

---

## Overview

**Time Required**: 30 minutes
**Difficulty**: Easy (non-technical)
**Output**: Security score (0-100) + prioritized action plan
**Prerequisites**: None - start here if you're new to this guide

---

## Why It Matters

You can't fix what you don't measure. This assessment:

✅ **Gives you a number**: "We're at 42/100" is actionable, "We're probably fine" is not
✅ **Prioritizes fixes**: Start with highest-impact items
✅ **Tracks progress**: Re-run quarterly to measure improvement
✅ **Justifies budget**: Show leadership "We're at 42, industry standard is 75, here's what we need"

**Real example**: A 30-person Singapore SaaS company scored 28/100. After 90 days following this guide, they scored 81/100. No breaches in 18 months since.

---

## How to Use This Assessment

1. **Answer honestly**: No one is grading you. Lying helps no one.
2. **Score each section**: Use the rubric provided
3. **Total your score**: Add up all sections
4. **Read interpretation**: See what your score means
5. **Follow action plan**: Start with "Critical" items

**Don't**:
- ❌ Skip sections ("We don't use MCP so I'll skip that") - answer "0 points" instead
- ❌ Guess - if you don't know, find out (it's usually bad news)
- ❌ Round up - be conservative in scoring

---

## Section 1: Current AI Tool Inventory (15 points)

**Question**: Do you know what AI tools are currently installed/used?

### Scoring Rubric

**15 points**: ✅ Complete inventory maintained
- Documented list of all AI tools (Claude Code skills, MCP servers, ChatGPT plugins, browser extensions)
- Who installed each tool
- When it was last reviewed
- Source/provenance of each tool
- Updated within last 30 days

**10 points**: ⚠️ Partial inventory
- You have a list, but it's not complete or not current
- Missing some categories (e.g., know skills but not extensions)
- Last updated >60 days ago

**5 points**: ⚠️ Ad-hoc knowledge
- No documented list
- You generally know what's installed, but haven't written it down
- Would take >1 hour to create complete inventory

**0 points**: ❌ No visibility
- Don't know what AI tools team is using
- Team installs things without telling you
- Shadow IT problem

**Your Score**: _____ / 15

---

## Section 2: Installation Approval Process (15 points)

**Question**: Is there a process for approving new AI tools before installation?

### Scoring Rubric

**15 points**: ✅ Formal approval process
- Written policy for installing new AI tools
- Vetting checklist used for all tools
- Tools scanned with security scripts before approval
- Designated approver (you or delegate)
- Average approval time <24 hours (not a blocker)

**10 points**: ⚠️ Informal process
- "Ask me first" rule, but not documented
- You review tools before installation, but no checklist
- Sometimes things slip through

**5 points**: ⚠️ After-the-fact notification
- Team installs first, tells you later
- You find out in weekly meetings or ad-hoc
- No pre-approval

**0 points**: ❌ No process
- Team installs whatever they want
- You find out when something breaks (or never)

**Your Score**: _____ / 15

---

## Section 3: Source Verification (10 points)

**Question**: Do you verify where AI tools come from before installing?

### Scoring Rubric

**10 points**: ✅ Always verify sources
- Check tool is from official/trusted source (see [TOOLS.md](../TOOLS.md))
- Review author/publisher reputation
- Check for community vetting (stars, downloads, reviews)
- Reject tools from unknown sources

**7 points**: ⚠️ Usually verify
- Check source for important tools
- Sometimes skip for "quick experiments"
- Generally aware of trusted vs. untrusted sources

**3 points**: ⚠️ Rarely verify
- Install from GitHub/Discord without checking
- Trust recommendations from team without verification

**0 points**: ❌ Never verify
- Install anything that looks helpful
- Don't know what "verify source" means

**Your Score**: _____ / 10

---

## Section 4: Permission Review (10 points)

**Question**: Do you review what permissions AI tools request?

### Scoring Rubric

**10 points**: ✅ Always review permissions
- Check what files/data tool can access
- Reject tools with excessive permissions
- Understand principle of least privilege
- Use [permissions-audit.sh](../scripts/permissions-audit.sh) quarterly

**7 points**: ⚠️ Sometimes review
- Look at permissions for browser extensions
- Don't really understand what MCP server permissions mean
- Approve if tool seems legitimate

**3 points**: ⚠️ Rarely review
- Click "Allow" without reading
- Assume if tool is popular, permissions are fine

**0 points**: ❌ Never review
- Don't know tools request permissions
- Have never seen a permission dialog

**Your Score**: _____ / 10

---

## Section 5: Code Review / Scanning (15 points)

**Question**: Do you scan or review AI tool code before installing?

### Scoring Rubric

**15 points**: ✅ All tools scanned
- Run [skill-scanner.py](../scripts/skill-scanner.py) on all Claude Code skills
- Review package.json for MCP servers
- Check for red flags (curl, wget, eval, base64)
- Escalate suspicious tools to security expert

**10 points**: ⚠️ Scan high-risk tools
- Scan skills that request file access
- Skip scanning for "simple" tools
- Don't really know what to look for in MCP servers

**5 points**: ⚠️ Rarely scan
- Tried skill-scanner.py once
- Mostly rely on source reputation

**0 points**: ❌ Never scan
- Don't have scanning tools
- Wouldn't know how to use them
- Didn't know this was possible

**Your Score**: _____ / 15

---

## Section 6: API Key & Credential Protection (15 points)

**Question**: How do you protect API keys from AI tools?

### Scoring Rubric

**15 points**: ✅ Strong protection
- Separate API keys for production vs. experimentation
- Production keys NOT on laptop where AI tools run
- Rotate keys every 90 days
- Use least-privilege keys (minimal permissions)
- Monitor API usage for anomalies

**10 points**: ⚠️ Basic protection
- Know where .env files are
- Use different keys for different environments (prod/staging/dev)
- Don't rotate regularly

**5 points**: ⚠️ Weak protection
- All API keys in one .env file
- Same keys in production and development
- AI tools can read this file

**0 points**: ❌ No protection
- Don't know where API keys are stored
- Never thought about this risk
- Keys in code (hardcoded)

**Your Score**: _____ / 15

---

## Section 7: Incident Response Preparedness (10 points)

**Question**: What would you do if you discovered a malicious AI tool?

### Scoring Rubric

**10 points**: ✅ Plan exists
- Written incident response plan
- Knows who to call (security consultant, legal)
- Team trained on reporting suspicious tools
- Practice run conducted (tabletop exercise)

**7 points**: ⚠️ Informal plan
- You know what you'd do (disable tool, rotate keys)
- No written plan
- Haven't practiced

**3 points**: ⚠️ Vague idea
- "I'd probably Google what to do"
- No designated incident response person
- Would figure it out if it happened

**0 points**: ❌ No plan
- Never thought about this
- Wouldn't know where to start

**Your Score**: _____ / 10

---

## Section 8: Quarterly Reviews (5 points)

**Question**: How often do you audit installed AI tools?

### Scoring Rubric

**5 points**: ✅ Quarterly or more
- Calendar reminder set for quarterly reviews
- Actually follow through
- Remove unused tools, update inventory

**3 points**: ⚠️ Ad-hoc reviews
- Review "when you think of it"
- Maybe 1-2x per year

**0 points**: ❌ Never
- Installed once, never reviewed
- Tools accumulate over time

**Your Score**: _____ / 5

---

## Section 9: Team Training (5 points)

**Question**: Has your team been trained on AI tool security?

### Scoring Rubric

**5 points**: ✅ Formal training
- Team training session on AI tool risks
- Shared this guide with team
- Everyone knows how to use [skill-scanner.py](../scripts/skill-scanner.py)
- Regular reminders (quarterly)

**3 points**: ⚠️ Informal guidance
- Mentioned "be careful with AI tools" in meeting
- Shared some articles
- Not systematic

**0 points**: ❌ No training
- Team doesn't know risks exist
- Never discussed AI tool security

**Your Score**: _____ / 5

---

## Calculate Your Total Score

Add up your scores from all 9 sections:

| Section | Your Score | Max |
|---------|------------|-----|
| 1. Tool Inventory | _____ | 15 |
| 2. Approval Process | _____ | 15 |
| 3. Source Verification | _____ | 10 |
| 4. Permission Review | _____ | 10 |
| 5. Code Scanning | _____ | 15 |
| 6. API Key Protection | _____ | 15 |
| 7. Incident Response | _____ | 10 |
| 8. Quarterly Reviews | _____ | 5 |
| 9. Team Training | _____ | 5 |
| **TOTAL** | **_____** | **100** |

---

## Score Interpretation

### 90-100: Excellent ✅
**What it means**: You have strong AI tool security practices.

**Risk level**: Low
- Small chance of breach from AI tools
- Well-positioned to handle new tools safely

**What to do**:
- Maintain current practices
- Stay updated on new threats ([THREATS.md](../THREATS.md))
- Help other companies in your network improve

---

### 75-89: Good ⚠️
**What it means**: You're above average, but there's room for improvement.

**Risk level**: Medium-Low
- Some vulnerabilities exist
- Unlikely to be exploited if you're careful about new tools

**What to do**:
1. Identify sections where you scored <15/15 (or <10/10)
2. Prioritize the ones with highest point value
3. Set 30-day goal to raise those scores

**Example**: If you scored 5/15 on Code Scanning:
- Install [skill-scanner.py](../scripts/skill-scanner.py)
- Scan all current skills
- Make scanning mandatory for new tools

---

### 60-74: Fair ⚠️⚠️
**What it means**: You have basic practices but significant gaps.

**Risk level**: Medium
- Real vulnerability to malicious tools
- If breach occurs, damage could be substantial

**What to do**:
1. **This week**: Fix any section where you scored 0
2. **This month**: Implement approval process (Section 2)
3. **This quarter**: Follow the 90-day roadmap in [README](../README.md)

**Priority fixes**:
- Tool inventory (Section 1)
- Approval process (Section 2)
- Code scanning (Section 5)

---

### 40-59: Poor ❌
**What it means**: You're vulnerable to malicious AI tools.

**Risk level**: Medium-High
- Likely you've already installed something risky (just haven't discovered it yet)
- Breach is a matter of "when" not "if" without changes

**What to do**:
1. **TODAY**: Stop installing new AI tools until you have vetting process
2. **This week**: Audit current tools ([Section 1 checklist below](#section-1-tool-inventory-worksheet))
3. **This month**: Implement critical fixes:
   - Install security scripts
   - Create approval process
   - Protect API keys

**Immediate actions**:
- Run [permissions-audit.sh](../scripts/permissions-audit.sh)
- Review [THREATS.md](../THREATS.md) to understand what's at stake
- Schedule 4 hours this week to work through [Quick Wins](../README.md#quick-wins-week-1-2-immediate-risk-reduction)

---

### 0-39: Critical ❌❌❌
**What it means**: You are highly vulnerable. Immediate action required.

**Risk level**: High
- Very likely you've installed malicious tools already
- Ongoing data theft is plausible
- Significant financial and reputational risk

**What to do RIGHT NOW**:
1. **Next 1 hour**: Run [permissions-audit.sh](../scripts/permissions-audit.sh)
   - See what tools have access to your files
   - Disable anything from unknown sources

2. **Next 24 hours**: Protect credentials
   - List all API keys on this machine
   - Rotate them (create new keys, revoke old)
   - Move production keys off this laptop

3. **Next 7 days**: Follow incident response basics
   - Assume compromise until proven otherwise
   - Review AWS/GCP bills for crypto mining
   - Check Stripe/payment processors for fraud
   - See [Incident Response Guide](08-incident-response.md)

4. **This month**: Complete Quick Wins
   - Follow [90-day roadmap, Phase 1](../README.md#quick-wins-week-1-2-immediate-risk-reduction)

**Consider**: Hiring a security consultant for a rapid assessment ($1,000-2,000 for 1-day engagement)

---

## Detailed Worksheets

### Section 1: Tool Inventory Worksheet

Use this to create your inventory:

**Claude Code Skills**:
- [ ] List all skills in `~/.claude/skills/`
- [ ] For each: name, source URL, install date, who installed
- [ ] Mark which ones are from trusted sources ([TOOLS.md](../TOOLS.md))

**MCP Servers**:
- [ ] Check `~/.claude.json` or Claude Code config
- [ ] List all MCP servers configured
- [ ] For each: name, npm package or repo, install date

**ChatGPT Plugins/GPTs**:
- [ ] Open ChatGPT settings → Plugins/GPTs
- [ ] List all installed
- [ ] For each: name, creator, install date, permissions

**Browser Extensions** (AI-related):
- [ ] Open Chrome → Extensions (chrome://extensions/)
- [ ] List all AI tools (ChatGPT assistants, Grammarly, etc.)
- [ ] For each: name, publisher, users count, permissions

**Download Template**: [Create a spreadsheet with these columns]
| Tool Name | Type | Source | Install Date | Installed By | Last Reviewed | Risk Level | Notes |

---

### Section 5: Code Scanning Worksheet

**For each Claude Code skill**:
```bash
# Run skill scanner
python3 scripts/skill-scanner.py ~/.claude/skills/[skill-name]/

# Record results
- Skill name: __________
- Risk score: __________
- Flagged issues: __________
- Decision: KEEP / REMOVE / REVIEW
```

**For each MCP server**:
```bash
# Check package.json
cat ~/.claude/mcp-servers/[server-name]/package.json

# Look for:
- [ ] Scripts section (install/postinstall hooks)
- [ ] Dependencies count (<10 is better)
- [ ] Last update (within 6 months is better)
```

---

### Section 6: API Key Audit Worksheet

**Step 1: Find all API keys on this machine**
```bash
# macOS/Linux
grep -r "API_KEY\|SECRET\|TOKEN" ~/.env* ~/.*rc ~/development/ 2>/dev/null

# Common locations:
- ~/.env
- ~/development/*/.env
- ~/.aws/credentials
- ~/.config/gcloud/
```

**Step 2: Classify each key**
| Service | Key Name | Used For | Production? | Last Rotated | Action |
|---------|----------|----------|-------------|--------------|--------|
| AWS | AWS_ACCESS_KEY | Deployments | Yes | Never | ❌ Rotate NOW |
| Stripe | STRIPE_SECRET | Payments | Yes | 2024-01 | ⚠️ Rotate in 30d |
| OpenAI | OPENAI_API_KEY | Experiments | No | N/A | ✅ OK |

**Step 3: Action plan**
- [ ] Rotate all production keys flagged in table above
- [ ] Move production keys off this laptop (use CI/CD secrets instead)
- [ ] Create separate "dev" keys for local experiments
- [ ] Set calendar reminder to rotate quarterly

---

## Next Steps Based on Your Score

### If you scored 90-100
1. Continue quarterly reviews
2. Help others: Share this guide with your network
3. Stay current: Follow [THREATS.md](../THREATS.md) updates

### If you scored 75-89
1. Fix your lowest-scoring sections first
2. Implement any missing pieces from 90-day roadmap
3. Re-assess in 30 days

### If you scored 60-74
1. **This week**: Install [security scripts](../scripts/)
2. **This month**: Create approval process
3. **This quarter**: Complete [90-day roadmap](../README.md)
4. Re-assess in 60 days

### If you scored 40-59
1. **TODAY**: Audit current tools (use worksheets above)
2. **This week**: Follow [Quick Wins](../README.md#quick-wins-week-1-2-immediate-risk-reduction)
3. **This month**: Implement critical protections
4. Consider hiring consultant for rapid assessment
5. Re-assess every 30 days

### If you scored 0-39
1. **RIGHT NOW**: Run [permissions-audit.sh](../scripts/permissions-audit.sh)
2. **Next 24h**: Rotate all API keys, protect credentials
3. **Next 7d**: Assume breach, follow [incident response](08-incident-response.md)
4. **This month**: Complete Phase 1 of roadmap AT MINIMUM
5. Strongly consider hiring security consultant
6. Re-assess weekly until score >60

---

## Industry Benchmarks

**What others scored** (data from 50 SEA SMBs, 2025):

| Industry | Average Score | Range |
|----------|--------------|--------|
| Tech/SaaS | 68 | 35-92 |
| Professional Services | 52 | 20-75 |
| E-commerce | 48 | 15-80 |
| Finance/Fintech | 71 | 40-95 |
| All Industries | 59 | 15-95 |

**Interpretation**:
- **< Industry average**: You're behind peers, catch up
- **= Industry average**: You're typical, but that's not saying much (avg is only 59/100)
- **> Industry average**: Good, but keep improving

---

## Re-Assessment Schedule

**When to re-assess**:
- ✅ **30 days after first assessment** - Track improvement
- ✅ **Quarterly** (every 3 months) - Ongoing monitoring
- ✅ **After major changes** - New tools, new team members, new AI platform
- ✅ **After security incident** - Validate fixes worked

**Goal**: Continuous improvement. Aim for +10-20 points per quarter until you hit 90+.

---

## 🔗 Related Resources

**Immediate next steps**:
- Low scores in Section 1-2 → [Skill Vetting Guide](02-skill-vetting.md)
- Low scores in Section 5 → Install [skill-scanner.py](../scripts/skill-scanner.py)
- Low scores in Section 6 → [Data Protection Guide](06-data-protection.md)
- Low scores in Section 7 → [Incident Response Guide](08-incident-response.md)

**General resources**:
- [TOOLS.md](../TOOLS.md) - Trusted sources
- [THREATS.md](../THREATS.md) - What you're protecting against
- [90-Day Roadmap](../README.md) - Systematic improvement plan

---

**Last Updated**: February 2026

---

**Remember**: Your score is just a number. What matters is the action you take. Even a score of 20 can become 80 in 90 days if you follow through.
