#!/bin/bash
export SDL_VIDEODRIVER=wayland
export _JAVA_AWT_WM_NONREPARENTING=1
export QT_QPA_PLATFORM=wayland
export XDG_CURRENT_DESKTOP=sway
export XDG_SESSION_DESKTOP=sway
export QT_QPA_PLATFORMTHEME=qt5ct
export GTK_THEME=Adwaita-dark
export XCURSOR_THEME=Adwaita
export QT_STYLE_OVERRIDE=kvantum
export GTK_ICON_THEME=Papirus
exec sway --unsupported-gpu
