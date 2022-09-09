# !/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar


#wait until the processes have been shut down
while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done


if type "xrandr" > /dev/null; then
      for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
          MONITOR=$m polybar -c ~/.config/polybar/config.ini &
      done
    else
        polybar --reload mainbar-bspwm -c ~/.config/polybar/config.ini &
    fi
    # second polybar at bottom
    # if type "xrandr" > /dev/null; then
    #   for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    #     MONITOR=$m polybar --reload mainbar-bspwm-extra -c ~/.config/polybar/config &
    #   done
    # else
    # polybar --reload mainbar-bspwm-extra -c ~/.config/polybar/config &
    # fi


