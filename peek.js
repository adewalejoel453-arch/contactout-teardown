const fs = require("fs");
for (const f of process.argv.slice(2)) {
  const j = JSON.parse(fs.readFileSync(f, "utf8"));
  console.log("\n==", f);
  if (j.error) { console.log("ERROR:", j.code, "-", String(j.message).slice(0, 150)); continue; }
  for (const [k, v] of Object.entries(j)) {
    const n = Array.isArray(v) ? `array(${v.length})`
            : v && typeof v === "object" ? `object(${Object.keys(v).length} keys)`
            : JSON.stringify(v)?.slice(0, 60);
    console.log(" ", k.padEnd(28), n);
  }
}
