const s = require("fs").readFileSync(process.argv[2], "utf8");
const re = new RegExp("[,{\\s]" + process.argv[3] + "\\s*[:(]");
const m = re.exec(s);
console.log(m ? s.slice(m.index, m.index + Number(process.argv[4] || 900)) : "not found");
