# Understanding AI Models: A Non-Technical Guide

**For business leaders who need to make informed AI decisions without becoming data scientists**

**Time to Read**: 15 minutes
**Prerequisites**: None - start here if you're new to AI
**Next Steps**: [02-needs-assessment.md](02-needs-assessment.md)

---

## What This Guide Covers

This guide explains how large language models (LLMs) work in plain English, so you can:
- Understand what you're buying when you pay for ChatGPT, Claude, or Gemini
- Make informed decisions about which model to use for which task
- Avoid common misconceptions and expensive mistakes
- Speak confidently about AI with your team and stakeholders

**What this guide does NOT cover**: Technical implementation, machine learning algorithms, or AI engineering. This is for decision-makers, not developers.

---

## The One-Sentence Explanation

**Large language models (LLMs) are trained to predict the next word in a sequence, and that simple task - done extremely well on massive datasets - enables them to write, reason, code, and assist with knowledge work.**

---

## Key Concepts (Non-Technical)

### 1. What is a Large Language Model (LLM)?

**Simple Analogy**: Think of LLMs as **extremely sophisticated autocomplete**.

You've used autocomplete on your phone: you type "How are", and it suggests "you doing?". LLMs work the same way, but at a vastly larger scale. They've read billions of documents (books, websites, code, etc.) and learned patterns in how words follow each other.

**Example**:
- You type: "The capital of France is"
- Your brain predicts: "Paris"
- An LLM does the same thing, except it's been trained on all of Wikipedia, millions of books, and the entire internet

**Why this matters**: Because LLMs are pattern-matching machines, they:
- ✅ Excel at tasks with clear patterns (writing emails, summarizing docs, translating)
- ❌ Struggle with tasks requiring real-world knowledge they haven't seen
- ❌ Can "hallucinate" (confidently make up facts that sound plausible)

---

### 2. Tokens: How AI Models Measure Text

**Definition**: A token is roughly 4 characters or 0.75 words.

**Why you should care**: AI models charge by the token. Understanding tokens helps you:
- Estimate costs (API pricing is per 1 million tokens)
- Understand context limits (models can only "remember" a certain number of tokens)

**Examples**:
| Text | Approximate Tokens |
|------|-------------------|
| "Hello" | 1 token |
| "Hello, how are you?" | 5 tokens |
| Average sentence | 15-20 tokens |
| Average paragraph (100 words) | 133 tokens |
| 1-page document (~500 words) | 665 tokens |
| 10-page document (~5,000 words) | 6,650 tokens |
| Full novel (~100,000 words) | 133,000 tokens |

**Practical Example**:
- You paste a 5,000-word document into ChatGPT
- That's ~6,650 input tokens
- ChatGPT generates a 500-word summary
- That's ~665 output tokens
- Total: ~7,315 tokens used

**Cost Impact**:
- GPT-4o: $2.50 input + $10 output per 1M tokens
- Your example: (6,650 × $2.50 / 1,000,000) + (665 × $10 / 1,000,000) = $0.023 (2.3 cents)

**Key Takeaway**: For most business use cases, API costs are negligible (<$5/month). Consumer subscriptions ($20/month) are usually simpler and cheaper than API unless you're processing millions of tokens.

---

### 3. Context Window: The Model's "Memory"

**Definition**: The context window is the maximum amount of text (in tokens) a model can "see" at once.

**Simple Analogy**: Imagine reading a book, but you can only see one page at a time. A model with a 128K token context can see ~192 pages at once. A model with a 200K context can see ~300 pages.

**Why this matters**:
- Larger context = can process longer documents in one go
- Larger context = can "remember" more of the conversation history

**Current Context Windows** (as of Feb 2026):
| Model | Context Window | Equivalent Pages | Equivalent Words |
|-------|----------------|------------------|------------------|
| GPT-4o | 128,000 tokens | ~192 pages | ~96,000 words |
| Claude 3.5 Sonnet | 200,000 tokens | ~300 pages | ~150,000 words |
| Gemini 1.5 Pro | 2,000,000 tokens | ~3,000 pages | ~1,500,000 words |

