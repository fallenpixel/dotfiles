local packer = require('packer')
local use = packer.use
local default_options = {noremap = true, silent = true}

use 'scrooloose/nerdtree'
vim.api.nvim_set_keymap("n", "<leader>q", "<cmd>NERDTreeToggle<cr>", default_options)



