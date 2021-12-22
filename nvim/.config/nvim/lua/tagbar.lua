local packer = require('packer')
local use = packer.use
local default_options = {noremap = true, silent = true}

use 'preservim/tagbar'

vim.api.nvim_set_keymap('n', '<leader>w', '<cmd>TagbarToggle<cr>', default_options)
