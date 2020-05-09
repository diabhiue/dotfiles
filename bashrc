# .bashrc
#
# This file is read by bash every time a shell starts.  Only put bash
# specific things (aliases, unexported variables) here.  Exported
# environment variables should be in .envrc, and path changes in .pathrc.

# Do not take the following lines out unless you're really sure of
# what you are doing.
source ~/.git-prompt.sh


# Color coding for better formatting (PS1 in my case)
BLACK="\[$(tput setaf 0)\]"
RED="\[$(tput setaf 1)\]"
GREEN="\[$(tput setaf 2)\]"
YELLOW="\[$(tput setaf 3)\]"
BLUE="\[$(tput setaf 4)\]"
MAGENTA="\[$(tput setaf 5)\]"
CYAN="\[$(tput setaf 6)\]"
WHITE="\[$(tput setaf 7)\]"

# NORMAL and BOLD text modes
NORMAL="\[$(tput sgr0)\]"
BOLD="\[$(tput bold)\]"

# Revamped and much clean bash prompt
PS1="${BOLD}[${WHITE}\D{%d %H:%M}] ${CYAN}\u${RED}@${CYAN}\h: ${YELLOW}\w${GREEN}$(__git_ps1 " (%s)")${RED}> ${NORMAL}"

# Basic structure of PS1 without color
#PS1='[\D{%d %H:%M}] \u@\h: \w> '
 

export Q__LS_ARGS_LL='--color=tty -F --time-style=long-iso -v --human-readable -lA'

export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history
shopt -s histappend                      # append to history, don't overwrite it
shopt -s checkwinsize

alias ptree='pstree -hpaGU'
alias wptree='watch pstree -hpaGU'
alias root='cd $(git root)'
alias mux='tmuxinator'

function lsan() {
    ls --color=auto $Q__LS_ARGS_LL -d $(print-ancestors $@)
}

export HISTTIMEFORMAT='%F %T '
PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND ; }"'history -a; echo $$ $SHORTHOST "$(history 1)" >> ~/.eternal_history'
function hgrep() { grep "$@"  ~/.eternal_history; }

[ -f ~/.fzf.bash ] && source ~/.fzf.bash


# --files: List files that would be searched but do not search
# --no-ignore: Do not respect .gitignore, etc...
# --hidden: Search hidden files and folders
# --follow: Follow symlinks
# --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

export EDITOR='vim'

# Auto-start TMUX
#if [ -z "$TMUX" ]; then
#    tmux attach -t default || tmux new -s default
#fi

# Corrects the previous console command. Refer: https://github.com/nvbn/thefuck
eval "$(thefuck --alias)"

#!/bin/bash

BATTINFO=`acpi -b`
if [[ `echo $BATTINFO | grep Discharging` && `echo $BATTINFO | cut -f 5 -d " "` < 00:15:00 ]] ; then
    DISPLAY=:0.0 /usr/bin/notify-send "low battery" "$BATTINFO"
fi