**Practical Example**:
- You have a 50-page contract (40,000 words = 53K tokens)
- **GPT-4o (128K)**: ✅ Can handle it in one go
- **Claude (200K)**: ✅ Can handle it easily
- **Gemini (2M)**: ✅ Massive overkill, but can handle 37 contracts at once

**When larger context matters**:
- ✅ Analyzing long documents (legal contracts, research papers, books)
- ✅ Long conversations (100+ message threads)
- ✅ Code repositories (analyzing entire projects)

**When larger context doesn't matter**:
- ❌ Short tasks (writing emails, quick questions) - 128K is plenty
- ❌ Most business use cases - you rarely paste >20 pages at once

---

### 4. Model Size (Parameters): Bigger ≠ Always Better

**Definition**: Parameters are the "knobs" the model adjusts during training. More parameters = more complex model.

**Numbers**:
- Small models: ~7-13 billion parameters (e.g., Mistral 7B, GPT-3.5)
- Medium models: ~70-180 billion parameters (e.g., GPT-4, Claude)
- Large models: ~500B-1.7 trillion parameters (e.g., GPT-4, Claude Opus)

**Why you should care**: You don't need to know the exact number, but understand this tradeoff:

| Factor | Small Models | Large Models |
|--------|--------------|--------------|
| **Quality** | Good enough for simple tasks | Best quality |
| **Speed** | Very fast (seconds) | Slower (10-30 seconds) |
| **Cost** | Cheap ($0.15/1M tokens) | Expensive ($15/1M tokens) |
| **Best For** | Summaries, translations, simple writing | Complex analysis, coding, creative writing |

**Practical Advice**: Start with the smallest model that works, then upgrade if quality is insufficient.

---

### 5. Training Data and Knowledge Cutoff

**The Problem**: AI models don't "know" things in real-time. They know what was in their training data.

**Example Knowledge Cutoffs** (as of Feb 2026):
- GPT-4: Trained on data up to October 2023
- Claude: Trained on data up to August 2023
- Gemini: Trained on data up to late 2023

**What this means**:
- ❌ Models don't know events after their training cutoff
- ❌ Can't tell you today's news, current stock prices, or recent events
- ❌ May reference outdated information (old pricing, discontinued products)

**Solutions**:
- ✅ **Web search**: ChatGPT Plus, Gemini, Perplexity can search the web for current info
- ✅ **RAG (Retrieval-Augmented Generation)**: Provide the model with current documents

**When knowledge cutoff matters**:
- ✅ Research on current events (use Perplexity or ChatGPT with web search)
- ✅ Checking current prices, policies, or availability
- ✅ Fact-checking recent claims

**When knowledge cutoff doesn't matter**:
- ❌ Writing emails or documents (timeless skills)
- ❌ Editing and summarizing your own documents
- ❌ Coding (most programming concepts are stable)

---

### 6. Temperature: Creativity vs. Consistency

**Definition**: Temperature is a setting that controls randomness in the model's output.

**Scale**: 0.0 (deterministic, same output every time) to 2.0 (highly random, creative)

**Typical Settings**:
| Temperature | Behavior | Best For |
|-------------|----------|----------|
| **0.0 - 0.3** | Deterministic, consistent, factual | Data extraction, summaries, analysis |
| **0.7 - 1.0** (default) | Balanced creativity and coherence | General writing, conversations |
| **1.0 - 2.0** | Highly creative, unpredictable | Brainstorming, creative writing, ideation |

**Why you should care**:
- Most consumer apps (ChatGPT Plus, Claude Pro) use a fixed temperature (~0.7)
- API users can adjust temperature per request
- If you want the model to always give the same answer, lower the temperature

