const fs = require("fs"), acorn = require("acorn");
const [,, file, what, len] = process.argv;
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
if (!arr) { console.log("module array not found"); process.exit(); }
console.log("modules:", arr.elements.length);
if (isNaN(Number(what))) {
  arr.elements.forEach((el, i) => { if (el && src.slice(el.start, el.end).includes(what)) console.log("index", i, "contains", what); });
} else {
  const el = arr.elements[Number(what)];
  console.log(el ? src.slice(el.start, el.start + Number(len || 1200)) : "no such index");
}
