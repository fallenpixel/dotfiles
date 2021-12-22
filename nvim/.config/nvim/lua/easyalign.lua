local packer = require('packer')
local use = packer.use

use 'junegunn/vim-easy-align'
vim.api.nvim_set_keymap('n', 'ga', '<Plug>(EasyAlign)', {silent = true, noremap = false})
vim.api.nvim_set_keymap('x', 'ga', '<Plug>(EasyAlign)', {silent = true, noremap = false})
