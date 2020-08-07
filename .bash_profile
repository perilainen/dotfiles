#export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
alias ls='ls -GFh'
alias lsa='ls -lah'
alias dgit='git --git-dir ~/.dotfiles/.git --work-tree=$HOME'
alias dok='cd ~/Documents'

complete -C /usr/local/bin/mc mc

export PATH="$HOME/.cargo/bin:$PATH"
