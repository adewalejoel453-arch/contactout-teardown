cd ~/rea-project/targets/contactout
P=pretty/background.js
S=src/app
sec(){ printf '\n\n######## %s ########\n' "$1"; }

sec "1/5 A4b iframe message protocol and origin checks"
node ~/rea-project/modctx.js $S/content_script.js 'contentWindow.postMessage' 'trustedDomains.' 2>&1 | head -c 3500

sec "2/5 A3 selector fetch and transform"
n=$(grep -n "x-co-selectors-hash" $P | head -1 | cut -d: -f1)
[ -n "$n" ] && sed -n "$((n-14)),$((n+22))p" $P | head -c 2500
echo "--- module 49 ---"
m=$(grep -n "^ *49: function" $P | head -1 | cut -d: -f1)
[ -n "$m" ] && sed -n "${m},$((m+30))p" $P | head -c 2000 || echo "module 49 not keyed in text, skipped"

sec "3/5 A5 and A7 scheduled tasks and automation"
grep -n -i "automation" $P | head -20
grep -n "runTaskInterval\|chrome.alarms\|ConnectionScrape\|GET_PROFILE_USING_SEARCH" $P | head -15

sec "4/5 B1 login flow"
npx -y prettier@3 --parser babel $S/auth_callback.js 2>/dev/null | head -c 3000
echo "--- token and cookie calls in worker ---"
grep -n "auth/token\|JSESSIONID\|GET_COOKIE_DATA" $P | head -15

sec "5/5 permissions, lifecycle, storage keys"
head -c 2200 $S/permissions.js
echo "--- lifecycle ---"
grep -n "onInstalled\|setUninstallURL\|onStartup\|alarms.create\|alarms.onAlarm" $P | head -15
echo "--- storage keys ---"
grep -oh 'CO__[A-Za-z0-9_-]*' $S/*.js | sort -u | head -30
