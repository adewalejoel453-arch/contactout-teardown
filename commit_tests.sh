cd ~/rea-project || exit 1
[ -d .git ] || git init -q -b main
git config user.name > /dev/null || { echo "git identity not set"; exit 1; }
[ -f unpack.js ] || cp targets/contactout/unpack.js ./unpack.js 2>/dev/null
[ -f .gitignore ] || printf 'node_modules/\ntargets/\n*.crx\n*.zip\nout/\n' > .gitignore
[ -f README.md ] || printf '# contactout-teardown\n\nScripts for a client-side teardown of a public Chrome extension.\nThe extension code and analysis output are not in this repo (targets/ is git-ignored).\n' > README.md
c(){
  msg="$1"; shift
  files=()
  for f in "$@"; do [ -e "$f" ] && files+=("$f"); done
  [ ${#files[@]} -eq 0 ] && { echo "skip (no files): $msg"; return; }
  git add "${files[@]}"
  git diff --cached --quiet && { echo "nothing new: $msg"; return; }
  git commit -q -m "$msg" && echo "✔ $msg"
}
c "Project scaffold" .gitignore README.md
c "Setup: colors and installer" ui.sh setup.sh rea package.json package-lock.json
c "Test: unpack the CRX package" unpack.js
c "Test: read REA output structure" peek.js peek2.js peek3.js
c "Test: find and read webpack modules" findmod.js modn.js modctx.js
c "Batch 1: iframe protocol, selectors, tasks, login" batch1.sh
c "Batch 2: selector transform, alarm, token, lifecycle" batch2.sh
c "Batch 3: config, install hooks, Anywhere parsers" batch3.sh
c "Batch 4: automation cases, alarm handler, credits" batch4.sh
c "Batch 5: cookies, request helper, remote config" batch5.sh
c "Batch 6: Recruiter handlers, logout payload, PRO_PRE" modfield.js batch6.sh
c "Scripts: commit helper" commit_tests.sh
