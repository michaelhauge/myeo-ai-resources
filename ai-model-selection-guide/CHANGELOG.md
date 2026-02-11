# AI Model Selection Guide - Changelog

Track pricing, model releases, and feature changes for all AI providers.

**Purpose**: Keep the guide current without rewriting entire sections. Log changes here, then update relevant provider files.

---

## 2026

### February 2026

#### 2026-02-07
- **[CREATED]** Initial guide created with 4 files
  - README.md with decision tree and 90-day roadmap
  - providers/00-comparison.md master comparison table
  - CHANGELOG.md (this file)
  - guides/01-understanding-models.md strategy foundation
- **[VERIFIED]** All pricing current as of 2026-02-07:
  - OpenAI: ChatGPT Plus $20/month, ChatGPT Team $25/user/month (annual)
  - Anthropic: Claude Pro $20/month, Claude for Work $30/user/month (annual)
  - Google: Gemini Advanced $20/month
  - Perplexity: Perplexity Pro $20/month
  - Microsoft: Copilot Pro $20/month, Copilot for 365 $30/user/month
- **[ADDED]** DeepSeek pricing: V3 at $0.27/$1.10 per 1M tokens, R1 at $0.55/$2.19
- **[ADDED]** Google Gemini 2.0 Flash at $0.10/$0.40 per 1M tokens (experimental)

---

## How to Use This Changelog

### For Guide Maintainers
When updating the guide monthly:
1. **Check provider websites** for pricing/feature changes
2. **Log changes** in this file with date and details
3. **Update** relevant provider files (providers/01-openai.md, etc.)
4. **Update** providers/00-comparison.md master table
5. **Update** "Last Updated" dates in affected files

### For Readers
- **New to the guide?** Ignore this file, start with [README.md](README.md)
- **Returning user?** Scan recent entries to see what changed since your last visit
- **Suspect outdated info?** Check the date in this file vs. the provider file

---

## Monthly Review Checklist

Run this checklist on the 1st of each month:

### Pricing Verification (High Priority)
- [ ] **OpenAI**: Check https://openai.com/pricing
  - [ ] ChatGPT Plus still $20/month?
  - [ ] ChatGPT Team still $25/user/month (annual)?
  - [ ] API pricing unchanged?
- [ ] **Anthropic**: Check https://www.anthropic.com/pricing
  - [ ] Claude Pro still $20/month?
  - [ ] Claude for Work still $30/user/month?
  - [ ] API pricing unchanged?
- [ ] **Google**: Check https://ai.google.dev/pricing
  - [ ] Gemini Advanced still $20/month?
  - [ ] API pricing unchanged?
- [ ] **Perplexity**: Check https://www.perplexity.ai/pro
  - [ ] Still $20/month?
  - [ ] Search limits unchanged?
- [ ] **Microsoft**: Check Microsoft 365 admin portal
  - [ ] Copilot Pro still $20/month?
  - [ ] Copilot for 365 still $30/user/month?
- [ ] **DeepSeek**: Check https://www.deepseek.com/pricing
  - [ ] API pricing unchanged?

### New Model Releases (Medium Priority)
- [ ] **OpenAI**: Check for GPT-5, new o-series models
- [ ] **Anthropic**: Check for Claude 4, new Sonnet/Opus
- [ ] **Google**: Check for Gemini 2.5, Pro/Ultra updates
- [ ] **Others**: Scan AI news for major releases (Mistral, Meta, etc.)

### Feature Changes (Medium Priority)
- [ ] **Web search**: Any provider add/remove web search?
- [ ] **Image generation**: New image models or integrations?
- [ ] **Context windows**: Any increases (200K → 1M)?
- [ ] **Integrations**: New Google Workspace, Microsoft 365, Slack integrations?

### SEA Availability (Low Priority - Quarterly)
- [ ] New countries supported?
- [ ] New payment methods (GrabPay, FPX, etc.)?
- [ ] Data residency options changed?

