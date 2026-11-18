cd ~/rea-project/targets/contactout
P=pretty/background.js; S=src/app
sec(){ printf '\n\n######## %s ########\n' "$1"; }

sec "1/5 A7 automation and search-lookup cases"
sed -n 5256,5292p $P | head -c 2200
echo "--- te ---"
sed -n 5330,5362p $P | head -c 2000

sec "2/5 A5 alarm handler (worker module 354)"
node ~/rea-project/modn.js $S/background.js 354 2200 2>&1 | head -c 2600

sec "3/5 B4 real-time subscription code"
grep -n -i "echo\|pusher\|\.channel(\|\.private(\|\.listen(" $P | head -14

sec "4/5 C5 credit messages in the sidebar handler"
node ~/rea-project/modctx.js $S/content_script.js 'setUserCredits' 2>&1 | head -c 2600

sec "5/5 C1 AI composers (client side), leftover from batch 3"
tail -c 600 out/batch3.txt 2>/dev/null
n=$(grep -n "composers/emails" $P | head -1 | cut -d: -f1); [ -n "$n" ] && sed -n "$((n-8)),$((n+22))p" $P | head -c 1800
