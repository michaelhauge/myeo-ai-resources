# AI Browser Extension Security Guide
**Safely Evaluating AI Extensions Before Installation (30-Minute Audit)**

Browser extensions have access to everything you do online. Here's how to protect yourself.

---

## Overview

**Time Required**: 30 minutes per extension (initial), 10 minutes per audit
**Difficulty**: Easy (non-technical)
**Output**: INSTALL / REJECT / RESTRICT decision
**Prerequisites**: None - works for Chrome, Firefox, Safari, Edge

---

## Why Browser Extensions Are Risky

AI browser extensions are particularly dangerous because they can access:

🔴 **Everything you type** (passwords before you submit them)
🔴 **All websites you visit** (browsing history, reading session tokens)
🔴 **Form data** (credit cards, personal information)
🔴 **Cookies** (authentication, session hijacking)
🔴 **Page content** (emails, documents, private messages)

**The AI component makes it worse**:
- AI extensions process your data (sending it to AI APIs)
- You're more likely to trust them (AI = helpful, right?)
- They often request excessive permissions ("to provide better AI assistance")

**Real incident**: In 2024, a popular "AI writing assistant" extension was found sending:
- All text typed in email (Gmail, Outlook)
- All search queries (Google, Bing)
- All document content (Google Docs, Notion)
- To undisclosed third-party servers for "AI processing"

**Impact**: 500,000+ users compromised. Company claimed it was for "improving AI model." No user consent.

---

## The 6-Step Extension Vetting Process

---

### Step 1: Install Source Check (5 minutes)

**Question**: Where are you installing this extension from?

#### Trusted Sources

✅ **Chrome Web Store** (Chrome, Edge)
- URL: chrome.google.com/webstore
- Review process: Google screens for malware
- Risk: Medium (malware still gets through sometimes)
- **Use ONLY if extension has >10,000 users**

✅ **Firefox Add-ons** (Firefox)
- URL: addons.mozilla.org
- Review process: Mozilla manual review (stricter than Chrome)
- Risk: Low-Medium
- **More trustworthy than Chrome for privacy**

✅ **Safari Extensions** (macOS Safari)
- URL: apps.apple.com (Mac App Store)
- Review process: Apple review (strictest)
- Risk: Low
- **Most secure but smallest selection**

✅ **Edge Add-ons** (Microsoft Edge)
- URL: microsoftedge.microsoft.com/addons
- Review process: Similar to Chrome
- Risk: Medium

#### Untrusted Sources (NEVER USE)

❌ **Direct download (.crx files)** from websites
- No review process
- Trivial to inject malware
- **Never install**

❌ **Developer mode sideloading**
- For testing only
- No security guarantees
- **Never use for daily browsing**

❌ **Third-party extension stores**
- No accountability
- Common malware vector
- **Stick to official stores only**

**Checklist**:
- [ ] Extension is from official store (Chrome Web Store, Firefox Add-ons, etc.)
- [ ] NOT from direct download or unofficial source
- [ ] Store URL is legitimate (check carefully for phishing)

**Decision**:
- ✅ Pass → Continue
- ❌ Fail → **REJECT** - Do not install from untrusted sources

---

### Step 2: User Count & Reviews (5 minutes)

**Question**: How popular is this extension, and what are users saying?

#### User Count Thresholds

| Users | Risk Level | Action |
|-------|------------|--------|
| **>100,000** | 🟢 Lower risk | More eyes on it, issues likely discovered |
| **10,000-100,000** | 🟡 Medium risk | Established but review carefully |
| **1,000-10,000** | 🟡 Medium-high risk | Newer or niche, proceed with caution |
| **<1,000** | 🔴 High risk | Few users, high malware probability |

**Why user count matters**:
- More users = more scrutiny (security researchers, tech journalists)
- Malicious extensions often get caught after 10k-50k users
- Small user count = easy to stay under the radar

#### Review Analysis

**Don't just look at star rating**. Read actual reviews:

