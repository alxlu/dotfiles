[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
[[ -f ~/.Xresources ]] && xmodmap ~/.Xmodmap
xset s off
xset s noblank
xset -dpms
exec i3
