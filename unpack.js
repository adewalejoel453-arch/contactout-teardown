const fs = require("fs");
const b = fs.readFileSync("ext2.crx");
const i = b.indexOf(Buffer.from([0x50, 0x4b, 0x03, 0x04]));
if (i < 0) { console.error("no zip data found"); process.exit(1); }
fs.writeFileSync("ext.zip", b.subarray(i));
console.log("zip starts at byte", i);
