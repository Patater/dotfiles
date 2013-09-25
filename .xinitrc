xrdb -merge ~/.Xresources
xset fp+ $HOME/.fonts
xset fp rehash
xsetroot -solid \#3f3f3f
xsetroot -cursor_name left_ptr

/usr/bin/xscreensaver -no-splash &
conky

/usr/local/bin/evilwm -fn fixed -term "xterm -u8 -bg black -fg white -fs 16" &
exec xterm
