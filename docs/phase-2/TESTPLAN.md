# Test gate: before the product goes live

**Principle.** Nothing goes live until every stage passes with fake data first. Real personal data enters the system only after the license and the privacy documents exist.

| Stage | Name | What is tested | Exit criteria |
| --- | --- | --- | --- |
| T0 | Unit and contract | Each provider adapter against the fake provider; the shared interface (search, enrich, verify) | All tests pass with `node --test`; any new adapter passes the same contract tests |
| T1 | Data flow | The request flow: plan and credit check, suppression check, provider call, storage rules, audit entry, credit deduction | Every request produces exactly one audit entry; blocked requests cost no credit |
| T2 | License limits | Storage, caching, retention, region and resale rules from the license, written as tests | A record is never kept longer or elsewhere than the license allows |
| T3 | Compliance | Opt-out, deletion and data-access requests end to end; suppression honoured on re-enrichment and import | A suppressed person never appears in a result; deletions propagate within the agreed time |
| T4 | Security | Authentication, separation between accounts, rate limits, secrets handling, dependency audit (`npm audit`), basic abuse cases | No critical finding open; no secrets in the repo or logs |
| T5 | Closed beta | A small group of real users under the signed license; support and incident drill | Agreed success measures met; no unresolved compliance issue |
| Gate | Go-live decision | Review of T0 to T5 results with the lawyer's sign-off | All stages passed and signed off |

Results for each stage are written to `docs/phase-2/test-results/`. A failed stage blocks the next one.

## Update 3: extension tests (stages T1 and T4)

- Manifest audit: the build fails if the extension requests the cookies permission or broad host access at install.
- Mode B makes no network call, and reads nothing from the page, without a user click.
- Only whitelisted fields (name, headline, company) are ever sent from a LinkedIn page.
- The remote switch and the per-user daily cap disable mode B as expected.
- Audit entries contain no page content and expire on schedule.

## Update 6: personal-email tests (stages T1 to T3)

- Where personal emails are off, no tool, export or adapter output returns one.
- Every returned email carries a work or personal label.
- Suppression covers both types.
- Personal-email reveals record the region rule applied in the audit entry.
