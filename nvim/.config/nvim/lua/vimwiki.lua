local packer = require ( 'packer' )
local use = packer.use
local default_options = {noremap = true, silent = true}
vim.api.nvim_set_keymap('n', '<leader>w<leader>n', '<cmd>VimwikiMakeTomorrowDiaryNote<cr>', default_options)
use('vimwiki/vimwiki')
vim.g.vimwiki_list = {{path='$HOME/.vimwiki', syntax='markdown', ext='.md'}}
vim.g.vimwiki_global_ext=0
