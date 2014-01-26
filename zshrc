HISTFILE=~/.histfile
HISTSIZE=20000
SAVEHIST=20000
bindkey -e

zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit && compinit

autoload -U colors && colors

autoload -U promptinit && promptinit

PROMPT="%(?..%{$bg[red]%}%{%B%}[%?]%{%b%}%{$reset_color%} )%n.%{%U%}%M%{%u%}> "
RPROMPT="%{$fg[magenta]%}%~%{$reset_color%}"


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
    for path in $all_paths; do
        p $path;
    done
}


setopt nobeep
setopt extendedglob

h() { if [ -z "$*" ]; then history 1; else history 1 | egrep "$@"; fi; }


export PATH=$PATH:$HOME/scripts
export PATH=$PATH:$HOME/.cabal/bin
export PATH=$PATH:$HOME/.gem/ruby/2.0.0/bin
export PATH=$PATH:/usr/bin/vendor_perl

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
alias ra="ranger"

# git
alias gits="git status -sb"
alias gitd="git diff"
alias gitdc="git diff --cached"
alias gt=gitodo
alias tiga="tig --all"

export EDITOR="mg"
alias rm='rm -I'


function backward-kill-partial-word {
	local WORDCHARS="${WORDCHARS//[\/.]/}"
	zle backward-kill-word "$@"
}
zle -N backward-kill-partial-word
bindkey '^[\' backward-kill-partial-word

# disable ctrl-s
stty -ixon

# use heth!!
alias mg=heth

# ec for emacs
alias ec=emacs

# python
export PYTHONSTARTUP=~/.pystartup
# android
export PATH=$PATH:/opt/android-sdk/tools