**Good signs**:
- ✅ Mix of 3, 4, and 5-star reviews (realistic)
- ✅ Detailed reviews explaining use cases
- ✅ Recent reviews (activity in last 30 days)
- ✅ Negative reviews addressed by developer

**Red flags**:
- ❌ All 5-star reviews (fake/bought reviews)
- ❌ Generic review text ("Great!", "Amazing!", "Best extension!")
- ❌ No reviews or all reviews on same date (bot campaign)
- ❌ 1-star reviews mentioning "malware", "stole my data", "spam"
- ❌ Developer deletes/ignores negative reviews

**How to check**:
1. Click extension in store
2. Scroll to "Reviews" section
3. Sort by "Most recent"
4. Read 5-10 recent reviews
5. Check 1-2 star reviews for red flags

**Checklist**:
- [ ] Extension has >10,000 users (or >1,000 with strong justification)
- [ ] Reviews are realistic (mix of ratings, detailed comments)
- [ ] Recent activity (reviews within last 30 days)
- [ ] No malware/data-theft complaints in reviews

**Decision**:
- ✅ Pass → Continue
- ❌ Fail → **REJECT** or use with extreme caution

---

### Step 3: Permission Review (10 minutes)

**Question**: What permissions does this extension request?

**This is the MOST IMPORTANT step** for browser extensions.

#### How to Check Permissions

**Before installing**:
1. Click extension in store
2. Look for "Permissions" section (usually below description)
3. Read every permission listed

**After installing** (to verify):
1. Chrome: `chrome://extensions/` → Click extension → Permissions
2. Firefox: `about:addons` → Extension → Permissions
3. Safari: Safari → Preferences → Extensions → Click extension

#### Common Permissions Explained

| Permission | What It Means | Red Flag? |
|------------|---------------|-----------|
| **"Read and change all your data on all websites"** | Can see EVERYTHING you do online | ⚠️ HIGH RISK (only if necessary) |
| **"Read and change your data on specific sites"** | Limited to listed websites | ✅ Better (but check which sites) |
| **"Access your data for all websites" / "Host permissions"** | Can read content on all pages | ⚠️ HIGH RISK |
| **"Read your browsing history"** | Knows every site you visit | ⚠️ MEDIUM-HIGH RISK |
| **"Manage your downloads"** | Can download files, see downloads | ⚠️ MEDIUM RISK |
| **"Communicate with cooperating websites"** | Can make network requests | ⚠️ MEDIUM RISK (to where?) |
| **"Display notifications"** | Show popup notifications | ✅ Low risk |
| **"Access browser tabs"** | See open tabs, switch tabs | ⚠️ MEDIUM RISK |
| **"Clipboard access"** | Read/write clipboard | ⚠️ MEDIUM RISK (sees copied passwords) |
| **"Web request"** | Intercept network traffic | ⚠️ HIGH RISK |

#### The "All Websites" Problem

**"Read and change all your data on all websites"** is the most dangerous permission.

**What it allows**:
- Read passwords as you type them (before submission)
- Capture credit card numbers
- Read emails, documents, private messages
- Modify page content (phishing)
- Inject code into banking sites

**When it's justified**:
- ✅ Grammar checkers (need to see all text)
- ✅ Password managers (need to fill forms everywhere)
- ✅ Ad blockers (need to modify all pages)

**When it's NOT justified**:
- ❌ AI summarizer that only works on specific sites (why "all websites"?)
- ❌ "Productivity tool" that only modifies one platform (Gmail, Notion, etc.)
- ❌ Extension that doesn't explain why it needs this permission

#### Permission Decision Framework

**Ask**: "Why does [extension function] need [permission]?"

**Examples**:
- AI writing assistant → Needs "all websites" to help you write anywhere ✅
- ChatGPT sidebar → Needs "all websites" to add sidebar to any page ✅
- AI document scanner → Needs "all websites" ❌ (should only need specific doc sites)

