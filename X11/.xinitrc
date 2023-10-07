#! /usr/bin/bash
# .xinitrc (hecato)
# author : Ed Goodwin

hsetroot -fill ~/wallpaper/dreams.jpg &
urxvt &
xload -fg "#CDD6F4" -bg "#1E1E2E" &
exec openbsd-cwm
