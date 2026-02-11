# Choosing Your Hosting Option

**Self-hosted, cloud, or hybrid? Decision guide for SEA businesses**

---

## Quick Decision Tree

**Answer these questions**:

1. **Do you want zero server management?**
   - YES → **n8n Cloud** (€24/month)
   - NO → Continue to question 2

2. **Is budget your top priority?**
   - YES → **Oracle Cloud Free** ($0) or **Local Mac** ($0)
   - NO → Continue to question 3

3. **Do you need 24/7 availability?**
   - NO → **Local Mac** ($0)
   - YES → Continue to question 4

4. **Is data sovereignty important (Singapore/Malaysia)?**
   - YES → **Self-hosted VPS** in Singapore
   - NO → **n8n Cloud** works fine

5. **What's your technical comfort level?**
   - Beginner → **DigitalOcean** ($24/month) or **n8n Cloud**
   - Intermediate → **Contabo** ($5.50/month)
   - Advanced → **Oracle Cloud Free** ($0)

---

## Detailed Comparison

### Option 1: Local Mac/PC

**Best for**:
- Testing and learning
- Personal use
- Internal company tools
- Maximum privacy

| Aspect | Details |
|--------|---------|
| **Monthly Cost** | $0 |
| **Setup Time** | 10 minutes |
| **Difficulty** | Beginner |
| **Uptime** | When Mac is on |
| **External Access** | No (network only) |
| **Data Location** | Your Mac |
| **Maintenance** | Monthly Docker updates |
| **Scalability** | Limited by Mac resources |

**Pros**:
- ✅ Zero cost
- ✅ Maximum privacy
- ✅ Instant setup
- ✅ No server management

**Cons**:
- ❌ Mac must stay on
- ❌ Not externally accessible
- ❌ Limited resources
- ❌ No redundancy

**When to upgrade**: When you need 24/7 availability or external access.

---

### Option 2: Oracle Cloud Free Tier

**Best for**:
- Budget-conscious businesses
- Production use at $0 cost
- Singapore data localization
- Those comfortable with VPS

| Aspect | Details |
|--------|---------|
| **Monthly Cost** | $0 (forever) |
| **Setup Time** | 30-45 minutes |
| **Difficulty** | Intermediate |
| **Uptime** | 99.9% |
| **External Access** | Yes |
| **Data Location** | Singapore (or your choice) |
| **Maintenance** | Manual updates |
| **Scalability** | 4 OCPU, 24GB RAM (excellent) |

**Pros**:
- ✅ Free forever
- ✅ Generous resources (4 OCPU, 24GB RAM)
- ✅ Singapore datacenter available
- ✅ Professional infrastructure
- ✅ 10TB bandwidth/month

**Cons**:
- ❌ Requires credit card verification
- ❌ ARM architecture (minor issue)
- ❌ Hard to get instance (high demand)
- ❌ Idle instances deleted after 30 days
- ❌ Requires technical setup

**Tips for success**:
- Try multiple times to provision (demand is high)
- Keep instance active (run health checks weekly)
- Use ARM-compatible Docker images

---

### Option 3: Contabo VPS

**Best for**:
- Production use on budget
- Best value for money
- Long-term hosting
- Singapore data localization

| Aspect | Details |
|--------|---------|
| **Monthly Cost** | ~$5.50 (VPS S) |
| **Setup Time** | 30 minutes |
| **Difficulty** | Intermediate |
| **Uptime** | 99.9% |
| **External Access** | Yes |
| **Data Location** | Singapore datacenter |
| **Maintenance** | Manual updates |
| **Scalability** | Up to 12 vCPU, 60GB RAM |

**Pros**:
- ✅ Exceptional value (4 vCPU, 8GB RAM for $5.50)
- ✅ Singapore datacenter
- ✅ Unlimited bandwidth
- ✅ x86 architecture (full compatibility)
- ✅ Predictable pricing

**Cons**:
- ❌ Not free (though very cheap)
- ❌ Manual setup required
- ❌ You manage updates
- ❌ No managed services

**ROI**: At $5.50/month, even one automated workflow pays for itself.

---

### Option 4: DigitalOcean

**Best for**:
- Non-technical users
- Value support and ease-of-use
- Need excellent documentation
- Prefer managed services

| Aspect | Details |
|--------|---------|
| **Monthly Cost** | $24 (4GB Droplet) |
| **Setup Time** | 20 minutes |
| **Difficulty** | Beginner |
| **Uptime** | 99.99% |
| **External Access** | Yes |
| **Data Location** | Singapore datacenter |
| **Maintenance** | Semi-automated |
| **Scalability** | Easy vertical scaling |

**Pros**:
- ✅ Excellent documentation
- ✅ Great community support
- ✅ Easy 1-click apps
- ✅ Simple UI
- ✅ Singapore datacenter
- ✅ $200 free credit (60 days, new users)

**Cons**:
- ❌ More expensive ($24 vs $5.50)
- ❌ Smaller specs for price
- ❌ Still requires some setup

