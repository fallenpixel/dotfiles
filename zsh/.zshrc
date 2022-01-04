# Use Antigen {{{

source $HOME/.dotfiles/antigen/antigen.zsh
antigen use oh-my-zsh
antigen bundle git
antigen bundle docker
antigen bundle colored-man-pages
antigen bundle zpm-zsh/colorize
antigen bundle unixorn/autoupdate-antigen.zshplugin
antigen bundle greymd/docker-zsh-completion
antigen bundle chrissicool/zsh-256color
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle MichaelAquilina/zsh-autoswitch-virtualenv
antigen bundle zdharma-continuum/fast-syntax-highlighting
antigen bundle zsh-users/zsh-completions
antigen bundle laurenkt/zsh-vimto
antigen bundle olets/zsh-abbr
antigen bundle nnao45/zsh-kubectl-completion
antigen bundle reegnz/jq-zsh-plugin
antigen theme romkatv/powerlevel10k

# }}}
# Conditional Configuration {{{
if [[ "$HOST" = shadow ]]; then
  export LIBVIRT_DEFAULT_URI="qemu+ssh://katyl@casterlyrock/system"
  export DOCKER_HOST=ssh://katyl@casterlyrock
fi
if [[ -d ~/.bin/ ]]; then
  export PATH=$PATH:~/.bin
fi
if [[ -d ~/.local/bin ]]; then
  export PATH=$PATH:~/.local/bin
fi
if [[ -e /usr/bin/bat ]] then
  alias cat='bat'
fi
if [[ -e /usr/bin/lsd ]] then
  alias ls='lsd'
else
  alias ls='ls --color=auto'
fi
if [[ -f ~/.zshrc.local ]]; then
  source ~/.zshrc.local
fi
# }}}
# Personal Configuration {{{
SUDO_PROMPT="Enter password: "
ANSIBLE_NOCOWS=1
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=6"
export EDITOR="nvim"
alias vi="nvim"
alias vim="nvim"
alias top="htop"
alias cd=" cd"
alias sudo="sudo "
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias codemusic="mpv --no-video --shuffle 'https://www.youtube.com/playlist?list=PLUja9J5M1XReqoBal5IKog_PWz2Q_hZ7Y'"
alias shantytime="mpv --no-video -shuffle 'https://www.youtube.com/playlist?list=PLfxnB1YXnxp7ADOru6TZAv1sfQhE-7ht7'"
export TMPDIR='/tmp/'
export VAGRANT_DEFAULT_PROVIDER=libvirt
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
zstyle ':completion:*' completer _complete _ignored _correct _approximate
autoload edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line
bindkey -M vicmd x run-help
function foreground-nvim(){fg %nvim}
zle -N foreground-nvim
bindkey -M vicmd z foreground-nvim
# }}}
# Bookmarks {{{
hash -d -- dotfiles=$HOME/.dotfiles/
hash -d -- git=$HOME/git/
# }}}
# Final Sourcing {{{
source ~/.p10k.zsh
autoload -Uz compinit
compinit
antigen apply
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# }}}
# vim: ft=sh
