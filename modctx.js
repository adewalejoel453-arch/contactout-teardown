const fs = require("fs"), acorn = require("acorn");
const [,, file, ...needles] = process.argv;
const src = fs.readFileSync(file, "utf8");
const ast = acorn.parse(src, { ecmaVersion: "latest" });
let arr = null;
(function walk(n) {
  if (arr || !n || typeof n.type !== "string") return;
  if (n.type === "ArrayExpression" && n.elements.length > 100) { arr = n; return; }
  for (const k in n) { const v = n[k];
    if (Array.isArray(v)) v.forEach(walk);
    else if (v && typeof v.type === "string") walk(v); }
})(ast);
for (const nd of needles) {
  console.log("\n######", nd);
  let shown = 0;
  arr.elements.forEach((el, i) => {
    if (!el || shown >= 3) return;
    const text = src.slice(el.start, el.end), p = text.indexOf(nd);
    if (p < 0) return;
    shown++;
    console.log("--- module", i, "---");
    console.log(text.slice(Math.max(0, p - 200), p + 500));
  });
}
