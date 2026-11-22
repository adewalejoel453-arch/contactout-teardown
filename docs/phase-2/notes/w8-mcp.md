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

## 14. Claude connector directory (Reported by Anthropic's documentation)

- Submitted through a developer portal; anyone on a paid Claude plan can submit; on Team and Enterprise an Owner does.
- Requirements: security, authentication, privacy and documentation; every tool needs a title and a read-only or destructive hint; documentation URL, privacy policy URL and icon.
- Review: automatic scan, listed by default as a community connector; may be escalated to Verified review where a reviewer tests each tool.
- Benefits: only a directory listing makes a connector discoverable inside Claude; directory connectors can be suggested in chat; custom connectors never are; a listing in the open MCP registry does not surface in Claude.
- Limits: tool results of about 150,000 characters on Claude.ai and Desktop; 300-second timeout; tools, prompts and resources supported; sampling and resource subscriptions not yet supported.
- Correction: a field guide said free users get one custom connector; Anthropic's support article says custom connectors are for paid plans only. The official article is trusted.

## 15. ChatGPT directory (Reported by OpenAI's documentation)

- Directory opened to submissions in December 2025; apps are now submitted as plugins through the platform portal.
- Requirements: organization verification and a matching publisher identity; a real public MCP endpoint (no local or test URL); app name, logo, description, company and privacy policy URLs, tool information, screenshots, test prompts and responses, localization; correct tool annotations.
- Tool responses must be checked against the privacy policy, with unnecessary personal data removed.
- For now, projects with EU data residency cannot submit plugins that include an MCP server.

## 16. Implications (Inferred)

- Privacy policy and data-handling wording must exist and be accurate before submission.
- The field allowlist helps pass the personal-data review of tool responses.
- Annotate tools correctly: search, count and balance are read-only; reveal and save change state.
- Budget for a paid Claude plan to test as a custom connector; the MCP Inspector works without one.

## 17. Open items

- Read both directories' policies on products that return personal data about individuals.
