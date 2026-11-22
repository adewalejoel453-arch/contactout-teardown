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

## Update 3: extension v1 modes (decision: both)

- Mode A (on by default): acts on text the user selects or pastes, and on email and CRM pages with permission.
- Mode B, LinkedIn page assist (off by default, per region, enabled only after counsel clears it): on click only, reads the visible name, headline and company of the profile the user is viewing, and sends only those fields for one lookup.
- Mode B never intercepts platform responses, reads session cookies, runs in the background, works in bulk or keeps page content. Remote switch and a per-user daily cap apply.
- Audit entries keep a minimal subject reference (provider record ID or salted hash), never page content, with a retention limit.

## Update 6: personal emails and Lusha MCP

- Decision: work and personal emails are both offered; personal emails switched per region and off everywhere until cleared. See DATA-HANDLING.md and section 18 of the teardown document.
- W4: a provider must document the source and lawful basis for personal emails, cover suppression and opt-outs, and allow passing them on; expect a shorter list.
- W5: the region matrix records, per region, whether personal emails may be returned and the rules on emailing individuals versus businesses.
- W8: Lusha MCP read; directory submission requirements next.

## Update 6: personal emails and Lusha MCP

- Decision: work and personal emails are both offered; personal emails switched per region and off everywhere until cleared. See DATA-HANDLING.md and section 18 of the teardown document.
- W4: a provider must document the source and lawful basis for personal emails, cover suppression and opt-outs, and allow passing them on; expect a shorter list.
- W5: the region matrix records, per region, whether personal emails may be returned and the rules on emailing individuals versus businesses.
- W8: Lusha MCP read; directory submission requirements next.

## Update 7: directory requirements

W8 now covers the Claude and ChatGPT directory requirements (notes 14 to 17). First task next: read both directories' policies on products that return personal data about individuals. See section 19 of the teardown document.

## Update 8: first users and search filters

- Decision: the first users are all of recruiters, sales and revenue teams, and founders and small teams. Search filters come later in implementation.
- Version 1: one segment-agnostic core and a small generic search schema (name, job title, company, location at city or country level, seniority, industry, company size). Segment filters are added later as data with presets, where the provider has the data.
- Rule (proposal): no filters, fields or inferences about protected or special-category characteristics; search criteria are limited to professional attributes.
- Onboarding asks what the user is using the product for. See section 20 of the teardown document.

## Update 9: Claude directory policy check

See section 21 of the teardown document and notes 18 to 20 in w8-mcp.md. New rules (proposal): no scoring, ranking or fit prediction; fictional sample data; no conversation content in logs; human confirmation for in-chat purchases; provider results kept separate. To do: ask Anthropic in writing about a licensed contact-data connector; read OpenAI's policy on personal-data apps.
