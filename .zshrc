# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/hp/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="gentoo"

# Set list of themes to pick from when loading at random
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

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    alias-tips
    colored-man-pages
    sudo
    vscode
    zsh-autosuggestions
    zsh-syntax-highlighting
)

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

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh=tmate ~/.oh-my-zsh"

# fo [FUZZY PATTERN] - Open the selected file with the default editor
#   - Bypass fuzzy finder if there's only one match (--select-1)
#   - Exit if there's no match (--exit-0)
fo() {
    local files
    IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
    [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}

alias vi=vim
alias mount='mount |column -t'
alias path='echo -e ${PATH//:/\\n}'
alias wget='wget -c'
alias reload="exec /usr/bin/zsh -l"
alias myip="curl http://ipecho.net/plain; echo"
alias mkcd='foo(){ mkdir -p "$1"; cd "$1" }; foo '
alias l.="ls -d .*"
alias cd..='cd ..'

alias now='date +"%T"'
alias nowtime=now
alias nowdate='date +"%d-%m-%Y"'
alias awr='ansiweather'

alias please="sudo"

alias wake="echo $'\a'"

# confirmation #
alias mv='mv -i'
alias cp='cp -i -r'
alias ln='ln -i'

alias scp='scp -r'
alias rm='rm -r'
alias mkdir='mkdir -p'

# Parenting changing perms on / #
alias chown='chown'
alias chmod='chmod'
alias chgrp='chgrp'

export PATH=$PATH:~/bin

setopt prompt_subst

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*:*' check-for-changes true # can be slow on big repos
zstyle ':vcs_info:*:*' unstagedstr '%F{red}'
zstyle ':vcs_info:*:*' actionformats "[%F{green}%u%b%f %a]"
zstyle ':vcs_info:*:*' formats       "[%F{green}%u%b%f]"

if [[ -n "$SSH_CLIENT" || -n "$SSH2_CLIENT" ]]; then
    if [[ $EUID == 0 ]]; then
        PROMPT=$'%F{red}%B%~ %b%f%F{blue}%B# %b%f' # root
    else
        PROMPT=$'%F{yellow}%B%~ %b%f%F{blue}%B$ %b%f' # regular user
    fi
    # right prompt with hostname or bad smiley
    RPROMPT=$'%(?,${vcs_info_msg_0_} %F{blue}ssh %n%f,%F{red}%Bfailed%b%f)'

else # not SSH
    if [[ $EUID == 0 ]]; then
        PROMPT=$'%F{red}%B%~ %b%f%F{yellow}%B# %b%f' # root
    else
        PROMPT=$'%F{green}%B%~ %b%f%F{blue}%B$ %b%f' # regular user
    fi
    # right prompt with hostname or bad smiley
    RPROMPT=$'%(?,${vcs_info_msg_0_} %F{blue}%n%f,%F{red}%Bfailed%b%f)'
fi

# VSCode
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

export GPG_TTY=$(tty)

# Shortcuts for the Quotation marks and dash in Linux
# setxkbmap -option lv3:ralt_switch,nbsp:level3n,misc:typo,altwin:left_meta_win