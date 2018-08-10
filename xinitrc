xset -b

xset r rate 200 20

xset m 9/2 0

xinput set-prop 12 316 -1

redshift -l 59.403557:17.943155 -t 5700:1850 &

xcape -t 200 -e Control_L=Escape

dunst &

urxvtd &

xrdb ~/.Xresources

setxkbmap -option ctrl:swapcaps

synclient coastingspeed=0

exec i3
