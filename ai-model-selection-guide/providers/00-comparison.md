# AI Provider Comparison - Master Table

**Last Updated**: 2026-02-07
**Next Review**: 2026-03-07
**Status**: ✅ Current (all pricing verified)

This is the **single source of truth** for AI provider pricing and features. All other guides reference this table.

---

## Quick Recommendations

| Budget | Best Option | Why | Monthly Cost |
|--------|-------------|-----|--------------|
| **Free** | ChatGPT Free + Claude Free | Rotate both, each has limits | $0 |
| **$20/month** | ChatGPT Plus | Best all-around (search, images, data) | $20 |
| **$40/month** | ChatGPT Plus + Claude Pro | Use each for its strength | $40 |
| **Team (3-10)** | ChatGPT Team | Admin controls, higher limits | $25/user (annual) |
| **Enterprise (50+)** | ChatGPT Enterprise or Copilot | SSO, compliance, support | $60+/user |

---

## Consumer Plans Comparison

### General-Purpose AI Assistants

| Provider | Plan | Price | Message Limit | Web Search | Image Gen | Image Read | File Upload | Code Execution | Best For |
|----------|------|-------|---------------|------------|-----------|------------|-------------|----------------|----------|
| **OpenAI** | ChatGPT Free | $0 | Limited | ❌ | ❌ | ❌ | ❌ | ❌ | Testing GPT-3.5 |
| **OpenAI** | ChatGPT Plus | $20/mo | 80 msg/3hr (GPT-4), unlimited GPT-4o | ✅ | ✅ (DALL-E 3) | ✅ | ✅ | ✅ | **All-around best** |
| **OpenAI** | ChatGPT Team | $25/user/mo* | Higher limits | ✅ | ✅ | ✅ | ✅ | ✅ | Teams (admin controls) |
| **OpenAI** | ChatGPT Enterprise | $60/user/mo* | Unlimited | ✅ | ✅ | ✅ | ✅ | ✅ | Enterprise (SSO, compliance) |
| **Anthropic** | Claude Free | $0 | Very limited | ❌ | ❌ | ✅ | ✅ | ❌ | Testing Claude |
| **Anthropic** | Claude Pro | $20/mo | 5x more usage | ❌ | ❌ | ✅ | ✅ | ❌ | **Best for writing** |
| **Anthropic** | Claude for Work | $30/user/mo* | Higher limits | ❌ | ❌ | ✅ | ✅ | ❌ | Teams (admin controls) |
| **Google** | Gemini Free | $0 | Limited | ✅ | ❌ | ✅ | ✅ | ❌ | Google Workspace users |
| **Google** | Gemini Advanced | $20/mo | Higher limits | ✅ | ✅ (Imagen) | ✅ | ✅ | ✅ | **Google Workspace integration** |
| **Microsoft** | Copilot Free | $0 | Limited | ✅ | ✅ (DALL-E 3) | ✅ | ❌ | ❌ | Testing |
| **Microsoft** | Copilot Pro | $20/mo | Higher limits | ✅ | ✅ | ✅ | ✅ | ❌ | Microsoft 365 users |
| **Microsoft** | Copilot for 365 | $30/user/mo* | Integrated | ✅ | ✅ | ✅ | ✅ | ✅ | **Microsoft 365 integration** |
| **Perplexity** | Perplexity Free | $0 | 5 Pro searches/day | ✅ (always) | ❌ | ✅ | ❌ | ❌ | Research |
| **Perplexity** | Perplexity Pro | $20/mo | 600 Pro searches/day | ✅ (always) | ✅ (DALL-E, Flux) | ✅ | ✅ | ❌ | **Best for research** |

*Annual billing required for Team/Enterprise plans

---

## API Pricing Comparison

**For developers and high-volume users**

### Input Pricing (per 1M tokens)

| Provider | Model | Input $/1M | Output $/1M | Context Window | Max Output | Speed | Best For |
|----------|-------|------------|-------------|----------------|------------|-------|----------|
| **OpenAI** | GPT-4o | $2.50 | $10.00 | 128K | 16K | Fast | **All-around** |
| **OpenAI** | GPT-4o mini | $0.15 | $0.60 | 128K | 16K | Very fast | Simple tasks |
| **OpenAI** | o1 | $15.00 | $60.00 | 200K | 100K | Slow | Complex reasoning |
| **OpenAI** | o1-mini | $3.00 | $12.00 | 128K | 65K | Medium | Coding |
| **Anthropic** | Claude 3.5 Sonnet | $3.00 | $15.00 | 200K | 8K | Fast | **Writing, code** |
| **Anthropic** | Claude 3.5 Haiku | $0.80 | $4.00 | 200K | 8K | Very fast | Simple tasks |
| **Anthropic** | Claude 3 Opus | $15.00 | $75.00 | 200K | 4K | Medium | Complex tasks |
| **Google** | Gemini 1.5 Pro | $1.25 | $5.00 | 2M | 8K | Fast | **Long context** |
| **Google** | Gemini 1.5 Flash | $0.075 | $0.30 | 1M | 8K | Very fast | **Cheapest quality** |
| **Google** | Gemini 2.0 Flash | $0.10 | $0.40 | 1M | 8K | Very fast | Experimental |
| **DeepSeek** | DeepSeek V3 | $0.27 | $1.10 | 64K | 8K | Fast | **Budget code** |
| **DeepSeek** | DeepSeek R1 | $0.55 | $2.19 | 64K | 8K | Medium | Reasoning |
| **Mistral** | Mistral Large | $2.00 | $6.00 | 128K | 32K | Fast | Multilingual |
| **Mistral** | Mistral Small | $0.20 | $0.60 | 32K | 32K | Very fast | Simple tasks |

