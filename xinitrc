xset -b

redshift -l 42.1100:-75.9508 &
emacs --daemon &

urxvtd &

xrdb ~/.Xresources

setxkbmap -option ctrl:swapcaps

exec i3
