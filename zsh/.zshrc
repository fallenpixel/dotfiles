# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
if [ "$HOST" = pyke ]; then
    alias offload='__NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME="nvidia" __VK_LAYER_NV_optimus="NVIDIA_only" __GL_SHOW_GRAPHICS_OSD=1'
fi
source $HOME/.dotfiles/antigen/antigen.zsh



# Load the oh-my-zsh's library.

antigen use oh-my-zsh
antigen theme romkatv/powerlevel10k


# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle colored-man-pages
antigen bundle unixorn/autoupdate-antigen.zshplugin
antigen bundle git
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle chrissicool/zsh-256color
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle MichaelAquilina/zsh-autoswitch-virtualenv
antigen bundle zdharma/fast-syntax-highlighting
antigen bundle zsh-users/zsh-completions 
antigen bundle laurenkt/zsh-vimto
antigen bundle 

# Load the theme.

source ~/.p10k.zsh


# Personal Configuration
SUDO_PROMPT="Enter password: "
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=6"
export EDITOR="nvim"
alias vi="nvim"
alias vim="nvim"
alias top="htop"
alias ls=" ls --color=auto"
alias cd=" cd"
alias sudo="sudo "
alias diff='diff --color=auto'
alias grep='grep --color=auto'
MANPAGER='nvim -c "set ft=man" -'

if [ -d ~/.bin/ ]; then
export PATH=$PATH:~/.bin
fi

# Tell Antigen that you're done.

antigen apply
