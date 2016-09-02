source ~/.dotfiles/antigen/antigen.zsh
#ZSH Options
setopt=HIST_IGNORE_SPACE
#THEMEING
if [[ $OS_CHECK != WINDOWS ]]; then
    export TERM="xterm-256color"
    POWERLEVEL9K_MODE='awesome-fontconfig'
    POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
    POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
    POWERLEVEL9K_BATTERY_CHARGING='yellow'
    POWERLEVEL9K_BATTERY_CHARGED='green'
    POWERLEVEL9K_BATTERY_DISCONNECTED='$DEFAULT_COLOR'
    POWERLEVEL9K_BATTERY_LOW_THRESHOLD='10'
    POWERLEVEL9K_BATTERY_LOW_COLOR='red'
    POWERLEVEL9K_BATTERY_ICON='\uf1e6 '
    POWERLEVEL9K_STATUS_VERBOSE=false
    POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(status os_icon context dir vcs)
    if [[ $HOST  = pyke ]]; then
    POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(ram background_jobs time battery)
    elif [[ $HOST = kingslanding ]]; then
    POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(ram load background_jobs time)
    else;
    POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(time)
    fi
    POWERLEVEL9K_TIME_FORMAT="%D{\uf017 %H:%M}"
    POWERLEVEL9K_SHOW_CHANGESET=true
    POWERLEVEL9K_CHANGESET_HASH_LENGTH=6
    POWERLEVEL9K_PROMPT_ON_NEWLINE=true
    antigen theme bhilburn/powerlevel9k powerlevel9k
else;
    antigen theme haribo/omz-haribo-theme haribo
fi
antigen use oh-my-zsh
#BASIC PLUGINS
antigen bundle git
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle zsh-users/zsh-completions
antigen bundle hcgraf/zsh-sudo
antigen bundle robbyrussell/oh-my-zsh plugins/taskwarrior
antigen bundle robbyrussell/oh-my-zsh plugins/common-aliases
antigen bundle robbyrussell/oh-my-zsh plugins/pass
#ZSH AUTOSUGGEST
antigen bundle zsh-users/zsh-autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=6'
#Set Environmental Variables and Aliases
export EDITOR='vim'
alias vi="vim"
alias top="htop"
alias ls=' ls --color=auto'
alias cd=' cd'
alias sudo='sudo '
if [ -d ~/.bin/ ]; then
    PATH=$PATH:~/.bin
fi
bindkey -v
bindkey '^ ' autosuggest-accept
antigen apply
#export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
