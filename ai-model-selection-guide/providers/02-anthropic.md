# Anthropic (Claude)

**Last Updated**: 2026-02-07
**Next Review**: 2026-03-07
**Status**: ✅ Current

---

## Quick Summary

**Best For**: Writing, long documents, complex instructions, code generation
**Price**: Free to $30/user/month
**Key Strength**: Best writing quality, 200K context window, excellent at following instructions
**Key Weakness**: No web search, no image generation

---

## Available Products

### Consumer Products

| Product | Price | Best For | Key Features |
|---------|-------|----------|--------------|
| **Claude Free** | $0 | Testing | Very limited messages, Claude 3.5 Sonnet |
| **Claude Pro** | $20/mo | Individual power users | 5x more usage, all models, priority access, Artifacts |
| **Claude for Work** | $30/user/mo* | Teams (3-50) | Everything in Pro + admin dashboard, SSO prep, no training on data |

*Annual billing required for Claude for Work

### API Products

| Model | Input $/1M | Output $/1M | Context | Best For |
|-------|------------|-------------|---------|----------|
| **Claude 3.5 Sonnet** | $3.00 | $15.00 | 200K | Writing, code, general tasks |
| **Claude 3.5 Haiku** | $0.80 | $4.00 | 200K | Simple tasks, high speed |
| **Claude 3 Opus** | $15.00 | $75.00 | 200K | Most complex tasks |

---

## Claude Pro Deep Dive

### What You Get ($20/month)

**Models Included**:
- ✅ Claude 3.5 Sonnet (primary model, best balance)
- ✅ Claude 3.5 Haiku (faster, simpler tasks)
- ✅ Claude 3 Opus (most capable, complex reasoning)

