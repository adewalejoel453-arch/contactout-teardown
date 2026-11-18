#!/data/data/com.termux/files/usr/bin/bash
cd "$(dirname "$0")"
. ./ui.sh

info "Checking Node..."
if command -v node >/dev/null; then ok "Node $(node -v)"; else err "Node missing"; exit 1; fi

info "Checking git and ps..."
for p in git ps; do
  command -v $p >/dev/null && ok "$p found" || { warn "$p missing, installing"; pkg install -y git procps; }
done

info "Installing REA into $(pwd)..."
[ -f package.json ] || npm init -y >/dev/null
if npm install rea-agents; then ok "REA installed"; else err "REA install failed"; exit 1; fi

# Local launcher
cat > rea << 'EOS'
#!/data/data/com.termux/files/usr/bin/bash
exec "$(dirname "$0")/node_modules/.bin/rea" "$@"
EOS
chmod +x rea
ok "Run it with: ~/rea-project/rea --help"
