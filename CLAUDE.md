# krauslabs.com — Portfolio Project Reference

## What This Is

Personal portfolio site for Matt Kraus, hosted at **krauslabs.com** on Cloudflare Workers & Pages (direct upload, not Git-connected).

## Live URL
- **Production:** https://krauslabs.com
- **Preview:** https://krauslabs.krauslabs.workers.dev

## Tech Stack
- Single HTML file (`index.html`) — no framework, no build step
- CSS: Custom properties, Plus Jakarta Sans + Fira Code fonts (Google Fonts CDN)
- JS: Vanilla — floating skills constellation, cursor glow, scroll reveals, browser detection
- Hosting: Cloudflare Workers & Pages (static asset upload)
- DNS: Cloudflare (same account)
- Domain: krauslabs.com (realshift.app reserved for product later)

## Design System
- **Background:** #09090b (near-black)
- **Accent:** #ff6a1a (electric orange), #ff9e57 (secondary orange)
- **Status green:** #00e5a0 (mint)
- **Status blue:** #5b9aff
- **Text:** #f5f5f5 (primary), #b8b8b8 (secondary), #888 (dim/labels)
- **Glass cards:** rgba(255,255,255,.035) with 1px border rgba(255,255,255,.09)
- **Font display:** Plus Jakarta Sans (weights 300-800)
- **Font mono:** Fira Code (labels, tech stacks, code)
- **Border radius:** 14px on cards, 24px on pills/badges

## Cloudflare-Specific Rules (CRITICAL)
The JS MUST follow these rules or Cloudflare will break it:
1. **NO template literals** (backtick strings) — use string concatenation: `"rgba(255,106,26," + alpha + ")"`
2. **NO arrow functions** — use `function() {}` everywhere
3. **Email addresses built in JS** — never put a raw email in HTML, Cloudflare's email obfuscation rewrites them. Build with: `var addr = "onekraus" + "@" + "gmail" + "." + "com";`
4. **`data-cfasync="false"`** on the script tag — prevents Cloudflare Rocket Loader from deferring
5. **`DOMContentLoaded` wrapper** around all JS
6. After deploying, **purge Cloudflare cache** if changes don't appear

## Cloudflare Settings (must be configured in dashboard)
- **Email Address Obfuscation:** OFF (Security > Settings)
- **Auto Minify JS:** OFF (if it exists under Speed > Optimization)

## Deploy Process
```bash
cd ~/projects/krauslabs
wrangler pages deploy . --project-name krauslabs
```
Or manually: Cloudflare dashboard > Workers & Pages > krauslabs > New deployment > upload index.html

## Page Structure (current v7)
1. **Nav** — Sticky, frosted glass blur, KL monogram logo, 5 links (Work, Career, Skills, References, Contact)
2. **Hero** — Canvas with floating skill keywords (36 skills drift, light up orange near cursor with connection lines), name in orange monospace, headline "The one they call when production is down.", contact row
3. **Callout bar** — "Multi-person, multi-day operations → One person. A few hours. My script."
4. **Bento stats** — 5 boxes: 30+ years, 17 at Fiserv, 300+ FI clients, 100+ servers, 5 shipped
5. **Projects** — "What I've been shipping" with ops-intent intro paragraph. epc-backend (Live), RealShift (Dev), MaxBuyIQ (QA), AI image pipeline, RationMe
6. **Automation & AI** — 4 duo cards: AI-assisted dev, Local inference, Workflow automation, Self-hosted infrastructure
7. **Career** — 4 roles with kickers on Fiserv and SASI entries. Includes CA Technology (1997-2000) to close gap
8. **Skills grid** — 8 categories, tags glow orange on hover
9. **Quick fit** — 3 cards: targeting roles, location/availability, proof of work (with browser/OS detection)
10. **Testimonials** — 2 placeholder quote cards (NEED REAL QUOTES from colleagues)
11. **CTA** — "Your team needs a problem solver." Email + LinkedIn buttons
12. **Footer** — "Built by Matt Kraus"

## Content Voice
Confident, earned swagger. Not arrogant toward others — proud of own track record. Key lines:
- "The one they call when production is down."
- "Multi-person, multi-day operations → One person. A few hours. My script."
- "17 years. Same company. They kept promoting the scope because I kept delivering."
- "Three promotions. Three years."
- "My next role is in operations and production support — that's where I belong."

## Key Facts (for accuracy)
- **Fiserv title:** IT Services Administrator, Staff (verified via Work Number / Equifax)
- **Fiserv dates:** Sep 2007 – Nov 2024
- **Bridge calls:** Matt was the P1/P2 TECHNICAL LEAD (hands-on-keyboard, initiated calls) — NOT the incident manager
- **Monitoring at Fiserv:** Splunk (log analysis) + GEM (homegrown). NO Datadog, NO New Relic
- **Tools:** ServiceNow, Jira, Ansible, Docker, VMware, Git, F5, DNS, TCP/IP, Wireshark
- **ITIL:** Followed daily, but NO formal certification
- **300+ FI clients** on the platforms Matt supported
- **60-100+ servers** managed across multiple data centers

## Pending TODO
- [ ] Replace placeholder testimonial quotes with real ones from colleagues
- [ ] Add CORS to epc-backend (Express app on Fly.io) for krauslabs.com origin
- [ ] Add www.krauslabs.com as additional Cloudflare custom domain
- [ ] Consider adding a professional headshot
