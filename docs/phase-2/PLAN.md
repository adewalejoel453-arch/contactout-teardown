# Teardown two: plan

**Goal.** Study everything around ContactOut and the market that phase 1 could not see, so that product, pricing and compliance decisions come from evidence. Teardown two ends with a recommendation for build phase 0.

## Workstreams

| ID | Workstream | What we study | Output |
| --- | --- | --- | --- |
| W1 | ContactOut as a visitor | Website, plans and free tier, onboarding, help centre, public API docs, integrations, privacy policy, terms, opt-out page | notes/w1-contactout-public.md |
| W3 | Competitors | Apollo, Lusha, Prospeo, Hunter, Snov, RocketReach: pricing, data-source claims, integrations, API, free tiers, compliance statements | notes/w3-competitors.md |
| W4 | Data providers | Candidate licensed sources: coverage, price per record, license terms, sourcing and compliance documents | notes/w4-providers.md |
| W5 | Legal and compliance landscape | How competitors handle opt-outs and notices; laws by market; questions for your lawyer | notes/w5-legal.md |
| W6 | Pricing and unit economics | Credit models, price per record, free-tier cost, your price floor | notes/w6-pricing.md |
| W2 | The remote sidebar app | What a signed-in free user sees: screens, flows, credit display, upsells; public files a browser loads normally | notes/w2-sidebar-app.md |
| W7 | Synthesis | Gaps, positioning, first-version scope recommendation, build phase 0 brief | notes/w7-synthesis.md |

Order of work: W1, W3, W4, W5, W6, W2, W7. W2 comes late because it needs a free account created by you.

## Rules of engagement

- Public pages and normal visitor or free-tier use only; follow each site's terms.
- No automation, scraping, bulk lookups or load against live services.
- No collection of third-party personal data; screenshots must not show real people's details.
- No credentials or tokens in chat or in the repo.
- Read only the public files a browser loads normally; do not call endpoints the page does not call itself.
- Every external action is logged in AUDIT.md.
- Every claim is marked Observed, Reported (by a source) or Inferred.
- Third-party material is summarised, not copied; keep links and dates.

## Done when

Seven notes are written, the synthesis is reviewed, the recommendation for build phase 0 is agreed, and the audit log is complete.
