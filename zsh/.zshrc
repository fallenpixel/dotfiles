#          _
#  _______| |__
# |_  / __| '_ \
#  / /\__ \ | | |
# /___|___/_| |_|

# Use Antigen {{{
autoload -Uz compinit
compinit

source "$HOME/.dotfiles/antigen/antigen.zsh"
# antigen use oh-my-zsh
# antigen bundle git
# antigen bundle docker
antigen bundle colored-man-pages
antigen bundle zpm-zsh/colorize
antigen bundle vagrant-prompt
antigen bundle unixorn/autoupdate-antigen.zshplugin
antigen bundle greymd/docker-zsh-completion
#antigen bundle chrissicool/zsh-256color
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle MichaelAquilina/zsh-autoswitch-virtualenv
antigen bundle zdharma-continuum/fast-syntax-highlighting
antigen bundle zsh-users/zsh-completions
antigen bundle laurenkt/zsh-vimto
antigen bundle olets/zsh-abbr
antigen bundle reegnz/jq-zsh-plugin
antigen theme romkatv/powerlevel10k
if [[ "$TERM" = "xterm-kitty" ]]; then
  antigen bundle redxtech/zsh-kitty
fi

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
if [[ -d ~/.go/bin ]]; then
  export PATH=$PATH:~/.go/bin
fi
if [[ -e /usr/bin/bat ]]; then
  alias cat='bat'
fi
alias ls='ls --color=auto --hyperlink=auto'
if [[ -f "$HOME/.zshrc.local" ]]; then
  source "${HOME}/.zshrc.local"
fi
if which kubectl >/dev/null; then
  source <(kubectl completion zsh)
fi
if which glab > /dev/null; then
  source <(glab completion -s zsh)
fi
if which podman >/dev/null; then
  source <(podman completion zsh)
fi
if [[ -f "$HOME/.ripgreprc" ]]; then
  export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"
fi
if which tmuxinator > /dev/null; then
  alias "tm=tmuxinator"
fi
if [[ -d "$HOME/.completions" ]]; then
  export FPATH=$FPATH:$HOME/.completions
fi
# }}}
# Personal Configuration {{{
export SUDO_PROMPT="Enter password:  "
export ANSIBLE_NOCOWS=1
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=6"
export EDITOR="/usr/local/bin/nvim"
export PAGER="less"
export LESS="-iFXR"
export DIFFPROG="nvim -d"
export GOPATH="${HOME}/.go"
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
export HISTFILE=~/.histfile
export HISTSIZE=10000
export SAVEHIST=10000
export DIRCOLORS=truecolor
setopt SHARE_HISTORY
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
zstyle ':completion:*' completer _complete _ignored _correct _approximate
autoload edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# }}}
# Bookmarks {{{
hash -d -- dotfiles=$HOME/.dotfiles/
hash -d -- git=$HOME/git/
# }}}
# Final Sourcing {{{
#disable
source "$HOME/.p10k.zsh"
autoload -Uz compinit
compinit
antigen apply
if [[ "$TERM" = "xterm-kitty" ]]; then
  __kitty_complete
fi
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# }}}
# vim: ft=sh
