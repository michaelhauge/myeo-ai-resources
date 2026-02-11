# Claude Code Skill Review Checklist
**Fill-in-the-blank checklist for reviewing AI tools before installation**

---

## Skill Information

**Skill Name**: _____________________________________

**Source URL**: _____________________________________ (GitHub link, OpenClaw URL, etc.)

**Reviewer**: _______________________________________ (Your name)

**Review Date**: ____________________ (YYYY-MM-DD)

**Requested By**: ___________________________________ (Who wants to install this?)

---

## 1. Source Check

Where did this skill come from?

- [ ] **Official Anthropic** (docs.anthropic.com)
- [ ] **OpenClaw verified** (github.com/cline/openclaw)
- [ ] **Reputable GitHub author** (>1,000 stars, established profile)
- [ ] **Random GitHub** (<1,000 stars, individual developer)
- [ ] **Direct file share** (Discord, Slack, email) → **⚠️ High risk**

**Source URL verified**: [ ] Yes [ ] No

**Notes**: ___________________________________________________________

---

## 2. Author Reputation

**GitHub author** (if applicable):

- **Account age**: __________ (days/months/years)
- **Public repositories**: __________ (count)
- **Followers**: __________
- **Stars on this repo**: __________

**Red flags observed** (check all that apply):
- [ ] Account <30 days old
- [ ] Only this one repository
- [ ] No profile information
- [ ] Poor English in README (malware indicator)
- [ ] No license file

**Author reputation**: [ ] Good [ ] Acceptable [ ] Poor [ ] **REJECT**

---

## 3. Size & Complexity

**SKILL.md file**:
- **Line count**: __________ (< 1,000 = normal, > 3,000 = suspicious)

**Scripts folder**:
- **Number of scripts**: __________ (0-2 = normal, > 3 = suspicious)

**Binary files**:
- [ ] No binary files (.exe, .dmg, .bin) ✅
- [ ] **Contains binaries** → **⚠️ IMMEDIATE REJECTION**

**Complexity matches function**:
- [ ] Yes (simple skill, simple code)
- [ ] No (simple function but overly complex) → **⚠️ Suspicious**

---

## 4. Automated Scan

**skill-scanner.py output**:

```
# Command run:
python3 scripts/skill-scanner.py ~/.claude/skills/[skill-name]/

# Risk score: __________

# Flagged issues:
[ ] No issues (LOW risk) ✅
[ ] Warnings (MEDIUM risk):
    - Issue 1: _________________________________________________
    - Issue 2: _________________________________________________
[ ] Critical issues (HIGH risk) → **⚠️ REJECT or ESCALATE**
    - Critical 1: _____________________________________________
    - Critical 2: _____________________________________________
```

**Risk score**: [ ] LOW ✅ [ ] MEDIUM ⚠️ [ ] HIGH ❌

---

## 5. Permissions Review

**What permissions does this skill request?**

(Check SKILL.md header or README for documented permissions)

Requested permissions:
- [ ] Read files in current directory
- [ ] Write files in current directory
- [ ] Execute bash commands
- [ ] Network access (API calls)
- [ ] Access to parent directories
- [ ] Full filesystem access
- [ ] Other: ___________________________________________________

**Permissions match claimed functionality**:
- [ ] Yes (skill needs these permissions to work)
- [ ] No (excessive permissions) → **⚠️ REJECT**

**Justification for permissions**: _____________________________

___________________________________________________________________

---

## 6. Community Signals

**Searched for security concerns**:
- [ ] Google search: "[skill name] security OR malware"
- [ ] Reddit: site:reddit.com "[skill name]"
- [ ] GitHub issues reviewed

**Results**:
- [ ] No security complaints ✅
- [ ] Positive community feedback
- [ ] **Security concerns found** → **⚠️ Describe below**

**Community feedback**: ___________________________________________

___________________________________________________________________

---

## 7. Manual Spot Check

**Reviewed SKILL.md for red flag keywords** (Ctrl+F / Cmd+F):

- [ ] `rm -rf` → **Found: Yes / No** (If Yes: Why needed? _______)
- [ ] `eval` → **Found: Yes / No** (If Yes: Why? _______________)
- [ ] `base64` → **Found: Yes / No** (If Yes: **⚠️ Obfuscation?**)
- [ ] `curl http://` → **Found: Yes / No** (If Yes: Domain: ________)
- [ ] `wget` → **Found: Yes / No** (If Yes: Domain: ________)

