[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
[[ -f ~/.Xresources ]] && xmodmap ~/.Xmodmap
xset r rate 200 125
xset s off
xset s noblank
xset -dpms
exec i3
