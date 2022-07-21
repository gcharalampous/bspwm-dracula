#!/bin/bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

#Find out your monitor name with xrandr or arandr (save and you get this line)
#xrandr --output VGA-1 --primary --mode 1360x768 --pos 0x0 --rotate normal
#xrandr --output DP2 --primary --mode 1920x1080 --rate 60.00 --output LVDS1 --off &
#xrandr --output LVDS1 --mode 1366x768 --output DP3 --mode 1920x1080 --right-of LVDS1
xrandr --output eDP1 --primary --mode 1600x900 --pos 0x0 --rotate normal --output VIRTUAL1 --off

# Dual Screen Setup
# xrandr --output eDP1 --primary --mode 1600x900 --pos 0x0 --rotate normal --output HDMI1 --mode 1920x1080 --rotate normal --above eDP1

#autorandr horizontal

$HOME/.config/polybar/launch.sh &

#change your keyboard if you need it
setxkbmap -option grp:alt_shift_toggle us,gr &
run sxhkd -c ~/.config/bspwm/sxhkd/sxhkdrc &


#Some ways to set your wallpaper besides variety or nitrogen
#feh --bg-scale ~/.config/bspwm/wall.png &
#feh --bg-fill /usr/share/backgrounds/arcolinux/arco-wallpaper.jpg &
#feh --randomize --bg-fill ~/Képek/*
#feh --randomize --bg-fill ~/Dropbox/Apps/Desktoppr/*

xsetroot -cursor_name left_ptr &

run variety &
run nm-applet &
run pamac-tray &
run xfce4-power-manager &
numlockx on &
blueberry-tray &
picom --config $HOME/.config/bspwm/picom.conf &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
/usr/lib/xfce4/notifyd/xfce4-notifyd &
run volumeicon &
run dropbox &
#run spotify &