**Checklist**:
- [ ] All permissions are explained in extension description
- [ ] Permissions match claimed functionality
- [ ] No excessive permissions for what extension does
- [ ] "All websites" permission only if truly needed

**Decision**:
- ✅ Pass (minimal, justified permissions) → Continue
- ⚠️ Uncertain → Escalate or use with "On Click Only" mode
- ❌ Fail (excessive permissions) → **REJECT**

---

### Step 4: Developer Verification (5 minutes)

**Question**: Who created this extension, and can they be trusted?

#### What to Check

**Developer name**:
- [ ] Matches a real company or person
- [ ] Searchable online (company website, LinkedIn, GitHub)
- [ ] Has other products/extensions (not one-off)

**Company verification** (if applicable):
- [ ] Chrome Web Store shows "Featured" or "Established Publisher" badge
- [ ] Company has website with contact info
- [ ] Company mentioned in tech news / credible sources

**Individual developer** (if not a company):
- [ ] GitHub profile exists and active
- [ ] Other projects with good reputation
- [ ] Responsive to extension issues/reviews

#### Red Flags

❌ **Developer name is generic** ("AI Tools", "Productivity Helper")
❌ **No contact information** anywhere
❌ **Multiple extensions with similar names** (spam pattern)
❌ **Developer account created recently** (<3 months before extension)
❌ **Developer has many low-quality extensions**
❌ **Company website doesn't mention the extension** (abandoned? fake?)

#### Green Flags

✅ **Known company** (Grammarly, Microsoft, Google, etc.)
✅ **Verified publisher badge**
✅ **Clear privacy policy** linked in extension
✅ **Active support** (email, Discord, GitHub issues)
✅ **Transparent about data handling**

**Checklist**:
- [ ] Developer is identifiable (company or person)
- [ ] Developer has reputation/history
- [ ] Developer responsive to issues
- [ ] Privacy policy exists and is clear

**Decision**:
- ✅ Pass → Continue
- ❌ Fail → **REJECT** or use with extreme caution

---

### Step 5: Privacy Policy Review (3 minutes)

**Question**: What does this extension do with your data?

**Important**: Extensions claiming "AI" often send your data to third-party AI APIs. You need to know where.

#### How to Find Privacy Policy

1. Extension store page → Look for "Privacy Policy" link
2. Or Google: `"[extension name]" privacy policy`
3. Or check extension settings/about page

#### What to Look For

**Good privacy policy**:
- ✅ **Specific about data collection**: "We collect search queries to provide AI suggestions"
- ✅ **Names third parties**: "Data sent to OpenAI API for processing"
- ✅ **Opt-out options**: "You can disable data sharing in settings"
- ✅ **Data retention**: "Data deleted after 30 days"
- ✅ **No selling data**: "We do not sell your data to third parties"

**Bad privacy policy**:
- ❌ **Vague**: "We may collect information to improve our service"
- ❌ **Missing entirely** (huge red flag)
- ❌ **Allows selling data**: "We may share data with partners for marketing"
- ❌ **No deletion**: "We retain data indefinitely"
- ❌ **Tracks everything**: "We collect all browsing activity"

**AI-specific questions**:
- [ ] Where is AI processing done? (OpenAI, Anthropic, their own servers?)
- [ ] Is your data used to train their AI models?
- [ ] Can you opt out of data collection?
- [ ] Is data encrypted in transit?

#### Red Flag Phrases

❌ "We may collect personal information for any purpose"
❌ "We share data with third-party partners" (without naming them)
❌ "We use cookies and similar technologies for advertising"
❌ "You consent to data processing by installing this extension"
❌ "We are not responsible for third-party data practices"

**Checklist**:
- [ ] Privacy policy exists and is findable
- [ ] Policy is specific (not vague boilerplate)
- [ ] Data collection is limited and justified
- [ ] Third-party data sharing is disclosed
- [ ] No data selling

