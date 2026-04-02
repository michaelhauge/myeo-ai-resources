# Part 3: Tech Stack Evolution — From MVP to $10M Infrastructure

**The Reality**: Your MVP tech stack won't scale to $10M ARR. Most founders wait too long to rebuild (accumulate tech debt, crash under load) or rebuild too early (waste 6-12 months on premature optimization). The art is knowing *when* to evolve your stack.

**This guide covers**:
- The 3-stage tech stack evolution (MVP → Growth → Scale)
- When to rebuild vs when to patch (the $1M and $5M decision points)
- Infrastructure cost optimization (SEA-specific cloud strategies)
- Database scaling strategies (when to move beyond Postgres)
- API architecture evolution (monolith → microservices decision)
- When to hire infrastructure/DevOps engineers

---

## The 3-Stage Tech Stack Evolution

### Stage 1: MVP Stack ($0-$1M ARR, 0-1,000 users)

**Philosophy**: Ship fast, technical debt is acceptable, use boring technology

**Typical stack**:
- **Frontend**: React/Next.js or Vue/Nuxt (pick one, doesn't matter which)
- **Backend**: Node.js/Express or Python/FastAPI or Ruby/Rails (whatever founder knows)
- **Database**: PostgreSQL (managed: AWS RDS, Supabase, Railway)
- **Hosting**: Vercel (frontend) + Railway/Render (backend) or all-in-one Heroku
- **File storage**: AWS S3 or Cloudflare R2
- **Email**: SendGrid or AWS SES
- **Payments**: Stripe
- **Monitoring**: Basic logs (no fancy monitoring yet)

**Infrastructure cost**: $100-$500/month
- Hosting: $50-$200/month
- Database: $20-$100/month
- CDN/storage: $10-$50/month
- Email/payments: $20-$150/month

**What's acceptable** (technical debt you can ignore):
- ✅ No caching (Postgres is fast enough for <1K users)
- ✅ Monolithic backend (one codebase, all features)
- ✅ Manual deployments (deploy via git push, no CI/CD)
- ✅ No load balancing (single server handles all traffic)
- ✅ Basic error logging (console.log + Sentry free tier)

**What you MUST do** (foundational decisions that are expensive to change later):
- ✅ Use managed database (not self-hosted Postgres — you'll regret it)
- ✅ Environment-based config (dev/staging/prod environments from Day 1)
- ✅ API versioning (use `/v1/` in API routes from start)
- ✅ Database migrations (use Prisma/Drizzle/Alembic, not raw SQL changes)

**Common mistakes**:
- ❌ Over-engineering (microservices, Kubernetes, GraphQL before product-market fit)
- ❌ Premature optimization (Redis caching, CDN for API, load balancers)
- ❌ Custom auth (use Auth0, Supabase Auth, Clerk — don't build your own)

---

### Stage 2: Growth Stack ($1M-$5M ARR, 1K-50K users)

**Philosophy**: Optimize bottlenecks, add caching, keep monolith

**Upgraded stack**:
- **Frontend**: Same (React/Next.js), add CDN (Cloudflare)
- **Backend**: Same framework, add Redis caching
- **Database**: Postgres (upgraded instance, add read replicas at $3M ARR)
- **Hosting**: Upgrade to production-grade (Vercel Pro, Railway with autoscaling)
- **Caching**: Redis (Upstash or AWS ElastiCache)
- **Queue**: Background jobs (BullMQ, Celery, Sidekiq)
- **Monitoring**: Real monitoring (DataDog, New Relic, or Grafana + Prometheus)
- **CI/CD**: Automated deployments (GitHub Actions, GitLab CI)

**Infrastructure cost**: $1K-$5K/month
- Hosting: $500-$2K/month (autoscaling, multiple environments)
- Database: $200-$1K/month (larger instance, read replicas)
- Caching/queue: $100-$500/month
- Monitoring: $100-$500/month
- CDN: $50-$300/month

**What to optimize**:
- ✅ **Caching**: Add Redis for frequently-accessed data (user sessions, API responses)
- ✅ **Database indexing**: Add indexes for slow queries (use `EXPLAIN ANALYZE`)
- ✅ **Background jobs**: Move slow operations to queue (email sending, PDF generation, data exports)
- ✅ **API response times**: Target <200ms p50, <500ms p99
- ✅ **Database connection pooling**: Use PgBouncer or built-in pooling

**What you STILL don't need**:
- ❌ Microservices (monolith is fine until $5M-$10M ARR)
- ❌ Multiple databases (Postgres handles 50K users easily)
- ❌ Service mesh (Istio, Linkerd — overkill before $10M+ ARR)
- ❌ GraphQL (REST is simpler, unless you have specific use case)

**The $1M rebuild decision**: Should you rebuild your MVP code?

**Rebuild if**:
- Codebase is <50% test coverage (impossible to refactor safely)
- Core architecture decision was wrong (chose wrong DB, wrong framework)
- Technical debt prevents new features (every change breaks 3 other things)
- Performance is <10% of requirements (100x too slow, can't be fixed with caching)

**DON'T rebuild if**:
- "Code is messy" (refactor incrementally, don't rewrite)
- "New framework is better" (grass is always greener)
- "Want to use latest tech" (boring technology wins)

**Rebuild timeline**: 3-6 months (50% of current feature velocity while rebuilding)

**Rebuild cost**:
- Opportunity cost: $500K-$1M in lost revenue (6 months of stalled growth)
- Engineering cost: 2-3 engineers × 6 months = $150K-$300K
- Total: $650K-$1.3M

**Only rebuild if NOT rebuilding costs more** (e.g., losing $2M/year to customer churn due to slow product).

---

### Stage 3: Scale Stack ($5M-$10M ARR, 50K-500K users)

**Philosophy**: Scale horizontally, split monolith strategically, invest in reliability

**Upgraded stack**:
- **Frontend**: Same, add edge caching (Cloudflare Workers, Vercel Edge)
- **Backend**: Start splitting monolith (extract high-traffic services)
- **Database**: Postgres primary + read replicas (2-3 replicas for read-heavy workloads)
- **Caching**: Redis cluster (HA setup, 2-3 nodes)
- **Queue**: Managed queue (AWS SQS, GCP Pub/Sub, or self-hosted with HA)
- **Search**: Elasticsearch or Algolia (if search is core feature)
- **Observability**: Full stack monitoring (logs, metrics, traces, alerts)
- **Infrastructure**: Kubernetes (optional, only if you have DevOps team)

**Infrastructure cost**: $5K-$20K/month
- Hosting: $2K-$8K/month (autoscaling, multi-region)
- Database: $1K-$5K/month (primary + replicas, larger instances)
- Caching/queue: $500-$2K/month (clustered Redis, HA queue)
- Monitoring/observability: $500-$2K/month
- CDN/edge: $200-$1K/month
- Search (if applicable): $500-$2K/month

**What to optimize**:
- ✅ **Horizontal scaling**: Add more servers, not bigger servers
- ✅ **Database read replicas**: Route read queries to replicas (80% of queries are reads)
- ✅ **CDN for API**: Cache API responses at edge (Cloudflare Workers, Vercel Edge Functions)
- ✅ **Service extraction**: Extract 1-2 critical services from monolith (e.g., billing, notifications)
- ✅ **Multi-region**: Serve users from closest region (AWS multi-region, Cloudflare global)

**The $5M rebuild decision**: Should you go microservices?

**Go microservices if**:
- Team >30 engineers (monolith becomes coordination bottleneck)
- Different services have different scaling needs (e.g., API handles 1K req/s, billing handles 10 req/s)
- Different services have different tech requirements (e.g., Python for ML, Go for high-throughput API)
- Regulatory/compliance requires service isolation (e.g., PCI compliance for payments)

**DON'T go microservices if**:
- Team <20 engineers (coordination overhead > benefits)
- Monolith performance is fine with caching/indexing
- No clear service boundaries (unclear how to split)

**Microservices cost**:
- Operational complexity: 3-5x increase (more deployments, monitoring, debugging)
- Engineering velocity: -30% for first 6-12 months (learning curve)
- Infrastructure cost: +50-100% (more servers, load balancers, service mesh)

**Only go microservices if clear win** (e.g., 10x team productivity increase justifies 3x operational overhead).

---

## When to Rebuild vs When to Patch

**The rebuild temptation**: Every founder wants to rewrite their code at some point ("this codebase is a mess, let's start fresh").

**The rebuild trap**: Rewrites take 2-3x longer than expected, deliver 0 new features, and often fail (second system effect).

### Decision Framework: Rebuild vs Patch

**Rebuild if BOTH are true**:
1. **Cost of NOT rebuilding > Cost of rebuilding**
   - Example: Losing $2M/year to churn due to slow product > $1M rebuild cost
2. **Core architecture is fundamentally broken**
   - Example: Chose NoSQL but need ACID transactions (can't patch, must rebuild)

**Patch if EITHER is true**:
1. **Problem can be fixed with refactoring** (not architectural)
   - Example: Slow queries → add indexes, caching
2. **Rebuild cost > 6 months of engineering time**
   - Example: 3 engineers × 6 months = $300K + $500K opportunity cost = $800K

### Case Study: When to Rebuild

**Example 1: Don't rebuild** (patch instead)

**Situation**:
- $2M ARR SaaS company
- Codebase is "messy" (low test coverage, inconsistent patterns)
- Engineers complain: "Code is hard to work with, we should rebuild"

**Analysis**:
- Problem: Code quality (refactoring problem, not architecture problem)
- Solution: Incremental refactoring (allocate 20% of sprint to refactoring)
- Cost: $0 extra (refactor as you build features)
- Timeline: 6-12 months to clean up codebase
- Result: Clean code WITHOUT rewrite risk

**Decision**: DON'T rebuild, refactor incrementally

---

**Example 2: Rebuild strategically** (extract critical service)

**Situation**:
- $5M ARR SaaS company
- Monolithic Rails app with 200K lines of code
- Billing system causes crashes (blocks entire app when Stripe is slow)
- Team: 25 engineers

**Analysis**:
- Problem: Billing system blocking main app (architectural problem)
- Solution: Extract billing to separate service (not full microservices, just billing)
- Cost: 2 engineers × 3 months = $100K
- Timeline: 3 months to extract billing service
- Result: Billing issues no longer crash main app

**Decision**: Rebuild billing service (strategic extraction, not full rewrite)

---

**Example 3: Rebuild from scratch** (rare, but justified)

**Situation**:
- $3M ARR SaaS company
- Built on Firebase (NoSQL) but product now requires complex relational queries
- Can't add features customers want (reporting, analytics, multi-table joins)
- Losing $1M/year in churn due to missing features

**Analysis**:
- Problem: Database choice fundamentally wrong (can't migrate Firebase to Postgres incrementally)
- Solution: Rebuild backend with Postgres
- Cost: 3 engineers × 6 months = $300K + $500K lost revenue = $800K
- Timeline: 6 months
- Result: Unlock $1M/year in revenue (payback in <1 year)

**Decision**: Rebuild justified (lost revenue > rebuild cost)

---

## Infrastructure Cost Optimization (SEA-Specific)

**The reality**: SEA startups can't afford US-level infrastructure spend ($20K-$50K/month). Need to optimize for cost while maintaining performance.

### Cloud Provider Selection (SEA)

**AWS** (best for enterprise, expensive):
- **Pros**: Most mature, best SEA coverage (Singapore, Mumbai, Tokyo, Seoul)
- **Cons**: Expensive (2-3x more than alternatives)
- **Best for**: $5M+ ARR companies, enterprise customers who require AWS

**GCP** (best for cost, good for data-heavy apps):
- **Pros**: Cheapest (20-30% less than AWS), great for ML/data workloads
- **Cons**: Fewer SEA regions (Singapore, Taiwan, Tokyo), less mature than AWS
- **Best for**: $1M-$5M ARR companies, data/ML-heavy products

**DigitalOcean** (best for simplicity, affordable):
- **Pros**: Simple pricing, affordable ($100-$500/month vs $500-$2K on AWS)
- **Cons**: Limited features (no managed Kubernetes, basic monitoring)
- **Best for**: $0-$1M ARR companies, simple CRUD apps

**Railway** (best for startups, easiest):
- **Pros**: Easiest deploy (git push to deploy), affordable ($50-$500/month)
- **Cons**: Not for scale (max ~50K users), US-only regions (no SEA)
- **Best for**: $0-$1M ARR MVP stage

**Cloudflare** (best for edge/CDN):
- **Pros**: Extremely affordable ($0-$200/month), global edge network
- **Cons**: Limited compute (Workers have 50ms CPU time limit)
- **Best for**: Static sites, API caching, edge functions

---

### Cost Optimization Strategies

#### Strategy 1: Use Managed Services (Save 50-70% on DevOps time)

**Self-hosted** (seems cheaper, actually more expensive):
- Example: Self-hosted Postgres on EC2
- Server cost: $200/month
- DevOps time: 10 hrs/month × $100/hr = $1,000/month
- **Total: $1,200/month**

**Managed** (seems expensive, actually cheaper):
- Example: AWS RDS Postgres
- Service cost: $300/month
- DevOps time: 2 hrs/month × $100/hr = $200/month
- **Total: $500/month** (58% savings)

**Takeaway**: Always use managed services until $5M+ ARR (RDS, ElastiCache, SES, S3).

---

#### Strategy 2: Region Selection (Save 20-40% by avoiding expensive regions)

**Expensive regions** (avoid if possible):
- us-east-1 (US East, Virginia): Baseline cost
- eu-west-1 (Ireland): +10-15% vs US
- ap-southeast-1 (Singapore): +15-25% vs US
- ap-northeast-1 (Tokyo): +20-30% vs US

**Cheaper regions** (use if SEA latency is acceptable):
- ap-south-1 (Mumbai): -10% vs Singapore
- ap-southeast-3 (Jakarta): -15% vs Singapore
- ap-southeast-2 (Sydney): Same as Singapore

**Strategy**: Host backend in Mumbai (cheap) + Cloudflare CDN (global edge caching)
- Backend: Mumbai (save 10% on compute)
- CDN: Cloudflare edge (cache responses at SEA edge locations)
- Result: SEA users get <50ms latency, but you pay Mumbai pricing

---

#### Strategy 3: Spot Instances (Save 60-80% on compute)

**On-demand instances** (expensive):
- Example: AWS t3.medium (2 vCPU, 4GB RAM)
- Cost: $0.042/hr = $30/month

**Spot instances** (cheap, but can be terminated):
- Same instance: $0.0084/hr = $6/month (80% savings)
- Risk: AWS can terminate with 2-minute warning

**Strategy**: Use spot instances for stateless workloads
- ✅ Web servers (stateless, can restart quickly)
- ✅ Background workers (queue-based, can retry)
- ❌ Databases (stateful, can't lose data)
- ❌ Caching (stateful, losing Redis = bad UX)

---

#### Strategy 4: Reserved Instances (Save 30-50% for predictable workloads)

**On-demand** (pay-as-you-go):
- Example: AWS RDS db.t3.medium
- Cost: $0.068/hr = $50/month

**Reserved (1-year commit)**:
- Same instance: $0.041/hr = $30/month (40% savings)
- Risk: Locked in for 1 year

**Strategy**: Buy reserved instances for baseline capacity
- At $3M ARR: You know you need at least 2 backend servers, 1 DB
- Buy 1-year reserved for baseline (save 40%)
- Use on-demand for spikes (pay premium only for variability)

---

#### Strategy 5: Compress Egress (Save 40-60% on bandwidth)

**The problem**: Cloud bandwidth is expensive
- AWS: $0.09/GB egress (outbound traffic)
- 1TB/month egress = $90/month
- At $5M ARR: 10-20TB/month = $900-$1,800/month

**The fix**: Enable gzip compression
- Reduces response size by 70-80% (JSON, HTML, CSS, JS)
- Example: 10TB uncompressed → 2-3TB compressed
- Savings: $900 → $200/month (78% reduction)

**Implementation**:
```javascript
// Express.js
const compression = require('compression');
app.use(compression());

// Next.js (built-in)
module.exports = {
  compress: true, // Default in production
};
```

---

## Database Scaling Strategies

**The database bottleneck**: Postgres can handle 1M users on a single instance, but eventually you'll need to scale.

### Scaling Strategy by ARR

#### $0-$1M ARR: Single Postgres instance

**Setup**:
- Managed Postgres (AWS RDS, Supabase, Railway)
- Instance size: 2-4 vCPU, 8-16GB RAM
- Cost: $50-$200/month

**Performance targets**:
- <1K queries/second (QPS)
- <10ms median query time
- <50ms p99 query time

**When this breaks**: >5K QPS or >50GB database size

---

#### $1M-$3M ARR: Add caching (Redis)

**Setup**:
- Same Postgres instance
- Add Redis (Upstash, AWS ElastiCache)
- Cost: +$50-$200/month for Redis

**What to cache**:
- User sessions (read-heavy, rarely change)
- API responses (cache for 60s-5min)
- Aggregated data (counts, stats computed once/hour)

**Performance improvement**:
- 50-80% reduction in DB queries (cache hit rate)
- Median query time: 10ms → 2ms (Redis is 5x faster)

**When this breaks**: >20K QPS or >200GB database size

---

#### $3M-$7M ARR: Add read replicas

**Setup**:
- Primary Postgres (handles writes)
- 2-3 read replicas (handle reads)
- Route 80% of queries to replicas (reads), 20% to primary (writes)
- Cost: +$200-$1K/month for replicas

**Query routing**:
```javascript
// Prisma with read replicas
const prisma = new PrismaClient({
  datasources: {
    db: {
      url: process.env.DATABASE_URL, // Primary (writes)
    },
  },
});

const prismaReadOnly = new PrismaClient({
  datasources: {
    db: {
      url: process.env.DATABASE_READ_REPLICA_URL, // Replica (reads)
    },
  },
});

// Write operations (use primary)
await prisma.user.create({ data: {...} });

// Read operations (use replica)
const users = await prismaReadOnly.user.findMany();
```

**Performance improvement**:
- 3-5x read throughput (replicas distribute load)
- Write performance unchanged (still single primary)

**When this breaks**: >100K QPS or >1TB database size

---

#### $7M-$10M ARR: Sharding (rare, complex)

**Setup**:
- Multiple Postgres instances (shards)
- Partition data by key (e.g., user_id % 4 = shard number)
- Application-level routing (app decides which shard to query)
- Cost: +$2K-$10K/month (multiple DB clusters)

**When to shard**:
- >1TB database size (single instance too large)
- >100K writes/second (single primary bottleneck)
- Regulatory requirements (data residency by country)

**Sharding complexity**:
- ❌ Cross-shard queries are slow (can't join across shards)
- ❌ Transactions across shards are complex (2-phase commit)
- ❌ Rebalancing shards is painful (moving data between shards)

**Alternatives to sharding** (try these first):
- Vertical partitioning (split large tables into multiple tables)
- Archiving old data (move >2 year old data to archive DB)
- Specialized databases (move time-series data to TimescaleDB, logs to Elasticsearch)

**Takeaway**: Avoid sharding until $10M+ ARR (most companies never need it).

---

## API Architecture Evolution

### Stage 1: Monolithic REST API ($0-$3M ARR)

**Architecture**:
- Single backend codebase (Node.js/Python/Ruby)
- REST API (JSON over HTTP)
- All features in one app (auth, billing, core features)

**Pros**:
- ✅ Simple (one codebase, one deploy)
- ✅ Easy to develop (make changes anywhere)
- ✅ Easy to debug (one log stream)

**Cons**:
- ❌ Tight coupling (changing one feature can break others)
- ❌ Single point of failure (if API crashes, entire product down)

**When to evolve**: $3M-$5M ARR, team >20 engineers

---

### Stage 2: Monolith + Background Workers ($3M-$7M ARR)

**Architecture**:
- Same monolith for API
- Separate background workers (for slow operations)
- Queue (BullMQ, Celery, Sidekiq) connects API to workers

**What goes in background workers**:
- Email sending (don't block API response)
- PDF generation (slow, 2-10 seconds)
- Data exports (CSV, Excel)
- Webhook deliveries (retries, exponential backoff)
- Scheduled jobs (daily reports, billing runs)

**Example** (Node.js + BullMQ):
```javascript
// API endpoint (fast, returns immediately)
app.post('/api/export', async (req, res) => {
  const job = await exportQueue.add('export-data', {
    userId: req.user.id,
    format: 'csv',
  });

  res.json({ jobId: job.id, status: 'processing' });
});

// Background worker (slow, runs async)
exportQueue.process('export-data', async (job) => {
  const { userId, format } = job.data;

  // Generate CSV (takes 10-30 seconds)
  const csv = await generateCSV(userId);

  // Upload to S3
  const url = await uploadToS3(csv);

  // Send email with download link
  await sendEmail(userId, url);
});
```

**Performance improvement**:
- API response time: 10-30s → <200ms (offload slow work)
- User experience: Better (no waiting, get email when ready)

---

### Stage 3: Microservices ($7M-$10M ARR)

**Architecture**:
- Multiple services (auth, billing, core, notifications)
- Each service has its own database (database per service)
- API gateway (routes requests to appropriate service)
- Service mesh (Istio, Linkerd) for service-to-service communication

**When to go microservices**:
- Team >30 engineers (coordination bottleneck)
- Different scaling needs (auth: 1K req/s, billing: 10 req/s)
- Clear service boundaries (can extract without breaking everything)

**What to extract first** (in order):
1. **Billing/payments** (critical, isolated, rarely changes)
2. **Notifications** (email, SMS, push — high volume, separate scaling)
3. **Auth** (security isolation, compliance requirements)

**What NOT to extract**:
- ❌ Core business logic (too coupled, breaks everything)
- ❌ Shared data models (User, Company — used by all services)

**Microservices cost**:
- Operational overhead: 3-5x (more deploys, monitoring, debugging)
- Infrastructure: +50-100% (more servers, load balancers)
- Development velocity: -30% for first 6-12 months (learning curve)

**Takeaway**: Only go microservices if team >30 engineers and clear service boundaries.

---

## When to Hire Infrastructure/DevOps Engineers

**The hiring timeline**:

**$0-$1M ARR**: No dedicated DevOps
- Founders/engineers handle infra (part-time)
- Use managed services (Vercel, Railway, Heroku)
- Time spent on infra: 5-10 hrs/week

**$1M-$3M ARR**: First DevOps/Platform engineer
- Hire at $2M-$3M ARR
- Focus: CI/CD, monitoring, cost optimization
- Typical title: "Platform Engineer" or "DevOps Engineer"
- Salary (SEA): $80K-$120K/year

**$3M-$7M ARR**: DevOps team (2-3 engineers)
- Add 2nd DevOps at $3M-$5M ARR
- Add 3rd DevOps at $5M-$7M ARR
- Focus: Infrastructure automation, reliability, scaling

**$7M-$10M ARR**: Infrastructure org (4-6 engineers)
- Add Head of Infrastructure/VP Engineering (Infra)
- Split into teams: Platform (CI/CD, tooling), SRE (reliability), Security (compliance)
- Ratio: 1 DevOps per 10-15 product engineers

---

## Tech Stack Evolution Checklist

### $0-$1M ARR (MVP Stack)

**Infrastructure**:
- [ ] Managed database (AWS RDS, Supabase, Railway — not self-hosted)
- [ ] Simple hosting (Vercel + Railway or Heroku)
- [ ] Basic monitoring (Sentry for errors, Vercel/Railway logs)
- [ ] Manual deployments (git push to deploy)

**Cost target**: $100-$500/month

---

### $1M-$3M ARR (Growth Stack)

**Infrastructure**:
- [ ] Add caching (Redis via Upstash or AWS ElastiCache)
- [ ] Add background workers (BullMQ, Celery, Sidekiq)
- [ ] Add CI/CD (GitHub Actions, GitLab CI)
- [ ] Upgrade monitoring (DataDog, New Relic, or Grafana)
- [ ] Add CDN (Cloudflare)

**Database**:
- [ ] Add indexes for slow queries (run `EXPLAIN ANALYZE`)
- [ ] Enable connection pooling (PgBouncer or Prisma built-in)

**Cost target**: $1K-$5K/month

---

### $3M-$7M ARR (Scale Stack)

**Infrastructure**:
- [ ] Add database read replicas (2-3 replicas)
- [ ] Add Redis cluster (HA setup)
- [ ] Upgrade to production hosting (AWS, GCP, or DigitalOcean with autoscaling)
- [ ] Add full observability (logs, metrics, traces, alerts)

**Rebuild decision**:
- [ ] Evaluate monolith performance (is it bottleneck?)
- [ ] Consider extracting 1-2 critical services (billing, notifications)

**Team**:
- [ ] Hire first DevOps engineer ($2M-$3M ARR)
- [ ] Hire second DevOps engineer ($5M-$7M ARR)

**Cost target**: $5K-$20K/month

---

## Summary

**Key takeaways**:

1. **Evolution, not revolution**: MVP → Growth → Scale stack (don't skip stages)

2. **Rebuild triggers**: Only rebuild if cost of NOT rebuilding > cost of rebuilding (rare before $5M ARR)

3. **Boring technology wins**: Postgres + Redis + managed services beats fancy tech (Kubernetes, GraphQL, microservices)

4. **Infrastructure cost optimization**: Use managed services (save DevOps time), choose cheaper regions (Mumbai vs Singapore), compress egress (save 70% on bandwidth)

5. **Database scaling path**: Single Postgres → Add caching → Add read replicas → Sharding (rare, avoid if possible)

6. **Monolith is fine until $7M+ ARR**: Don't go microservices early (operational overhead > benefits until team >30 eng)

7. **Hire DevOps strategically**: First hire at $2M-$3M ARR, build team of 2-3 by $7M ARR

**Next steps**:
- Read Part 4: Fundraising Strategy (when to raise Series A/B, how much, investor selection)
- Use Template: Infrastructure Cost Calculator (estimate AWS/GCP/DO costs by ARR stage)
- Use Template: Database Scaling Checklist (optimize Postgres before adding replicas/sharding)
