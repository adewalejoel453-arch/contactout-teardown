const fs = require("fs"), acorn = require("acorn");
const [,, file, needle, len, ...idx] = process.argv;
const src = fs.readFileSync(file, "utf8");
const ast = acorn.parse(src, { ecmaVersion: "latest" });
let arr = null;
(function w(n) {
  if (arr || !n || typeof n.type !== "string") return;
  if (n.type === "ArrayExpression" && n.elements.length > 100) { arr = n; return; }
  for (const k in n) { const v = n[k];
    if (Array.isArray(v)) v.forEach(w);
    else if (v && typeof v.type === "string") w(v); }
})(ast);
for (const i of idx) {
  const el = arr.elements[Number(i)];
  if (!el) { console.log("-- module", i, "none"); continue; }
  const t = src.slice(el.start, el.end), p = t.indexOf(needle);
  console.log("-- module", i, "length", t.length);
  console.log(p < 0 ? t.slice(-Number(len)) : t.slice(p, p + Number(len)));
}
