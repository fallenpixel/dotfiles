local packer = require('packer')
local use = packer.use
local default_options = {noremap = true, silent = true}

use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' }
}

vim.api.nvim_set_keymap("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", default_options)
vim.api.nvim_set_keymap("n", "<leader>fg", ":Telescope live_grep<cr>", default_options)
vim.api.nvim_set_keymap("n", "<leader>fb", ":Telescope buffers<cr>", default_options)
vim.api.nvim_set_keymap("n", "<leader>fh", ":Telescope help_tags<cr>", default_options)
