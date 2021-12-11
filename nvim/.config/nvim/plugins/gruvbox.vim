Plug 'eddyekofo94/gruvbox-flat.nvim'
augroup GruvboxOverrides
  autocmd!
autocmd User PlugLoaded ++nested let g:gruvbox_flat_style = "hard"
autocmd User PlugLoaded ++nested colorscheme gruvbox-flat
