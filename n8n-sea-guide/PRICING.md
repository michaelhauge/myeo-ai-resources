# Pricing Guide: n8n vs Zapier for SEA Businesses

**Complete cost breakdown and ROI calculator**

---

## Executive Summary

**How much does n8n cost?**
- **Self-Hosted**: $0-15/month (free software + optional VPS)
- **n8n Cloud**: €24-800/month (~$26-870 USD)

**Compare to Zapier**:
- **Zapier**: $30-75/month for basic plans, $1,999/month for enterprise

**Typical Savings**: 70-95% for most business use cases

---

## Critical Billing Difference: Executions vs Tasks

### Why n8n is 90-98% Cheaper for Complex Workflows

**Zapier Billing Model**: Charges per **task** (each step in a workflow)
**n8n Billing Model**: Charges per **execution** (complete workflow run, regardless of steps)

#### Real-World Example

**Workflow**: Lead capture automation with 10 steps
1. Form submission trigger
2. Validate email
3. Check for duplicates in CRM
4. Add contact to CRM
5. Tag contact
6. Send welcome email
7. Add to mailing list
8. Create task for sales team
9. Send Slack notification
10. Log to spreadsheet

**Runs**: 1,000 times/month

| Platform | Billing Calculation | Monthly Cost |
|----------|-------------------|-------------|
| **Zapier Professional** | 10 steps × 1,000 runs = 10,000 tasks | **$75** |
| **n8n Cloud Starter** | 1,000 executions | **€24 (~$26)** |
| **n8n Self-Hosted** | Unlimited executions + $5.50 VPS | **$5.50** |

**Savings with n8n**: **$834-870/year** for this single workflow!

---

## n8n Pricing Tiers

### Self-Hosted (Community Edition)

| What You Get | Cost |
|--------------|------|
| Unlimited workflows | **FREE** |
| Unlimited executions | **FREE** |
| Unlimited users | **FREE** |
| 400+ integrations | **FREE** |
| Community support | **FREE** |

