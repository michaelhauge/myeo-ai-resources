# Workflow 16: Customer Onboarding Sequences

**Funnel Stage:** Retention
**Time Saved:** 4–6 hours (one-time setup), then fully automated
**Tools:** Claude, Mailchimp / ActiveCampaign / HubSpot, n8n
**Difficulty:** Beginner

---

## What This Workflow Does

Creates a structured, personalised onboarding email sequence that automatically activates when a new client signs. Instead of ad-hoc welcome emails and hoping clients figure things out, every new customer gets a professional, confidence-building onboarding experience that reduces churn, increases engagement, and makes you look like a much larger operation than you are.

---

## The Prompt Template

### Prompt 1 — Full Onboarding Sequence

```
Create a customer onboarding email sequence for my business.

MY BUSINESS:
Company: [COMPANY NAME]
What we deliver: [PRODUCT / SERVICE — 2–3 sentences]
Typical client: [WHO BUYS FROM US]
Onboarding period: [e.g. first 30 days, first 90 days]

COMMON NEW CLIENT ANXIETIES:
1. [e.g. "Did I make the right decision?"]
2. [e.g. "When will I see results?"]
3. [e.g. "Who do I contact if something goes wrong?"]

FIRST STEPS A NEW CLIENT NEEDS TO TAKE:
1. [e.g. Complete onboarding form]
2. [e.g. Schedule kickoff call]
3. [e.g. Share team contact list]

KEY MILESTONES IN OUR DELIVERY:
[e.g. Kickoff call → needs assessment → first deliverable → review → second phase]

Write a 6-email onboarding sequence:

EMAIL 1 (Immediately after signing): Welcome + confirm what happens next. Reassure them they made the right decision. Include first action they need to take. Under 200 words.

EMAIL 2 (Day 2): Practical setup email. Walk them through the first 2–3 steps. Include links, instructions, or what to prepare. Under 150 words.

EMAIL 3 (Day 7): Check-in. "How are you finding things?" + a useful tip or resource. Under 100 words.

EMAIL 4 (Day 14): Progress celebration. Acknowledge what they've done so far. Preview what's coming. 100 words.

EMAIL 5 (Day 21): Case study or social proof relevant to their situation. Plant the idea of an upsell or referral. 150 words.

EMAIL 6 (Day 30): 30-day milestone. What we've accomplished together. What's next. Invite them to leave a review or refer a colleague. 150 words.

Tone: Warm, professional, confident. Write as if from [YOUR NAME / TEAM NAME].
```

### Prompt 2 — Quick Kickoff Call Agenda

```
Write a kickoff call agenda for a new client.

Client company: [COMPANY]
Client contact: [NAME, ROLE]
Our deliverable: [WHAT WE'RE DELIVERING]
Call duration: [30 / 60 minutes]

Create an agenda that:
1. Opens with a relationship-building moment (not straight to business)
2. Confirms their goals and success metrics
3. Covers logistics (timeline, communication preferences, point of contact)
4. Sets expectations for what they'll see and when
5. Ends with clear next steps

Include suggested questions for each section.
```

---

## How to Use It

1. Run Prompt 1 once — this is your master onboarding sequence
2. Load the 6 emails into your email platform (Mailchimp, ActiveCampaign, HubSpot) as an automated sequence
3. Configure trigger: when a deal moves to "Closed Won" in your CRM → sequence activates automatically
4. Customise Email 1 slightly per client (add their company name, specific deliverable)
5. All subsequent emails send automatically on schedule

---

## Example Email 1

**Subject:** Welcome to [Company] — here's what happens next

> Hi [Name],
>
> Welcome. We're genuinely glad you're here.
>
> Over the next 30 days, we'll [brief description of what you'll deliver]. By the end, you'll have [specific outcome].
>
> Your first step is simple: complete the onboarding form here → [LINK]. It takes 8 minutes and gives us everything we need to hit the ground running.
>
> Your kickoff call is scheduled for [DATE/TIME]. If anything changes on your end, just reply to this email.
>
> Looking forward to it.
>
> [Your name]

---

## Malaysia-Specific Tips

- Send onboarding emails in English with a WhatsApp message to accompany each one — "Hi [Name], just sent you the onboarding details over email" bridges the gap for clients who prefer WhatsApp
- For GLC and corporate clients, include a formal "Letter of Engagement" summary in Email 1 — they often need this for internal records
- Acknowledge public holidays proactively — if a kickoff call is near Hari Raya, CNY, or Deepavali, mention it explicitly to avoid scheduling confusion
- Malaysian clients respond well to being told exactly what to expect — reduce ambiguity in every email

---

## Recommended Tools

| Tool | Purpose | Cost |
|------|---------|------|
| Claude | Sequence generation | USD 20/month |
| ActiveCampaign | Email automation + CRM trigger | USD 29/month |
| HubSpot | CRM + email sequences (free tier) | Free / USD 45/month |
| n8n | Custom automation (WhatsApp + email) | Free (self-hosted) |

---

## Expected Results

- New clients feel confident and cared for from day one
- Churn in first 30 days drops significantly (most churn is "buyer's remorse" — this prevents it)
- Referrals and reviews come in at Day 30 (you ask for them at the right moment)
- Your team spends zero time on manual onboarding follow-up
