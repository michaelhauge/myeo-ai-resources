# Template: Expansion Checklists — 90-Day Launch Plans by Country

**Purpose**: This template provides country-specific checklists for launching in each SEA market, covering legal setup, localization, marketing, and go-live steps.

**How to use**:
1. Select target country (Malaysia, Indonesia, Thailand, Vietnam, Philippines)
2. Follow 90-day checklist (Month 1: prep, Month 2: soft launch, Month 3: full launch)
3. Track progress weekly (update checklist)
4. Measure success (first 10 customers in 90 days)

---

## Universal Pre-Launch Checklist (All Countries)

**Complete BEFORE starting country-specific checklist:**

### Product Readiness
- [ ] Product is stable (no critical bugs, <1% error rate)
- [ ] Product supports localization (i18n/l10n framework in place)
- [ ] Pricing defined for new market (see pricing guide below)
- [ ] Payment methods researched (credit card + local e-wallets)

### Team Readiness
- [ ] Hire Country Manager or identify local partner
- [ ] Allocate 1-2 people for launch support (eng, CS)
- [ ] Budget approved ($10K-$30K for 90-day launch)

### Legal Readiness
- [ ] Decide on entity structure (local subsidiary vs branch vs agent)
- [ ] Engage local lawyer or incorporation agent ($2K-$5K)
- [ ] Budget for legal/accounting ($5K-$10K for setup)

---

## Pricing Localization Guide

**SEA Pricing Strategy** (relative to Singapore baseline):

| Country | GDP/Capita | Pricing vs SG | Example (if SG = $100/mo) |
|---------|------------|---------------|---------------------------|
| Singapore | $70K | 100% (baseline) | $100/month |
| Malaysia | $12K | 100% (same as SG) | $100/month |
| Thailand | $7.5K | 70-80% | $70-80/month |
| Vietnam | $4.2K | 70-80% | $70-80/month |
| Indonesia | $4.5K | 50-70% | $50-70/month |
| Philippines | $3.8K | 50-70% | $50-70/month |

**Implementation**:
```javascript
const PRICING = {
  SG: 100,
  MY: 100,
  TH: 75,
  VN: 75,
  ID: 60,
  PH: 60,
};
```

---

## Malaysia 90-Day Launch Checklist

### Month 1: Preparation (Day 1-30)

**Week 1-2: Legal Setup**
- [ ] Incorporate Sdn Bhd via agent (Osome, Sleek, Paul Hype Page) — 1 week
- [ ] Cost: $1K-$2K
- [ ] Register for SSM (Companies Commission of Malaysia)
- [ ] Apply for business bank account (Maybank, CIMB, Public Bank) — 2-4 weeks
- [ ] Register for SST (Sales & Service Tax) if revenue >RM 500K/year (~$120K)

**Week 2-3: Payment Setup**
- [ ] Integrate Stripe Malaysia (supports MYR, credit cards)
- [ ] Add local payment methods:
  - [ ] FPX (online banking, used by 80% of Malaysians)
  - [ ] Boost, Touch 'n Go eWallet (popular e-wallets)
- [ ] Test payments (RM 1 test transaction)

**Week 3-4: Product Localization**
- [ ] Translate UI to Bahasa Malaysia (optional, English widely used)
- [ ] Display prices in MYR (1 USD = ~4.5 MYR as of 2026)
- [ ] Adapt date format (DD/MM/YYYY)
- [ ] Update phone number format (+60)
- [ ] Create local domain: example.com.my or example.my

**Week 4: Market Research**
- [ ] Interview 10 potential customers (virtual or in-person)
- [ ] Identify 5 competitors (local and international)
- [ ] Join Malaysian startup community (MY StartUp, MDEC events)

---

### Month 2: Soft Launch (Day 31-60)

**Week 5-6: Beta Testing**
- [ ] Recruit 10-20 beta users (offer 50% discount for 3 months)
- [ ] Set up local support (WhatsApp Business +60 number)
- [ ] Fix localization bugs (payment, language, UX issues)

**Week 7-8: Content & SEO**
- [ ] Write 5 blog posts targeting Malaysian keywords
  - "Best accounting software Malaysia"
  - "SME bookkeeping software Malaysia"
  - "Accounting software for Malaysian businesses"
- [ ] Create Malaysian case studies (if any customers)
- [ ] Set up Google My Business (Kuala Lumpur, Penang locations)

---

### Month 3: Full Launch (Day 61-90)

**Week 9: PR & Awareness**
- [ ] Press release to Malaysian tech media (Digital News Asia, TechInAsia, e27)
- [ ] Post on Malaysian startup communities (FB groups, LinkedIn)
- [ ] Partner with local accelerators (MaGIC, 1337 Ventures)