**Your Only Costs**:
- **VPS Hosting**: $0-30/month (optional - can run on your Mac)
- **Domain** (optional): $10-15/year
- **SSL Certificate**: FREE (Let's Encrypt)

### n8n Cloud (Managed Hosting)

| Plan | Price (EUR) | Price (USD) | Executions | Workflows | Projects |
|------|------------|-------------|------------|-----------|----------|
| **Starter** | €24/month | ~$26 | 2,500 | Unlimited | 1 shared |
| **Pro** | €60/month | ~$65 | 10,000 | Unlimited | 3 shared |
| **Business** | €800/month | ~$870 | 40,000 | Unlimited | Unlimited |
| **Enterprise** | Custom | Custom | Unlimited | Unlimited | Unlimited |

**All plans include**:
- Unlimited users
- Unlimited workflows
- 400+ integrations
- Email support (Pro+)
- SSO (Business+)
- SLA (Business+)

### n8n Self-Hosted Enterprise

**For large organizations needing**:
- Advanced governance
- SSO/SAML
- Priority support
- Professional services
- Custom SLA

**Pricing**: Contact n8n sales team

---

## Zapier Pricing (For Comparison)

| Plan | Price/Month | Tasks Included | Multi-Step Zaps | Premium Apps |
|------|-------------|----------------|-----------------|--------------|
| **Free** | $0 | 100 tasks | ❌ Single-step only | ❌ |
| **Starter** | $30 | 750 tasks | ✅ | ❌ |
| **Professional** | $75 | 2,000 tasks | ✅ | ✅ |
| **Team** | $120 | 50,000 tasks | ✅ | ✅ |
| **Enterprise** | $1,999+ | 1M+ tasks | ✅ | ✅ |

**Additional costs**:
- Extra tasks: $0.01-0.02 each
- Premium apps: Included in Pro+ only
- Users: $18-40/user/month (Team+)

---

## Detailed Cost Breakdown: Self-Hosted n8n

### Option 1: Local Mac (Maximum Privacy)

| Component | Cost |
|-----------|------|
| n8n software | FREE |
| Docker Desktop | FREE |
| Your existing Mac | $0 (already owned) |
| **Total Monthly** | **$0** |

**Pros**:
- Zero cost
- Maximum privacy
- Perfect for testing
- Easy to start

**Cons**:
- Mac must stay on 24/7 for scheduled workflows
- Not accessible from outside your network (unless port forwarding)
- Limited to Mac's resources

---

### Option 2: Oracle Cloud Free Tier (Best Free Hosting)

| Component | Monthly Cost |
|-----------|-------------|
| n8n software | FREE |
| VM (4 OCPU, 24GB RAM) | FREE |
| 200GB storage | FREE |
| 10TB bandwidth | FREE |
| PostgreSQL database | FREE |
| **Total Monthly** | **$0** |

**Pros**:
- Generous forever-free tier
- ARM instances are powerful
- Singapore datacenter available
- Professional hosting infrastructure

**Cons**:
- Requires credit card verification ($0 charge)
- ARM architecture (minor consideration)
- Instance can be deleted if idle >30 days
- Competitive to get (high demand)

**Verdict**: Best value if you can get an instance

---

### Option 3: Contabo VPS S (Best Value Paid Option)

| Component | Monthly Cost |
|-----------|-------------|
| VPS (4 vCPU, 8GB RAM, 75GB NVMe) | ~$5.50 |
| Unlimited bandwidth | Included |
| PostgreSQL database (on VPS) | Included |
| n8n software | FREE |
| **Total Monthly** | **~$5.50** |

**Annual Cost**: ~$66/year

**Pros**:
- Exceptional specs for price
- Singapore datacenter
- Unlimited bandwidth
- x86 architecture

**Cons**:
- Requires manual setup
- You manage updates
- No managed database

**Verdict**: Best value for production use

---

### Option 4: DigitalOcean (Easiest Paid VPS)

| Component | Monthly Cost |
|-----------|-------------|
| Droplet (2 vCPU, 4GB RAM) | $24 |
| Bandwidth (4TB) | Included |
| PostgreSQL (on droplet) | Included |
| n8n software | FREE |
| **Total Monthly** | **$24** |

**Optional Add-Ons**:
- Managed PostgreSQL: +$15/month
- Backups: +$4.80/month (20% of droplet cost)
- Monitoring: FREE

**Pros**:
- Excellent documentation
- Singapore datacenter
- 1-click apps available
- Great support

**Cons**:
- Higher cost than Contabo
- Smaller specs for the price

**Verdict**: Worth it if you value ease-of-use and support

---

## Monthly Cost Scenarios

### Scenario 1: Testing & Learning

**Setup**: Local Mac installation
- **Monthly Cost**: $0
- **Use Case**: Learning n8n, testing workflows, personal use
- **Limitations**: Mac must stay on, not externally accessible

---

### Scenario 2: Small Business (Budget-Conscious)

**Setup**: Oracle Cloud Free or Contabo VPS
- **Monthly Cost**: $0-5.50
- **Workflows**: 5-15 automations
- **Executions**: 1,000-10,000/month
- **Use Case**: Lead capture, invoice processing, social media scheduling

**Compare to Zapier**: Would need Professional plan = $75/month
**Annual Savings**: $840-900

---

### Scenario 3: Growing Business

**Setup**: Contabo VPS or DigitalOcean
- **Monthly Cost**: $5.50-24
- **Workflows**: 20-50 automations
- **Executions**: 10,000-50,000/month
- **Use Case**: CRM automation, customer support, e-commerce sync

**Compare to Zapier**: Would need Team plan = $120-300/month
**Annual Savings**: $1,100-3,500

---

### Scenario 4: Established Business (Managed)

**Setup**: n8n Cloud Pro
- **Monthly Cost**: €60 (~$65)
- **Executions**: 10,000/month
- **Use Case**: Professional support, no server management
- **Includes**: Email support, SSO, projects

**Compare to Zapier Professional**: $75/month
**Savings**: $120/year (minimal, but better features)

---

## ROI Calculator

### Time Saved with Automation

**Example: Small Business with 5 Workflows**

| Workflow | Manual Time/Week | Annual Hours Saved |
|----------|------------------|-------------------|
| Lead data entry | 3 hours | 156 hours |
| Invoice processing | 2 hours | 104 hours |
| Social media posting | 4 hours | 208 hours |
| Customer support routing | 5 hours | 260 hours |
| Report generation | 2 hours | 104 hours |
| **Total** | **16 hours/week** | **832 hours/year** |

**Value Calculation**:
- Hourly rate: $50 (average for SEA business manager)
- Annual value saved: 832 hours × $50 = **$41,600** (theoretical maximum — see note below)

**n8n Cost (Self-Hosted)**:
- Annual cost: $66 (Contabo VPS)
- **Direct savings vs Zapier**: $834/year
- **Payback period**: Under 1 month

**Zapier Cost (Professional)**:
- Annual cost: $900
- **Payback period**: Under 1 month

> **A note on ROI math**: We deliberately don't show the astronomical ROI percentages you might calculate from these numbers (dividing $41,600 by $66 gives a misleading figure). The real question is: **will n8n save you meaningful time and money?** Yes — typically $500-2,500/year in tool costs vs Zapier, plus 10-20 hours/week once workflows are mature. The time-value numbers above assume all workflows run perfectly after setup. In practice, expect to spend 2-4 hours/month maintaining workflows, and budget for a learning curve of 1-2 months before reaching full productivity.

---

### Cost Per Execution Comparison

| Monthly Executions | Zapier Pro Cost | n8n Cloud Cost | n8n Self-Hosted | Savings (Cloud) | Savings (Self-Hosted) |
|-------------------|----------------|----------------|-----------------|-----------------|----------------------|
| 1,000 (5-step avg) | $75 | €24 (~$26) | $5.50 | 65% | 93% |
| 5,000 (10-step avg) | $300 | €60 (~$65) | $5.50 | 78% | 98% |
| 10,000 (10-step avg) | $750 | €60 (~$65) | $5.50 | 91% | 99% |

**Key Insight**: The more steps in your workflows, the greater the savings with n8n.

---

## Hidden Costs to Consider

### n8n Self-Hosted

**Time Investment (One-Time)**:
- Initial setup: 1-2 hours
- Learning curve: 2-4 hours
- First workflow: 1 hour
- **Total**: ~4-7 hours

**Ongoing Maintenance**:
- Monthly updates: 15 minutes
- Monitoring: 30 minutes/month
- **Total**: ~1 hour/month

**Your Time Cost**:
- Setup: 7 hours × $50 = $350 (one-time)
- Maintenance: 1 hour/month × $50 = $50/month

**Break-Even vs Zapier Professional**:
- Zapier: $75/month
- n8n: $5.50 VPS + $50 maintenance = $55.50/month
- **Savings**: $19.50/month ($234/year)
- **Payback**: ~1.5 months

---

### n8n Cloud

**No Hidden Costs**:
- ✅ No setup time needed
- ✅ No maintenance required
- ✅ No server management
- ✅ Automatic updates
- ✅ Professional monitoring

**When to Choose**:
- Don't want to manage servers
- Need professional support
- Prefer predictable costs
- Want SOC 2 compliance without effort

---

## When to Upgrade Plans

### From Local Mac to VPS

**Trigger**:
- Need 24/7 availability
- Want external access
- Sharing with team
- Running >10 workflows

**Recommended**: Oracle Free or Contabo VPS (~$0-5.50/month)

---

### From n8n Cloud Starter to Pro

**Trigger**:
- Exceeding 2,500 executions/month
- Need more than 1 project
- Want email support
- Running critical business workflows

**Cost Increase**: +€36/month (~$39)

---

### From Self-Hosted to n8n Cloud

**Trigger**:
- Don't want to manage servers
- Need professional support
- Require SLA guarantees
- Want automatic scaling
- Team lacks technical skills

**Cost Increase**: $5.50/month → €24/month (~$21 increase)

---

### From n8n Cloud to Enterprise

**Trigger**:
- Exceeding 40,000 executions/month
- Need SSO/SAML
- Require custom SLA
- Multi-region deployment
- Advanced security/compliance

**Contact**: n8n sales team for pricing

---

## Payment Methods Accepted

### Self-Hosted VPS Providers

**Oracle Cloud**:
- ✅ Credit card (Visa, Mastercard, AmEx)
- Singapore billing address accepted

**Contabo**:
- ✅ Credit card
- ✅ PayPal
- Singapore billing address accepted

**DigitalOcean**:
- ✅ Credit card
- ✅ PayPal
- Singapore billing address accepted

---

### n8n Cloud

**Accepted Payment Methods**:
- ✅ Credit card (Visa, Mastercard, AmEx)
- ✅ PayPal
- ✅ Wire transfer (Enterprise only)

**Billing Currency**: EUR (Euro)

**Billing Cycle**: Monthly or annual (10% discount for annual)

---

## Total Cost of Ownership (3 Years)

### n8n Self-Hosted (Contabo)

| Year | VPS Cost | Domain | Total |
|------|----------|--------|-------|
| Year 1 | $66 | $12 | $78 |
| Year 2 | $66 | $12 | $78 |
| Year 3 | $66 | $12 | $78 |
| **3-Year Total** | | | **$234** |

---

### n8n Cloud Starter

| Year | Subscription | Total |
|------|-------------|-------|
| Year 1 | €288 (~$312) | $312 |
| Year 2 | €288 (~$312) | $312 |
| Year 3 | €288 (~$312) | $312 |
| **3-Year Total** | | **$936** |

---

### Zapier Professional

| Year | Subscription | Total |
|------|-------------|-------|
| Year 1 | $900 | $900 |
| Year 2 | $900 | $900 |
| Year 3 | $900 | $900 |
| **3-Year Total** | | **$2,700** |

---

**3-Year Savings**:
- **Self-Hosted vs Zapier**: $2,466 (91% savings)
- **Cloud vs Zapier**: $1,764 (65% savings)
- **Self-Hosted vs Cloud**: $702 (75% savings)

---

## Frequently Asked Questions

### "Is self-hosted really free forever?"

**Yes**. n8n's community edition is fair-code and free to use forever. You only pay for hosting infrastructure.

Oracle Cloud's Always Free tier is also free forever (as long as you use it).

---

### "What happens if I exceed my n8n Cloud plan limits?"

**Executions pause** until next billing cycle, or you can upgrade plan mid-month.

**Best practice**: Set up email alerts at 80% usage to avoid interruptions.

---

### "Can I start with cloud and move to self-hosted later?"

**Yes**. n8n provides export/import tools. You can export your workflows and credentials, then import into self-hosted instance.

**Process**: ~1-2 hours for migration.

---

### "Are there any transaction fees or hidden charges?"

**Self-Hosted**: No fees from n8n. Only your VPS provider costs.

**n8n Cloud**: No hidden fees. Price shown is what you pay.

**Integrations**: Some third-party services may charge for API usage (separate from n8n).

---

### "Can I get a refund if I don't like it?"

**Self-Hosted**: Try free locally first before paying for VPS.

**n8n Cloud**: Contact support for refund policy (typically within first 30 days).

**VPS Providers**: Most offer hourly billing or monthly refunds (check specific provider).

---

## Recommended Starting Points

### Recommendation 1: Start Free, Then Decide

1. **Week 1-2**: Install locally on Mac (free)
2. **Week 3-4**: Build 2-3 workflows, understand value
3. **Month 2**: If valuable, deploy to Oracle Free or Contabo VPS
4. **Month 6**: Review if n8n Cloud makes sense for your needs

**Cost**: $0 for testing, $0-5.50/month for production

---

### Recommendation 2: Quick Start with Cloud

1. **Day 1**: Sign up for n8n Cloud Starter (€24/month)
2. **Week 1**: Build workflows with support
3. **Month 3**: Evaluate if usage justifies self-hosting
4. **Month 4**: Either stay on cloud or migrate to self-hosted

**Cost**: €24/month (~$26), cancel anytime

---

## Conclusion

**For most SEA businesses, the math is clear**:

| Solution | Annual Cost | Best For |
|----------|------------|----------|
| **Self-Hosted (Oracle Free)** | $0-144 | Maximum savings, technical teams |
| **Self-Hosted (Contabo)** | $66/year | Best value for production |
| **n8n Cloud** | €288-720/year | No server management |
| **Zapier** | $360-900/year | No alternative considered |

**Typical Savings**: $300-2,500/year depending on usage

**Value**: Significant time savings (10-20 hours/week) plus lower tool costs vs Zapier/Make

---

**Ready to save money? → [Prerequisites](guides/01-prerequisites.md)**
