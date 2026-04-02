# Vendor Scorecard Templates

## The 15-Criteria Vendor Evaluation Framework

**Purpose**: Objectively compare vendors to decide which tool to keep and which to eliminate during consolidation.

**Scoring**: Rate each vendor on 15 criteria (1-10 scale, where 10 = excellent, 1 = poor).

**Decision rule**:
- **Highest total score** = Keep this vendor
- **Lower scores** = Eliminate these vendors (migrate users to top-scoring vendor)

---

## Master Vendor Scorecard Template

### Vendor Information

**Vendor name**: [VENDOR NAME]

**Category**: [PROJECT MANAGEMENT / CRM / COMMUNICATION / etc.]

**Current spend**: $[X]/year

**Number of users**: [Y] users

**Contract term**: [ANNUAL / MONTHLY / MULTI-YEAR]

**Evaluator**: [YOUR NAME]

**Date evaluated**: [YYYY-MM-DD]

---

### Scoring Criteria (1-10 scale for each)

#### 1. Feature Completeness (Weight: 10%)

**Question**: Does this tool have all the features your teams need (across all departments)?

**Scoring guide**:
- **10 points**: 100% of required features (no gaps)
- **8 points**: 90-99% of required features (1-2 minor gaps)
- **6 points**: 80-89% of required features (3-5 minor gaps)
- **4 points**: 70-79% of required features (some important features missing)
- **2 points**: 60-69% of required features (major gaps)
- **1 point**: <60% of required features (many critical features missing)

**Your score**: _____ / 10

**Notes**: [What features are missing? Are they deal-breakers?]

---

#### 2. Ease of Use (Weight: 8%)

**Question**: Can non-technical users adopt this tool without extensive training?

**Scoring guide**:
- **10 points**: Intuitive, no training needed (users productive in <1 hour)
- **8 points**: Minimal training (users productive in 1-2 hours)
- **6 points**: Moderate training (users productive in 1 day)
- **4 points**: Extensive training (users productive in 1 week)
- **2 points**: Steep learning curve (users productive in 2-4 weeks)
- **1 point**: Extremely complex (users struggle even after 1 month)

**Your score**: _____ / 10

**Notes**: [How long does it take new users to become productive?]

---

#### 3. Integration Ecosystem (Weight: 8%)

**Question**: Does it integrate with your core stack (Slack, Gmail, Salesforce, etc.)?

**Scoring guide**:
- **10 points**: Native integrations with 100% of core stack (no workarounds needed)
- **8 points**: Native integrations with 80-99% of core stack (1-2 missing)
- **6 points**: Native integrations with 60-79% of core stack (some via Zapier/API)
- **4 points**: Native integrations with 40-59% of core stack (many via Zapier/API)
- **2 points**: Native integrations with <40% of core stack (heavy API work needed)
- **1 point**: No integrations (completely siloed)

**Your score**: _____ / 10

**Notes**: [Which integrations are missing? Can they be built via Zapier/API?]

---

#### 4. Pricing Competitiveness (Weight: 10%)

**Question**: How does this vendor's pricing compare to alternatives?

**Scoring guide**:
- **10 points**: 30%+ cheaper than alternatives (best-in-class pricing)
- **8 points**: 15-29% cheaper than alternatives
- **6 points**: 0-14% cheaper than alternatives (comparable pricing)
- **4 points**: 0-14% more expensive than alternatives
- **2 points**: 15-29% more expensive than alternatives
- **1 point**: 30%+ more expensive than alternatives (overpriced)

**Your score**: _____ / 10

**Calculation**:
```
Price comparison = (This vendor's cost per user ÷ Alternative vendor's cost per user) × 100

Example:
- This vendor: $50/user/month
- Alternative: $40/user/month
- Comparison: ($50 ÷ $40) × 100 = 125% (25% more expensive) → Score: 2/10
```

**Notes**: [What are the alternative vendors and their pricing?]

---

#### 5. Vendor Stability (Weight: 6%)

**Question**: Is the vendor financially stable? (Will they be around in 3-5 years?)

**Scoring guide**:
- **10 points**: Public company or profitable ($100M+ ARR) — very stable
- **8 points**: Late-stage startup ($50M-$100M ARR, Series C+)
- **6 points**: Growth-stage startup ($10M-$50M ARR, Series B)
- **4 points**: Early-stage startup ($2M-$10M ARR, Series A)
- **2 points**: Seed-stage startup (<$2M ARR) — high risk
- **1 point**: Vendor shows signs of distress (layoffs, declining usage, negative press)

**Your score**: _____ / 10

