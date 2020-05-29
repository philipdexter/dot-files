HISTFILE=~/.histfile
HISTSIZE=2000000
SAVEHIST=2000000
bindkey -e

# fpath=($HOME/projects/zsh-completions/src $fpath)

zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit && compinit

autoload -U colors && colors

autoload -U promptinit && promptinit

autoload -U edit-command-line
zle -N edit-command-line
bindkey '\ee' edit-command-line

PROMPT="%(?..%{$bg[red]%}%{%B%}[%?]%{%b%}%{$reset_color%} )%F{222}%n.%{%U%}%M%{%u%}> %{$reset_color%}%f"
RPROMPT="%F{209}%~%{$reset_color%}%f"

setopt extended_history

setopt multios

pushd()
{
    builtin pushd "$@" > /dev/null
}

popd()
{
    builtin popd "$@" > /dev/null
}

alias p=pushd
alias b=popd
alias u='cd ..'
alias pu='p ..'

alias top=htop
alias topme="htop -u philip"
pa()
{
    all_paths=("${(s./.)1}")
    for p in $all_paths; do
        pushd $p;
    done
}


setopt nobeep
setopt extendedglob
setopt histignorespace

#unset NULLCMD
READNULLCMD=less

zmodload zsh/deltochar
bindkey '\ez' delete-to-char

h() { if [ -z "$*" ]; then history 1; else history 1 | egrep "$@"; fi; }

export PATH=$PATH:$HOME/.cabal/bin
export PATH=$PATH:$HOME/.gem/ruby/2.7.0/bin
export PATH=$PATH:/usr/bin/vendor_perl
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/.poetry/bin

# urxvt title
if [ "$SHELL" = '/bin/zsh' ]
then
    case $TERM in
         *rxvt*|*term)
         precmd() { print -Pn "\e]0;%m:%~\a" }
         preexec () { print -Pn "\e]0;$1\a" }
         ;;
    esac
fi

#random
alias igrep="grep -i"
alias ifind="find . | grep -i "
alias ips="ps aux | grep -i"
alias cal="cal -3m"
alias cat="bat"
alias m="mold"

export EDITOR="vim"

alias rm='rm -I'


function backward-kill-partial-word {
	local WORDCHARS="${WORDCHARS//[\/._-]/}"
	zle backward-kill-word "$@"
}
zle -N backward-kill-partial-word
bindkey '^[\' backward-kill-partial-word
bindkey '^u' backward-kill-line

# disable ctrl-s
stty -ixon

# ec for emacs
alias ec='emacs -nw'
alias gnus="ec --eval '(gnus)'"
alias gnusm="em --eval '(gnus)'"
em() { (setsid emacs $@ &) }
eww() { ec --eval "(eww-browse-url \"$1\")"; }
ewwm() { em --eval "(eww-browse-url \"$1\")"; }

# v for vim
alias v=vim

# z is for zathura
alias z=zathura
alias zf='zathura --fork'

# curl pdfs
cpdf () { curl $1 | zathura - --fork }

# youtube-dl and watch
ytmpv () { youtube-dl -o- "$1" | mpv - }
ytmpvlq () { youtube-dl -f18 -o- "$1" | mpv - }

# python
export PYTHONSTARTUP=~/.pystartup
# android
export PATH=$PATH:/opt/android-sdk/tools

ANYFILE () { find -maxdepth 1 -type f -print -quit }

shush1 () { "$@" 1> /dev/null }
shush2 () { "$@" 2> /dev/null }
shush  () { "$@" &> /dev/null }

dynahack () {
	xrdb ~/.Xresources.hack
	urxvtc -e zsh -c 'cd ~/dynahack/install/dynahack-data; LD_LIBRARY_PATH=. ./dynahack'
	xrdb ~/.Xresources
}

alias rg='rg -i'

function markdown-less {
	 pandoc -s -f markdown -t man $1 | groff -T utf8 -man - | less
}

# etc

alias df='df -H'

# OPAM configuration
. /home/philip/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# iso date
alias isod='date -I'

# tmux
alias tma='tmux attach -t'
alias t=tmux
function tv(){
  tmux new-session \; send-keys "vim $@" \; attach
}

