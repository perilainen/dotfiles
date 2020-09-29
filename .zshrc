export TERM="xterm-256color"
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# Path to your oh-my-zsh installation.
export ZSH="/Users/perjohansson/.oh-my-zsh"
export GOPATH=$HOME/go
#export GOPRIVATE=git.svt.se
export PATH=$PATH:$GOPATH/bin
export SVT_NPM_EMAIL="per.a.johansson@svt.se"
export SVT_NPM_READONLY_AUTH="bnBtLXJlYWRlci0yMDE5OnFGRkpoVndhdDNuNW5QTmJlN0cybTY5QnFadUdpSk56VFNnVmNXdWRjcHZRYnlzTGs1UUVYNDk4Z0RoZGZ2QjM="
#export SVT_NPM_DEPLOY_AUTH="ZGVwbG95ZXItdW5kZXJ0ZXh0OlplU2lpcTYyU2hxY2hnUUtQYnI3UEhFTUgzOTN4RERMQUdLTnN1Qmd5UkVhWnJUbVU4azdXeDNMNkc5Yjh3ZG4K"
export SVT_NPM_DEPLOY_AUTH="ZGVwbG95ZXItdW5kZXJ0ZXh0OlplU2lpcTYyU2hxY2hnUUtQYnI3UEhFTUgzOTN4RERMQUdLTnN1Qmd5UkVhWnJUbVU4azdXeDNMNkc5Yjh3ZG4="

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="robbyrussell"
POWERLEVEL9K_MODE='nerdfont-complete'
ZSH_THEME="powerlevel9k/powerlevel9k"
# Set list of themes to pick from when loading at random
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='yellow'
POWERLEVEL9K_DIR_HOME_BACKGROUND='red'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='red'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='black'
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(docker git z colored-man-pages colorize pip python brew osx zsh-syntax-highlighting virtualenv docker-compose kubectl golang vi-mode)
source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh
alias dgit="git --git-dir ~/.dotfiles/.git --work-tree=$HOME"
alias lsa="ls -lah"
alias stxdistans="ssh -L 5000:stx.svt.se:443 smash.svt.se"
alias moln="ssh -t cli@sthlm.molnet.svt.se --"
alias pip="pip3"
alias d="dirs -v"
alias 1='cd -'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'
alias startTB='cd "/Users/perjohansson/SVT/tiebreak-services" && docker-compose up & go run serve/cmd/server/main.go & sleep 5; go run flow/cmd/server/main.go &'
alias dockerkillall='docker stop $(docker ps -a -q)'
alias syn='f() { curl -X GET "https://words.bighugelabs.com/api/2/b323549c57bd44dacf9f29691d0c47af/$1/json" };f'
# Virtualenvwrapper things
export WORKON_HOME=$HOME/.virtualenvs/
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
export PROJECT_HOME=$HOME/Devel
source /usr/local/bin/virtualenvwrapper.sh
#POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=( dir newline vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status history virtualenv)
POWERLEVEL9K_SHORTEN_DIR_LENGTH='3'
setopt histignorealldups
setopt histignorespace

# pip zsh completion start
function _pip_completion {
  local words cword
  read -Ac words
  read -cn cword
  reply=( $( COMP_WORDS="$words[*]" \
             COMP_CWORD=$(( cword-1 )) \
             PIP_AUTO_COMPLETE=1 $words[1] ) )
}
compctl -K _pip_completion pip3
# pip zsh completion end


# pip zsh completion start
function _pip_completion {
  local words cword
  read -Ac words
  read -cn cword
  reply=( $( COMP_WORDS="$words[*]" \
             COMP_CWORD=$(( cword-1 )) \
             PIP_AUTO_COMPLETE=1 $words[1] ) )
}
compctl -K _pip_completion pip
# pip zsh completion end
fpath+=($ZSH/plugins/docker)
autoload -U compinit && compinit

function mountmeta(){
	sshfs -o idmap=user root@$1:/ardome/fs0/hr /tmp/$1
	cd /tmp/$1
}

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

source <(kubectl completion zsh | sed '/"-f"/d')
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/mc mc

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files'
  export FZF_DEFAULT_OPTS='-m --height 50% --border'
fi
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
function zle-keymap-select zle-line-init
{
    # change cursor shape in iTerm2
    case $KEYMAP in
        vicmd)      print -n -- "\E]50;CursorShape=0\C-G";;  # block cursor
        viins|main) print -n -- "\E]50;CursorShape=1\C-G";;  # line cursor
    esac

    zle reset-prompt
    zle -R
}

function zle-line-finish
{
    print -n -- "\E]50;CursorShape=0\C-G"  # block cursor
}

zle -N zle-line-init
zle -N zle-line-finish
zle -N zle-keymap-select