**Practical Example**:
- **Task**: "Summarize this 5-page contract"
- **Temperature 0.0**: Always produces identical summary
- **Temperature 1.0**: Each run produces slightly different phrasing (same facts)
- **Temperature 2.0**: May get creative and add interpretations

---

## How Models Are Trained

**Simplified 3-Step Process**:

### Step 1: Pre-training (Learn Language Patterns)
- Model reads billions of documents (books, websites, code, etc.)
- Learns to predict next word in sequences
- Takes months and costs $10M-100M+
- **Outcome**: General language understanding

### Step 2: Instruction Fine-Tuning (Learn to Follow Instructions)
- Model trained on examples of "instruction → response"
- Learns to answer questions, follow commands, format output
- Takes weeks, costs $1M-10M
- **Outcome**: Useful assistant behavior

### Step 3: Reinforcement Learning from Human Feedback (RLHF)
- Humans rate model outputs (helpful vs. harmful, accurate vs. hallucinated)
- Model learns to optimize for human preferences
- Takes weeks, costs $1M-10M
- **Outcome**: Safe, helpful, aligned behavior

**Why you should care**: Training is expensive, which is why:
- Only a few companies can afford it (OpenAI, Anthropic, Google, Meta)
- Smaller providers (Perplexity, Jasper) use other companies' models under the hood
- Open-source models (Llama, Mistral) rely on companies/communities to fund training

---

## Key Tradeoffs to Understand

### 1. Speed vs. Quality

| Priority | Model Choice | Use Case |
|----------|--------------|----------|
| **Speed** | GPT-4o mini, Gemini Flash, Claude Haiku | Quick summaries, simple tasks, chatbots |
| **Balanced** | GPT-4o, Claude Sonnet, Gemini Pro | General business tasks |
| **Quality** | o1, Claude Opus | Complex analysis, creative writing, hard problems |

### 2. Cost vs. Capability

**Budget Hierarchy** (Monthly costs for moderate use):
1. **Free tiers** ($0) - Limited, but great for testing
2. **Consumer plans** ($20/month) - Unlimited reasonable use, best value
3. **Team plans** ($25-30/user/month) - Add admin controls
4. **Enterprise** ($60+/user/month) - SSO, compliance, support

**Rule of Thumb**: Don't pay for Enterprise unless you need SSO or compliance certifications. Team plans are only worth it if you need admin dashboards.

### 3. Specialized vs. General Purpose

| Need | Specialized Tool | General Purpose Alternative |
|------|------------------|----------------------------|
| **Research with citations** | Perplexity Pro ($20/mo) | ChatGPT Plus + web search |
| **SEO content** | Jasper ($49/mo) | ChatGPT Plus + prompts |
| **Meeting transcription** | Otter.ai ($10/mo) | ChatGPT Plus + audio upload |
| **Image generation** | Midjourney ($10/mo) | ChatGPT Plus (DALL-E) |

**Advice**: Start with general-purpose (ChatGPT Plus or Claude Pro). Only pay for specialized tools if the general model isn't good enough.

---

## Common Misconceptions

### ❌ Myth 1: "Newer model = always better for my task"
**Reality**: GPT-4o mini is newer than GPT-4, but GPT-4 is still better for complex tasks. Newest ≠ best for every use case.

### ❌ Myth 2: "AI models are sentient or 'understand' like humans"
**Reality**: Models are statistical pattern-matchers. They don't "understand" in a human sense - they predict likely next words based on training data.

### ❌ Myth 3: "Expensive model = better output"
**Reality**: For simple tasks (summaries, translations), cheap models work just as well. Save money by using the smallest model that meets your quality bar.

### ❌ Myth 4: "AI can't make mistakes"
**Reality**: ALL models hallucinate (make up facts). Always verify critical information. Never trust AI blindly for legal, medical, or financial advice.

### ❌ Myth 5: "I need Enterprise plan for my 10-person team"
**Reality**: Enterprise is for 50+ users or regulated industries. For <50 users, Team plans ($25-30/user) or even individual Plus accounts ($20/user) work fine.

