G=$'\e[1;32m'; R=$'\e[1;31m'; Y=$'\e[1;33m'; B=$'\e[1;34m'; N=$'\e[0m'
ok()   { printf "%s✔ %s%s\n" "$G" "$*" "$N"; }
err()  { printf "%s✖ %s%s\n" "$R" "$*" "$N"; }
warn() { printf "%s⚠ %s%s\n" "$Y" "$*" "$N"; }
info() { printf "%sℹ %s%s\n" "$B" "$*" "$N"; }
