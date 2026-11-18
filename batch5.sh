cd ~/rea-project/targets/contactout
P=pretty/background.js; S=src/app
sec(){ printf '\n\n######## %s ########\n' "$1"; }

sec "1/5 A5b where li_at and cookies are read"
grep -n "li_at\|cookieKeyLinkedinSession\|chrome.cookies" $P | cut -c1-150 | head -10
n=$(grep -n "cookies.get" $P | head -1 | cut -d: -f1); [ -n "$n" ] && sed -n "$((n-6)),$((n+14))p" $P | cut -c1-150

sec "2/5 B4 real-time channel usage"
grep -n "notificationsAuthUrl" $P | cut -c1-150 | head -4
grep -l "notificationsAuthUrl\|Echo\|pusher" $S/*.js
grep -oE '.{120}notificationsAuthUrl.{300}' $S/main.js | head -c 700

sec "3/5 C2 request helper, ATS and campaign"
n=$(grep -n "webRequest = " $P | head -1 | cut -d: -f1); [ -n "$n" ] && sed -n "${n},$((n+26))p" $P | cut -c1-150
grep -n "ats-enrich\|extension/campaign\|NOTIFICATION_ATS" $P | cut -c1-140 | head -8

sec "4/5 C4 GitHub handling"
grep -oE '.{100}github\.com.{250}' $S/content_script.js | head -c 1100

sec "5/5 D1 remote extension config"
n=$(grep -n "getExtensionConfig = " $P | head -1 | cut -d: -f1); [ -n "$n" ] && sed -n "${n},$((n+22))p" $P | cut -c1-150
