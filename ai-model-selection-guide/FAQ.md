# Frequently Asked Questions

**Last Updated**: 2026-02-07

Quick answers to common questions about choosing and using AI models.

---

## Choosing a Provider

### Q: Which AI provider is "best"?
**A**: There's no single "best" - it depends on your use case:
- **All-around**: ChatGPT Plus ($20/month)
- **Writing**: Claude Pro ($20/month)
- **Research**: Perplexity Pro ($20/month)
- **Budget**: Free tiers (ChatGPT Free + Claude Free)

See [README.md](README.md) decision tree for personalized recommendation.

### Q: Should I pay for AI tools or use free tiers?
**A**: Start with free tiers for 1-2 weeks. If you use AI daily and it saves >1 hour/week, upgrade to paid ($20/month). ROI is typically positive within days for knowledge workers.

### Q: Can I use multiple AI providers?
**A**: Yes! Many users combine:
- **ChatGPT Plus** ($20) for research, images, data analysis
- **Claude Pro** ($20) for writing and editing
- **Total**: $40/month for best of both worlds

### Q: Do I need Enterprise plans?
**A**: Only if you need:
- SSO (single sign-on)
- SOC 2 compliance
- Guaranteed data residency
- Team size >50 people

For <50 users, Team plans ($25-30/user) or individual Plus accounts ($20/user) are sufficient.

---

## Pricing & Costs

### Q: Is API cheaper than consumer subscriptions?
**A**: Depends on volume:
- **Low volume** (<100K tokens/month = ~75K words): Consumer subscriptions ($20/month) are cheaper and simpler
- **High volume** (>100K tokens/month): API becomes more cost-effective
- **Break-even**: ~100,000-150,000 tokens/month

### Q: How much does it cost to generate a blog post?
**Example**: 2,000-word blog post

| Method | Cost | Notes |
|--------|------|-------|
| **ChatGPT Plus** | $0 (within subscription) | Unlimited posts within usage caps |
| **Claude Pro** | $0 (within subscription) | Unlimited posts within usage caps |
| **GPT-4o API** | ~$0.03 | 2,700 input + 2,700 output tokens |
| **Claude API** | ~$0.08 | 2,700 input + 2,700 output tokens |

**Winner**: Consumer subscriptions for simplicity (unless processing thousands of posts)

### Q: What are "tokens" and why should I care?
**A**: Tokens are how AI models measure text (~4 characters = 1 token, ~0.75 words = 1 token).

**Why it matters**:
- API pricing is per million tokens
- Context windows are measured in tokens (128K, 200K)
- Understanding tokens helps estimate costs

**Practical**: 1 page (~500 words) = ~665 tokens

---

## Features & Capabilities

### Q: Which model has web search?
**A**:
- ✅ **ChatGPT Plus** (Bing search)
- ✅ **Gemini Advanced** (Google search)
- ✅ **Perplexity** (always-on search with citations)
- ✅ **Microsoft Copilot** (Bing search)
- ❌ **Claude** (no web search)

### Q: Which model can generate images?
**A**:
- ✅ **ChatGPT Plus** (DALL-E 3)
- ✅ **Gemini Advanced** (Imagen 3)
- ✅ **Microsoft Copilot** (DALL-E 3)
- ✅ **Perplexity Pro** (DALL-E 3, Flux)
- ❌ **Claude** (no image generation, only analyzes images)

### Q: Which model has the longest context window?
**A**:
1. **Gemini 1.5 Pro**: 2,000,000 tokens (~3,000 pages)
2. **Claude 3.5 Sonnet**: 200,000 tokens (~300 pages)
3. **GPT-4o**: 128,000 tokens (~192 pages)

**Practical**: For most use cases, 128K is sufficient. 200K helps with very long documents. 2M is overkill unless you're processing entire books.

### Q: Can AI models browse the web?
**A**: Some can (with limitations):
- **ChatGPT Plus**: Yes, via Bing (not always reliable)
- **Perplexity**: Yes, always-on (best for research)
- **Gemini Advanced**: Yes, via Google
- **Claude**: No

**Limitation**: Even with web search, AI can still make mistakes. Always verify critical information.

