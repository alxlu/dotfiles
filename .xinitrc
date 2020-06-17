[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
compton -b --experimental-backends
feh --bg-fill ~/.wallpapers/bg.jpg
xcape
xset r rate 200 125 
# setxkbmap -option altwin:swap_alt_win
xmodmap ~/.Xmodmap
sxhkd &
dwmblocks &

# exec dwm
# relaunch DWM if the binary changes, otherwise bail
csum=$(sha1sum $(which dwm))
new_csum=""
while true
do
    if [ "$csum" != "$new_csum" ]
    then
        csum=$new_csum
        dwm
    else
        exit 0
    fi
    new_csum=$(sha1sum $(which dwm))
    sleep 0.5
done
