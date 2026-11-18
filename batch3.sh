cd ~/rea-project/targets/contactout
P=pretty/background.js; S=src/app
sec(){ printf '\n\n######## %s ########\n' "$1"; }

sec "1/5 A7 definitions of ee and te"
grep -n -E "\b(ee|te)\b" $P | head -14
n=$(grep -n -E "\bee\s*=\s*" $P | head -1 | cut -d: -f1); [ -n "$n" ] && { echo "--- ee def at $n ---"; sed -n "${n},$((n+26))p" $P | head -c 1500; }
n=$(grep -n -E "\bte\s*=\s*" $P | head -1 | cut -d: -f1); [ -n "$n" ] && { echo "--- te def at $n ---"; sed -n "${n},$((n+26))p" $P | head -c 1500; }

sec "2/5 A5 alarm setup and interval config"
sed -n 4676,4700p $P | head -c 1300
echo "--- config block ---"
sed -n 1084,1104p $P

sec "3/5 D2 install and uninstall hooks"
sed -n 4719,4750p $P | head -c 1800
echo "--- uninstall ---"
sed -n 4960,4980p $P | head -c 1200

sec "4/5 C3 Anywhere mode and DOM parsers"
grep -n "ANYWHERE" $P | head -12
grep -n "origins:" $P | head -6
grep -oE 'parseEmailsFromPage=(function|\(|[a-z]=>|async).{0,650}' $S/content_script.js | head -1
echo "--- phones ---"
grep -oE 'parsePhonesFromPage=(function|\(|[a-z]=>|async).{0,450}' $S/content_script.js | head -1

sec "5/5 C1 AI composers (client side)"
n=$(grep -n "composers/emails" $P | head -1 | cut -d: -f1); [ -n "$n" ] && sed -n "$((n-8)),$((n+22))p" $P | head -c 1800
echo "--- custom prompts ---"
n=$(grep -n "custom-prompts" $P | head -1 | cut -d: -f1); [ -n "$n" ] && sed -n "$((n-4)),$((n+12))p" $P | head -c 900
