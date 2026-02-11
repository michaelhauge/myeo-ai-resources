# Frequently Asked Questions

**Common questions about n8n for Southeast Asian businesses**

---

## General Questions

### What is n8n?

n8n (pronounced "n-eight-n") is a workflow automation platform that helps businesses automate repetitive tasks by connecting different applications without writing code.

Think of it as:
- Cheaper alternative to Zapier (90-98% savings)
- More powerful than IFTTT
- Self-host option (keep data in Singapore/Malaysia)
- Visual workflow builder (no coding required)

---

### Is n8n really free?

**Yes**, with caveats:

**Free (Self-Hosted)**:
- ✅ n8n software: FREE forever
- ✅ Unlimited workflows: FREE
- ✅ Unlimited executions: FREE
- ✅ Unlimited users: FREE
- ❌ Hosting: You pay for server ($0-30/month)

**Paid (n8n Cloud)**:
- Managed hosting starting at €24/month (~$26 USD)
- No server management required
- Professional support included

**Bottom line**: Software is free, hosting is optional (can run on your Mac for $0).

---

### How is n8n different from Zapier?

| Feature | n8n | Zapier |
|---------|-----|--------|
| **Pricing** | Per execution | Per task/step |
| **Cost (typical)** | $0-30/month | $30-75/month |
| **Self-hosting** | Yes (free) | No |
| **Data location** | Your choice | US datacenters |
| **Workflow complexity** | Unlimited steps | Expensive for >3 steps |
| **Open source** | Yes (fair-code) | No |
| **Integrations** | 400+ | 5,000+ |

**When to choose n8n**: Complex workflows (5+ steps), budget-conscious, data sovereignty needs
**When to choose Zapier**: Need a specific niche integration, want zero technical setup

---

### Is n8n suitable for non-technical users?

**Yes**, with some caveats:

**Easy Parts**:
- Visual workflow builder (drag and drop)
- Pre-built templates
- No coding required for most tasks
- Clear documentation

**Requires Some Technical Skill**:
- Initial server setup (if self-hosting)
- Understanding basic concepts (webhooks, API keys)
- Troubleshooting when integrations change

**Recommended Path for Non-Technical Users**:
1. Start with **n8n Cloud** (€24/month) to avoid server setup
2. Use templates for common workflows
3. Hire freelancer for initial setup (~$100-300 one-time)
4. Learn gradually through building simple workflows

---

### Can I migrate from Zapier to n8n?

**Yes**, but manually:

1. Export your Zapier workflows (screenshot or document them)
2. Rebuild in n8n using similar nodes
3. Test thoroughly before switching
4. Gradually migrate workflow by workflow

**Average time**: 30-60 minutes per workflow

**Tip**: Many users run both temporarily during migration.

---

## Security & Privacy

### Where is my data stored?

**Self-Hosted**:
- Your data stays on YOUR server
- You choose the datacenter (Singapore, Malaysia, etc.)
- Full control over data location

**n8n Cloud**:
- Frankfurt, Germany (European data protection laws)
- OR US datacenters
- SOC 2 Type II certified

**What data is stored**:
- Workflow definitions (how your automations work)
- Execution logs (history of workflow runs)
- Encrypted credentials (API keys, passwords)

**What is NOT stored**:
- Your actual business data (passes through but not persisted)

---

### Who can access my workflows?

**Self-Hosted**:
- Only people with access to your server
- You control authentication (username/password, SSO)
- Can use VPN for additional security

**n8n Cloud**:
- Only your team (invited users)
- n8n staff cannot see your workflows
- Enterprise plan offers audit logs

**Best practice**: Enable two-factor authentication, use strong passwords, limit user access.

---

### How are API keys stored?

**Encrypted at rest**:
- AES-256 encryption
- Encryption key stored separately from database
- Even with database access, credentials are unreadable

