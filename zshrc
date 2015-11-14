HISTFILE=~/.histfile
HISTSIZE=20000
SAVEHIST=20000
bindkey -e

fpath=($HOME/projects/zsh-completions/src $fpath)

zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit && compinit

autoload -U colors && colors

autoload -U promptinit && promptinit

autoload -U edit-command-line
zle -N edit-command-line
bindkey '\ee' edit-command-line

PROMPT="%(?..%{$bg[red]%}%{%B%}[%?]%{%b%}%{$reset_color%} )%n.%{%U%}%M%{%u%}> "
RPROMPT="%{$fg[magenta]%}%~%{$reset_color%}"

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

zmodload zsh/deltochar
bindkey '\ez' delete-to-char

h() { if [ -z "$*" ]; then history 1; else history 1 | egrep "$@"; fi; }


export PATH=$PATH:$HOME/scripts
export PATH=$PATH:$HOME/.cabal/bin
export PATH=$PATH:$HOME/.gem/ruby/2.0.0/bin
export PATH=$PATH:$HOME/.gem/ruby/2.1.0/bin
export PATH=$PATH:/usr/bin/vendor_perl
export PATH=$PATH:$HOME/.local/bin

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
alias ra="ranger"

# git
alias gits="git status -sb"
alias gitd="git diff"
alias gitdc="git diff --cached"
alias gt=gitodo
alias tiga="tig --all"

export EDITOR="emacs"
alias rm='rm -I'


function backward-kill-partial-word {
	local WORDCHARS="${WORDCHARS//[\/._-]/}"
	zle backward-kill-word "$@"
}
zle -N backward-kill-partial-word
bindkey '^[\' backward-kill-partial-word
bindkey '^w' kill-region
bindkey '^u' backward-kill-line

# disable ctrl-s
stty -ixon

# ec for emacs
alias ec=emacs

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

# ack -i and ag -i and paged version
alias acki='ack -i'
alias agi='ag -i'
alias ackp='ack --pager="less -r"'
alias agp='ag --pager="less -r"'
alias ackip='ack -i --pager="less -r"'
alias agip='ag -i --pager="less -r"'

# zle text editor
function qq {
	local file=$(realpath $BUFFER)
	BUFFER=''
	LBUFFER=" cat > $file << EOF
"
	RBUFFER=`cat $file`
	RBUFFER+="
EOF"
}
zle -N qq
bindkey '^xe' qq

# haskell

function which-module {
	 ~/.envs/result/bin/load-env-haskell-general-environment ghc-pkg find-module $1
}

function markdown-less {
	 pandoc -s -f markdown -t man $1 | groff -T utf8 -man - | less
}

# etc

alias df='df -H'

# tmux
alias tma='tmux attach -t'