**Decision**:
- ✅ Pass → Continue
- ⚠️ Uncertain → Use only on non-sensitive sites
- ❌ Fail → **REJECT**

---

### Step 6: Last Updated Check (2 minutes)

**Question**: Is this extension actively maintained?

**Why it matters**: Abandoned extensions:
- Don't get security updates
- May have unpatched vulnerabilities
- Developer may have sold extension to malicious actor (common)

#### How to Check

**Last update date**:
- Chrome Web Store: Listed on extension page
- Firefox: Listed on add-on page
- Safari: Mac App Store update history

#### Age Thresholds

| Last Update | Status | Risk |
|-------------|--------|------|
| **<3 months** | 🟢 Actively maintained | Low risk of abandonment |
| **3-6 months** | 🟡 Still maintained | Acceptable |
| **6-12 months** | 🟡 Slow updates | Moderate concern |
| **>12 months** | 🔴 Likely abandoned | High risk, avoid |

**Exception**: Simple extensions that don't need updates (e.g., basic color picker) can be older.

#### What Changed in Latest Update?

Read the changelog (if available):
- ✅ **Bug fixes, security patches** → Good sign
- ✅ **New features requested by users** → Active development
- ⚠️ **New permissions requested** → Review carefully (why now?)
- ❌ **"Monetization added"** → May have been sold (red flag)

**Checklist**:
- [ ] Extension updated within last 6 months (or 12 if simple)
- [ ] Changelog shows legitimate updates (not just "bug fixes" every time)
- [ ] No sudden permission increases
- [ ] Developer still active (responds to reviews)

**Decision**:
- ✅ Pass → Approve
- ⚠️ Borderline (6-12 months) → Approve but monitor closely
- ❌ Fail (>12 months) → **REJECT** or plan to find alternative

---

## Post-Installation: Restrict Permissions

**Even after approving an extension**, restrict its access:

### Chrome: "On Click Only" Mode

```
1. Go to chrome://extensions/
2. Click extension
3. Under "Site access":
   - Change from "On all sites" to "On click"
   - Or "On specific sites" (list safe domains)
4. Now extension only runs when you click its icon
```

**Benefits**:
- Extension can't passively monitor all browsing
- You control when it activates
- Reduces attack surface 90%

**When to use**:
- ✅ AI assistants you use occasionally (ChatGPT sidebar, etc.)
- ✅ Summarizers, translators (on-demand use)

**When NOT to use**:
- ❌ Password managers (need automatic detection)
- ❌ Ad blockers (need to run on every page)

---

### Firefox: Permission Restrictions

```
1. Go to about:addons
2. Click extension
3. Permissions tab
4. Review each permission
5. Some can be revoked (optional permissions)
```

---

## Quarterly Extension Audit

**Every 3 months** (set calendar reminder):

### Audit Checklist

1. **List all extensions**:
   ```
   Chrome: chrome://extensions/
   Firefox: about:addons
   Safari: Preferences → Extensions
   ```

2. **For each extension, ask**:
   - [ ] Still using it? (If not, remove)
   - [ ] Last updated when? (>12 months = remove)
   - [ ] Any new permissions requested? (Review if yes)
   - [ ] Any security news about it? (Google "[extension name] security")

3. **Remove unused extensions**:
   - Even "safe" extensions increase attack surface
   - Disable, wait 30 days, delete if not missed

4. **Check for alternatives**:
   - Is there a safer extension with same function?
   - Can you do this without an extension? (browser built-in feature)

### Quarterly Audit Template

| Extension Name | Last Used | Last Updated | Permissions OK? | Action |
|----------------|-----------|--------------|-----------------|--------|
| ChatGPT Helper | Yesterday | 2026-01 | ✅ Yes | Keep |
| Old Summarizer | 3 months ago | 2024-06 | ⚠️ Abandoned | Remove |
| Grammar Check | Daily | 2026-02 | ✅ Yes | Keep |

---

## Examples: Real Vetting Decisions

### Example 1: Grammarly

