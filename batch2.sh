cd ~/rea-project/targets/contactout
P=pretty/background.js; S=src/app
sec(){ printf '\n\n######## %s ########\n' "$1"; }

sec "1/5 A3 selector transform (worker module 49, plus fallbacks)"
node ~/rea-project/modn.js $S/background.js 49 1200 2>&1 | head -c 1600
echo "--- decode hints ---"
grep -n -i "atob\|inflate\|decrypt\|base64\|pako\|decompress" $P | head -8

sec "2/5 A7 automation (ee) and search lookup (te)"
for v in ee te; do
  n=$(grep -n -E "^\s+$v = " $P | head -1 | cut -d: -f1)
  echo "--- $v at line $n ---"
  [ -n "$n" ] && sed -n "${n},$((n+32))p" $P | head -c 1800
done

sec "3/5 A5 the hashVersion alarm"
sed -n 4700,4716p $P | head -c 1500

sec "4/5 B1 token exchange and cookie handler"
sed -n 2820,2840p $P | head -c 1500
echo "--- auth_callback entry module ---"
node ~/rea-project/findmod.js $S/auth_callback.js 503 1500

sec "5/5 D2 permissions tail, lifecycle, storage keys"
tail -c 1400 $S/permissions.js
echo "--- lifecycle ---"
grep -n "onInstalled\|setUninstallURL\|onStartup\|alarms.create\|alarms.onAlarm" $P | head -12
echo "--- storage keys ---"
grep -oh 'CO__[A-Za-z0-9_-]*' $S/*.js | sort -u | head -30
