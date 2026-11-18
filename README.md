# contactout-teardown

Scripts used for a client-side teardown of a public Chrome extension.
The extension code and the analysis output are not in this repo (`targets/` is git-ignored).
Download the extension package yourself from the Chrome Web Store, unpack it under
`targets/<name>/src`, then run the scripts.

- `unpack.js`: strips the CRX header so the package unzips
- `peek*.js`: summarise REA's JSON output
- `findmod.js`, `modn.js`, `modctx.js`, `modfield.js`: read webpack modules from a bundle
- `batch1.sh` to `batch6.sh`: the numbered test batches, one commit each