**When worth it**: If support and ease-of-use are more valuable than cost savings.

---

### Option 5: n8n Cloud

**Best for**:
- "Just make it work" users
- No technical team
- Need professional support
- Compliance requirements (SOC 2)

| Aspect | Details |
|--------|---------|
| **Monthly Cost** | €24-800 (~$26-870) |
| **Setup Time** | 5 minutes |
| **Difficulty** | None |
| **Uptime** | 99.95% SLA |
| **External Access** | Yes |
| **Data Location** | Frankfurt, Germany or US |
| **Maintenance** | Automatic |
| **Scalability** | Automatic |

**Pros**:
- ✅ Zero setup
- ✅ Automatic updates
- ✅ Professional monitoring
- ✅ Email support (Pro+)
- ✅ SOC 2 certified
- ✅ Guaranteed uptime SLA

**Cons**:
- ❌ Monthly cost (€24 minimum)
- ❌ Execution limits (2,500/month on Starter)
- ❌ Data not in SEA
- ❌ Less control

**When worth it**: If you have budget but no technical team, or need compliance certification.

---

## Cost Comparison (3-Year Total)

| Option | Year 1 | Year 2 | Year 3 | 3-Year Total |
|--------|--------|--------|--------|--------------|
| **Local Mac** | $0 | $0 | $0 | **$0** |
| **Oracle Free** | $0 | $0 | $0 | **$0** |
| **Contabo** | $66 | $66 | $66 | **$198** |
| **DigitalOcean** | $288 | $288 | $288 | **$864** |
| **n8n Cloud** | €288 (~$312) | €288 | €288 | **$936** |

---

## Migration Paths

### Start Free, Upgrade Later

**Recommended path**:
1. **Week 1-2**: Local Mac (free testing)
2. **Week 3-4**: Build real workflows, understand value
3. **Month 2**: If valuable, migrate to VPS
   - Budget: Oracle Free or Contabo
   - Ease: DigitalOcean or n8n Cloud

**Export/Import**:
- Export workflows from local
- Import to new installation
- Re-enter credentials (not exported for security)

---

### Hybrid Approach

**Development + Production**:
- **Local Mac**: Testing and development
- **VPS/Cloud**: Production workflows

**Benefits**:
- Test changes locally before deploying
- Reduce production costs
- Safer experimentation

---

## Latency Considerations for SEA

### Singapore Datacenters

**Providers with Singapore**:
- ✅ Oracle Cloud
- ✅ Contabo
- ✅ DigitalOcean
- ✅ AWS/GCP (expensive)

**Latency from Malaysia/Singapore**:
- Singapore datacenter: <10ms
- Frankfurt (n8n Cloud): ~180ms
- US datacenters: ~200-250ms

**Impact**:
- Most workflows: Negligible
- Real-time interactions: Noticeable
- Batch processing: No impact

**Recommendation**: Singapore hosting for best performance, but n8n Cloud latency is acceptable for most use cases.

---

## Recommendations by Business Size

### Solopreneur / Freelancer

**Recommended**: Local Mac or Oracle Cloud Free

**Reasoning**:
- Low budget
- Simple workflows
- Can manage downtime
- Privacy important

**Cost**: $0

---

### Small Business (5-20 employees)

**Recommended**: Contabo VPS or DigitalOcean

**Reasoning**:
- Need reliability
- Multiple team members
- Budget-conscious
- Can handle basic server management

**Cost**: $5.50-24/month

---

### Medium Business (20-100 employees)

**Recommended**: DigitalOcean or n8n Cloud

**Reasoning**:
- Need support
- Complex workflows
- Multiple integrations
- Value uptime and reliability

**Cost**: $24-65/month

---

### Enterprise (100+ employees)

**Recommended**: n8n Cloud (Business/Enterprise) or Self-Hosted Enterprise

**Reasoning**:
- Need SLA guarantees
- Compliance requirements
- Professional support critical
- Budget less constrained

**Cost**: $870+/month

---

## Decision Matrix

| Priority | Best Option |
|----------|-------------|
| **Lowest cost** | Oracle Free or Local Mac ($0) |
| **Best value** | Contabo ($5.50/month) |
| **Easiest setup** | n8n Cloud (€24/month) |
| **Most control** | Self-hosted (any VPS) |
| **PDPA compliance** | Singapore VPS (self-hosted) |
| **Zero maintenance** | n8n Cloud |
| **Best performance in SEA** | Singapore VPS |

---

## Next Steps

**Chose Local Mac?**
→ [Install on Mac Guide](03-local-mac.md)

**Chose Oracle Cloud Free?**
→ [Oracle Cloud Setup Guide](04-oracle-cloud-free.md)

**Chose DigitalOcean?**
→ [DigitalOcean Setup Guide](05-digitalocean.md)

**Chose Contabo?**
→ [Contabo VPS Guide](06-contabo-vps.md)

**Chose n8n Cloud?**
→ Sign up at https://n8n.io

---

**Still unsure? Start with Local Mac for free testing!**