**Source**: Chrome Web Store ✅
**Users**: 10 million+ ✅
**Reviews**: 4.5 stars, detailed reviews ✅
**Permissions**: "All websites" (justified for grammar checking) ✅
**Developer**: Grammarly Inc. (known company) ✅
**Privacy**: Clear policy, SOC 2 certified ✅
**Last updated**: 2 weeks ago ✅

**Decision**: ✅ **APPROVE** - Install normally

---

### Example 2: "Amazing AI Writer Pro"

**Source**: Chrome Web Store ✅
**Users**: 850 (very low) ❌
**Reviews**: All 5-star, generic text ❌
**Permissions**: "All websites" + "Downloads" (why downloads?) ❌
**Developer**: "AI Tools Team" (generic, no website) ❌
**Privacy**: No policy linked ❌
**Last updated**: 3 months ago ⚠️

**Decision**: ❌ **REJECT** - Multiple red flags

---

### Example 3: ChatGPT Sidebar (Third-Party)

**Source**: Chrome Web Store ✅
**Users**: 50,000 ✅
**Reviews**: 4.2 stars, mixed but realistic ✅
**Permissions**: "All websites" (for sidebar on any page) ⚠️
**Developer**: Individual developer with GitHub profile ✅
**Privacy**: Clear policy, sends data to OpenAI ✅
**Last updated**: 1 month ago ✅

**Decision**: ✅ **APPROVE WITH RESTRICTION** - Use "On click only" mode

---

## Safe AI Extension Alternatives

If an AI extension fails vetting, consider these safer alternatives:

### Instead of AI Browser Extensions

✅ **Use web apps directly**:
- ChatGPT web interface (chat.openai.com)
- Claude web interface (claude.ai)
- No extension needed, no persistent permissions

✅ **Use official integrations**:
- Notion AI (built into Notion, not an extension)
- Gmail Smart Compose (built-in to Gmail)
- Edge Copilot (first-party Microsoft)

✅ **Desktop apps**:
- Claude Code (runs locally, you control permissions)
- Cursor (AI code editor, sandboxed)

### Lower-Risk Extension Categories

If you must use extensions:

✅ **First-party** (from the company whose site you're using)
- Google extensions (for Google services)
- Microsoft extensions (for Microsoft services)

✅ **Open source** (code is auditable)
- uBlock Origin (ad blocker)
- Bitwarden (password manager)

---

## SEA-Specific Considerations

### Regional Extensions

⚠️ **SEA-focused extensions** often have:
- Smaller user bases (harder to vet by popularity)
- Less scrutiny (Western security researchers miss them)
- Language barriers (privacy policies in Bahasa/Thai/Vietnamese may be vague)

**Extra caution**:
- Verify company is legitimate (Singapore ACRA, Malaysia SSM registry)
- Check if company website matches extension claims
- Use Chrome Translate to read non-English privacy policies

### Payment-Related Extensions

⚠️ **Extensions for regional payment platforms** (GrabPay, Touch 'n Go, GCash):
- Very high risk if malicious (financial data)
- Use official apps instead (not extensions)
- If using extension, verify it's from official company

---

## 🔗 Related Resources

**Before using this guide**:
- [TOOLS.md](../TOOLS.md) - Trusted extension sources
- [THREATS.md](../THREATS.md) - What can go wrong

**After installation**:
- [Data Protection](06-data-protection.md) - Limit extension access
- [Incident Response](08-incident-response.md) - If something goes wrong

**Other tool types**:
- [Skill Vetting](02-skill-vetting.md) - Claude Code skills
- [MCP Servers](03-mcp-servers.md) - MCP server security
- [ChatGPT Plugins](05-chatgpt-plugins.md) - Plugin security

---

**Last Updated**: February 2026

---

**Remember**: Every browser extension is a potential keylogger. The 30 minutes you spend vetting an extension can save you from $500k+ in data breach costs. Never install an extension "just to try it."
