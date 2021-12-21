# Path to your dotfiles.
export DOTFILES=$HOME/.dotfiles

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

export PATH="/usr/local/bin:$PATH"

source /usr/local/share/antigen/antigen.zsh

export LSCOLORS='exfxcxdxbxegedabagacad'
export CLICOLOR=true
export VSCODE=code
export EDITOR="$VSCODE -w"
export VISUAL=$EDITOR
export TERM="xterm-256color"
export PAGER='less'
export LESS='-giAMR'

# Load local sh, export, for example export GOPATH, export JAVA_HOME, export ANDROID_SDK, etc...
[[ -s "$HOME/.export" ]] && source "$HOME/.export"

# Load the oh-my-zsh's library
antigen use oh-my-zsh

alias be="bundle exec"
alias c="console"


# Enable completions
autoload -Uz compinit && compinit

# Minimal - Theme Settings
export MNML_INSERT_CHAR="$"
export MNML_PROMPT=(mnml_git mnml_keymap)
export MNML_RPROMPT=('mnml_cwd 20')


# bundle antigen zsh plugins @ https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins
antigen bundles <<EOBUNDLES
	common-aliases
	history 
	git 
	docker 
	zsh_reload 
	zsh-users/zsh-completions
	zsh-users/zsh-autosuggestions
  unixorn/autoupdate-antigen.zshplugin
EOBUNDLES

# Load the theme @ https://github.com/robbyrussell/oh-my-zsh/tree/master/themes/
# Load the theme
# simple and fast
# antigen theme steeef
antigen theme candy
# antigen theme bhilburn/powerlevel9k powerlevel9k
# cool but slow
# antigen theme https://github.com/denysdovhan/spaceship-zsh-theme spaceship

# syntax highlighting must come below the bundle to set the correct paths/variables with history search
antigen bundle zdharma/fast-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search

# Tell antigen that you're done
antigen apply

# bind keys
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# Extra zsh variables - history, auto-completion etc...
HISTFILE=~/.zsh_history         # where to store zsh config
HISTSIZE=10240000               # big history
SAVEHIST=10240000               # big history
LISTMAX=999999


# auto-completion with selection / menu / error correction / cache / etc...
zstyle ':completion:*:*:*:*:*' menu select

zstyle ':completion:*' verbose true
zstyle ':completion:*' menu yes select=1
zstyle ':completion:*' substitute 0
zstyle ':completion:*' max-errors 2 not-numeric
zstyle ':completion:*' original true
zstyle ':completion:*' use-cache true
zstyle ':completion:*' cache-path ~/.zsh/cache              
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' file-sort links reverse
zstyle ':completion:*:commands' rehash true
zstyle ':completion:*:functions' ignored-patterns '_*'

zstyle ':completion:*' completer _expand _complete _approximate
zstyle ':completion:*' completions 1
zstyle ':completion:*' glob 1
zstyle ':completion:*' group-name ''
zstyle ':completion:*' ignore-parents parent pwd ..
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' matcher-list '' '+m:{a-z}={A-Z} r:|[._-]=* r:|=*' '' 'l:|=* r:|=*'
zstyle ':completion:*:messages' format $'\e[00;31m%d'
zstyle ':completion:*:descriptions' format "- %d -"
zstyle ':completion:*:corrections' format "- %d - (errors %e})"
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle -e ':completion:*:default' list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)*==36=36}:${(s.:.)LS_COLORS}")';

zstyle ':filter-select:highlight' matched fg=red
zstyle ':filter-select' max-lines 1000
zstyle ':filter-select' rotate-list yes
zstyle ':filter-select' case-insensitive yes # enable case-insensitive search

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

. $HOME/.asdf/asdf.sh

. $HOME/.asdf/completions/asdf.bash

eval "$(direnv hook zsh)"
eval "$(ssh-add -K ~/.ssh/id_rsa)"



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


HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$DOTFILES

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

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
# alias ohmyzsh="mate ~/.oh-my-zsh"
