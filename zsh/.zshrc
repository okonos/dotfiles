# UTILITY FUNCTIONS

# Returns whether the command is present
_has() {
	return $( which $1 >/dev/null )
}

mdf() {
    pandoc -t plain "$1" | less
}

export PATH=$PATH:$HOME/.local/bin

export DISABLE_AUTO_TITLE='true'

# replaced by update-alternatives
# Add go binaries to PATH
# export PATH=/usr/local/go/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

# Hide user@hostname when logged in as myself on local machine
DEFAULT_USER="$USER"

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
plugins=(git virtualenvwrapper zsh-autosuggestions knife \
	zsh-syntax-highlighting)  # must be last on the list!

# fedora -- autojump installed manually
# oh-my-zsh/plugins script does not take into account fedora's package
[[ -s "$HOME/.autojump/etc/profile.d/autojump.sh" ]] && source "$HOME/.autojump/etc/profile.d/autojump.sh"

autoload -U compinit && compinit -u


# Docker compose completion
fpath=(~/.zsh/completion $fpath)

# Load compinit
autoload -Uz compinit && compinit -i

# Disable default virtualenv prompt (replaced by agnoster's powerline prompt)
export VIRTUAL_ENV_DISABLE_PROMPT=1

source $ZSH/oh-my-zsh.sh

# aws-cli completion
[[ -s /usr/local/bin/aws_zsh_completer.sh ]] && source /usr/local/bin/aws_zsh_completer.sh

# User configuration

# set GOPATH
export GOPATH=$HOME/src/go

# set Go bin path
export GOBIN=$GOPATH/bin

# autosuggestions color
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=242'
# disable autosuggestions for large buffers
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=40
# fetch suggestions asynchronously
zmodload zsh/zpty
export ZSH_AUTOSUGGEST_USE_ASYNC=true

# bind ctrl+space to accept the current suggestion
bindkey '^ ' autosuggest-accept

# remap Ctrl+u to backward-kill-line (by default is kill-whole-line)
bindkey \^U backward-kill-line

# load fzf zsh bindings; Ctrl-t to run in shell, also **<TAB>
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# fzf + ag configuration
if _has fzf && _has ag; then
	export FZF_DEFAULT_COMMAND='ag -g ""'
	export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    # https://github.com/ggreer/the_silver_searcher/issues/1016
    # ag does not support directory listing (like find -type d)
	# export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
    # from: https://github.com/junegunn/fzf/wiki/Color-schemes
    _gen_fzf_default_opts() {
      local base03="234"
      local base02="235"
      local base01="240"
      local base00="241"
      local base0="244"
      local base1="245"
      local base2="254"
      local base3="230"
      local yellow="136"
      local orange="166"
      local red="160"
      local magenta="125"
      local violet="61"
      local blue="33"
      local cyan="37"
      local green="64"

      # Solarized Dark color scheme for fzf
      export FZF_DEFAULT_OPTS="
      --color fg:-1,bg:-1,hl:$blue,fg+:$base2,bg+:$base02,hl+:$blue
      --color info:$yellow,prompt:$yellow,pointer:$base3,marker:$base3,spinner:$yellow
      --height 10% --reverse
      "
    }
    _gen_fzf_default_opts

fi

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='vim'
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

