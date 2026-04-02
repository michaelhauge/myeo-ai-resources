# SaaS Cost Optimization FAQ

## Quick answers to the 15 most common CFO questions

---

### 1. How much can I realistically save from a SaaS audit?

**Short answer**: 30-50% of total SaaS spend ($200K-$2M annually for most $2M-$50M ARR companies).

**Breakdown**:
- Zombie subscriptions: 15-25% savings
- Seat over-provisioning: 10-20% savings
- Vendor negotiation: 10-20% savings
- Consolidation: 5-15% savings
- Currency optimization (SEA): 5-10% savings

**Reality check**: If you've NEVER audited, expect 40-60% savings. If you audited 1-2 years ago, expect 20-30% savings.

---

### 2. How long does a SaaS audit take?

**30-day rapid audit**: Focus on quick wins (zombies, seat reductions) → 40-60 hours total
**Comprehensive audit**: Full optimization (including consolidation) → 6-12 weeks, 80-150 hours total

**Timeline**:
- Week 1-2: Discovery (find all subscriptions)
- Week 3-4: Usage analysis
- Week 5-6: Quick wins implementation (zombies, seats)
- Month 2-3: Renegotiations + currency optimization
- Month 4-6: Vendor consolidation (if needed)

---

### 3. What's the ROI of a SaaS audit?

**Typical ROI**: 500-2,000% in first year

**Example**: $50K investment (internal time or consultant) → $500K-$1M savings = 1,000% ROI

**Payback period**: <30 days (immediate savings from zombie cleanup exceeds audit cost)

---

### 4. Should I do this internally or hire a consultant?

**Do it internally if**:
- ✅ Your finance/ops team has 80-150 hours over 6-12 weeks
- ✅ You have <100 SaaS tools (manageable scope)
- ✅ Budget-constrained (DIY costs $5K-$20K vs consultant $30K-$100K)

**Hire consultant if**:
- ✅ Your team is at capacity (no bandwidth for 3-month project)
- ✅ You have >150 SaaS tools (complex, needs expertise)
- ✅ You want faster results (consultants finish in 4-8 weeks vs 12+ weeks internal)

---

### 5. Will vendors actually give me 20-30% discounts?

**Yes**, if you have leverage:
- Expiring contract (renewal coming up) → 15-25% discount
- Multi-year commitment (2-3 years) → 15-25% discount
- Competitive pressure (evaluating alternatives) → 20-30% discount
- End-of-quarter timing (vendor quota pressure) → 10-20% discount

**Combine 2-3 leverage points** → 30-40% discounts are realistic.

**See**: [Negotiation Tactics Guide](guides/03-negotiation-tactics.md)

---

### 6. What if I cancel a tool and someone actually needs it?

**Risk mitigation**:
1. **Always confirm with department head** before canceling ("Are you still using [TOOL]?")
2. **Check usage data** (0 logins in 60-90 days = safe to cancel)
3. **Document cancellation** (who approved, when, why)
4. **Keep 30-day rollback option** (most vendors allow reactivation if needed)

**Reality**: 95% of zombies stay dead (no one asks for them back after canceling).

---

### 7. How do I find "shadow IT" (unapproved SaaS purchases)?

**5 detection methods**:
1. **Expense reports** (look for recurring software charges)
2. **Credit card statements** (flag SaaS vendor names)
3. **SSO logs** (check OAuth-connected apps in Okta/Google)
4. **Browser extensions** (Torii, Productiv track SaaS usage)
5. **Anonymous survey** (ask employees what tools they use)

**Expected finding**: 20-30% of actual SaaS spend is shadow IT.