# watching
watch_next() {
  BUFFER=$(python -c "
import sys
import re
ep = re.search('E([0-9]+)', sys.argv[1])[1]
print(re.sub('E[0-9]+', f'E{int(ep)+1:02}', sys.argv[1]))
" "$BUFFER")
}
zle -N watch_next
bindkey '\eN' watch_next

# countdown
countdown(){
   seconds=$1
   start=$((`date +%s` + $seconds))
   while [ "$start" -ge `date +%s` ]; do
     echo -ne "$(date -u --date @$(($start - `date +%s`)) +%H:%M:%S)\r";
     sleep 0.1
   done
}
minutes(){
  echo $((60*$1))
}
alias mins=minutes
countdownandplay() {
  countdown $(mins $1) && echo '\a' && paplay --raw ~/alarm.wav
}
alias cap=countdownandplay

export GOPATH=~/go
export PATH=$PATH:$GOPATH:$GOPATH/bin

alias ta="tmux attach -t"

alias eman="erl -man"

# fzf
__fsel() {
  local cmd="${FZF_CTRL_T_COMMAND:-"command find -L . -mindepth 1 \\( -path '*/\\.*' -o -fstype 'sysfs' -o -fstype 'devfs' -o -fstype 'devtmpfs' -o -fstype 'proc' \\) -prune \
    -o -type f -print \
    -o -type d -print \
    -o -type l -print 2> /dev/null | cut -b3-"}"
  setopt localoptions pipefail 2> /dev/null
  eval "$cmd" | FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --reverse $FZF_DEFAULT_OPTS $FZF_CTRL_T_OPTS" $(__fzfcmd) -m "$@" | while read item; do
    echo -n "${(q)item} "
  done
  local ret=$?
  echo
  return $ret
}

__fzf_use_tmux__() {
  [ -n "$TMUX_PANE" ] && [ "${FZF_TMUX:-0}" != 0 ] && [ ${LINES:-40} -gt 15 ]
}

__fzfcmd() {
  __fzf_use_tmux__ &&
    echo "fzf-tmux -d${FZF_TMUX_HEIGHT:-40%}" || echo "fzf"
}

fzf-file-widget() {
  LBUFFER="${LBUFFER}$(__fsel)"
  local ret=$?
  zle redisplay
  typeset -f zle-line-init >/dev/null && zle zle-line-init
  return $ret
}
fzf-edit-file-widget() {
  LBUFFER="v ${LBUFFER}$(__fsel)"
  local ret=$?
  [[ ret -eq 0 ]] && zle accept-line
  zle redisplay
  typeset -f zle-line-init >/dev/null && zle zle-line-init
  return $ret
}
zle     -N   fzf-file-widget
zle     -N   fzf-edit-file-widget
bindkey '\ew' fzf-file-widget
bindkey '\ei' fzf-edit-file-widget

fzf-history-widget() {
  local selected num
  setopt localoptions noglobsubst noposixbuiltins pipefail 2> /dev/null
  selected=( $(fc -l 1 |
    FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} $FZF_DEFAULT_OPTS --tac -n2..,.. --tiebreak=index --bind=ctrl-r:toggle-sort $FZF_CTRL_R_OPTS --query=${(q)LBUFFER} +m" $(__fzfcmd)) )
  local ret=$?
  if [ -n "$selected" ]; then
    num=$selected[1]
    if [ -n "$num" ]; then
      zle vi-fetch-history -n $num
    fi
  fi
  zle redisplay
  typeset -f zle-line-init >/dev/null && zle zle-line-init
  return $ret
}
zle     -N   fzf-history-widget
bindkey '\er' fzf-history-widget

fzf-ag-widget() {
  local file
  setopt localoptions noglobsubst noposixbuiltins pipefail 2> /dev/null
  file=( $(rg --no-heading . |
    FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} $FZF_DEFAULT_OPTS --tac -n2..,.. --tiebreak=index --bind=ctrl-r:toggle-sort $FZF_CTRL_R_OPTS --query=${(q)LBUFFER} +m" $(__fzfcmd) | awk -F: '{ print $1 }') )
  LBUFFER="${LBUFFER}$file"
  local ret=$?
  zle redisplay
  typeset -f zle-line-init >/dev/null && zle zle-line-init
  return $ret
}
fzf-ag-column-widget() {
  local file
  setopt localoptions noglobsubst noposixbuiltins pipefail 2> /dev/null
  file=( $(rg --no-heading . |
    FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} $FZF_DEFAULT_OPTS --tac -n2..,.. --tiebreak=index --bind=ctrl-r:toggle-sort $FZF_CTRL_R_OPTS --query=${(q)LBUFFER} +m" $(__fzfcmd) | awk -F: '{ print $1 " +" $2 }') )
  LBUFFER="${LBUFFER}$file"
  local ret=$?
  zle redisplay
  typeset -f zle-line-init >/dev/null && zle zle-line-init
  return $ret
}
zle -N fzf-ag-widget
bindkey '\ea' fzf-ag-widget
zle -N fzf-ag-column-widget
bindkey '\eA' fzf-ag-column-widget

fzf-git-commit-widget() {
  local selected num
  setopt localoptions noglobsubst noposixbuiltins pipefail 2> /dev/null
  selected=( $(git log --all --oneline --reverse |
    FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} $FZF_DEFAULT_OPTS --tac -n2..,.. --tiebreak=index --bind=ctrl-r:toggle-sort $FZF_CTRL_R_OPTS +m" $(__fzfcmd)) )
  local ret=$?
  if [ -n "$selected" ]; then
    LBUFFER+=$selected[1]
  fi
  zle redisplay
  typeset -f zle-line-init >/dev/null && zle zle-line-init
  return $ret
}
zle     -N   fzf-git-commit-widget
bindkey '\eg' fzf-git-commit-widget

git-fshow() {
        local g=(
                git log
                --graph
                --format='%C(auto)%h%d %s %C(white)%C(bold)%cr'
                --color=always
                "$@"
        )

        local fzf=(
                fzf
                --ansi
                --reverse
                --tiebreak=index
                --no-sort
                --bind=ctrl-s:toggle-sort
                --bind=ctrl-d:preview-down,ctrl-u:preview-up
                --preview 'f() { set -- $(echo -- "$@" | grep -o "[a-f0-9]\{7\}"); [ $# -eq 0 ] || git show --color=always $1; }; f {}'
        )
        $g | $fzf
}
zle -N git-fshow
bindkey '\eG' git-fshow

export ERL_AFLAGS="-kernel shell_history enabled"

# vim pager
function = () { /usr/share/vim/vim81/macros/less.sh "$@" }
page-file() {
  LBUFFER="= ${LBUFFER}"
  zle accept-line
}
zle -N page-file
bindkey '\eo' page-file

# iex
alias imix="iex -S mix"

alias g=git
alias tiga='tig --all'

# keyboard setup
kb () { xset r rate 200 20 && setxkbmap -option ctrl:swapcaps }

alias factor="~/projects/factor/factor"

ediff() { ec --eval "(ediff-files \"$1\" \"$2\")" }

tvon() {
  xrandr --output HDMI-2  --auto --right-of eDP-1 ; pkill redshift
  sed -ibak -e 's/#load-module module-alsa-sink device=hw:0,7/load-module module-alsa-sink device=hw:0,7/' -ibak ~/.config/pulse/default.pa
  pulseaudio -k ; pulseaudio --start

}
tvoff() {
  xrandr --output HDMI-2 --off ; (setsid redshift -l 60.194654:24.956958 -t 5700:1850 &)
  sed -ibak -e 's/load-module module-alsa-sink device=hw:0,7/#load-module module-alsa-sink device=hw:0,7/' -ibak ~/.config/pulse/default.pa
  pulseaudio -k ; pulseaudio --start
  xrandr --dpi 125
}
start_bluetooth() {
  sudo systemctl start bluetooth.service && blueman-applet
}
stop_bluetooth() {
  sudo systemctl stop bluetooth.service
}

alias mg="ec --eval '(progn (load-magit) (delete-other-windows))'"

warnme() {
  prev_res=$?
  if [ $prev_res = 1 ] ; then echo '\a' ; fi
  return $prev_res
}

quotize() {
  (( ${+NUMERIC} )) || NUMERIC=1
  times=$NUMERIC
  unset NUMERIC
  zle beginning-of-line
  if [[ $times -gt 0 ]]; then
    for i in {1..$times};
      do zle vi-forward-blank-word
    done
  fi
  zle set-mark-command
  zle end-of-line
  zle quote-region
}
zle -N quotize
bindkey $'\e\'' quotize

alias vmk="python -m venv ./venv && vv"
function vv()
{
  p $PWD
  while [[ $PWD != '/' && ! -d venv ]]; do cd ..; done
  . ./venv/bin/activate
  echo $PWD
  b
}

function pg() {
  p ~/go/src/"$1"
}
compdef '_files -W ~/go/src' pg

alias k=kubectl
alias sk="source <(kubectl completion zsh)"

setaccel() {
  id=$(xinput | grep 'IBM TrackPoint' | sed -e 's/.*id=\([0-9]\+\).*/\1/')
  prop=$(xinput list-props $id | grep 'Accel Speed (' | sed -e 's/.*(\([0-9]\+\)).*/\1/')
  echo xinput set-prop "$id" $prop -0.40
  xinput set-prop "$id" $prop -0.40
  xinput | grep 'IBM TrackPoint'
  xinput list-props $id | grep 'Accel Speed ('
}


alias -g GG='| grep'
alias -g CC='| cat'
alias -g LL='| less'

hash -d pr=~/projects/


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/opt/google-cloud-sdk/path.zsh.inc' ]; then . '/opt/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/opt/google-cloud-sdk/completion.zsh.inc' ]; then . '/opt/google-cloud-sdk/completion.zsh.inc'; fi
