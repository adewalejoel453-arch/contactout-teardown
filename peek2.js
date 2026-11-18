const fs = require("fs");
const j = JSON.parse(fs.readFileSync(process.argv[2], "utf8"));
for (const [k, v] of Object.entries(j.normalized_result)) {
  const size = JSON.stringify(v).length;
  const t = Array.isArray(v) ? `array(${v.length})`
    : v && typeof v === "object" ? `object(${Object.keys(v).length})`
    : JSON.stringify(v).slice(0, 60);
  console.log(k.padEnd(30), String(size).padStart(9), t);
}
console.log("\nLIMITATIONS");
for (const l of j.limitations) console.log("-", (typeof l === "string" ? l : JSON.stringify(l)).slice(0, 200));
