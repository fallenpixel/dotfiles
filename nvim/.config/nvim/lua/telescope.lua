local packer = require('packer')
local use = packer.use
local default_options = {noremap = true, silent = true}

use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim',
    'nvim-lua/popup.nvim',
    {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'} }
}

vim.api.nvim_set_keymap("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", default_options)
vim.api.nvim_set_keymap("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", default_options)
vim.api.nvim_set_keymap("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>", default_options)
vim.api.nvim_set_keymap("n", "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>", default_options)
vim.api.nvim_set_keymap("n", "<leader>fd", "<cmd>lua require('telescope.builtin').git_files({ hidden = true, cwd = '~/.dotfiles/'}, default_options)<cr>", default_options)
