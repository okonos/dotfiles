# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export DISABLE_AUTO_TITLE='true'

# replaced by update-alternatives
# Add go binaries to PATH
# export PATH=/usr/local/go/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/home/okonos/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

# Hide user@hostname when logged in as myself on local machine
DEFAULT_USER="okonos"

# set most pager to display man pages
# export MANPAGER=most

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=11000

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd.mm.yyyy"

# save every command before it is executed
setopt inc_append_history

# retrieve the history file every time history is called upon
# setopt share_history
# Disable share_history
unsetopt share_history

setopt HIST_IGNORE_SPACE

# History - ignore these commands
HISTORY_IGNORE="(reboot|poweroff|ls|cd|fg|clear|pwd|htop|exit)"

# Uncomment and remove references to oh-my-zsh to replace agnoster powerline
#if [[ -r ~/.local/lib/python3.5/site-packages/powerline/bindings/zsh/powerline.zsh ]]; then
#	source ~/.local/lib/python3.5/site-packages/powerline/bindings/zsh/powerline.zsh
#fi

# Better ls colors
eval `dircolors ~/.solarized/dircolors.256dark`

# zmv autoload
autoload -U zmv

setopt extendedglob

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

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

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# zsh-syntax-highlighting must be last on the list!
plugins=(git virtualenvwrapper autojump zsh-autosuggestions \
	zsh-syntax-highlighting)  # must be last on the list!

# Docker compose completion
fpath=(~/.zsh/completion $fpath)

# Load compinit
autoload -Uz compinit && compinit -i

# Disable default virtualenv prompt (replaced by agnoster's powerline prompt)
export VIRTUAL_ENV_DISABLE_PROMPT=1

source $ZSH/oh-my-zsh.sh

# aws-cli completion
source /usr/local/bin/aws_zsh_completer.sh

# User configuration

# set GOPATH
export GOPATH=$HOME/src/go

# set Go bin path
export GOBIN=$GOPATH/bin

# autosuggestions color
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=242'

# bind ctrl+space to accept the current suggestion
bindkey '^ ' autosuggest-accept

# remap Ctrl+u to backward-kill-line (by default is kill-whole-line)
bindkey \^U backward-kill-line

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

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
# Personal aliases placed in ZSH_CUSTOM/.aliases
# (.oh-my-zsh/custom/aliases.zsh)