**Notes**: [Check Crunchbase, news articles, Glassdoor for vendor health signals]

---

#### 6. Data Export (Weight: 7%)

**Question**: Can you easily export your data if you need to migrate later?

**Scoring guide**:
- **10 points**: Full export via UI (CSV, JSON) — no vendor assistance needed
- **8 points**: Full export via API (requires technical work, but doable)
- **6 points**: Partial export via UI/API (some data types not exportable)
- **4 points**: Export requires vendor assistance (time-consuming, risky)
- **2 points**: Export is difficult (vendor resists, incomplete data)
- **1 point**: No export (data is locked in)

**Your score**: _____ / 10

**Notes**: [Test export functionality — can you export 100% of data types?]

---

#### 7. Contract Flexibility (Weight: 7%)

**Question**: How flexible are the contract terms (can you scale up/down, cancel early)?

**Scoring guide**:
- **10 points**: Month-to-month (cancel anytime, no penalty)
- **8 points**: Annual contract, can scale up/down mid-contract
- **6 points**: Annual contract, locked in (can't scale down, but can cancel at renewal)
- **4 points**: Multi-year contract (2-3 years), locked in
- **2 points**: Multi-year contract with auto-renewal (hard to exit)
- **1 point**: Multi-year contract with steep early termination penalties (vendor lock-in)

**Your score**: _____ / 10

**Notes**: [Check contract for early termination clauses, scaling terms]

---

#### 8. Customer Support (Weight: 7%)

**Question**: How good is the vendor's customer support?

**Scoring guide**:
- **10 points**: 24/7 live support, <5 min response time, excellent help docs
- **8 points**: Business hours live support, <15 min response time, good help docs
- **6 points**: Email support, <2 hour response time, adequate help docs
- **4 points**: Email support, <24 hour response time, sparse help docs
- **2 points**: Email support, >24 hour response time, poor help docs
- **1 point**: No support (community forums only)

**Your score**: _____ / 10

**Notes**: [Test support response time — send a test ticket]

---

#### 9. Security / Compliance (Weight: 7%)

**Question**: Does the vendor meet your security and compliance requirements?

**Scoring guide**:
- **10 points**: SOC 2 Type II + ISO 27001 + GDPR + HIPAA (if needed) — enterprise-grade
- **8 points**: SOC 2 Type II + GDPR
- **6 points**: SOC 2 Type I (or in progress)
- **4 points**: No SOC 2, but has security whitepaper and practices SSO, encryption
- **2 points**: Minimal security (no certifications, no SSO)
- **1 point**: Security concerns (data breaches, poor practices)

**Your score**: _____ / 10

**Notes**: [Check vendor's security page, ask for SOC 2 report]

---

#### 10. Customization (Weight: 6%)

**Question**: Can you customize the tool to fit your workflows?

**Scoring guide**:
- **10 points**: Fully customizable (custom fields, workflows, automations, API access)
- **8 points**: Highly customizable (custom fields, workflows, but limited API)
- **6 points**: Moderately customizable (some custom fields, basic automations)
- **4 points**: Limited customization (mostly out-of-the-box, few options)
- **2 points**: Minimal customization (rigid, one-size-fits-all)
- **1 point**: No customization (take it or leave it)

**Your score**: _____ / 10

**Notes**: [What customizations are important? Can this vendor deliver them?]

---

#### 11. Mobile Experience (Weight: 5%)

**Question**: Does the tool work well on mobile (iOS, Android)?

**Scoring guide**:
- **10 points**: Excellent native mobile apps (iOS + Android), feature parity with desktop
- **8 points**: Good native mobile apps, 80-90% feature parity
- **6 points**: Adequate native mobile apps, 60-79% feature parity
- **4 points**: Basic mobile web (no native app), limited functionality
- **2 points**: Poor mobile web (barely usable)
- **1 point**: No mobile support (desktop only)

**Your score**: _____ / 10

**Notes**: [Test mobile apps — do they work well for your use cases?]

---

#### 12. Reporting / Analytics (Weight: 6%)

**Question**: Does the tool have built-in reporting and analytics?

**Scoring guide**:
- **10 points**: Advanced analytics (custom dashboards, real-time data, export to BI tools)
- **8 points**: Good reporting (pre-built dashboards, some customization)
- **6 points**: Basic reporting (standard reports, limited customization)
- **4 points**: Minimal reporting (basic metrics, no customization)
- **2 points**: Poor reporting (hard to extract insights)
- **1 point**: No reporting (manual data extraction required)

**Your score**: _____ / 10

**Notes**: [What reports do you need? Can this vendor provide them?]

---

#### 13. User Satisfaction (Weight: 7%)

**Question**: What do current users think of this tool?

**Scoring guide**:
- **10 points**: 90%+ users love it (internal survey: "highly satisfied")
- **8 points**: 75-89% users like it (internal survey: "satisfied")
- **6 points**: 60-74% users neutral (internal survey: "it's fine")
- **4 points**: 40-59% users dislike it (internal survey: "frustrating")
- **2 points**: 20-39% users dislike it (internal survey: "want to switch")
- **1 point**: <20% users like it (internal survey: "hate it")

**Your score**: _____ / 10

**Survey question**:
```
"On a scale of 1-10, how satisfied are you with [TOOL NAME]?"

- 9-10: Highly satisfied (love it)
- 7-8: Satisfied (it works well)
- 5-6: Neutral (it's fine, but not great)
- 3-4: Dissatisfied (frustrating)
- 1-2: Very dissatisfied (want to switch)
```

**Notes**: [Survey 10-20 users, calculate average satisfaction]

---

#### 14. Switching Cost (Weight: 6%)

**Question**: How hard would it be to migrate TO this tool (if switching from another vendor)?

**Scoring guide**:
- **10 points**: Very easy (bulk import, vendor provides migration support)
- **8 points**: Easy (CSV import, minimal manual work)
- **6 points**: Moderate (requires data transformation, but doable in 1-2 weeks)
- **4 points**: Hard (requires significant manual work, 4-8 weeks)
- **2 points**: Very hard (complex data migration, 2-3 months)
- **1 point**: Extremely hard (migration is so complex it's a deal-breaker)

**Your score**: _____ / 10

**Notes**: [Estimate migration effort — data mapping, training, testing]

---

#### 15. SEA Localization (Weight: 6%)

**Question**: Does the vendor support Southeast Asian markets (local currency, language, payment methods)?

**Scoring guide**:
- **10 points**: Full SEA support (SGD/MYR/IDR/THB/VND/PHP pricing, local languages, local payment methods)
- **8 points**: Partial SEA support (SGD/MYR pricing, English only)
- **6 points**: Singapore support only (SGD pricing, English)
- **4 points**: USD pricing only, but accepts SEA credit cards
- **2 points**: USD pricing only, limited SEA payment options
- **1 point**: No SEA support (US-focused, hard to pay from SEA)

**Your score**: _____ / 10

**Notes**: [Check vendor website for regional pricing, payment methods]

---

### Score Calculation

**Total Score** = Sum of all 15 scores (max 150 points)

**Percentage** = (Total Score ÷ 150) × 100

**Your total score**: _____ / 150 (_____%)

---

### Weighted Score Calculation (Optional)

If you want to weight certain criteria more heavily (e.g., pricing is 2x more important than mobile), use weighted scoring:

**Weighted Score** = Σ(Score × Weight)

**Example**:
```
Criterion 1 (Feature Completeness, Weight: 10%):
- Score: 8/10
- Weighted: 8 × 0.10 = 0.80

Criterion 2 (Ease of Use, Weight: 8%):
- Score: 9/10
- Weighted: 9 × 0.08 = 0.72

... (repeat for all 15 criteria)

Total Weighted Score = Sum of all weighted scores (max 10.0)
Percentage = (Total Weighted Score ÷ 10) × 100
```

---

### Decision Matrix

**Use this matrix to compare 2-3 vendors side-by-side**:

| Criterion | Weight | Vendor A Score | Vendor A Weighted | Vendor B Score | Vendor B Weighted | Vendor C Score | Vendor C Weighted |
|-----------|--------|----------------|-------------------|----------------|-------------------|----------------|-------------------|
| 1. Feature Completeness | 10% | ___ / 10 | ___ | ___ / 10 | ___ | ___ / 10 | ___ |
| 2. Ease of Use | 8% | ___ / 10 | ___ | ___ / 10 | ___ | ___ / 10 | ___ |
| 3. Integration Ecosystem | 8% | ___ / 10 | ___ | ___ / 10 | ___ | ___ / 10 | ___ |
| 4. Pricing Competitiveness | 10% | ___ / 10 | ___ | ___ / 10 | ___ | ___ / 10 | ___ |
| 5. Vendor Stability | 6% | ___ / 10 | ___ | ___ / 10 | ___ | ___ / 10 | ___ |
| 6. Data Export | 7% | ___ / 10 | ___ | ___ / 10 | ___ | ___ / 10 | ___ |
| 7. Contract Flexibility | 7% | ___ / 10 | ___ | ___ / 10 | ___ | ___ / 10 | ___ |
| 8. Customer Support | 7% | ___ / 10 | ___ | ___ / 10 | ___ | ___ / 10 | ___ |
| 9. Security / Compliance | 7% | ___ / 10 | ___ | ___ / 10 | ___ | ___ / 10 | ___ |
| 10. Customization | 6% | ___ / 10 | ___ | ___ / 10 | ___ | ___ / 10 | ___ |
| 11. Mobile Experience | 5% | ___ / 10 | ___ | ___ / 10 | ___ | ___ / 10 | ___ |
| 12. Reporting / Analytics | 6% | ___ / 10 | ___ | ___ / 10 | ___ | ___ / 10 | ___ |
| 13. User Satisfaction | 7% | ___ / 10 | ___ | ___ / 10 | ___ | ___ / 10 | ___ |
| 14. Switching Cost | 6% | ___ / 10 | ___ | ___ / 10 | ___ | ___ / 10 | ___ |
| 15. SEA Localization | 6% | ___ / 10 | ___ | ___ / 10 | ___ | ___ / 10 | ___ |
| **TOTAL** | **100%** | **___ / 150** | **___ / 10** | **___ / 150** | **___ / 10** | **___ / 150** | **___ / 10** |

**Decision**: Keep the vendor with the highest weighted score.

---

## Example: CRM Vendor Comparison

### Scenario

**Your company** uses 2 CRMs:
- Salesforce (Sales team): $180K/year, 50 users
- HubSpot (Marketing team): $75K/year, 30 users

**Question**: Should you consolidate to one CRM? If yes, which one?

**Approach**: Score both vendors using the 15-criteria framework.

---

### Vendor A: Salesforce

| Criterion | Score | Weighted Score | Notes |
|-----------|-------|----------------|-------|
| 1. Feature Completeness | 9/10 | 0.90 | Has everything both teams need |
| 2. Ease of Use | 5/10 | 0.40 | Steep learning curve (especially for marketing) |
| 3. Integration Ecosystem | 10/10 | 0.80 | Integrates with everything |
| 4. Pricing Competitiveness | 4/10 | 0.40 | Expensive ($180/user/year vs HubSpot $75/user/year) |
| 5. Vendor Stability | 10/10 | 0.60 | Public company, very stable |
| 6. Data Export | 9/10 | 0.63 | Easy export via UI |
| 7. Contract Flexibility | 6/10 | 0.42 | Annual contract, locked in |
| 8. Customer Support | 8/10 | 0.56 | Good support (dedicated CSM) |
| 9. Security / Compliance | 10/10 | 0.70 | SOC 2, ISO 27001, GDPR, HIPAA |
| 10. Customization | 10/10 | 0.60 | Fully customizable (flows, custom objects, Apex) |
| 11. Mobile Experience | 8/10 | 0.40 | Good mobile apps |
| 12. Reporting / Analytics | 10/10 | 0.60 | Excellent reporting (dashboards, Einstein Analytics) |
| 13. User Satisfaction | 6/10 | 0.42 | Sales loves it (9/10), Marketing dislikes it (3/10) → avg 6/10 |
| 14. Switching Cost | 4/10 | 0.24 | Hard to migrate TO Salesforce (complex data model) |
| 15. SEA Localization | 8/10 | 0.48 | SGD/MYR pricing available |
| **TOTAL** | **117/150** | **7.15/10** | **78%** |

---

### Vendor B: HubSpot

| Criterion | Score | Weighted Score | Notes |
|-----------|-------|----------------|-------|
| 1. Feature Completeness | 7/10 | 0.70 | Missing some advanced sales features (Salesforce has more) |
| 2. Ease of Use | 9/10 | 0.72 | Very intuitive (marketing team loves it) |
| 3. Integration Ecosystem | 8/10 | 0.64 | Good integrations, but missing a few niche tools |
| 4. Pricing Competitiveness | 8/10 | 0.80 | Cheaper than Salesforce ($75/user/year vs $180/user/year) |
| 5. Vendor Stability | 9/10 | 0.54 | Public company (IPO 2014), stable |
| 6. Data Export | 8/10 | 0.56 | Easy export via UI/API |
| 7. Contract Flexibility | 7/10 | 0.49 | Annual contract, but can scale up/down mid-contract |
| 8. Customer Support | 7/10 | 0.49 | Good support (but not as good as Salesforce) |
| 9. Security / Compliance | 9/10 | 0.63 | SOC 2, ISO 27001, GDPR |
| 10. Customization | 7/10 | 0.42 | Moderately customizable (workflows, custom properties) |
| 11. Mobile Experience | 7/10 | 0.35 | Decent mobile apps (but not as good as Salesforce) |
| 12. Reporting / Analytics | 8/10 | 0.48 | Good reporting (custom dashboards, but less advanced than Salesforce) |
| 13. User Satisfaction | 8/10 | 0.56 | Marketing loves it (9/10), Sales neutral (7/10) → avg 8/10 |
| 14. Switching Cost | 7/10 | 0.42 | Moderate migration effort (easier than Salesforce) |
| 15. SEA Localization | 7/10 | 0.42 | SGD pricing available (MYR limited) |
| **TOTAL** | **120/150** | **7.22/10** | **80%** |

---

### Decision

**Weighted scores**:
- **Salesforce**: 7.15/10 (78%)
- **HubSpot**: 7.22/10 (80%)

**Winner**: HubSpot (slightly higher score)

**Rationale**:
- HubSpot scores higher on ease of use (critical for marketing team adoption)
- HubSpot is 58% cheaper ($75 vs $180 per user per year)
- HubSpot has better user satisfaction (8/10 vs 6/10)
- Salesforce has better features, but HubSpot has 90% of what you need

**Decision**: Consolidate to HubSpot (migrate Sales team from Salesforce to HubSpot).

**Savings**:
- Before: Salesforce $180K + HubSpot $75K = $255K/year
- After: HubSpot for 80 users (50 sales + 30 marketing) = $90K/year (negotiated enterprise pricing)
- **Total savings**: $165K/year (65% reduction)

---

## Customization: Adjusting Criteria Weights

**Default weights** (above) work for most companies. But you can adjust based on your priorities:

### Scenario 1: Security is Critical (Financial Services, Healthcare)

**Adjusted weights**:
- Security / Compliance: 15% (↑ from 7%)
- Data Export: 10% (↑ from 7%)
- Vendor Stability: 10% (↑ from 6%)
- Pricing Competitiveness: 5% (↓ from 10%) — security matters more than cost

### Scenario 2: Cost is Critical (Early-Stage Startup, Budget-Constrained)

**Adjusted weights**:
- Pricing Competitiveness: 20% (↑ from 10%)
- Contract Flexibility: 10% (↑ from 7%) — need flexibility to cancel if budget changes
- Feature Completeness: 5% (↓ from 10%) — willing to accept fewer features for lower cost
- Security / Compliance: 3% (↓ from 7%) — less critical at early stage

### Scenario 3: User Adoption is Critical (Change-Averse Organization)

**Adjusted weights**:
- Ease of Use: 15% (↑ from 8%)
- User Satisfaction: 12% (↑ from 7%)
- Customer Support: 10% (↑ from 7%) — need hand-holding during transition
- Switching Cost: 3% (↓ from 6%) — willing to invest in migration if tool is easier to use

---

## Quick Scorecard (10-Minute Version)

**Use this simplified scorecard when you don't have time for the full 15-criteria evaluation**:

### 5-Criteria Quick Scorecard

**Vendor name**: [VENDOR NAME]

**1. Does it have 80%+ of features you need?** (YES/NO)
- ✅ YES → Continue
- ❌ NO → Eliminate this vendor

**2. Is it 20%+ cheaper than alternatives?** (YES/NO)
- ✅ YES → +2 points
- ❌ NO → 0 points

**3. Can users adopt it without extensive training?** (YES/NO)
- ✅ YES → +2 points
- ❌ NO → 0 points

**4. Do most users (60%+) like it?** (YES/NO)
- ✅ YES → +2 points
- ❌ NO → 0 points

**5. Can you export data easily?** (YES/NO)
- ✅ YES → +2 points
- ❌ NO → 0 points

**Total Quick Score**: _____ / 8 points

**Decision rule**:
- **6-8 points**: Strong candidate (keep this vendor)
- **3-5 points**: Moderate candidate (consider alternatives)
- **0-2 points**: Weak candidate (eliminate this vendor)

---

## Next Steps

**Step 1**: Use the [Master Vendor Scorecard](#master-vendor-scorecard-template) to evaluate your overlapping tools

**Step 2**: Compare scores using the [Decision Matrix](#decision-matrix)

**Step 3**: Choose the highest-scoring vendor (consolidate to this tool)

**Step 4**: Calculate ROI using the [Vendor Consolidation ROI Calculator](roi-calculators.md#calculator-3-vendor-consolidation-roi)

**Step 5**: Execute migration using the [Vendor Consolidation Guide](../guides/02-vendor-consolidation.md)

---

**Ready to objectively evaluate your vendors?** Start with the [Master Vendor Scorecard](#master-vendor-scorecard-template). 📊
