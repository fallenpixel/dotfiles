source ~/.dotfiles/antigen/antigen.zsh
antigen use oh-my-zsh
#ZSH Options
setopt=HIST_IGNORE_SPACE
#THEMEING
if [[ $OS_CHECK != WINDOWS ]]; then
    export TERM="xterm-256color"
    POWERLEVEL9K_MODE='nerdfont-complete'
    POWERLEVEL9K_TIME_ICON=$'\ue382 '
    POWERLEVEL9K_HOME_ICON='\UE764'
    POWERLEVEL9K_SUB_ICON='\UF07C'
    POWERLEVEL9K_FOLDER_ICON='\UF07B'
    POWERLEVEL9K_STATUS_OK_ICON='\UF2B0'
    POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
    POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
    POWERLEVEL9K_STATUS_VERBOSE=true
    POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon context newline status dir vcs)
    if [[ $HOST = shadow ]]; then
    POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(ram load background_jobs time)
    else;
    POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(time)
    fi
    POWERLEVEL9K_TIME_FORMAT="%T"
    POWERLEVEL9K_SHOW_CHANGESET=true
   # POWERLEVEL9K_CHANGESET_HASH_LENGTH=6
    POWERLEVEL9K_PROMPT_ON_NEWLINE=false
    antigen theme bhilburn/powerlevel9k powerlevel9k --branch=master
else;
    antigen theme haribo/omz-haribo-theme haribo
fi
#BASIC PLUGINS
#antigen bundle git
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle zsh-users/zsh-syntax-highlighting
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
alias clip='xclip -selection c'
if [ -d ~/.bin/ ]; then
    export PATH=$PATH:~/.bin
fi
bindkey -v
antigen apply
bindkey '^ ' autosuggest-accept
#export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