---

## Feature Comparison Matrix

| Feature | ChatGPT Plus | Claude Pro | Gemini Advanced | Perplexity Pro | Copilot Pro |
|---------|--------------|------------|-----------------|----------------|-------------|
| **Web Search** | ✅ Bing | ❌ | ✅ Google | ✅ (Always on) | ✅ Bing |
| **Image Generation** | ✅ DALL-E 3 | ❌ | ✅ Imagen 3 | ✅ DALL-E/Flux | ✅ DALL-E 3 |
| **Image Understanding** | ✅ | ✅ | ✅ | ✅ | ✅ |
| **File Upload (PDF, Doc)** | ✅ | ✅ | ✅ | ✅ | ✅ |
| **Data Analysis (Code)** | ✅ Python | ❌ | ✅ Python | ❌ | ❌ |
| **Context Window** | 128K | 200K | 2M | 128K | 128K |
| **Mobile App** | ✅ iOS/Android | ✅ iOS/Android | ✅ iOS/Android | ✅ iOS/Android | ✅ iOS/Android |
| **Voice Input** | ✅ | ✅ | ✅ | ✅ | ✅ |
| **Custom Instructions** | ✅ | ✅ | ❌ | ✅ | ❌ |
| **Conversation Memory** | ✅ | ✅ | ❌ | ✅ | ❌ |
| **Team Workspace** | ✅ ($25/user) | ✅ ($30/user) | ❌ | ❌ | ✅ ($30/user) |
| **API Access** | ✅ | ✅ | ✅ | ✅ | ❌ |

---

## SEA Availability & Payment

| Provider | Singapore | Malaysia | Indonesia | Thailand | Payment Methods | Data Residency |
|----------|-----------|----------|-----------|----------|-----------------|----------------|
| **OpenAI** | ✅ | ✅ | ✅ | ✅ | Credit card, Apple Pay | US (no region choice) |
| **Anthropic** | ✅ | ✅ | ✅ | ✅ | Credit card | US (no region choice) |
| **Google** | ✅ | ✅ | ✅ | ✅ | Credit card, Google Pay | US, Asia (configurable) |
| **Microsoft** | ✅ | ✅ | ✅ | ✅ | Credit card, Microsoft account | Configurable (365 customers) |
| **Perplexity** | ✅ | ✅ | ✅ | ✅ | Credit card, Apple Pay | US |
| **DeepSeek** | ✅ | ✅ | ✅ | ✅ | Credit card | China |

---

## Cost Examples by Use Case

### Example 1: Content Creator (10 blog posts/month)

**Scenario**: Write 10x 2,000-word blog posts per month (~20,000 words total, ~27,000 tokens)

| Option | Monthly Cost | Notes |
|--------|--------------|-------|
| **Claude Pro (Recommended)** | $20 | Unlimited within usage limits, best writing quality |
| **ChatGPT Plus** | $20 | Unlimited within limits, can also do research/images |
| **Claude API (3.5 Sonnet)** | ~$0.50 | 27K input + 27K output tokens = ~$1, but need technical setup |
| **GPT-4o API** | ~$0.34 | Cheapest API option, but consumer plan simpler |

**Winner**: Claude Pro ($20/month) for simplicity and quality.

---

### Example 2: Developer (Code generation, 20 hours/week)

**Scenario**: Generate ~50,000 tokens/week code (200K tokens/month input, 200K output)

| Option | Monthly Cost | Notes |
|--------|--------------|-------|
| **DeepSeek API** | ~$1 | $0.27 input + $1.10 output per 1M = ultra cheap |
| **Claude Pro** | $20 | Unlimited within limits, excellent code quality |
| **ChatGPT Plus** | $20 | Good for code, also has data analysis |
| **Claude API (3.5 Sonnet)** | ~$3.60 | $3 input + $15 output per 1M |

**Winner**: DeepSeek API ($1/month) if comfortable with API, Claude Pro ($20/month) for simplicity.

---

### Example 3: Researcher (Heavy web search, 40 searches/day)

**Scenario**: 40 searches/day = 1,200 searches/month

