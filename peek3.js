const fs = require("fs");
const n = JSON.parse(fs.readFileSync(process.argv[2], "utf8")).normalized_result;
for (const k of process.argv.slice(3)) {
  console.log("\n==", k);
  console.log(JSON.stringify(n[k], null, 1).slice(0, 1800));
}
