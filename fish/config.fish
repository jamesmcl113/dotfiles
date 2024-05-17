if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -gx EDITOR vim
alias vi="nvim"
alias vim="nvim"
alias g="git"

bind \el 'clear; commandline -f repaint'
