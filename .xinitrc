xrdb -merge ~/.Xresources
xset fp+ $HOME/.fonts
xset fp rehash
xsetroot -solid \#3f3f3f
xsetroot -cursor_name left_ptr

/usr/bin/xscreensaver -no-splash &
conky
iceweasel &
icedove &
chromium &

/usr/local/bin/evilwm -fn fixed -term "urxvt" &
exec urxvt -fg gray -bg gray30
