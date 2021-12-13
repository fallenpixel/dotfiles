Plug 'EdenEast/nightfox.nvim', { 'branch': 'main' }
augroup NightfoxOverrides
  autocmd!
autocmd User PlugLoaded ++nested colorscheme nightfox