**See**: [Shadow IT Detection Checklist](templates/audit-checklists.md#shadow-it-detection-checklist)

---

### 8. Should I consolidate duplicate tools or keep them?

**Consolidate if**:
- ✅ ROI >300% (savings ÷ migration effort)
- ✅ Teams are willing to adopt single tool (no resistance)
- ✅ Chosen tool has 80%+ feature overlap (minimal loss)

**Keep separate tools if**:
- ❌ Use cases genuinely differ (e.g., Jira for eng, Asana for marketing = OK)
- ❌ Migration effort exceeds 3-year savings (not worth it)
- ❌ Critical features only exist in both tools (can't consolidate to one)

**See**: [Vendor Consolidation Guide](guides/02-vendor-consolidation.md)

---

### 9. How often should I re-audit SaaS spend?

**Quarterly** (every 90 days) for best results.

**What to check**:
- New subscriptions added (shadow IT creep)
- Seat utilization (remove departing employees, add new hires)
- Contract renewals (renegotiate expiring contracts)
- Zombie detection (tools that fell out of use)

**Time**: 4-8 hours per quarter (once systems are in place)

**See**: [Ongoing Governance Guide](guides/05-governance.md)

---

### 10. Is multi-currency pricing really 10-20% cheaper?

**Yes, in Southeast Asia** (for major vendors).

**Why**:
- Lower pricing power in emerging markets (MY/ID/TH/VN/PH)
- FX arbitrage (vendor hedges rates, passes savings to customers)
- Market penetration strategy (vendors want SEA market share)

**Which vendors offer local currency?**:
- Salesforce: SGD, MYR, IDR, THB, PHP
- Google Workspace: All SEA currencies
- Microsoft 365: All SEA currencies
- HubSpot: SGD, MYR

**Typical savings**: 10-20% vs USD pricing

**See**: [Multi-Currency Optimization Guide](guides/04-multi-currency.md)

---

### 11. Can I downgrade from Enterprise to Professional tier mid-contract?

**Sometimes**.

**Depends on vendor**:
- ✅ **Monthly contracts**: Downgrade anytime (effective next month)
- ⚠️ **Annual contracts**: Some vendors allow (pro-rated refund), others require waiting until renewal
- ❌ **Multi-year contracts**: Rarely allowed mid-contract (must wait until renewal)

**How to ask**:
"We'd like to downgrade from Enterprise to Professional. Can we do this mid-contract, or must we wait until renewal?"

**Worst case**: Mark for downgrade at renewal (set calendar reminder)

---

### 12. What's the biggest mistake companies make with SaaS spend?

**Mistake #1: One-time audit (no ongoing governance)**

**Problem**: You audit once, save $500K, but waste creeps back in 12 months (back to square one).

**Fix**: Implement procurement policies + quarterly re-audits (maintain savings long-term).

**Other common mistakes**:
- Not tracking shadow IT (miss 20-30% of spend)
- Canceling without confirming with users (upset teams)
- Focusing only on big vendors (ignore 50 small tools that add up)
- Not renegotiating (accepting list price when 20-30% discounts are standard)

---

### 13. How do I get buy-in from department heads to optimize their tools?

**Strategy**:
1. **Show data** (usage reports prove tools are underutilized)
2. **Allocate costs** (show department heads their SaaS spend → creates accountability)
3. **Offer trade-offs** ("We can cut Tool A ($20K) and invest in Tool B ($10K) you actually want")
4. **Frame as efficiency** (not as "cost-cutting" but as "eliminating waste to fund growth")

**Executive mandate**: Get CFO/CEO buy-in first ("We're optimizing SaaS spend company-wide. All departments will participate.")

---

### 14. Is it worth paying for a SaaS management platform (Torii, Productiv, Zylo)?

**Worth it if**:
- ✅ You have >100 SaaS subscriptions (manual tracking is painful)
- ✅ High shadow IT risk (large company, distributed teams)
- ✅ Budget: $10K-$50K/year for platform (typical cost)

**Not worth it if**:
- ❌ You have <50 subscriptions (Google Sheets sufficient)
- ❌ Low shadow IT (centralized procurement already in place)
- ❌ Budget-constrained (DIY audit is free)

**Recommendation**: Start with manual audit (Google Sheets), upgrade to platform if complexity justifies it.

---

### 15. Where do I start if I've never audited SaaS spend?

**Start here**: [30-Day Rapid Audit](README.md#quick-start-the-30-day-saas-audit)

**Week 1**: Find all subscriptions (credit cards, IT records, surveys)
**Week 2**: Pull usage reports (identify zombies + over-provisioning)
**Week 3**: Execute quick wins (cancel zombies, reduce seats) → $50K-$200K immediate savings
**Week 4**: Plan consolidation + renegotiation (90-day roadmap)

**Time**: 40-60 hours over 30 days (part-time effort)

**Expected outcome**: $100K-$350K savings in first 30 days + roadmap for $200K-$1M additional savings.

---

## More Questions?

**Read the full guides**:
- [SaaS Audit Guide](guides/01-saas-audit.md) — Complete audit methodology
- [Vendor Consolidation](guides/02-vendor-consolidation.md) — Eliminate duplicate tools
- [Negotiation Tactics](guides/03-negotiation-tactics.md) — Get 20-30% discounts
- [Multi-Currency Optimization](guides/04-multi-currency.md) — SEA-specific savings
- [Ongoing Governance](guides/05-governance.md) — Maintain savings long-term

**Use the templates**:
- [100-Point Audit Checklist](templates/audit-checklists.md)
- [ROI Calculators](templates/roi-calculators.md)

---

**Ready to recover $200K-$2M+ from your SaaS budget?** Start with the [30-Day Rapid Audit](README.md#quick-start-the-30-day-saas-audit). 🚀
