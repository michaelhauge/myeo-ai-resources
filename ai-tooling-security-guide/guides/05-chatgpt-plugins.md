# ChatGPT Plugin & Custom GPT Security Guide
**Safely Evaluating ChatGPT Plugins and Custom GPTs (30-Minute Checklist)**

ChatGPT plugins and custom GPTs extend ChatGPT's capabilities - but also extend security risks.

---

## Overview

**Time Required**: 30 minutes per plugin/GPT
**Difficulty**: Easy (non-technical)
**Output**: USE / AVOID / RESTRICT decision
**Prerequisites**: ChatGPT Plus or Team account (required for plugins/GPTs)

---

## Understanding the Risk

### What Can ChatGPT Plugins/GPTs Access?

**Plugins** (third-party integrations):
- ✅ Your prompts/conversations (whatever you share with ChatGPT)
- ✅ Data you explicitly ask ChatGPT to send to plugin
- ✅ API calls on your behalf (to plugin's servers)
- ❌ **Cannot** access your local files (unlike Claude Code skills)
- ❌ **Cannot** run commands on your computer

**Custom GPTs** (community-created AI assistants):
- ✅ Your conversations with that GPT
- ✅ Files you upload to that GPT
- ✅ Web browsing (if GPT has web access enabled)
- ✅ Actions (API calls if GPT creator configured them)
- ❌ **Cannot** access other GPT conversations

**Key difference vs. browser extensions**: Plugins/GPTs are **sandboxed** (can't access your local computer), but they **can access and process whatever you share** with ChatGPT.

---

## The 5-Step Plugin Vetting Process

---

### Step 1: Source & Discovery Check (5 minutes)

**Question**: Where did you find this plugin/GPT?

#### Trusted Discovery Paths

✅ **ChatGPT Plugin Store** (accessed via ChatGPT interface)
- Path: ChatGPT → Click "Plugins" → "Plugin store"
- Review process: OpenAI vetting before approval
- Risk: Low-Medium (vetted but not perfect)

✅ **GPT Store "Featured" Section**
- Path: ChatGPT → "Explore GPTs" → "Featured"
- Review process: OpenAI curated picks
- Risk: Low (hand-selected by OpenAI)

✅ **GPT Store "By ChatGPT"**
- Created by OpenAI themselves
- Risk: Very Low (first-party)

⚠️ **GPT Store "Browse All"**
- Community-created GPTs
- Less curation
- Risk: Medium (review carefully)

❌ **Direct GPT links** from Discord, forums, email
- No context on who created it
- Could be malicious
- Risk: Medium-High

❌ **"Jailbreak" or "Unlocked" ChatGPT variants**
- Bypass OpenAI safety features
- Often malicious
- Risk: Extreme (**Never use**)

**Checklist**:
- [ ] Plugin from official ChatGPT Plugin Store
- [ ] GPT from official GPT Store (not direct link from stranger)
- [ ] NOT a jailbreak or modified ChatGPT variant

**Decision**:
- ✅ Pass → Continue
- ❌ Fail → **REJECT**

---

### Step 2: Creator Verification (10 minutes)

**Question**: Who created this plugin/GPT?

#### For Plugins

**Check plugin listing**:
- [ ] Developer name listed
- [ ] Developer website linked
- [ ] Company is real (Google the company, check website)
- [ ] Multiple plugins from same developer (established presence)

**Red flags**:
- ❌ Anonymous developer ("AI Helper Team", "Plugin Creator")
- ❌ No website or contact info
- ❌ Website doesn't mention the plugin (abandoned? fake?)
- ❌ Developer account created recently (<3 months)

#### For Custom GPTs

**Check GPT profile** (click GPT name → Info):
- [ ] Creator name shown
- [ ] Creator verification badge (if available)
- [ ] Creator description (who they are, why they made this)
- [ ] "Conversations" count (>1,000 shows popularity)

**OpenAI Verification Badge**:
- ✅ Checkmark badge = OpenAI verified creator
- Means: Creator identity confirmed by OpenAI
- More trustworthy (but still review)

**Red flags**:
- ❌ "By [Anonymous]" or no creator shown
- ❌ <10 conversations (brand new, untested)
- ❌ Creator has many similar GPTs with clickbait names
- ❌ No description of GPT's purpose

**Checklist**:
- [ ] Creator is identifiable (company or person)
- [ ] Creator has credibility (verified badge, website, history)
- [ ] Plugin/GPT has traction (many users/conversations)

**Decision**:
- ✅ Pass → Continue
- ⚠️ Borderline → Proceed with caution
- ❌ Fail → **REJECT**

---

### Step 3: Permission & Capabilities Review (10 minutes)

**Question**: What can this plugin/GPT do?

#### Plugin Capabilities

Plugins can request:
- **Web Search**: Search the internet
- **API Access**: Call external services
- **File Upload**: Accept file uploads from you
- **Authentication**: Ask for your login to third-party services

**How to check**:
1. Click plugin in Plugin Store
2. Read "Capabilities" section
3. Check "Authentication" (does it ask you to log into external service?)

**Permission decision framework**:

| Plugin Type | Justified Capabilities | Red Flags |
|-------------|----------------------|-----------|
| **Web Search Plugin** | Web search | Authentication (why?) |
| **Calculator** | None (pure math) | API access (why?) |
| **Travel Booking** | API access + auth (to booking site) | Web search (why?) |
| **PDF Reader** | File upload | Authentication (why?) |
| **Code Interpreter** | File upload, code execution | N/A (built-in by OpenAI) |

**Red flags**:
- ❌ Requests capabilities not needed for function
- ❌ Authentication to unknown service
- ❌ "Full access to your [X] account" (too broad)

#### GPT Actions

GPTs can have "Actions" configured (API calls to external services).

**How to check**:
1. Click GPT → "Configuration" or "About"
2. Look for "Actions" section
3. If present, read what APIs it calls

**Red flags**:
- ❌ Calls to unknown/suspicious domains
- ❌ Sends your conversation data to third parties
- ❌ "Posts on your behalf" without clear consent flow

**Checklist**:
- [ ] Capabilities/actions are documented
- [ ] Capabilities match claimed functionality
- [ ] No excessive permissions
- [ ] Authentication requests are justified

**Decision**:
- ✅ Pass → Continue
- ❌ Fail → **REJECT**

---

### Step 4: Privacy & Data Handling Review (3 minutes)

**Question**: What happens to your data?

#### For Plugins

**Find privacy policy**:
- Plugin store listing → "Privacy Policy" link
- Or Google: `"[plugin name]" privacy policy`

**Key questions**:
- [ ] Where is data sent? (plugin's servers? third-party AI?)
- [ ] Is data retained? (deleted after use vs. stored indefinitely)
- [ ] Is data used for training? (your conversations used to improve their AI)
- [ ] Is data shared/sold? (to advertisers, data brokers)

**Good privacy practices**:
- ✅ Data processed only for plugin function
- ✅ Data deleted after session
- ✅ NOT used for training
- ✅ NOT shared with third parties
- ✅ Encrypted in transit (HTTPS)

**Bad privacy practices**:
- ❌ "We may use your data for any purpose"
- ❌ "Data retained indefinitely"
- ❌ "Data used to improve our AI models" (without opt-out)
- ❌ "Shared with partners"

#### For GPTs

**GPTs inherit ChatGPT privacy**:
- Your conversations with GPTs go through OpenAI
- OpenAI privacy policy applies
- **But**: If GPT has "Actions" (API calls), your data is sent to those APIs too

**Check GPT configuration**:
- If GPT has Actions → Check where Actions send data
- If GPT requests web browsing → Your queries sent to search engines

**Important**: GPT creators **can see aggregate data** about GPT usage (number of conversations, popular queries), but **should not** see your actual conversations (OpenAI policy).

**Checklist**:
- [ ] Privacy policy exists (for plugins) and is acceptable
- [ ] Data handling is reasonable (not excessive retention)
- [ ] No data selling or unauthorized sharing
- [ ] For GPTs with Actions: Understand where data goes

**Decision**:
- ✅ Pass → Continue
- ⚠️ Uncertain → Use only for non-sensitive data
- ❌ Fail → **REJECT**

---

### Step 5: Reviews & Community Signals (2 minutes)

**Question**: What are other users saying?

#### Where to Look

**For plugins**:
- ChatGPT Plugin Store reviews (if available)
- Google: `"[plugin name]" review OR security OR privacy`
- Reddit: `site:reddit.com "[plugin name]"`
- Twitter: `"[plugin name]" ChatGPT`

**For GPTs**:
- Conversation count (higher = more vetted)
- Search Twitter/Reddit for mentions
- Look for "This GPT leaked my data" type complaints

#### Good Signs

- ✅ High conversation/usage count (>10,000 for GPTs)
- ✅ Positive reviews from real users
- ✅ Discussion in tech communities (HackerNews, Reddit)
- ✅ No security incidents reported

#### Red Flags

- ❌ "This plugin stole my API key"
- ❌ "GPT shared my conversation publicly"
- ❌ "Plugin uploaded my data without permission"
- ❌ No discussion anywhere (brand new, untested)

**Checklist**:
- [ ] Searched for security complaints (found none)
- [ ] Community sentiment is positive or neutral
- [ ] No reports of data leaks or misuse

**Decision**:
- ✅ Pass → Approve
- ❌ Fail → **REJECT**

---

## Post-Approval: Safe Usage Practices

**Even after approving a plugin/GPT**, follow these practices:

### 1. Separate Accounts

**Use different ChatGPT accounts for different risk levels**:

- **Work account** (ChatGPT Team):
  - Only approved, vetted plugins
  - No experimental GPTs
  - No uploading sensitive files

- **Personal/experimental account** (ChatGPT Plus):
  - Try new GPTs here
  - Test plugins before approving for work
  - No work data

**Cost**: ~$20/mo per account (worth it for separation)

---

### 2. Data Minimization

**Don't share sensitive data** with plugins/GPTs:

❌ **Never share**:
- API keys, passwords, tokens
- Customer data (names, emails, payment info)
- Proprietary code (trade secrets)
- Financial data (revenue, costs, projections)
- Personal data (SSN, passport, medical)

✅ **OK to share** (with vetted plugins/GPTs):
- Public information
- Anonymized data
- General questions
- Learning/educational content

**Rule of thumb**: "Would I post this on Twitter?" If no, don't share with plugin/GPT.

---

### 3. Monitor Plugin Permissions

**ChatGPT doesn't have granular permission controls** (unlike browser extensions), but you can:

**Control what plugins can access**:
1. Only enable plugins when you need them (disable after use)
2. Review enabled plugins weekly (Settings → Plugins → Manage)
3. Remove plugins you haven't used in 30 days

**For GPTs with Actions**:
- Review what APIs GPT calls (in GPT configuration)
- Understand you're giving GPT permission to act on your behalf
- Use GPTs with Actions only for intended purpose (don't share off-topic sensitive data)

---

## Examples: Real Vetting Decisions

### Example 1: Wolfram (Official Plugin)

**Source**: ChatGPT Plugin Store ✅
**Creator**: Wolfram Research (known company) ✅
**Capabilities**: API access to Wolfram Alpha (documented) ✅
**Privacy**: Clear policy, data processed for computation only ✅
**Reviews**: Widely used, positive feedback ✅

**Decision**: ✅ **APPROVE** - Use freely

---

### Example 2: "Amazing SEO Optimizer" (GPT)

**Source**: GPT Store direct link from Discord ⚠️
**Creator**: "SEO Expert" (no verification badge, <50 conversations) ❌
**Capabilities**: Web browsing + Actions (calls unknown API) ❌
**Privacy**: No privacy policy linked ❌
**Reviews**: No independent reviews found ❌

**Decision**: ❌ **REJECT** - Multiple red flags

---

### Example 3: "Code Review Assistant" (GPT)

**Source**: GPT Store Featured ✅
**Creator**: Verified developer (badge shown) ✅
**Capabilities**: File upload (for code review), no Actions ✅
**Privacy**: OpenAI standard (no third-party data sharing) ✅
**Reviews**: 50,000+ conversations, positive mentions on Twitter ✅

**Decision**: ✅ **APPROVE** - But don't upload proprietary code

---

## ChatGPT Enterprise/Team vs. Plus

**Security differences by account type**:

| Feature | ChatGPT Plus | ChatGPT Team | ChatGPT Enterprise |
|---------|--------------|--------------|-------------------|
| **Data used for training** | ❌ Yes (unless opted out) | ✅ No | ✅ No |
| **Admin controls** | ❌ No | ⚠️ Limited | ✅ Full |
| **Custom plugins** | ❌ No | ⚠️ Limited | ✅ Yes |
| **SSO/SAML** | ❌ No | ⚠️ Some | ✅ Yes |
| **Data residency** | ❌ No choice | ❌ No choice | ✅ Can specify region |
| **Audit logs** | ❌ No | ⚠️ Basic | ✅ Full |

**Recommendation for businesses**:
- **Startups (<10 people)**: ChatGPT Plus is OK with strict policies (no sensitive data)
- **SMBs (10-50 people)**: ChatGPT Team minimum (data not used for training)
- **Enterprises (>50 people)**: ChatGPT Enterprise (admin controls, compliance)

---

## When to Escalate

**Get expert review if**:
- ⚠️ Plugin requests authentication to critical system (your CRM, database, etc.)
- ⚠️ GPT with Actions calls APIs you don't recognize
- ⚠️ Planning to use plugin/GPT with customer data
- ⚠️ Plugin/GPT will integrate with production systems

**Who to ask**:
- Technical team member
- Security consultant ($200-500 for plugin review)
- OpenAI support (if using Team/Enterprise)

---

## Quarterly Plugin/GPT Audit

**Every 3 months**:

### Audit Checklist

1. **List enabled plugins**:
   ```
   ChatGPT → Settings → Plugins → Manage
   ```

2. **For each plugin**:
   - [ ] Still using it? (If not, disable)
   - [ ] Any security news about it? (Google "[plugin] security 2026")
   - [ ] Privacy policy changed? (Re-review)
   - [ ] Still maintained? (Developer still active?)

3. **List recent GPTs used**:
   ```
   ChatGPT → History → Filter by GPTs
   ```

4. **For each GPT**:
   - [ ] Still relevant? (If not, stop using)
   - [ ] Creator still active? (Check conversation count growth)
   - [ ] Any reports of issues?

5. **Clean up**:
   - Disable unused plugins
   - Remove GPTs from history if containing sensitive data
   - Update approved plugin/GPT list

---

## Safer Alternatives to Third-Party Plugins/GPTs

**Instead of plugins**, consider:

✅ **Use ChatGPT built-in features**:
- Web browsing (built-in, no third party)
- Code Interpreter (sandboxed, OpenAI-controlled)
- DALL-E (first-party image generation)
- These are safer than third-party plugins

✅ **Use dedicated tools**:
- Need PDF reading? Use a dedicated PDF AI tool, not a ChatGPT plugin
- Need coding help? Use Claude Code or Cursor (sandboxed environments)
- Need translation? Use DeepL or Google Translate directly

✅ **Create your own GPT** (instead of using community GPTs):
- You control the configuration
- No third-party Actions (unless you add them)
- Your data stays within OpenAI (not sent to GPT creator's APIs)

---

## SEA-Specific Considerations

### Regional Plugins/GPTs

⚠️ **SEA-focused tools** (e.g., "Grab helper", "Shopee analyzer"):
- Smaller user bases (less community vetting)
- May not have English privacy policies (use Google Translate)
- Verify company is legitimate (Singapore ACRA, Malaysia SSM)

### Data Residency

**ChatGPT data centers**: Primarily US-based
- Singapore companies: Check PDPA compliance
- Malaysia companies: Check PDPA compliance
- Consider ChatGPT Enterprise for data residency options

### Language Considerations

⚠️ **Non-English GPTs**:
- Privacy policies may be unclear when translated
- Harder to find English reviews
- Vet extra carefully

---

## 🔗 Related Resources

**Before using this guide**:
- [TOOLS.md](../TOOLS.md) - Trusted plugin/GPT sources
- [THREATS.md](../THREATS.md) - Privacy violation risks

**After approval**:
- [Data Protection](06-data-protection.md) - What not to share with plugins/GPTs
- [Vendor Evaluation](07-vendor-evaluation.md) - For enterprise ChatGPT deployment

**Other tool types**:
- [Skill Vetting](02-skill-vetting.md) - Claude Code skills
- [Browser Extensions](04-browser-extensions.md) - Browser extension security

---

**Last Updated**: February 2026

---

**Remember**: ChatGPT plugins and GPTs are sandboxed (safer than browser extensions or skills), but they still process your data. The key risk is **data leakage** (sharing too much with a plugin/GPT that logs or misuses it). Always assume anything you share with a plugin/GPT could become public.