**Week 10-11: Paid Marketing**
- [ ] Google Ads (budget: $1K-$3K, target Malaysian search queries)
- [ ] Facebook/Instagram ads (budget: $1K-$2K, geo-target Malaysia)
- [ ] LinkedIn ads (budget: $500-$1K, target Malaysian B2B)

**Week 12: Sales Activation**
- [ ] Hire Malaysian BDR or AE ($2K-$4K/month salary + commission)
- [ ] Build prospect list (100-200 Malaysian companies)
- [ ] Run outbound campaign (50 emails/day)
- [ ] Close first 10 customers (target: 10-20 customers in Month 3)

**Success Metrics**:
- [ ] 10-20 paying customers
- [ ] $5K-$10K MRR
- [ ] <10% churn in first 3 months

---

## Indonesia 90-Day Launch Checklist

### Month 1: Preparation (Day 1-30)

**Week 1-2: Legal Setup** (More complex than Malaysia)
- [ ] Decide on entity type:
  - PT (Perseroan Terbatas) for local ownership
  - PT PMA (Foreign Investment) for foreign-owned (requires local partner if >50% foreign)
- [ ] Engage incorporation agent (Cekindo, Paul Hype Page) — 4-8 weeks
- [ ] Cost: $3K-$7K
- [ ] Register with BKPM (Investment Coordinating Board) if PT PMA
- [ ] Obtain NIB (Business Identification Number)
- [ ] Open business bank account (Mandiri, BCA, BNI) — 4-8 weeks

**Week 2-3: Payment Setup**
- [ ] Integrate Xendit or Midtrans (local payment gateway for Indonesia)
- [ ] Add local payment methods:
  - [ ] Bank transfer (BCA, Mandiri — most common)
  - [ ] GoPay, OVO, Dana (popular e-wallets)
  - [ ] Alfamart/Indomaret (over-the-counter payments)
- [ ] Display prices in IDR (1 USD = ~16,000 IDR as of 2026)

**Week 3-4: Product Localization**
- [ ] Translate UI to Bahasa Indonesia (REQUIRED — English less common)
- [ ] Hire Indonesian translator ($500-$1K for full app)
- [ ] Display prices in IDR (use 'Rp' symbol)
- [ ] Adapt date format (DD/MM/YYYY)
- [ ] Update phone number format (+62)
- [ ] Create local domain: example.co.id

**Week 4: Market Research**
- [ ] Interview 10-20 Indonesian potential customers
- [ ] Identify local competitors (Jurnal, Accurate, Zahir)
- [ ] Join Indonesian startup community (Startup Lokal, ANGIN)

---

### Month 2: Soft Launch (Day 31-60)

**Week 5-6: Beta Testing**
- [ ] Recruit 10-20 Indonesian beta users (offer 60% discount — pricing lower in ID)
- [ ] Set up WhatsApp Business +62 number (ubiquitous in Indonesia)
- [ ] Fix translation errors (common: UI not fully translated)
- [ ] Test payment flows (bank transfer, e-wallet)

**Week 7-8: Content & SEO**
- [ ] Write 10 blog posts in Bahasa Indonesia (hire local content writer)
  - "Software akuntansi terbaik Indonesia"
  - "Aplikasi pembukuan UKM Indonesia"
- [ ] Create Indonesian case studies
- [ ] List on Tokopedia, Shopee (if selling through e-commerce)

---

### Month 3: Full Launch (Day 61-90)

**Week 9: PR & Awareness**
- [ ] Press release to Indonesian tech media (DailySocial, TechinAsia Indonesia, Tech in Asia)
- [ ] Post on Indonesian startup communities (Startup Lokal FB group)
- [ ] Partner with local incubators (GDP Venture, East Ventures)

**Week 10-11: Paid Marketing**
- [ ] Google Ads Indonesia (budget: $2K-$5K, target Indonesian keywords)
- [ ] Instagram ads (budget: $2K-$4K, very popular in Indonesia)
- [ ] TikTok ads (budget: $1K-$2K, growing fast)

**Week 12: Sales Activation**
- [ ] Hire Indonesian BDR/AE ($1.5K-$3K/month + commission)
- [ ] Build prospect list (200-500 Indonesian SMBs)
- [ ] Run outbound campaign (focus on Jakarta, Surabaya, Bandung)
- [ ] Close first 10 customers

**Success Metrics**:
- [ ] 10-20 paying customers
- [ ] $3K-$8K MRR (lower ARPU than Malaysia)
- [ ] <15% churn (higher churn in Indonesia, acceptable)

