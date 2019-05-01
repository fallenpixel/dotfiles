source $HOME/.dotfiles/antigen/antigen.zsh
antigen use oh-my-zsh 
antigen bundle unixorn/autoupdate-antigen.zshplugin
antigen theme romkatv/powerlevel10k powerlevel10k
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle MikeDacre/tmux-zsh-vim-titles
antigen bundle popstas/zsh-command-time
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle hcgraf/zsh-sudo
antigen bundle robbyrussell/oh-my-zsh plugins/common-aliases
antigen bundle robbyrussell/oh-my-zsh plugins/pass
#ZSH Options
setopt=HIST_IGNORE_SPACE
#THEMEING
POWERLEVEL9K_MODE="nerdfont-complete"
if [[ $HOST = shadow ]]; then
	    POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(ram load background_jobs )
    else;
    	POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(time)
        POWERLEVEL9K_TIME_FORMAT="%T"
        POWERLEVEL9K_SHOW_CHANGESET=true
        POWERLEVEL9K_PROMPT_ON_NEWLINE=false
fi
    DEFAULT_USER=katyl
    POWERLEVEL9K_LINUX_ARCH_ICON="\uf300"
    POWERLEVEL9K_VCS_GIT_ICON="\Uf7a1"
    POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
    POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
    POWERLEVEL9K_DIR_SHOW_WRITABLE=true
    POWERLEVEL9K_STATUS_VERBOSE=true
    POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon time context newline ssh root_indicator status dir vcs )


#BASIC PLUGINS
#ZSH AUTOSUGGEST
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=6"
#Set Environmental Variables and Aliases
export EDITOR="vim"
alias vi="vim"
alias top="htop"
alias ls=" ls --color=auto"
alias cd=" cd"
alias sudo="sudo "
alias diff='diff --color=auto'
alias grep='grep --color=auto'

if [ -d ~/.bin/ ]; then
    export PATH=$PATH:~/.bin
fi
bindkey -v
#export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
antigen apply

