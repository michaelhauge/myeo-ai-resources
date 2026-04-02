# RFC: [TITLE]

**RFC #**: [NUMBER - if you track RFCs sequentially]
**Status**: [Draft / Open for Comments / Decided / Implemented / Deprecated]
**Author**: [NAME]
**Date Created**: [YYYY-MM-DD]
**Comment Deadline**: [YYYY-MM-DD - usually 3-7 days from creation]
**Decision Maker**: [NAME - who makes the final call?]
**Stakeholders**: [@person1, @person2, @team-name]

---

## Summary (TL;DR)

[2-3 sentence summary of the proposal. What are we proposing and why?]

**Example**:
> We propose migrating from AWS to Railway for our backend infrastructure to reduce costs by 60% ($12k→$4.8k/year) and simplify deployment. This RFC outlines the migration plan, risks, and timeline. Decision needed by [DATE] to hit Q2 launch date.

---

## Background

### Context
[Why are we considering this? What problem are we solving?]

**Example**:
> Our AWS costs have grown from $500/month to $1,000/month as we've scaled. We're spending significant time managing AWS infrastructure (EC2, RDS, VPC, etc.). For a team of 5 engineers, this overhead isn't sustainable.

### Current State
[What's the situation today?]
- Current costs: [$ or metrics]
- Current pain points:
  - [Pain point 1]
  - [Pain point 2]
- What's working: [What we should preserve]

**Example**:
- Current costs: $1,000/month AWS (EC2, RDS, S3, CloudFront)
- Pain points:
  - 5-10 hours/week spent on DevOps tasks
  - Deployments take 20-30 minutes
  - Complex setup = hard to onboard new engineers
- What's working: Uptime is good (99.9%), performance is solid

---

## Proposal

### What We're Proposing
[Clear description of the proposal]

**Example**:
> Migrate backend services from AWS to Railway:
> - Move 3 Node.js services from EC2 to Railway
> - Move PostgreSQL from RDS to Railway Postgres
> - Keep S3/CloudFront for static assets (no change)
> - Timeline: Complete migration by [DATE]

### Success Criteria
[How will we know this worked?]

**Must-have** (non-negotiable):
- [ ] [Criteria 1]
- [ ] [Criteria 2]

**Nice-to-have** (goals but not blockers):
- [ ] [Criteria 3]
- [ ] [Criteria 4]

**Example**:
**Must-have**:
- [ ] Zero downtime during migration
- [ ] Costs reduced to <$600/month
- [ ] Deployments take <5 minutes
- [ ] No performance degradation

**Nice-to-have**:
- [ ] Improved deployment speed (current: 20 min → target: 2 min)
- [ ] Simplified onboarding for new engineers

### Implementation Plan
[High-level steps to execute this]

**Phase 1**: [Name] ([Timeline])
- [Step 1]
- [Step 2]

**Phase 2**: [Name] ([Timeline])
- [Step 3]
- [Step 4]

**Phase 3**: [Name] ([Timeline])
- [Step 5]
- [Step 6]

**Example**:
**Phase 1**: Setup & Testing (Week 1-2)
- Create Railway account, set up staging environment
- Deploy staging services to Railway
- Test end-to-end (no production traffic yet)

**Phase 2**: Database Migration (Week 3)
- Set up Railway Postgres
- Replicate data from RDS to Railway (read-only replica)
- Test data sync

**Phase 3**: Production Cutover (Week 4)
- Blue-green deployment (Railway in parallel with AWS)
- Route 10% traffic to Railway → Monitor → 100% cutover
- Decommission AWS services (after 1-week validation period)

---

## Alternatives Considered

### Option 1: [Alternative Name]
**Description**: [What is this alternative?]

**Pros**:
- [Pro 1]
- [Pro 2]

**Cons**:
- [Con 1]
- [Con 2]

**Why not this**: [Brief explanation]

**Example**:
### Option 1: Stay on AWS
**Description**: Keep current AWS setup, optimize costs via Reserved Instances and resource tuning.

**Pros**:
- No migration risk
- Team already knows AWS

**Cons**:
- Still expensive (maybe save 20-30%, not 60%)
- DevOps overhead remains
- Complexity remains

**Why not this**: Doesn't solve our main pain points (time overhead, complexity). Cost savings are minimal.

---

### Option 2: [Alternative Name]
[Same structure as Option 1]

**Example**:
### Option 2: Self-hosted on DigitalOcean
**Description**: Move to DigitalOcean Droplets, manage infrastructure ourselves.

**Pros**:
- Cheapest option ($200-300/month)
- Full control

**Cons**:
- **High DevOps overhead** (worse than AWS)
- No managed services (we'd manage Postgres, Redis, backups, etc.)
- Requires hiring/training DevOps engineer

**Why not this**: Saves money but increases complexity. Wrong trade-off for 5-person team.

---

### Option 3: [Alternative Name]
[Same structure]

**Example**:
### Option 3: Vercel + PlanetScale
**Description**: Deploy Next.js frontend to Vercel, backend APIs to Vercel Functions, database to PlanetScale.

**Pros**:
- Excellent developer experience
- Auto-scaling

**Cons**:
- Expensive at scale (Vercel Functions: $20/month per 1M invocations)
- Vendor lock-in (Vercel proprietary)
- Not suitable for our non-Next.js services

**Why not this**: Too expensive long-term, doesn't support our tech stack.

---

## Risks & Mitigation

| Risk | Likelihood | Impact | Mitigation |
|------|------------|--------|------------|
| [Risk 1] | High/Medium/Low | High/Medium/Low | [How we'll mitigate or address] |
| [Risk 2] | | | |

**Example**:
| Risk | Likelihood | Impact | Mitigation |
|------|------------|--------|------------|
| Migration causes downtime | Medium | High | Blue-green deployment, run both in parallel, gradual traffic shift |
| Railway outage impacts us | Low | High | Keep AWS backups for 1 month, can rollback quickly |
| Hidden costs on Railway | Low | Medium | Monitor costs weekly, set billing alerts at $700/month |
| Team unfamiliar with Railway | Medium | Medium | 1-week training period during staging setup |

---

## Costs & Resources

### Financial Cost
**Current state**: [$ cost]
**Proposed state**: [$ cost]
**Savings**: [$ saved per month/year]

**One-time costs**:
- [Cost item]: [$]
- [Cost item]: [$]

**Example**:
**Current**: $1,000/month AWS = $12,000/year
**Proposed**: $400/month Railway = $4,800/year
**Savings**: $7,200/year (60% reduction)

**One-time costs**:
- Migration effort: 40 hours engineering time (~$4,000 labor)
- Parallel running (AWS + Railway): $1,400 for 1 month
- **Total one-time**: $5,400
- **ROI**: Pays for itself in 9 months ($7,200/year savings)

### Time/People Cost
**Who**: [Names or roles]
**Time required**: [Hours or weeks]

**Example**:
**Who**: @mike (backend lead), @sarah (frontend)
**Time**: 40 hours over 4 weeks (10 hours/week)

---

## Open Questions

[Questions we need to answer before deciding]

- [ ] [Question 1] - **Owner**: [@person]
- [ ] [Question 2] - **Owner**: [@person]

**Example**:
- [ ] Does Railway support our current Postgres version (14.2)? - **Owner**: @mike
- [ ] What's Railway's SLA and uptime history? - **Owner**: @mike
- [ ] Can we import AWS CloudWatch logs to Railway? - **Owner**: @sarah

**Process**: Questions will be answered and this section updated before decision deadline.

---

## Comments & Discussion

[Team members add comments here, or use Notion/Confluence comments feature]

### @person1 - [DATE]
[Comment]

**Response from @author**:
[Response]

---

### @person2 - [DATE]
[Comment]

---

**Example**:
### @sarah - 2026-02-07
Love the cost savings! Concern: How do we handle environment variables migration? We have 50+ env vars in AWS.

**Response from @mike**:
Great point. Railway has built-in env var management. I'll create a migration script to export from AWS and import to Railway. Will add this to Phase 1.

---

### @john - 2026-02-08
What about CI/CD? We use GitHub Actions with AWS deployments. Does Railway support this?

**Response from @mike**:
Yes, Railway has native GitHub integration (auto-deploys on push). Will simplify our CI/CD actually (no more custom GitHub Actions scripts).

---

## Decision

[Leave blank until comment period ends. Then decision maker fills this in.]

**Status**: [Approved / Approved with Modifications / Rejected / Deferred]
**Decision Date**: [YYYY-MM-DD]
**Decision Maker**: [NAME]

### Rationale
[Why this decision was made]

**Example**:
**Status**: Approved
**Decision Date**: 2026-02-10
**Decision Maker**: @mike (CTO)

### Rationale
After reviewing comments and validating open questions:
- Cost savings are significant ($7,200/year, 60% reduction)
- Migration risk is low (blue-green deployment mitigates downtime risk)
- Team is supportive (Sarah, John both +1 after questions answered)
- Railway's uptime history is solid (99.97% last 12 months)

**Modifications from original proposal**:
- Added env var migration script to Phase 1 (Sarah's feedback)
- Extended parallel running from 1 week to 2 weeks (extra safety buffer)

**Next steps**:
- @mike: Create Railway account (by Feb 15)
- @mike + @sarah: Begin Phase 1 staging setup (week of Feb 15)
- Team: Weekly migration standup on Tuesdays 3pm SGT

---

## Implementation Tracking

[After decision, track progress here or link to project management tool]

- [ ] **Phase 1**: Setup & Testing (Week 1-2) - **Owner**: @mike
  - [ ] Create Railway account
  - [ ] Deploy staging environment
  - [ ] End-to-end testing
- [ ] **Phase 2**: Database Migration (Week 3) - **Owner**: @mike
  - [ ] Set up Railway Postgres
  - [ ] Data replication
  - [ ] Validation
- [ ] **Phase 3**: Production Cutover (Week 4) - **Owner**: @mike + @sarah
  - [ ] Blue-green deployment
  - [ ] Traffic shift (10% → 100%)
  - [ ] Decommission AWS

**Status**: [Not Started / In Progress / Completed]

---

## Related Documents

[Links to related docs, RFCs, or technical specs]

- [Link to technical spec]
- [Link to related RFC]
- [Link to project plan in Asana/Linear]

**Example**:
- [Technical Migration Spec](link-to-notion-page)
- [Railway vs AWS Cost Comparison Spreadsheet](link-to-sheet)
- [Migration Project in Linear](link-to-linear)

---

## Changelog

[Track major updates to this RFC]

| Date | Change | Author |
|------|--------|--------|
| 2026-02-07 | RFC created, opened for comments | @mike |
| 2026-02-08 | Added env var migration (Sarah's feedback) | @mike |
| 2026-02-10 | Decision: Approved with modifications | @mike |
| 2026-02-15 | Implementation started (Phase 1) | @mike |

---

**Questions about this RFC?**
- Ask in Slack: [#engineering or #rfcs channel]
- DM the author: [@author]
- Comment directly on this doc (Notion/Confluence comments)
