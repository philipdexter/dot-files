URxvt*iso14755: false
URxvt*iso14755_52: false
URxvt.scrollBar: false
URxvt.saveLines:32767

URxvt.pastableTabs: false

URxvt.perl-ext-common: default,matcher
URxvt.urlLauncher: chromium
URxvt.matcher.button: 1
URxvt.matcher.pattern.1: \\bwww\\.[\\w-]\\.[\\w./?&@#-]*[\\w/-]

#define S_yellow        #b58900
#define S_orange        #cb4b16
#define S_red           #dc322f
#define S_magenta       #d33682
#define S_violet        #6c71c4
#define S_blue          #268bd2
#define S_cyan          #2aa198
#define S_green         #859900


! Dark

!#define S_base03        #002b36
!#define S_base02        #073642
!#define S_base01        #586e75
!#define S_base00        #657b83
!#define S_base0         #839496
!#define S_base1         #93a1a1
!#define S_base2         #eee8d5
!#define S_base3         #fdf6e3


! Light

#define S_base03        #fdf6e3
#define S_base02        #eee8d5
#define S_base01        #93a1a1
#define S_base00        #839496
#define S_base0         #657b83
#define S_base1         #586e75
#define S_base2         #073642
#define S_base3         #002b36


! To only apply colors to your terminal, for example, prefix
! the color assignment statement with its name. Example:
!
! URxvt*background:            S_base03

*background:              S_base03
*foreground:              S_base0
*fading:                  40
*fadeColor:               S_base03
*cursorColor:             S_base1
*pointerColorBackground:  S_base01
*pointerColorForeground:  S_base1

*color0:                  S_base02
*color1:                  S_red
*color2:                  S_green
*color3:                  S_yellow
*color4:                  S_blue
*color5:                  S_magenta
*color6:                  S_cyan
*color7:                  S_base2
*color9:                  S_orange
*color8:                  S_base03
*color10:                 S_base01
*color11:                 S_base00
*color12:                 S_base0
*color13:                 S_violet
*color14:                 S_base1
*color15:                 S_base3

! tangoesque scheme
URxvt.background: #111111
URxvt.foreground: #babdb6
! Black (not tango) + DarkGrey
URxvt.color0:  #000000
URxvt.color8:  #555753
! DarkRed + Red
URxvt.color1:  #ff6565
URxvt.color9:  #ff8d8d
! DarkGreen + Green
URxvt.color2:  #93d44f
URxvt.color10: #c8e7a8
! DarkYellow + Yellow
URxvt.color3:  #eab93d
URxvt.color11: #ffc123
! DarkBlue + Blue
URxvt.color4:  #204a87
URxvt.color12: #3465a4
! DarkMagenta + Magenta
URxvt.color5:  #ce5c00
URxvt.color13: #f57900
!DarkCyan + Cyan (both not tango)
URxvt.color6:  #89b6e2
URxvt.color14: #46a4ff
! LightGrey + White
URxvt.color7:  #cccccc
URxvt.color15: #ffffff