---

## Data Privacy & Security

### Q: Is my data used to train future AI models?
**A**:

| Provider | Free Tier | Paid Tier | API | Enterprise |
|----------|-----------|-----------|-----|------------|
| **OpenAI** | YES (opt-out available) | NO | NO | NO |
| **Anthropic** | YES (opt-out available) | NO | NO | NO |
| **Google** | YES (opt-out available) | NO | NO | NO |

**Bottom line**: Paid tiers ($20/month) and API guarantee your data isn't used for training.

### Q: Can I use AI for confidential business data?
**A**: Depends on sensitivity:
- ✅ **Internal documents** (non-sensitive): OK with paid tier
- ⚠️ **Customer PII** (names, emails): Anonymize first, or use Enterprise tier with DPA
- ❌ **Trade secrets, passwords**: Never share with any AI

**Best practice**: Use data classification (Public, Internal, Confidential, Secret) - see [AI Tooling Security Guide](../ai-tooling-security-guide/).

### Q: Where is my data stored?
**A**:
- **OpenAI**: US servers only
- **Anthropic**: US servers only
- **Google**: Configurable (US, EU, Asia options for Workspace customers)
- **Microsoft**: Configurable (for Microsoft 365 customers)

**For SEA businesses**: Most providers don't offer Singapore/Malaysia data residency (yet).

---

## Quality & Performance

### Q: Which model gives the best writing quality?
**A**: Subjectively:
1. **Claude 3.5 Sonnet**: Most natural, concise, human-like
2. **GPT-4**: Good quality, sometimes verbose
3. **Gemini 1.5 Pro**: Good but slightly robotic

**Test yourself**: Try same prompt on all 3 and compare.

### Q: Do all models "hallucinate" (make up facts)?
**A**: Yes, all models can hallucinate. Some are worse than others, but none are perfect.

**Mitigation**:
- Use models with web search for factual queries
- Use Perplexity (shows citations) for research
- Always verify critical information
- Never trust AI blindly for legal, medical, or financial advice

### Q: Which model is fastest?
**A**:
1. **GPT-4o mini**: Fastest among quality models (~50 tokens/sec)
2. **Gemini 1.5 Flash**: Very fast, good quality
3. **Claude 3.5 Haiku**: Fast, good for simple tasks
4. **GPT-4o**: Medium speed (~30 tokens/sec)
5. **o1, Claude Opus**: Slowest (reasoning models take time)

**Practical**: Speed differences are 5-30 seconds per response. Only matters for real-time applications.

---

## Use Case Specific

### Q: Which model is best for code generation?
**A**:
1. **Claude 3.5 Sonnet**: Excellent code, well-explained
2. **GPT-4o**: Similar quality to Claude
3. **DeepSeek V3**: Budget option (10x cheaper via API)

**For coding in IDE**: Consider GitHub Copilot ($10/month) instead.

### Q: Which model is best for data analysis?
**A**: **ChatGPT Plus** (only one with Python code execution built-in)

Upload CSV → ChatGPT writes Python code → Runs it → Shows results and charts.

Alternatives require manual coding or third-party tools.

### Q: Which model is best for SEO content?
**A**:
1. **Jasper AI** ($49/month): Built-in SEO optimization
2. **ChatGPT Plus** ($20/month): Manual SEO optimization (cheaper)

**Break-even**: If Jasper saves >2 hours/month on SEO, worth the extra $29.

---

## Southeast Asia Specific

### Q: Can I pay with GrabPay, FPX, or local payment methods?
**A**: Most providers only accept credit cards:
- ✅ Credit card: All providers
- ⚠️ Apple Pay: OpenAI, Anthropic, Google
- ⚠️ Google Pay: Google only
- ❌ GrabPay, FPX, bank transfer: Not yet supported

**Workaround**: Use virtual credit cards or international credit cards.

### Q: Do these work in Singapore, Malaysia, Indonesia, Thailand?
**A**: Yes, all major providers (OpenAI, Anthropic, Google, Microsoft) are fully available in SEA.

**Exceptions**:
- Some features may roll out later to SEA
- Pricing may differ (usually same as US)

