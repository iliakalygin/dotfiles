#!/bin/sh
# Started from Sway exec. Keep $vars out of sway/config (Sway expands them).
# Qt only checks for a tray once. If Noctalia is not up yet, the icon never
# appears — wait for StatusNotifierHost before launching.
db="${HOME}/Nextcloud/Passwords.kdbx"
i=0
while [ ! -s "$db" ] && [ "$i" -lt 60 ]; do
    i=$((i + 1))
    sleep 1
done

i=0
while [ "$i" -lt 60 ]; do
    if busctl --user get-property \
        org.kde.StatusNotifierWatcher \
        /StatusNotifierWatcher \
        org.kde.StatusNotifierWatcher \
        IsStatusNotifierHostRegistered 2>/dev/null | grep -q true; then
        break
    fi
    i=$((i + 1))
    sleep 0.5
done
# Host can still be registering; Qt races if we start immediately.
sleep 1

exec keepassxc "$db"
