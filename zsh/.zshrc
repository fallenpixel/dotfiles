source $HOME/.dotfiles/antigen/antigen.zsh



# Load the oh-my-zsh's library.

antigen use oh-my-zsh
antigen theme romkatv/powerlevel10k


# Bundles from the default repo (robbyrussell's oh-my-zsh).

antigen bundle unixorn/autoupdate-antigen.zshplugin
antigen bundle git
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle chrissicool/zsh-256color
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle MichaelAquilina/zsh-autoswitch-virtualenv
antigen bundle zsh-users/zsh-completions 
antigen bundle laurenkt/zsh-vimto

# Load the theme.

source ~/.p10k.zsh


# Personal Configuration
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=6"
export EDITOR="vim"
alias vi="vim"
alias top="htop"
alias ls=" ls --color=auto"
alias cd=" cd"
alias sudo="sudo "
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias cop='cd ~/Documents/School/UF/Summer\ 19/COP3503'
alias cot='cd ~/Documents/School/UF/Summer\ 19/COT3100'

if [ -d ~/.bin/ ]; then
export PATH=$PATH:~/.bin
fi

# Tell Antigen that you're done.

antigen apply
