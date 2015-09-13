xrdb -merge ~/.Xresources
xset fp+ $HOME/.fonts
xset fp rehash
xsetroot -solid \#3f3f3f
xsetroot -cursor_name left_ptr

xbindkeys &
$HOME/Projects/dotfiles/trackPointScrolling.sh &
#/usr/bin/xscreensaver -no-splash &
conky

/usr/local/bin/evilwm -fn fixed -term "urxvt" &
exec urxvt -fg gray -bg gray30
