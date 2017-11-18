xset -b

xset r rate 200 20

# redshift -l 42.1100:-75.9508 &
#redshift -l 60.238419:24.8766544

redshift -l 59.403557:17.943155 &

dunst &

urxvtd &

xrdb ~/.Xresources

setxkbmap -option ctrl:swapcaps

synclient coastingspeed=0

exec i3
