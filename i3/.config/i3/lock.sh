#!/bin/bash

# Take a screenshot
scrot /tmp/lock.png

# Apply blur using imagemagick (requires it to be installed)
convert /tmp/lock.png -blur 0x8 /tmp/lock.png

# Lock the screen with custom visuals
i3lock \
  --image=/tmp/lock.png \
  --inside-color=00000088 \
  --ring-color=ffffffcc \
  --line-uses-ring \
  --keyhl-color=33ccffaa \
  --bshl-color=ff3333aa \
  --separator-color=00000000 \
  --insidever-color=11111188 \
  --ringver-color=33ccffcc \
  --insidewrong-color=55000088 \
  --ringwrong-color=ff3333cc \
  --ind-pos="x+w/2:y+h/2+100" \
  --radius=120 \
  --verif-text="Verifying..." \
  --wrong-text="Wrong!" \
  --noinput-text="Type password..." \
  --time-str="%H:%M:%S" \
  --date-str="%A, %d %B" \
  --time-font="Fira Code" \
  --date-font="Fira Code" \
  --greeter-text="Locked" \
  --greeter-font="Fira Code" \
  --greeter-color=ffffffcc \
  --time-color=ffffffff \
  --date-color=ffffffff
