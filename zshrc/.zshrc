# Load colours and then set prompt
# Prompt preview:
# [user@hostname]-[~]
# >>>
autoload -U colors && colors
PS1="%{$fg[white]%}%B[%b%{$fg[blue]%}%n%{$fg[white]%}%B@%b%{$fg[blue]%}%m%{$fg[white]%}%B]-%b%{$fg[white]%}%B[%b%{$fg[blue]%}%~%{$fg[white]%}%B]%b
%{$fg[white]%}%B>>>%b%{$reset_color%} "

# ZSH history file
HISTSIZE=100
SAVEHIST=100
HISTFILE=~/.zsh_history

# Fancy auto-complete
autoload -Uz compinit
zstyle ':completion:*' menu select=0
zmodload zsh/complist
zstyle ':completion:*' format '>>> %d'
compinit
_comp_options+=(globdots) # hidden files are included

# Keybindings section
bindkey -e
bindkey '^[[7~' beginning-of-line                               # Home key
bindkey '^[[H' beginning-of-line                                # Home key
if [[ "${terminfo[khome]}" != "" ]]; then
  bindkey "${terminfo[khome]}" beginning-of-line                # [Home] - Go to beginning of line
fi
bindkey '^[[8~' end-of-line                                     # End key
bindkey '^[[F' end-of-line                                     # End key
if [[ "${terminfo[kend]}" != "" ]]; then
  bindkey "${terminfo[kend]}" end-of-line                       # [End] - Go to end of line
fi
bindkey '^[[2~' overwrite-mode                                  # Insert key
bindkey '^[[3~' delete-char                                     # Delete key
bindkey '^[[C'  forward-char                                    # Right key
bindkey '^[[D'  backward-char                                   # Left key
bindkey '^[[5~' history-beginning-search-backward               # Page up key
bindkey '^[[6~' history-beginning-search-forward                # Page down key

# Navigate words with ctrl+arrow keys
bindkey '^[Oc' forward-word                                     #
bindkey '^[Od' backward-word                                    #
bindkey '^[[1;5D' backward-word                                 #
bindkey '^[[1;5C' forward-word                                  #
bindkey '^H' backward-kill-word                                 # delete previous word with ctrl+backspace
bindkey '^[[Z' undo                                             # Shift+tab undo last action

export LD_PRELOAD=""
export EDITOR="vim"
export PATH="$HOME/bin:/home/austin/.local/bin:/usr/lib/ccache/bin/:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:/opt/bin:/usr/bin/core_perl:/usr/games/bin:$HOME/.cargo/bin:$PATH"

# alias
alias c="clear"
alias cd..="cd .."
alias curl="curl --user-agent 'noleak'"
alias l="ls -ahls --color=auto"
alias r="reset"
alias shred="shred -zf"
alias sl="ls --color=auto"
alias vi="nvim"
alias vim="nvim"
alias ls="ls --color=auto"
alias dir="dir --color=auto"
alias vdir="vdir --color=auto"
alias grep="grep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"
alias wget="wget -c --user-agent 'noleak'"
alias dd="dd status=progress"
alias cp="cp -i"                          # confirm before overwriting something
alias rm="rm -i"
alias mv="mv -i"
alias df="df -h"                          # human-readable sizes
alias free="free -h"
alias du="du -h"
alias todo="cat /home/austin/misc/todo.txt"
alias zathura="zathura --fork"

export TERM=alacritty
if [ -e /home/austin/.nix-profile/etc/profile.d/nix.sh ]; then . /home/austin/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

# opam configuration
[[ ! -r /home/austin/.opam/opam-init/init.zsh ]] || source /home/austin/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
# Below are the color init strings for the basic file types.
# One can use codes for 256 or more colors supported by modern terminals.
# The default color codes use the capabilities of an 8 color terminal
# with some additional attributes as per the following codes:
# Attribute codes:
# 00=none 01=bold 04=underscore 05=blink 07=reverse 08=concealed
# Text color codes:
# 30=black 31=red 32=green 33=yellow 34=blue 35=magenta 36=cyan 37=white
# Background color codes:
# 40=black 41=red 42=green 43=yellow 44=blue 45=magenta 46=cyan 47=white
#NORMAL 00 # no color code at all
#FILE 00 # regular file: use no color at all
export LS_COLORS="di=01;38;5;241:ln=01;38;5;247:ex=01;38;5;160:"



[ -f "/home/austin/.ghcup/env" ] && source "/home/austin/.ghcup/env" # ghcup-env