### ❌ Myth 6: "API is always cheaper than subscriptions"
**Reality**: For <100K tokens/month (~75K words), subscriptions are simpler and often cheaper. API makes sense for high volume or custom integrations.

---

## What Models CAN'T Do (Honest Limitations)

### 1. Provide Real-Time Information
- ❌ Can't tell you today's stock price, weather, or news (unless they have web search)
- ✅ **Solution**: Use models with web search (ChatGPT Plus, Perplexity, Gemini)

### 2. Access External Systems
- ❌ Can't check your bank balance, send emails, or book meetings (unless integrated with APIs/plugins)
- ✅ **Solution**: Use tools with integrations (Microsoft Copilot for Office, Gemini for Gmail)

### 3. Guarantee Factual Accuracy
- ❌ All models hallucinate occasionally (make up facts confidently)
- ✅ **Solution**: Always verify critical info, use models with citations (Perplexity)

### 4. Handle Truly Novel Situations
- ❌ Limited by training data patterns - struggle with genuinely new problems
- ✅ **Workaround**: Provide detailed context and examples in your prompts

### 5. Maintain Perfect Consistency
- ❌ Same prompt may get slightly different answers each time (unless temperature = 0)
- ✅ **Solution**: For critical workflows, use lower temperature or API with fixed seed

### 6. Understand Nuance Perfectly
- ❌ Sarcasm, cultural references, and subtle humor often missed
- ✅ **Mitigation**: Be explicit in prompts, avoid relying on implied context

---

## Practical Decision Framework

Use this flowchart to quickly match models to tasks:

```
Does your task require real-time web search?
├─ YES → ChatGPT Plus, Perplexity Pro, or Gemini Advanced
└─ NO ↓

Is your task primarily writing long documents?
├─ YES → Claude Pro (200K context, best writing)
└─ NO ↓

Do you need image generation?
├─ YES → ChatGPT Plus (DALL-E 3) or Gemini Advanced
└─ NO ↓

Do you need data analysis (code execution)?
├─ YES → ChatGPT Plus (Advanced Data Analysis)
└─ NO ↓

Are you on a tight budget?
├─ YES → Start with free tiers, upgrade only if needed
└─ NO ↓

Want best all-around tool?
└─ ChatGPT Plus ($20/month)
```

---

## Next Steps

Now that you understand how models work, move to:

1. **[02-needs-assessment.md](02-needs-assessment.md)** - Assess your specific AI needs (30 min)
2. **[../providers/00-comparison.md](../providers/00-comparison.md)** - Compare specific models and pricing (10 min)
3. **Free tier testing** - Sign up for ChatGPT Free + Claude Free and test for 1-2 weeks

---

## Glossary (Quick Reference)

| Term | Simple Definition |
|------|-------------------|
| **LLM** | Large Language Model - AI trained to predict next words |
| **Token** | ~4 characters or 0.75 words. How AI measures text. |
| **Context Window** | Max text (in tokens) model can process at once |
| **Temperature** | Randomness setting (0 = deterministic, 2 = creative) |
| **Hallucination** | When AI confidently makes up facts |
| **Fine-tuning** | Additional training on specialized data |
| **RAG** | Retrieval-Augmented Generation - giving model external docs |
| **Prompt** | Your input/instruction to the AI |
| **Inference** | Running the model to get output (vs. training) |
| **API** | Application Programming Interface - programmatic access |

---

## Related Guides

- [README.md](../README.md) - Main guide with decision tree
- [02-needs-assessment.md](02-needs-assessment.md) - Assess your needs
- [03-build-vs-buy.md](03-build-vs-buy.md) - Consumer vs API decision
- [../providers/00-comparison.md](../providers/00-comparison.md) - Current pricing and features

---

**Last Updated**: 2026-02-07
**Next Review**: 2026-08-07 (strategy content, updated rarely)
**Maintained by**: [MyEO AI](https://myeo.ai)