**Suspicious code sections noted**:

Line numbers: ___________________________________________________

Description: _____________________________________________________

___________________________________________________________________

---

## Final Decision

**Overall risk assessment**:

| Check | Result | Weight |
|-------|--------|--------|
| Source | ✅ ⚠️ ❌ | Critical |
| Author | ✅ ⚠️ ❌ | High |
| Size/Complexity | ✅ ⚠️ ❌ | Medium |
| Automated Scan | ✅ ⚠️ ❌ | Critical |
| Permissions | ✅ ⚠️ ❌ | High |
| Community | ✅ ⚠️ ❌ | Medium |
| Manual Spot Check | ✅ ⚠️ ❌ | High |

**Decision** (check one):

- [ ] **APPROVE** - All checks pass, install with confidence
- [ ] **APPROVE WITH RESTRICTIONS** - Acceptable with "On Click Only" or limited permissions
- [ ] **ESCALATE TO EXPERT** - Uncertain, need technical review
- [ ] **REJECT** - Failed critical checks or too many warnings

---

## Approval Information (If Approved)

**Approved by**: _______________________________________ (Name)

**Approval date**: ____________________ (YYYY-MM-DD)

**Conditions** (if any):
- [ ] Use only in test/dev environment (not production)
- [ ] Re-review before using with customer data
- [ ] Monitor for updates (re-scan quarterly)
- [ ] Other: ___________________________________________________

**Installed to**: _____________________________________________

**Installation date**: ____________________ (YYYY-MM-DD)

**Installed by**: ____________________ (Name)

---

## Monitoring & Re-Review

**Scheduled re-review**: ____________________ (YYYY-MM-DD) [90 days from install]

**Trigger for re-review** (check when applicable):
- [ ] Skill updates (new version released)
- [ ] Security news about this skill
- [ ] Permissions change request
- [ ] Quarterly security audit

**Re-review notes**: _______________________________________________

___________________________________________________________________

---

## Rejection Information (If Rejected)

**Rejected by**: _______________________________________ (Name)

**Rejection date**: ____________________ (YYYY-MM-DD)

**Primary reason for rejection** (check one):
- [ ] Unknown/untrusted source
- [ ] Poor author reputation
- [ ] skill-scanner.py flagged HIGH risk
- [ ] Excessive permissions for claimed function
- [ ] Security concerns in community feedback
- [ ] Suspicious code found in manual review
- [ ] Multiple warnings across different checks

**Details**: ______________________________________________________

___________________________________________________________________

**Communicated to requester**: [ ] Yes [ ] No

**Suggested alternative** (if available): _________________________

___________________________________________________________________

---

## Escalation Information (If Escalated)

**Escalated by**: _______________________________________ (Name)

**Escalation date**: ____________________ (YYYY-MM-DD)

**Escalated to**: _______________________________________ (Name/Team)

**Reason for escalation**: _______________________________________

___________________________________________________________________

**Expert review result**:
- [ ] Approved after expert review (Date: __________)
- [ ] Rejected after expert review (Date: __________)
- [ ] Pending expert review

**Expert notes**: _________________________________________________

___________________________________________________________________

---

## Related Documentation

**skill-scanner.py output** (attach or link): ____________________

**Screenshots** (if suspicious code found): _______________________

**External references** (articles, security reports): ____________

___________________________________________________________________

---

## Template Version

**Template version**: 1.0.0
**Last updated**: February 2026
**Source**: AI Tooling Security Guide (MyEO AI Resources)

---

## Notes for Reviewers

**How to use this checklist**:
1. Fill out sections 1-7 in order
2. For each section, check boxes and fill blanks
3. Make decision in "Final Decision" section
4. If approving: Fill "Approval Information"
5. If rejecting: Fill "Rejection Information"
6. If escalating: Fill "Escalation Information"
7. Keep this checklist for records (3 years for compliance)

**Time estimate**: 15-20 minutes for complete review

**When in doubt**: ESCALATE or REJECT. Better safe than sorry.