**Features**:
- ✅ **Artifacts** (interactive documents and code)
- ✅ **Vision** (upload images, analyze them)
- ✅ **File upload** (PDF, Word, PowerPoint, text)
- ✅ **200K context window** (~300 pages of text)
- ✅ **Projects** (organize conversations by topic)
- ✅ **Claude.ai mobile app**
- ❌ **No web search** (biggest limitation)
- ❌ **No image generation**
- ❌ **No code execution** (can't run Python like ChatGPT)

**Limits**:
- 5x more usage than Free tier (exact number not published)
- Usage resets every 5 hours
- Heavy users may hit limits

### Use Cases Where Claude Pro Excels

#### 1. Writing & Editing
**Example**: "Write a 2,000-word blog post about AI adoption in Southeast Asia"
- Best writing quality among all models
- Natural, human-like tone
- Excellent at matching your writing style

**vs ChatGPT**: Claude is more concise, less likely to over-explain
**vs Gemini**: Claude has better narrative flow

**Real Comparison**:
```
Same prompt: "Write a professional email declining a meeting"

ChatGPT: 150 words, overly formal, verbose
Claude: 80 words, professional but warm, concise
Gemini: 120 words, good but slightly robotic
```

#### 2. Long Document Analysis
**Example**: Upload 100-page research report → "Summarize key findings and methodology"
- 200K context = can process longer docs than ChatGPT (128K)
- Excellent at extracting key information
- Maintains coherence across long texts

**Practical Limit**: ~150,000 words or ~300 pages

#### 3. Code Generation
**Example**: "Build a Python script to analyze sales data from CSV and generate report"
- Excellent at writing clean, documented code
- Strong at explaining code logic
- Good at debugging

**vs ChatGPT**: Similar quality
**vs DeepSeek**: DeepSeek cheaper for code, Claude better explained

#### 4. Following Complex Instructions
**Example**: "Write in the style of Malcolm Gladwell, avoid clichés, use Oxford comma, include 3 examples"
- Claude is exceptional at following multi-step instructions
- Rarely forgets constraints midway through
- Good at maintaining consistency

**This is Claude's superpower** compared to other models.

---

## Artifacts Feature

**What are Artifacts?**
Interactive documents, code, and visualizations that appear in a separate panel.

**Examples**:
- **Documents**: Claude writes a document, you can edit it live
- **Code**: Claude writes HTML/CSS/JavaScript, renders it live
- **SVGs**: Claude creates diagrams, charts, illustrations
- **React components**: Claude builds interactive UI elements

**Use Cases**:
- Build landing pages without coding
- Create interactive data visualizations
- Design SVG logos and graphics
- Prototype web apps quickly

**Limitation**: Only works in claude.ai (not mobile app)

---

## Claude for Work

**Price**: $30/user/month (annual billing)
**Minimum**: No minimum (but designed for teams)

### Work vs Pro

| Feature | Pro | Work |
|---------|-----|------|
| Price | $20/mo | $30/user/mo* |
| Usage limits | Standard | Higher |
| Admin dashboard | ❌ | ✅ |
| Usage analytics | ❌ | ✅ |
| SSO (SAML) | ❌ | Coming soon |
| Training on data | Opt-out | ✅ No training |
| Projects sharing | ❌ | ✅ |
| Priority support | ❌ | ✅ |

**When to choose Work**:
- ✅ Team of 3+ people
- ✅ Need admin controls
- ✅ Want guaranteed no-training policy
- ✅ Share projects across team

**When Pro is enough**:
- ❌ Solo user or <3 people
- ❌ Don't need admin visibility

---

## SEA Availability

### Singapore, Malaysia, Indonesia, Thailand

**Availability**: ✅ Fully available
**Payment Methods**: Credit card only
**Local Payment**: ❌ No GrabPay, FPX, local bank transfer
**Data Residency**: US servers only (no SEA data centers)

### Language Support

| Language | Quality | Notes |
|----------|---------|-------|
| English | ⭐⭐⭐⭐⭐ | Excellent, best among all models |
| Mandarin Chinese | ⭐⭐⭐⭐ | Very good |
| Malay/Bahasa | ⭐⭐⭐ | Good but less training data |
| Thai | ⭐⭐⭐ | Good |
| Code (Python, JS) | ⭐⭐⭐⭐⭐ | Excellent |

---

## Common Questions

### Q: Why no web search?
**A**: Anthropic focuses on core reasoning capabilities rather than real-time data. They believe adding web search would complicate the model's alignment and safety.

**Workaround**:
- Use ChatGPT or Perplexity for research
- Copy relevant info to Claude for writing/analysis
- Combination: Research with ChatGPT → Write with Claude

### Q: Is my data used for training?
**Claude Free**: YES, unless you opt out (in settings)
**Claude Pro**: NO (guaranteed in ToS as of 2024)
**Claude for Work**: NO (guaranteed)
**API**: NO (guaranteed)

### Q: Claude Pro vs ChatGPT Plus for writing?
**Claude Pro**:
- ✅ Better writing quality (more natural, concise)
- ✅ Longer context (200K vs 128K)
- ✅ Better at complex instructions
- ❌ No web search
- ❌ No image generation

**ChatGPT Plus**:
- ✅ Web search
- ✅ Image generation
- ✅ Data analysis
- ❌ Can be verbose
- ❌ Shorter context (128K)

**Verdict**: Claude for pure writing, ChatGPT for all-around

### Q: Can I use Claude for coding?
**Yes**, Claude is excellent for code:
- Clean, well-documented code
- Good at explaining logic
- Strong at debugging
- Supports 20+ programming languages

**vs Alternatives**:
- ChatGPT: Similar quality
- DeepSeek: Cheaper via API, good quality
- GitHub Copilot: Better for autocomplete in IDE

### Q: What's the usage limit?
Anthropic doesn't publish exact numbers, but Claude Pro users report:
- ~5x more messages than Free tier
- Resets every 5 hours
- Heavy users (100+ messages/day) may hit limits

**If you hit limits frequently**: Consider API usage or ChatGPT Plus (80 GPT-4 messages/3hr is more predictable)

---

## Strengths & Weaknesses

### ✅ Strengths

1. **Best writing quality** - Natural tone, concise, human-like
2. **Instruction following** - Excellent at complex, multi-step tasks
3. **200K context** - Process longer documents than GPT-4
4. **Safety & alignment** - Less likely to produce harmful content
5. **Code quality** - Clean, documented, explained well

### ❌ Weaknesses

1. **No web search** - Can't access current information
2. **No image generation** - Can't create images (only analyze them)
3. **Smaller ecosystem** - Fewer integrations than OpenAI
4. **Vague usage limits** - Don't know exact message cap
5. **No code execution** - Can't run Python like ChatGPT's Advanced Data Analysis

---

## When to Choose Claude

### ✅ Choose Claude Pro When:
- Writing quality is your top priority
- You work with long documents (50-300 pages)
- You need to follow complex, detailed instructions
- You can live without web search and image generation
- Budget is $20/month

### ✅ Choose Claude for Work When:
- Team of 3+ people
- Need admin controls and analytics
- Want guaranteed no-training policy
- Budget is $30/user/month

### ✅ Choose API When:
- Building applications
- Processing >50K tokens/month
- Need programmatic access
- Want 200K context window

### ❌ Choose Alternative When:
- Need web search for research → ChatGPT Plus or Perplexity Pro
- Need image generation → ChatGPT Plus or Gemini Advanced
- Need data analysis with Python → ChatGPT Plus
- Budget is $0 → Claude Free (very limited) or ChatGPT Free

---

## Cost Examples

### Content Writer (Heavy User)

**Usage**: Write 20 blog posts/month (2,000 words each = 40,000 words total)

| Plan | Monthly Cost | Value |
|------|--------------|-------|
| Claude Pro | $20 | Unlimited within usage caps |
| Claude API (3.5 Sonnet) | ~$3.60 | 40K input + 40K output tokens |

**Calculation**: (53K input × $3/1M) + (53K output × $15/1M) = $0.16 + $0.80 = $0.96

**Winner**: Claude Pro for simplicity (unless processing millions of words)

### Small Team (5 people, moderate writing)

**Usage**: 30 documents/month per person

| Plan | Monthly Cost | Notes |
|------|--------------|-------|
| 5× Claude Pro | $100 | No admin controls, each pays separately |
| Claude for Work | $150 | Admin dashboard, analytics, no training guarantee |

**Winner**: Depends on need for admin controls ($50 premium for team features)

---

## Common Workflows

### Workflow 1: Research + Writing (Claude + ChatGPT)

**Problem**: Claude can't search the web
**Solution**: Use both tools in sequence

**Steps**:
1. **Research** with ChatGPT Plus (web search enabled)
   - "What are current trends in SEA fintech for 2026?"
   - Copy relevant information
2. **Write** with Claude Pro
   - Paste research → "Write a 1,500-word analysis"
   - Claude produces better-written content

**Total Cost**: $40/month (both subscriptions)
**Value**: Best of both worlds

### Workflow 2: Long Document Analysis

**Task**: Analyze 150-page contract

**Why Claude**:
- 200K context = ~300 pages max (vs ChatGPT's 128K = ~192 pages)
- Excellent at following instructions like "Focus only on termination clauses"

**Steps**:
1. Upload PDF to Claude
2. "Summarize key terms, identify risks, extract all deadlines"
3. Claude maintains coherence across entire document

### Workflow 3: Code Generation with Explanation

**Task**: Build Python script for data processing

**Why Claude**:
- Clean, well-documented code
- Excellent explanations of logic
- Good at iterating based on feedback

**Steps**:
1. "Build a script to process CSV sales data and generate monthly report"
2. Claude writes code with comments
3. "Explain how the date filtering works"
4. Claude provides clear explanation

**vs ChatGPT**: Similar quality, both excellent for code

---

## Migration from Other Providers

### From ChatGPT Plus

**What you'll miss**:
- Web search (biggest loss)
- Image generation (DALL-E 3)
- Data analysis (Python code execution)

**What you'll gain**:
- Better writing quality
- Longer context window (200K vs 128K)
- Better instruction following
- Artifacts (interactive documents/code)

**Verdict**: Only switch if writing is 80%+ of your usage. Otherwise keep ChatGPT or get both ($40/month).

### From Gemini Advanced

**What you'll miss**:
- Massive context window (2M vs 200K)
- Google Workspace integration
- Web search

**What you'll gain**:
- Better writing quality
- Better at following instructions
- More mature ecosystem

**Verdict**: Switch if you don't use Google Workspace heavily and prioritize writing.

---

## Related Guides

- [Master Comparison Table](00-comparison.md) - Compare all providers
- [OpenAI (ChatGPT)](01-openai.md) - Best all-around alternative
- [Google (Gemini)](03-google.md) - For Google Workspace users
- [use-cases/01-content-creation.md](../use-cases/01-content-creation.md) - Best for content

---

**Last Updated**: 2026-02-07
**Pricing Verified**: 2026-02-07
**Next Review**: 2026-03-07
**Official Pricing**: https://www.anthropic.com/pricing
