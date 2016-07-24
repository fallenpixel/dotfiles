source ~/.dotfiles/antigen/antigen.zsh
export TERM="xterm-256color"
POWERLEVEL9K_MODE='awesome-fontconfig'
antigen theme bhilburn/powerlevel9k powerlevel9k
antigen use oh-my-zsh
antigen bundle git
antigen bundle zsh-users/zsh-syntax-highlighting
antigen-bundle zsh-users/zsh-history-substring-search
export EDITOR='vim'
antigen apply
alias vi="vim"
alias top="htop"