---

## Thailand 90-Day Launch Checklist

### Month 1: Preparation (Day 1-30)

**Week 1-2: Legal Setup**
- [ ] Incorporate Thai limited company (need Thai majority shareholder for most businesses)
- [ ] Engage agent (Iglu, Acclime, Mazars) — 2-4 weeks
- [ ] Cost: $2K-$4K
- [ ] Register with DBD (Department of Business Development)
- [ ] Apply for business bank account (Bangkok Bank, Kasikorn Bank, SCB) — 2-4 weeks
- [ ] Register for VAT if revenue >THB 1.8M/year (~$50K)

**Week 2-3: Payment Setup**
- [ ] Integrate 2C2P or Omise (Thai payment gateways)
- [ ] Add local payment methods:
  - [ ] PromptPay (instant bank transfer, used by 90%+ Thais)
  - [ ] TrueMoney Wallet, Rabbit LINE Pay (popular e-wallets)
- [ ] Display prices in THB (1 USD = ~35 THB as of 2026)

**Week 3-4: Product Localization**
- [ ] Translate UI to Thai (REQUIRED — English less common for SMBs)
- [ ] Hire Thai translator ($500-$1K)
- [ ] Display prices in THB (use '฿' symbol)
- [ ] Adapt date format (DD/MM/BBBB in Buddhist calendar, but DD/MM/YYYY accepted)
- [ ] Update phone number format (+66)
- [ ] Create local domain: example.co.th

**Week 4: Market Research**
- [ ] Interview 10 Thai potential customers
- [ ] Identify competitors (local: ทะเบียนบัญชี, international: QuickBooks)
- [ ] Join Thai startup community (Tech Sauce, Techsauce FB groups)

---

### Month 2: Soft Launch (Day 31-60)

**Week 5-6: Beta Testing**
- [ ] Recruit 10-20 Thai beta users (offer 50% discount)
- [ ] Set up LINE Official Account (used by 95% of Thais, more than WhatsApp)
- [ ] Fix Thai language bugs (common: text overflow, special characters)

**Week 7-8: Content & SEO**
- [ ] Write 10 blog posts in Thai (hire Thai content writer)
  - "โปรแกรมบัญชีราคาถูก" (cheap accounting software)
  - "ซอฟต์แวร์บัญชีสำหรับ SME" (accounting software for SME)
- [ ] List on Pantip (Thai Reddit), Wongnai (Thai Yelp)

---

### Month 3: Full Launch (Day 61-90)

**Week 9: PR & Awareness**
- [ ] Press release to Thai tech media (Tech Sauce, TechTalkThai, The101.World)
- [ ] Post on Thai startup communities (Pantip Business forum)

**Week 10-11: Paid Marketing**
- [ ] Google Ads Thailand (budget: $2K-$4K, Thai keywords)
- [ ] Facebook ads (budget: $2K-$3K, largest platform in Thailand)
- [ ] LINE ads (budget: $1K-$2K, very effective)

**Week 12: Sales Activation**
- [ ] Hire Thai BDR/AE ($1.8K-$3.5K/month + commission)
- [ ] Build prospect list (200 Thai SMBs, focus on Bangkok)
- [ ] Close first 10 customers

**Success Metrics**:
- [ ] 10-20 paying customers
- [ ] $4K-$8K MRR
- [ ] <10% churn

---

## Vietnam 90-Day Launch Checklist

### Month 1: Preparation (Day 1-30)

**Week 1-2: Legal Setup**
- [ ] Incorporate limited liability company (LLC) in Vietnam
- [ ] Engage agent (Dezan Shira, Acclime) — 2-4 weeks
- [ ] Cost: $2K-$5K
- [ ] Register with DPI (Department of Planning and Investment)
- [ ] Obtain Investment Registration Certificate (IRC) if foreign-owned
- [ ] Open business bank account (Vietcombank, BIDV, Techcombank) — 4-6 weeks
- [ ] Register for VAT if revenue >VND 100M/year (~$4K)

**Week 2-3: Payment Setup**
- [ ] Integrate 2C2P, OnePay, or Payoo (Vietnamese payment gateways)
- [ ] Add local payment methods:
  - [ ] Bank transfer (most common for B2B)
  - [ ] Momo, ZaloPay (popular e-wallets)
- [ ] Display prices in VND (1 USD = ~24,000 VND as of 2026)

**Week 3-4: Product Localization**
- [ ] Translate UI to Vietnamese (REQUIRED)
- [ ] Hire Vietnamese translator ($300-$800)
- [ ] Display prices in VND (use 'đ' or 'VND' symbol)
- [ ] Adapt date format (DD/MM/YYYY)
- [ ] Update phone number format (+84)
- [ ] Create local domain: example.com.vn

