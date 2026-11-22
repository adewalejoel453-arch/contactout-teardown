# W8: MCP landscape (partial)


## 12. Lusha MCP (Reported by Lusha's documentation)

- Generally available remote server on Lusha's own domain with 22 tools. Two connection methods: OAuth (Claude, ChatGPT, Codex, through each client's directory) and API key (VS Code, Cursor, Gemini CLI, n8n). Also available inside Gong's AI briefer.
- Billing: the same key and credit pool as the REST API; credits are generally charged per successful matched result; failed lookups are free; filter-discovery and account-usage tools are free; some tools are OAuth-only.
- Controls: an account permission decides who may connect (on by default; when off, only admins and managers); an account-usage tool shows balance and limits; pausing or regenerating the API key stops usage at once.
- Experience: interactive contact and company cards in Claude, in-chat credit top-up, a built-in starter prompt, and CRM export tools (Salesforce, HubSpot, Zoho, Pipedrive, SalesLoft) with a per-row result.
- The documentation says the tool set can change as new tools ship.

## 13. Implications (Inferred)

- Support both OAuth (chat clients) and API key (automation clients).
- Free discovery tools, a balance tool and plain credit rules are standard; match them.
- Admin permissions and a key kill switch matter for teams.
- Interactive cards and in-chat top-up set the experience bar; achievable later.
- Directory listings in Claude and ChatGPT are a distribution channel; the submission requirements are still to be researched.
