xset -b

redshift -l 42.1100:-75.9508 &

urxvtd &

xrdb ~/.Xresources

setxkbmap -option ctrl:swapcaps

synclient coastingspeed=0

exec i3