**Week 4: Market Research**
- [ ] Interview 10 Vietnamese customers
- [ ] Identify competitors (MISA, Fast Accounting)
- [ ] Join Vietnamese startup community (Vietnam Silicon Valley, Startup Vietnam FB)

---

### Month 2: Soft Launch (Day 31-60)

**Week 5-6: Beta Testing**
- [ ] Recruit 10-20 Vietnamese beta users (offer 50% discount)
- [ ] Set up Zalo Official Account (used more than WhatsApp in Vietnam)
- [ ] Fix Vietnamese language bugs

**Week 7-8: Content & SEO**
- [ ] Write 10 blog posts in Vietnamese
  - "Phần mềm kế toán tốt nhất" (best accounting software)
  - "Phần mềm quản lý tài chính doanh nghiệp" (business financial management software)

---

### Month 3: Full Launch (Day 61-90)

**Week 9: PR & Awareness**
- [ ] Press release to Vietnamese tech media (VnExpress, ICTNews, TechInAsia Vietnam)

**Week 10-11: Paid Marketing**
- [ ] Google Ads Vietnam (budget: $1K-$3K)
- [ ] Facebook ads (budget: $2K-$4K, largest platform)
- [ ] Zalo ads (budget: $1K-$2K, growing fast)

**Week 12: Sales Activation**
- [ ] Hire Vietnamese BDR/AE ($1.5K-$2.5K/month + commission)
- [ ] Build prospect list (200 Vietnamese SMBs, focus on Hanoi, HCMC)
- [ ] Close first 10 customers

**Success Metrics**:
- [ ] 10-20 paying customers
- [ ] $3K-$6K MRR
- [ ] <10% churn

---

## Philippines 90-Day Launch Checklist

### Month 1: Preparation (Day 1-30)

**Week 1-2: Legal Setup**
- [ ] Incorporate corporation in Philippines
- [ ] Note: Foreign ownership restricted to 40% for most industries (need Filipino partner)
- [ ] Engage agent (Acclime, InCorp) — 4-8 weeks
- [ ] Cost: $2K-$5K
- [ ] Register with SEC (Securities and Exchange Commission)
- [ ] Obtain Mayor's Permit, BIR registration
- [ ] Open business bank account (BDO, BPI, Metrobank) — 4-8 weeks

**Week 2-3: Payment Setup**
- [ ] Integrate PayMongo or Xendit (Philippine payment gateways)
- [ ] Add local payment methods:
  - [ ] GCash (most popular e-wallet, 50M+ users)
  - [ ] PayMaya, GrabPay
  - [ ] Over-the-counter (7-Eleven, Cebuana Lhuillier)
- [ ] Display prices in PHP (1 USD = ~55 PHP as of 2026)

**Week 3-4: Product Localization**
- [ ] English is primary (No translation needed — Philippine English is excellent)
- [ ] Display prices in PHP (use '₱' symbol)
- [ ] Adapt date format (MM/DD/YYYY — Philippines uses US format)
- [ ] Update phone number format (+63)
- [ ] Create local domain: example.com.ph

**Week 4: Market Research**
- [ ] Interview 10 Filipino customers
- [ ] Identify competitors (QuickBooks, Xero, local: Fincle)
- [ ] Join Philippine startup community (Startup PH, Geeks on a Beach)

---

### Month 2: Soft Launch (Day 31-60)

**Week 5-6: Beta Testing**
- [ ] Recruit 10-20 Filipino beta users (offer 50% discount)
- [ ] Set up Viber Business Account (more popular than WhatsApp in PH)
- [ ] Set up Facebook Messenger (ubiquitous for customer service)

**Week 7-8: Content & SEO**
- [ ] Write 10 blog posts targeting Philippine keywords
  - "Best accounting software Philippines"
  - "Bookkeeping software for Filipino SMEs"

---

### Month 3: Full Launch (Day 61-90)

**Week 9: PR & Awareness**
- [ ] Press release to Philippine tech media (TechInAsia Philippines, PhilDev, Rappler Tech)
- [ ] Post on Philippine startup communities (Startup PH FB group)

**Week 10-11: Paid Marketing**
- [ ] Google Ads Philippines (budget: $1K-$3K)
- [ ] Facebook ads (budget: $2K-$4K, largest platform)
- [ ] TikTok ads (budget: $1K-$2K, growing)

