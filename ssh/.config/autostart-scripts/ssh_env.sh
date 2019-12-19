#!/bin/sh
export SSH_ASKPASS=/usr/bin/ksshaskpass
exec '/usr/bin/ssh-add' $HOME/.ssh/digitalocean_rsa $HOME/.ssh/git_rsa $HOME/.ssh/id_ed25519 $HOME/.ssh/inf_rsa $HOME/.ssh/personal_rsa </dev/null
exit