### Q: Is there data residency in Southeast Asia?
**A**: Currently:
- ❌ **OpenAI**: US only
- ❌ **Anthropic**: US only
- ✅ **Google**: Asia region available (for Workspace Enterprise)
- ✅ **Microsoft**: Configurable (for Microsoft 365 Enterprise)

**For most SMEs**: Data residency isn't a dealbreaker unless required by regulations or contracts.

### Q: Do models support Bahasa Malaysia, Thai, Tagalog?
**A**:

| Language | ChatGPT | Claude | Gemini |
|----------|---------|--------|--------|
| English | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| Mandarin | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| Bahasa (Malay/Indonesian) | ⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐⭐ |
| Thai | ⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐⭐ |
| Tagalog | ⭐⭐⭐ | ⭐⭐ | ⭐⭐⭐ |

**Best for SEA languages**: ChatGPT and Gemini

---

## Switching & Migration

### Q: Can I switch providers easily?
**A**: Yes:
- ✅ Consumer subscriptions are month-to-month (cancel anytime)
- ✅ Export conversation history from most providers
- ⚠️ Team/Enterprise plans may require annual commitment
- ❌ Custom GPTs (ChatGPT) and Projects (Claude) don't transfer between providers

**Switching cost**: <1 hour to set up new account

### Q: Can I export my conversations?
**A**:
- ✅ **ChatGPT**: Yes (Settings → Data export)
- ✅ **Claude**: Yes (export per conversation)
- ✅ **Gemini**: Yes (Google Takeout)

---

## Technical Questions

### Q: What's the difference between GPT-4 and GPT-4o?
**A**:
- **GPT-4**: Original model, slower, more expensive
- **GPT-4o**: "Omni" model - faster, multimodal (vision, voice), cheaper
- **GPT-4o mini**: Even faster, simpler tasks, very cheap

**For most users**: GPT-4o is better (faster, cheaper, multimodal)

### Q: What's the difference between ChatGPT and OpenAI API?
**A**:
- **ChatGPT**: Web interface, mobile apps, $20/month subscription
- **OpenAI API**: Programmatic access, pay-per-token, for developers

**For non-technical users**: Use ChatGPT
**For developers**: Use API if building applications

### Q: What does "context window" mean?
**A**: Maximum amount of text the model can process at once.
- 128K tokens = ~96,000 words = ~192 pages
- 200K tokens = ~150,000 words = ~300 pages
- 2M tokens = ~1.5M words = ~3,000 pages

**Practical**: Most conversations fit in 128K. Larger context helps with long documents.

---

## Troubleshooting

### Q: Why did I hit usage limits?
**A**: Each provider has different limits:
- **ChatGPT Plus**: 80 GPT-4 messages per 3 hours (resets every 3 hours)
- **Claude Pro**: ~5x Free tier (exact number unpublished, resets every 5 hours)
- **Gemini Advanced**: High but unpublished limits

**Solutions**:
- Wait for reset (3-5 hours)
- Use faster models (GPT-4o mini, Claude Haiku) which have higher limits
- Switch to another provider temporarily
- Upgrade to Team/Enterprise (higher limits)

### Q: Why does the same prompt give different answers?
**A**: AI models are non-deterministic (randomness built-in for creativity).

**To get consistent answers**:
- API users: Set `temperature = 0`
- Consumer users: Re-prompt with "Give me the exact same answer as before"
- Expect ~90% consistency, not 100%

### Q: Why can't ChatGPT access URLs I share?
**A**: ChatGPT's web browsing has limitations:
- Can access most public websites
- Cannot access paywalled content
- Cannot access pages requiring login
- Cannot access some dynamic JavaScript pages

**Workaround**: Copy-paste the content directly into ChatGPT

---

## Still Have Questions?

- **Read the full guide**: [README.md](README.md)
- **Compare providers**: [providers/00-comparison.md](providers/00-comparison.md)
- **Community**: Ask in r/ChatGPT or r/ClaudeAI on Reddit

---

**Last Updated**: 2026-02-07
**Maintained by**: [MyEO AI](https://myeo.ai)
