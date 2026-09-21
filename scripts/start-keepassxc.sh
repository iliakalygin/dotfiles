#!/bin/sh
# Started from Sway exec. Keep $vars out of sway/config (Sway expands them).
db="${HOME}/Nextcloud/Passwords.kdbx"
i=0
while [ ! -s "$db" ] && [ "$i" -lt 60 ]; do
    i=$((i + 1))
    sleep 1
done
exec keepassxc "$db"