**Week 12: Sales Activation**
- [ ] Hire Filipino BDR/AE ($1K-$2K/month + commission, English proficiency advantage)
- [ ] Build prospect list (200 Philippine SMBs, focus on Manila, Cebu)
- [ ] Close first 10 customers

**Success Metrics**:
- [ ] 10-20 paying customers
- [ ] $2K-$5K MRR (lower ARPU than SG/MY)
- [ ] <15% churn

---

## Post-Launch Checklist (All Countries)

**Month 4-6: Optimization**

### Metrics & Reporting
- [ ] Track country-specific metrics (MRR, CAC, churn by country)
- [ ] Compare to targets (10-20 customers in Month 3)
- [ ] Identify top acquisition channels (SEO, ads, referrals)

### Product Iteration
- [ ] Gather feedback from first 20 customers
- [ ] Fix localization bugs reported
- [ ] Prioritize feature requests (build only if >50% request)

### Sales & Marketing Optimization
- [ ] Double down on what works (if SEO drives 60% of customers, invest more)
- [ ] Cut what doesn't (if LinkedIn ads produced 0 customers, stop)
- [ ] Hire 2nd sales rep if first rep closing >5 deals/month

### Decision Point: Expand or Consolidate?
- [ ] If successful (>10 customers, <10% churn): Plan next country
- [ ] If struggling (<5 customers, >20% churn): Consolidate, fix issues before expanding

---

## Country Comparison: Launch Complexity

| Country | Legal (weeks) | Cost | Language | Payments | Difficulty |
|---------|---------------|------|----------|----------|------------|
| Malaysia | 1-2 | $1K-$2K | English OK | Easy | ⭐ Easy |
| Singapore | 1 | $1K-$2K | English | Easy | ⭐ Easy |
| Thailand | 2-4 | $2K-$4K | Thai required | Moderate | ⭐⭐ Moderate |
| Vietnam | 2-4 | $2K-$5K | Vietnamese required | Moderate | ⭐⭐ Moderate |
| Indonesia | 4-8 | $3K-$7K | Bahasa required | Complex | ⭐⭐⭐ Hard |
| Philippines | 4-8 | $2K-$5K | English | Moderate | ⭐⭐⭐ Hard |

**Recommendation**: Start with easiest markets (SG → MY), then moderate (TH, VN), then hardest (ID, PH)

---

## Budget Template (Per Country)

```
90-DAY LAUNCH BUDGET — [COUNTRY]

Legal & Setup:
- Incorporation: $[X]
- Bank account: $[Y]
- Tax registration: $[Z]
- Subtotal: $[A]

Product Localization:
- Translation: $[X]
- Payment gateway integration: $[Y]
- Domain: $[Z]
- Subtotal: $[B]

Marketing:
- Content creation: $[X]
- Paid ads (3 months): $[Y]
- PR/partnerships: $[Z]
- Subtotal: $[C]

Team:
- Country Manager (3 months): $[X]
- Sales rep (1 month): $[Y]
- Subtotal: $[D]

Contingency (20%): $[E]

TOTAL: $[A + B + C + D + E]
```

**Example (Malaysia)**:
- Legal: $2K
- Localization: $1K
- Marketing: $5K
- Team: $12K (Country Manager 3 months × $4K)
- Contingency: $4K
- **Total: $24K**

---

## Success Metrics Targets

**By Day 90 (End of Month 3)**:

| Metric | Malaysia | Indonesia | Thailand | Vietnam | Philippines |
|--------|----------|-----------|----------|---------|-------------|
| Customers | 15-25 | 10-20 | 12-22 | 10-20 | 8-18 |
| MRR | $8K-$12K | $4K-$8K | $6K-$10K | $4K-$7K | $3K-$6K |
| CAC | <$800 | <$500 | <$700 | <$600 | <$400 |
| Churn | <8% | <12% | <8% | <10% | <12% |

**If below targets**: Consolidate, don't expand to next country yet

**If above targets**: Plan next country expansion (start prep 3 months before launch)

---

## Summary

**90-Day Launch Timeline**:
- **Month 1**: Legal setup, payment integration, product localization, market research
- **Month 2**: Beta testing (10-20 users), content creation, bug fixes
- **Month 3**: Full launch, PR, paid ads, sales activation, first 10-20 customers

**Cost per country**: $10K-$30K (depending on complexity)

**Success criteria**: 10-20 customers, $3K-$12K MRR, <15% churn by Day 90

**Next steps**:
- Review Part 5: Regional Expansion for full strategy
- Choose target country (prioritize easy → moderate → hard)
- Start Month 1 checklist (legal setup, product localization)
- Track progress weekly (update checklist, measure metrics)
