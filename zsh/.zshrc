#!/usr/bin/env zsh
# shellcheck disable=SC2034
ZDOTDIR=~/.zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
export XDG_CONFIG_HOME=$HOME/.config
alias vi="nvim"
source ${ZDOTDIR:-~}/antidote/antidote.zsh
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
if [[ -d "$HOME/.completions" ]]; then
  export FPATH=$HOME/.completions:$FPATH
fi
[[ ! -f ${ZDOTDIR:-~}/p10k.zsh ]] || source ${ZDOTDIR:-~}/p10k.zsh
# Conditional Configurations {{{
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
if [[ -f "$HOME/.zshrc.local" ]]; then
  source "${HOME}/.zshrc.local"
fi
if [[ -f "$HOME/.ripgreprc" ]]; then
  export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"
fi
if which tmuxinator > /dev/null; then
  alias "tm=tmuxinator"
fi
if which kubecolor > /dev/null; then
  alias kubectl="kubecolor"
fi
alias k="kubectl"
# }}}
# Aliases {{{
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
alias ls=' ls --color=auto --hyperlink=auto'
alias sudo="sudo "
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias kdebug='_kdebug() { kubectl run -i --rm --tty debug --image jonlabelle/network-tools --restart=Never -- sh; }; _kdebug'
alias codemusic="mpv --no-video --shuffle 'https://www.youtube.com/playlist?list=PLUja9J5M1XReqoBal5IKog_PWz2Q_hZ7Y'"
alias shantytime="mpv --no-video -shuffle 'https://www.youtube.com/playlist?list=PLfxnB1YXnxp7ADOru6TZAv1sfQhE-7ht7'"
export TMPDIR='/tmp/'
export HISTFILE=~/.histfile
export HISTSIZE=10000
export SAVEHIST=10000
export DIRCOLORS=truecolor
setopt SHARE_HISTORY
export ZSH_AUTOSUGGEST_STRATEGY=(history completion) 
# }}}
zstyle ':completion:*' completer _complete _ignored _correct #_approximate
zstyle ':autocomplete:*' insert-unambiguous yes
autoload edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line
if [[ -f ~/.zshrc.local ]]; then
  source ~/.zshrc.local
fi
autoload -U compinit && compinit
antidote load
if which kubectl > /dev/null 2>&1; then
  compdef kubecolor=kubectl
fi
autoload -Uz promptinit && promptinit && prompt powerlevel10k
# vim: ft=sh

