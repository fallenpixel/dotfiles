source ~/.dotfiles/antigen/antigen.zsh
#THEMEING
export TERM="xterm-256color"
POWERLEVEL9K_MODE='awesome-fontconfig'
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(status os_icon load context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(time)
POWERLEVEL9K_SHOW_CHANGESET=true
POWERLEVEL9K_CHANGESET_HASH_LENGTH=6
antigen theme bhilburn/powerlevel9k powerlevel9k
antigen use oh-my-zsh
#BASIC PLUGINS
antigen bundle git
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle zsh-users/zsh-completions
#ZSH AUTOSUGGEST
antigen bundle zsh-users/zsh-autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=6'
bindkey '^ ' autosuggest-accept
#Set Environmental Variables and Aliases
export EDITOR='vim'
alias vi="vim"
alias top="htop"
antigen apply