**Best practices**:
- Use OAuth when available (more secure than API keys)
- Set unique encryption key (don't use default)
- Rotate credentials every 90 days
- Use minimum API scope needed

---

### Is n8n PDPA compliant?

**Self-hosted = YES**, easier to comply:

**PDPA Requirements**:
- ✅ **Data localization**: Deploy in Singapore/Malaysia
- ✅ **Access controls**: User authentication, role-based access
- ✅ **Audit logging**: All executions logged
- ✅ **Data encryption**: AES-256 for credentials, HTTPS for transit
- ✅ **Data retention**: Configurable (delete old executions)
- ✅ **Right to be forgotten**: Delete workflows and data

**n8n Cloud**:
- Data in Frankfurt/US (requires Data Processing Agreement)
- SOC 2 Type II certified
- GDPR compliant

**Recommendation**: Self-host in Singapore for simplest PDPA compliance.

---

### What if n8n shuts down?

**Self-hosted**: You're not affected
- Software runs on your infrastructure
- Fair-code license ensures code remains available
- Active open-source community can fork if needed

**n8n Cloud**: Migration path exists
- Export all workflows and credentials
- Import into self-hosted instance
- Or migrate to another platform

**Company Health**:
- Profitable company with paying enterprise customers
- Growing user base and contributor community
- Not dependent on venture capital

---

## Technical Questions

### Do I need to know how to code?

**No**, for most workflows:

**No coding required for**:
- Connecting apps
- Setting up triggers
- Basic data mapping
- Using templates
- 90% of common automations

**Coding helpful for**:
- Complex data transformations
- Custom logic with Function nodes
- Advanced API integrations
- Debugging issues

**JavaScript knowledge**: Nice to have, not required.

---

### What is Docker and why do I need it?

**Docker** is a tool that packages software into containers, making installation consistent across different computers.

**Why n8n uses Docker**:
- Clean installation (doesn't mess with your system)
- Easy updates (just pull new container)
- Consistent environment (works same everywhere)
- Professional standard for deployment

**Do you NEED Docker?**
- **Self-hosted**: Yes (recommended method)
- **n8n Cloud**: No (they handle it)
- **Local Mac**: Easiest with Docker Desktop

**Is Docker hard?** No - installation guides provide exact commands to copy/paste.

---

### What happens if my workflow fails?

**n8n provides**:
- Error notifications (email, Slack, etc.)
- Retry logic (automatic retries with backoff)
- Error workflows (triggered on failure)
- Execution logs (see what went wrong)

**Example error handling**:
```
1. Workflow fails
   ↓
2. n8n retries 3 times (5 min apart)
   ↓
3. Still failing → Trigger error workflow
   ↓
4. Error workflow sends Slack alert
   ↓
5. You fix the issue
   ↓
6. Manually retry failed execution
```

---

### Can I schedule workflows?

**Yes**, multiple ways:

**Cron Trigger**:
- Run daily, weekly, monthly
- Specific times (e.g., "Every Monday at 9 AM")
- Complex schedules supported

**Interval Trigger**:
- Every N minutes/hours
- Simple repeating patterns

**Examples**:
- `0 9 * * 1-5` = Weekdays at 9 AM
- `0 0 * * 0` = Every Sunday at midnight
- Every 15 minutes during business hours

**Interface**: Visual cron builder (no need to memorize syntax).

---

### How do I back up my workflows?

**Automated backups (recommended)**:

```bash
# Daily backup script (add to cron)
docker exec n8n n8n export:workflow --all --output=/backup/
tar -czf /backup/n8n-backup-$(date +%Y%m%d).tar.gz /backup/*.json
```

**Manual export**:
- n8n UI → Workflows → Export
- Exports as JSON file
- Store in Google Drive/Dropbox

**What to back up**:
- Workflows (JSON files)
- Database (PostgreSQL dump)
- Environment variables (.env file)
- Encryption key (critical!)

**Backup frequency**: Daily for production, weekly for testing.

---

### Can I use n8n offline?

**Self-hosted**: Partially
- ✅ n8n runs offline (workflows execute)
- ❌ Integrations require internet (API calls)
- ❌ Cannot download new nodes offline

**Use case**: Internal automations between on-premise systems.

---

## Cost & Pricing

### Are there any hidden costs?

**Self-Hosted**:
- ❌ No hidden costs from n8n
- ✅ Only your hosting/VPS provider costs
- ✅ Some integrations charge for API usage (separate from n8n)

**n8n Cloud**:
- ❌ No transaction fees
- ❌ No per-user fees
- ✅ Execution limits (Starter: 2,500/month)
- ✅ Overage: Workflows pause until next billing cycle

**Third-party costs**:
- Some APIs charge for usage (OpenAI, Twilio, etc.)
- These are separate from n8n

---

### What happens if I exceed my plan limits?

**n8n Cloud**:
- Workflows pause at limit
- Email notification at 80% and 100%
- Can upgrade mid-month (prorated)
- Next month limit resets

**Self-Hosted**:
- No limits!
- Unlimited executions
- Only limited by server resources

---

### Can I start with Cloud and move to self-hosted later?

**Yes**, migration is supported:

**Process**:
1. Export workflows from Cloud (JSON)
2. Set up self-hosted instance
3. Import workflows
4. Re-enter credentials (not exported for security)
5. Test workflows
6. Cancel Cloud subscription

**Time**: 1-2 hours for typical setup.

---

### Is there an annual discount?

**n8n Cloud**:
- 10% discount for annual payment
- Pay upfront for 12 months
- Example: Starter €24/month → €259/year (vs €288)

**Self-hosted**:
- Some VPS providers offer annual discounts
- DigitalOcean, Vultr: ~5-10% annual savings

---

## Integrations

### Does n8n integrate with WhatsApp?

**Yes**, via WhatsApp Business Cloud API:

**Setup**:
- Create Meta Business account
- Verify business
- Get WhatsApp API credentials
- Configure in n8n

**Capabilities**:
- Send messages
- Send media (images, PDFs)
- Receive messages (webhook trigger)
- Template messages (for notifications)

**Limitations**:
- Not WhatsApp personal account
- Business verification required (1-3 days)
- Template message approval needed

**See**: [WhatsApp Integration Guide](guides/08-whatsapp-integration.md)

---

### Can I use n8n with local Malaysian/Singapore apps?

**Yes**, if they have an API:

**Common SEA Apps**:
- ✅ Xero (accounting)
- ✅ MYOB (accounting)
- ✅ Shopee (via custom HTTP)
- ✅ Lazada (via API)
- ✅ SingPost (tracking)
- ❌ Some local apps without APIs (limited)

**Workaround for apps without APIs**:
- Email integration (send/receive emails)
- Google Sheets as middleware
- Webhooks if supported
- Web scraping (advanced, fragile)

---

### What if n8n doesn't have a specific integration?

**Options**:

1. **HTTP Request Node** (Most common)
   - Use any API directly
   - 90% of integrations possible
   - Requires reading API docs

2. **Build Custom Node** (Advanced)
   - JavaScript/TypeScript
   - Share with community
   - Full control

3. **Request Community Node**
   - Post on n8n forum
   - Community may build it

4. **Use Middleware**
   - Webhook bridge
   - Google Sheets connector
   - Email trigger/action

---

### Can I connect n8n to my database?

**Yes**, supported databases:
- PostgreSQL
- MySQL/MariaDB
- MongoDB
- Microsoft SQL Server
- Redis
- SQLite (development only)

**Use cases**:
- Query data for decisions
- Insert records from forms
- Sync between databases
- Generate reports

---

## Hosting Options

### Should I self-host or use n8n Cloud?

**Choose Self-Hosted if**:
- Want maximum cost savings ($0-15/month)
- Need data in Singapore/Malaysia (PDPA)
- Comfortable with basic server management
- Have someone technical on team

**Choose n8n Cloud if**:
- Don't want to manage servers
- Need professional support
- Want automatic updates
- Prefer predictable pricing

**Start with**: Local Mac (free) to test, then decide.

---

### Which VPS provider is best for Singapore?

**Best for budget**: Contabo (~$5.50/month)
- 4 vCPU, 8GB RAM
- Singapore datacenter
- Unlimited bandwidth

**Best for free**: Oracle Cloud
- Forever free tier
- 4 OCPU, 24GB RAM
- Hard to get (high demand)

**Best for ease**: DigitalOcean ($24/month)
- Excellent documentation
- Singapore datacenter
- Great support

**See**: [Choosing Hosting Guide](guides/02-choosing-hosting.md)

---

### How much server resources do I need?

**Minimum (Development)**:
- 2 CPU cores
- 4GB RAM
- 25GB storage

**Recommended (Production)**:
- 4 CPU cores
- 8GB RAM
- 50GB SSD storage

**Heavy usage (50+ workflows)**:
- 8 CPU cores
- 16GB RAM
- 100GB SSD storage

**Database**: PostgreSQL (NOT SQLite for production).

---

### Do I need a domain name?

**Optional but recommended**:

**Without domain**:
- Access via IP: `http://192.168.1.100:5678`
- Works fine for local/VPN access
- No HTTPS (less secure)

**With domain**:
- Access via name: `https://n8n.yourcompany.com`
- Easy HTTPS with Caddy/Certbot
- Professional appearance
- Easier to remember

**Cost**: $10-15/year (.com domain).

---

## Next Steps

### I'm ready to start. What's the first step?

**Recommended path**:

1. **[Prerequisites](guides/01-prerequisites.md)** (15 minutes)
   - Install Docker
   - Understand basic concepts

2. **[Choose Hosting](guides/02-choosing-hosting.md)** (5 minutes)
   - Decide: Local, Free VPS, or Paid VPS

3. **[Install n8n](guides/03-local-mac.md)** (10 minutes)
   - Start with local Mac
   - Test before committing to VPS

4. **[First Workflow](guides/07-first-workflow.md)** (30 minutes)
   - Build something simple
   - Understand the interface

**Total time**: ~60 minutes to first working automation.

---

### Where can I get help?

**Official Resources**:
- [n8n Documentation](https://docs.n8n.io)
- [n8n Community Forum](https://community.n8n.io)
- [n8n YouTube Channel](https://www.youtube.com/c/n8n-io)

**This Guide**:
- Step-by-step installation guides
- Real SEA business use cases
- Security & pricing information

**Paid Support**:
- n8n Cloud (Pro+): Email support
- Freelancers on Upwork/Fiverr: $30-100/hour

---

### Can I get a demo before installing?

**Yes**, several options:

1. **n8n Cloud Free Trial**
   - Sign up at n8n.io
   - 14-day free trial
   - No credit card required

2. **n8n Demo Environment**
   - https://demo.n8n.io
   - Try building workflows
   - Doesn't save (resets after session)

3. **YouTube Tutorials**
   - Watch real workflows being built
   - See interface before installing

---

### What industries is n8n best for?

**Excellent for**:
- E-commerce (inventory sync, order processing)
- Professional services (CRM automation, client communication)
- Healthcare (appointment reminders, patient records)
- Real estate (lead management, property alerts)
- F&B (reservations, supplier orders)
- Marketing agencies (social media, reporting)

**Any business with**:
- Repetitive manual tasks
- Multiple software tools to connect
- Email/messaging automation needs
- Data entry work
- Report generation

---

## Still Have Questions?

**Not answered here?**
- Check [n8n Community Forum](https://community.n8n.io)
- Ask in n8n Discord
- Submit issue on this GitHub repo

**Ready to start?** → [Prerequisites](guides/01-prerequisites.md)
