Plug 'eddyekofo94/gruvbox-flat.nvim'
Plug 'ryanoasis/vim-devicons'
augroup GruvboxOverrides
  autocmd!
autocmd User PlugLoaded ++nested let g:gruvbox_flat_style = "hard"
autocmd User PlugLoaded ++nested colorscheme gruvbox-flat