| Option | Monthly Cost | Notes |
|--------|--------------|-------|
| **Perplexity Pro** | $20 | 600 Pro searches/day (18,000/month), citations included |
| **ChatGPT Plus** | $20 | Web search included, but not always on |
| **Gemini Advanced** | $20 | Google search included, Gmail/Docs integration |

**Winner**: Perplexity Pro ($20/month) for dedicated research tool.

---

### Example 4: Team of 5 (Mixed usage)

**Scenario**: 5 users, various tasks (writing, research, data analysis)

| Option | Monthly Cost | Notes |
|--------|--------------|-------|
| **ChatGPT Team** | $125 | $25/user annual, admin controls, higher limits |
| **Claude for Work** | $150 | $30/user annual, best writing, no search/images |
| **5x ChatGPT Plus** | $100 | Cheapest but no admin controls, no shared workspace |
| **Mix: 3x ChatGPT + 2x Claude** | $100 | Flexible but manage separately |

**Winner**: ChatGPT Team ($125/month) for admin features, or mix individual plans to save $25/month.

---

## Enterprise Features Comparison

| Feature | ChatGPT Enterprise | Claude for Enterprise | Copilot for 365 | Gemini for Workspace |
|---------|-------------------|----------------------|-----------------|---------------------|
| **Price** | $60/user/mo* | Contact sales | $30/user/mo* | Included in Workspace |
| **SSO (SAML)** | ✅ | ✅ | ✅ | ✅ |
| **Admin Dashboard** | ✅ | ✅ | ✅ | ✅ |
| **Usage Analytics** | ✅ | ✅ | ✅ | ✅ |
| **Data Residency** | ❌ (US only) | ❌ (US only) | ✅ Configurable | ✅ Configurable |
| **SOC 2 Type II** | ✅ | ✅ | ✅ | ✅ |
| **HIPAA BAA** | ✅ | ✅ | ✅ | ✅ |
| **No Training on Data** | ✅ (guaranteed) | ✅ (guaranteed) | ✅ | ✅ |
| **Unlimited Usage** | ✅ | ❌ (high limits) | ✅ | ❌ (high limits) |
| **Priority Support** | ✅ | ✅ | ✅ | ✅ |
| **Custom Models (Fine-tuning)** | ✅ ($$$) | ❌ | ❌ | ❌ |

*Annual billing required

---

## When to Use Each Provider

### Use ChatGPT Plus When:
- ✅ You need an all-around tool (search, images, data, code)
- ✅ You want the most familiar interface (most users have tried ChatGPT)
- ✅ You need Python code execution (Advanced Data Analysis)
- ✅ You want image generation (DALL-E 3)
- ✅ Budget is $20/month

### Use Claude Pro When:
- ✅ Writing quality is your top priority (blogs, docs, emails)
- ✅ You work with long documents (200K token context)
- ✅ You need Artifacts (interactive documents/code)
- ✅ You can sacrifice web search and image generation
- ✅ Budget is $20/month

### Use Gemini Advanced When:
- ✅ You're a heavy Google Workspace user (Gmail, Docs, Sheets)
- ✅ You need Google search integration
- ✅ You want 2M token context (longest available)
- ✅ Budget is $20/month

### Use Perplexity Pro When:
- ✅ Research is your primary use case
- ✅ You need citations for every answer
- ✅ You want always-on web search
- ✅ You don't need long document editing
- ✅ Budget is $20/month

### Use Microsoft Copilot When:
- ✅ You're a Microsoft 365 enterprise customer
- ✅ You need Office integration (Word, Excel, PowerPoint, Teams)
- ✅ You have existing Microsoft licensing
- ✅ Budget is $30/user/month (on top of Microsoft 365)

### Use DeepSeek (API) When:
- ✅ You need budget code generation (10x cheaper than GPT-4)
- ✅ You're comfortable with API integration
- ✅ Quality is "good enough" (not best-in-class)
- ✅ You want to minimize costs

---

## Update History

### February 2026
- ✅ All pricing verified current as of 2026-02-07
- ✅ Added DeepSeek V3 and R1 pricing
- ✅ Updated Gemini 2.0 Flash pricing
- ✅ Verified SEA availability

### January 2026
- Initial version created

---

## How to Use This Table

1. **For Quick Decisions**: Use "Quick Recommendations" at top
2. **For Detailed Comparison**: Review "Consumer Plans Comparison"
3. **For Developers/High-Volume**: Review "API Pricing Comparison"
4. **For Teams**: Review "Enterprise Features Comparison"
5. **For Cost Planning**: Review "Cost Examples by Use Case"

---

## Related Guides

- [README.md](../README.md) - Main guide with decision tree
- [guides/01-understanding-models.md](../guides/01-understanding-models.md) - How models work
- [guides/02-needs-assessment.md](../guides/02-needs-assessment.md) - Assess your needs
- [use-cases/01-content-creation.md](../use-cases/01-content-creation.md) - Best for content

---

**Last Updated**: 2026-02-07
**Next Review**: 2026-03-07
**Maintained by**: [MyEO AI](https://myeo.ai)
