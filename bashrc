# .bashrc
#
# This file is read by bash every time a shell starts.  Only put bash
# specific things (aliases, unexported variables) here.  Exported
# environment variables should be in .envrc, and path changes in .pathrc.

# Do not take the following lines out unless you're really sure of
# what you are doing.
source ~/.git-prompt.sh


# Powerline status
#PS1='\[\e[38;5;250m\]\[\e[48;5;240m\] \u \[\e[48;5;238m\]\[\e[38;5;240m\]\[\e[0m\]\[\e[38;5;250m\]\[\e[48;5;238m\] \h \[\e[48;5;166m\]\[\e[38;5;238m\]\[\e[0m\]\[\e[38;5;254m\]\[\e[48;5;166m\] ☎ \[\e[48;5;31m\]\[\e[38;5;166m\]\[\e[0m\]\[\e[38;5;15m\]\[\e[48;5;31m\] ~ \[\e[48;5;237m\]\[\e[38;5;31m\]\[\e[0m\]\[\e[38;5;254m\]\[\e[48;5;237m\] .vim \[\e[48;5;236m\]\[\e[38;5;237m\]\[\e[0m\]\[\e[38;5;15m\]\[\e[48;5;236m\] \$ \[\e[0m\]\[\e[38;5;236m\]\[\e[0m\]'

PS1='\[\e[1m\]\[[\D{%d %H:%M}] \[\e[1;36m\]\u\[\e[1;31m\]@\[\e[1;36m\]\h: \[\e[1;33m\]\w\[\e[1;32m\]\[$(__git_ps1 " (%s)")\[\e[1;36m\]\[\e[1;31m\]> \[\e[0m\]'

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
