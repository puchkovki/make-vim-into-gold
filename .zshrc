# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="gentoo"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=10

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    alias-tips
    colored-man-pages
    sudo
    vscode
    zsh-syntax-highlighting
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# User configuration

export EDITOR='vi'

# fo [FUZZY PATTERN] - Open the selected file with the default editor
#   - Bypass fuzzy finder if there's only one match (--select-1)
#   - Exit if there's no match (--exit-0)
fo() {
    local files
    IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
    [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}

alias vi='mvim -v'
alias t=tmux

alias mount='mount | column -t'
alias path='echo -e ${PATH//:/\\n}'
alias wget='wget -c'
alias reload="exec /bin/zsh -l"
alias myip="curl http://ipecho.net/plain; echo"
alias mkcd='foo(){ mkdir -p "$1"; cd "$1" }; foo '
alias l.="ls -d .*"
alias cd..='cd ..'

alias now='date +"%T"'
alias nowtime=now
alias nowdate='date +"%d-%m-%Y"'

alias wake="echo $'\a'"

alias dc='docker-compose'

# Confirmation
alias mv='mv -i'
alias cp='cp -i -r'
alias ln='ln -i'

alias scp='scp -r'
alias rm='rm -r'
alias mkdir='mkdir -p'

# Golang
# export GOPATH=$HOME/go

# PATH
export PATH=$PATH:~/bin
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:/usr/local/sbin

# Status bar + git

setopt prompt_subst

# source ~/.git_status_line/zshrc.sh

autoload -U compinit && compinit

if [[ -n "$SSH_CLIENT" || -n "$SSH2_CLIENT" ]]; then
    if [[ $EUID == 0 ]]; then
        PROMPT=$'%F{red}%B%~ %b%f%F{blue}%B# %b%f' # root
    else
        PROMPT=$'%F{yellow}%B%~ %b%f%F{blue}%B$ %b%f' # regular user
    fi
    # right prompt with hostname or bad smiley
    RPROMPT=$'%(?,${vcs_info_msg_0_} %F{blue}%n%f,%F{red}%Bfailed%b%f)'
    #RPROMPT=$'%(?,$(git_super_status) %F{blue}ssh %n%f,%F{red}%Bfailed%b%f)'

else # not SSH
    if [[ $EUID == 0 ]]; then
        PROMPT=$'%F{red}%B%~ %b%f%F{yellow}%B# %b%f' # root
    else
        PROMPT=$'%F{green}%B%~ %b%f%F{blue}%B$ %b%f' # regular user
    fi
    # right prompt with hostname or bad smiley
    RPROMPT=$'%(?,${vcs_info_msg_0_} %F{blue}%n%f,%F{red}%Bfailed%b%f)'
    #RPROMPT=$'%(?,$(git_super_status) %F{blue}%n%f,%F{red}%Bfailed%b%f)'
fi

# GPG
export GPG_TTY=$(tty)

# Disable homebrew auto update
export HOMEBREW_NO_AUTO_UPDATE=1

export PATH="/usr/local/opt/openjdk/bin:$PATH"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
