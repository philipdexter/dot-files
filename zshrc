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

export EDITOR="mg"

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

export PATH=$PATH:~/scripts
export PATH=$PATH:~/.cabal/bin
export PATH=$PATH:~/.gem/ruby/1.9.1/bin

setopt nobeep
setopt extendedglob

h() { if [ -z "$*" ]; then history 1; else history 1 | egrep "$@"; fi; }

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

# git
alias gits="git status -sb"
alias gitd="git diff"
alias gitdc="git diff --cached"

# ack
export PATH=$PATH:/usr/bin/vendor_perl/

# python
export PYTHONSTARTUP=~/.pystartup
