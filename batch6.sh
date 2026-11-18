cd ~/rea-project/targets/contactout
P=pretty/background.js; S=src/app
sec(){ printf '\n\n######## %s ########\n' "$1"; }

sec "1/5 A2d Recruiter handlers 476 477 478"
node ~/rea-project/modfield.js $S/content_script.js parseJsonResponse 650 476 477 478 | head -c 2500

sec "2/5 what the logout and checkpoint scripts send"
for f in linkedin_logout linkedin_detect; do
  echo "-- $f"
  grep -o 'sendMessage({command:.\{0,260\}' $S/$f.js | head -2 | head -c 700; echo
done

sec "3/5 PRO_PRE: where profile HTML goes in the worker"
n=$(grep -n 'case \$:' $P | head -1 | cut -d: -f1)
[ -n "$n" ] && sed -n "${n},$((n+12))p" $P | cut -c1-130

sec "4/5 connection-state keys and intervals"
grep -n "ConnectionScrapeState\|ConnectionCountState\|ConnectionPingState" $P | cut -c1-120 | head -8
grep -o '.\{200\}linkedinConnectionScrapeState.\{300\}' $S/content_script.js | tail -1 | head -c 700; echo
grep -n "intervalCheckConnectsProfiles\|intervalFirstDegreeConnectionCount" $P $S/*.js | cut -c1-130 | head -6

sec "5/5 Gmail AI writer permission flow"
sed -n 2680,2700p $P | cut -c1-120
grep -n -A6 "permissionsOrigin" $P | head -14 | cut -c1-120
