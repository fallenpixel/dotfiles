# Fallenpixel's Dotfiles

These dotfiles are meant to be managed by GNU stow. In essence, each folder in
the root of the repository can be considered a module which can be deployed
using `stow <package_name>`, i.e. `stow nvim` to deploy the neovim
configurations. The exception to this is the antigen module which is sourced
directly from the repository location.