### Documentation Updates
- [ ] Update providers/00-comparison.md master table
- [ ] Update individual provider files (providers/01-openai.md, etc.)
- [ ] Update use-case guides if recommendations change
- [ ] Update this CHANGELOG.md with findings
- [ ] Update "Last Updated" and "Next Review" dates

---

## Change Categories

### [PRICE-INCREASE]
Provider increased pricing. May affect recommendations.

**Example**:
```
- **[2026-03-01] [PRICE-INCREASE] OpenAI**: ChatGPT Plus increased to $25/month (was $20)
```

### [PRICE-DECREASE]
Provider decreased pricing. Update cost examples.

**Example**:
```
- **[2026-03-10] [PRICE-DECREASE] Anthropic**: Claude API reduced to $2/1M input (was $3)
```

### [NEW-MODEL]
New model released. May change recommendations.

**Example**:
```
- **[2026-03-15] [NEW-MODEL] OpenAI**: GPT-5 released at $30/1M tokens, 500K context
```

### [NEW-FEATURE]
Provider added new capability (search, images, etc.).

**Example**:
```
- **[2026-03-20] [NEW-FEATURE] Anthropic**: Claude Pro now includes web search (beta)
```

### [DEPRECATED]
Model or feature being phased out.

**Example**:
```
- **[2026-04-01] [DEPRECATED] OpenAI**: GPT-4-turbo retiring June 2026, migrate to GPT-4o
```

### [SEA-EXPANSION]
New Southeast Asia availability or payment methods.

**Example**:
```
- **[2026-04-15] [SEA-EXPANSION] OpenAI**: Now accepts GrabPay in Singapore and Malaysia
```

### [VERIFIED]
Pricing/features verified as current (routine check).

**Example**:
```
- **[2026-05-01] [VERIFIED]** All pricing current as of 2026-05-01, no changes
```

---

## Tracking External Sources

### Official Pricing Pages
- **OpenAI**: https://openai.com/pricing
- **Anthropic**: https://www.anthropic.com/pricing
- **Google**: https://ai.google.dev/pricing
- **Perplexity**: https://www.perplexity.ai/pro
- **Microsoft**: Microsoft 365 admin portal
- **DeepSeek**: https://www.deepseek.com/pricing
- **Mistral**: https://mistral.ai/technology/#pricing

### Model Benchmarks
- **Artificial Analysis**: https://artificialanalysis.ai/ (quality, speed, price)
- **LLM Pricing**: https://llmpricing.co/ (API pricing aggregator)
- **LMSYS Chatbot Arena**: https://chat.lmsys.org/ (quality leaderboard)

### AI News Sources
- **OpenAI Blog**: https://openai.com/blog
- **Anthropic Blog**: https://www.anthropic.com/news
- **Google AI Blog**: https://ai.googleblog.com/
- **The Batch (DeepLearning.AI)**: https://www.deeplearning.ai/the-batch/
- **AI Reddit**: https://www.reddit.com/r/artificial/

---

## Template for New Entries

When logging a change, use this format:

```markdown
#### YYYY-MM-DD
- **[YYYY-MM-DD] [CATEGORY] Provider**: Description of change
  - Impact: How this affects users or recommendations
  - Action: What file(s) were updated
  - Source: Link to announcement or pricing page
```

**Example**:
```markdown
#### 2026-03-15
- **[2026-03-15] [NEW-MODEL] OpenAI**: GPT-5 released
  - Impact: Significantly better than GPT-4, but 3x more expensive
  - Action: Updated providers/01-openai.md, added to comparison table
  - Source: https://openai.com/blog/gpt-5-release
- **[2026-03-15] [PRICE-DECREASE] Google**: Gemini 1.5 Pro reduced to $1/1M (was $1.25)
  - Impact: Now cheapest quality API option
  - Action: Updated providers/00-comparison.md, providers/03-google.md
  - Source: https://ai.google.dev/pricing
```

---

## Version History

**v1.0.0** - 2026-02-07
- Initial changelog created
- Established update process and categories
- Verified all initial pricing

---

**Next Review**: 2026-03-07 (1st of month)
**Last Updated**: 2026-02-07
**Maintained by**: [MyEO AI](https://myeo.ai)
