Plug 'nvim-lualine/lualine.nvim'
" If you want to have icons in your statusline choose one of these
Plug 'kyazdani42/nvim-web-devicons'
augroup lspOverrides
  autocmd!
  autocmd User PlugLoaded ++nested source ~/.config/nvim/plugins/lualine.lua
augroup end
