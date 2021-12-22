local map = vim.api.nvim_set_keymap
local default_options = {noremap = true, silent = true}
-- local expr_options = {noremap = true, expr = true, silent = true}

map("n", "<leader>vr", ":source ~/.config/nvim/init.lua<cr>", default_options)
map("n", "<leader>ve", ":edit ~/.config/nvim/init.lua<cr>", default_options)
map("n", "<ESC>", ":nohlsearch<Bar>:echo<CR>", default_options)
map("n", "gf", ":edit <cfile><cr>", default_options)
map("n", "<leader>l", ":set list!<cr>", default_options)
map("n", "<C-t>h", ":tabr<cr>", default_options)
map("n", "<C-t>l", ":tabl<cr>", default_options)
map("n", "<C-t>j", ":tabn<cr>", default_options)
map("n", "<C-t>k", ":tabp<cr>", default_options)
map("n", "<C-t>t", ":tabnew<cr>", default_options)
map("n", "<leader>r", ":lua vim.lsp.buf.formatting_sync(nil,100)<cr>", default_options)
