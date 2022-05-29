local map = vim.keymap.set

map("n", "<leader>vr",         ":source ~/.config/nvim/init.lua<cr>")
map("n", "<leader>ve",         ":edit ~/.config/nvim/init.lua<cr>")
map("n", "<ESC>",              ":nohlsearch<Bar>:echo<CR>")
map("n", "gf",                 ":edit <cfile><cr>")
map("n", "<leader>l",          ":set list!<cr>")
map("n", "<C-t>h",             ":tabr<cr>")
map("n", "<C-t>l",             ":tabl<cr>")
map("n", "<C-t>j",             ":tabn<cr>")
map("n", "<C-t>k",             ":tabp<cr>")
map("n", "<C-t>t",             ":tabnew<cr>")
map("n", "<leader>r",          ":lua vim.lsp.buf.formatting_sync(nil,100)<cr>")
map("n", "<leader>ss",         ":set spell!<cr>")
map("n", "<leader>sd",         "a<C-X>s")
map('n', 'ga',                 '<Plug>(EasyAlign)')
map('x', 'ga',                 '<Plug>(EasyAlign)')
map('n', '<leader>w',          '<cmd>TagbarToggle<cr>')
map("n", "<leader>q",          '<cmd>NERDTreeToggle<cr>')
map('n', '<leader>w',          '<cmd>TagbarToggle<cr>')
map('n', 'gD',                 '<cmd>lua vim.lsp.buf.declaration()<CR>')
map('n', 'gd',                 '<cmd>lua vim.lsp.buf.definition()<CR>')
map('n', 'K',                  '<cmd>lua vim.lsp.buf.hover()<CR>')
map('n', 'gi',                 '<cmd>lua vim.lsp.buf.implementation()<CR>')
map('n', '<C-k>',              '<cmd>lua vim.lsp.buf.signature_help()<CR>')
map('n', '<space>wa',          '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>')
map('n', '<space>wr',          '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>')
map('n', '<space>wl',          '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>')
map('n', '<space>D',           '<cmd>lua vim.lsp.buf.type_definition()<CR>')
map('n', '<space>rn',          '<cmd>lua vim.lsp.buf.rename()<CR>')
map('n', '<space>ca',          '<cmd>lua vim.lsp.buf.code_action()<CR>')
map('n', 'gr',                 '<cmd>lua vim.lsp.buf.references()<CR>')
map('n', '<space>e',           '<cmd>lua vim.diagnostic.open_float()<CR>')
map('n', '[d',                 '<cmd>lua vim.diagnostic.goto_prev()<CR>')
map('n', ']d',                 '<cmd>lua vim.diagnostic.goto_next()<CR>')
map('n', '<space>q',           '<cmd>lua vim.diagnostic.setloclist()<CR>')
map('n', '<leader>fm',         '<cmd>lua vim.lsp.buf.formatting()<CR>')
map("n", "<C-a>",              "<Plug>(dial-increment)")
map("v", "<C-a>",              "<Plug>(dial-increment)")
map("n", "<C-x>",              "<Plug>(dial-decrement)")
map("v", "<C-x>",              "<Plug>(dial-decrement)")
map("v", "g<C-a>",             "<Plug>(dial-increment-additional)")
map("v", "g<C-x>",             "<Plug>(dial-decrement-additional)")
map('n', '<leader>w<leader>n', '<cmd>VimwikiMakeTomorrowDiaryNote<cr>')
map("n", "<leader>ff",         "<cmd>Telescope find_files theme=ivy<cr>")
map("n", "<leader>fg",         "<cmd>Telescope live_grep theme=ivy<cr>")
map("n", "<leader>fb",         "<cmd>Telescope buffers theme=cursor<cr>")
map("n", "<leader>fh",         "<cmd>Telescope help_tags<cr>")
map("n", "<leader>fd",         "<cmd>Telescope git_files hidden=true cwd=~/.dotfiles theme=ivy<cr>")
-- map("n", "<leader>fd",
--   "<cmd>lua require('telescope.builtin').git_files({ hidden = true, cwd = '~/.dotfiles/'})<cr>")
map("n", "<leader>fw",         "<cmd>Telescope vimwiki<cr>")
map("n", "<leader>z",         "<cmd>Telescope spell_suggest theme=cursor<cr>")
map("n", "<leader>r",          "<cmd>set number! relativenumber!<cr>")
map("n", "<leader>sw",         "<cmd>StripWhitespace<cr>")
map("n", "<leader>ml",
  "<cmd>set ft=ansible.yaml ts=2 et<cr>ggO# vim:ft=yaml.ansible ts=2 et<esc><C-o>")
map("n", "<leader>d",          "<cmd>lua vim.diagnostic.open_float()<cr>")
map("n", "<leader>h",          "<cmd>vertical resize -10<cr>")
map("n", "<leader>l",          "<cmd>vertical resize +10<cr>")
map("n", "<leader>j",          "<cmd>vertical resize -10<cr>")
map("n", "<leader>k",          "<cmd>vertical resize +10<cr>")
map("n", "<leader>b",          "<cmd>Telescope buffers theme=cursor<cr>")
map('n', '<leader>hs',         "<cmd>Gitsigns stage_hunk<cr>")
map('n', '<leader>hS',         "<cmd>Gitsigns stage_buffer<cr>")
map('n', '<leader>hu',         "<cmd>Gitsigns undo_stage_hunk<cr>")
map('n', '<leader>hR',         "<cmd>Gitsigns reset_buffer<cr>")
map('n', '<leader>hp',         "<cmd>Gitsigns preview_hunk<cr>")
map('n', '<leader>hb',         "<cmd>Gitsigns blame_line<cr>")
map('n', '<leader>hd',         "<cmd>Gitsigns diffthis<cr>")
map('n', "<leader>hn",         "<cmd>Gitsigns next_hunk<cr>")
map('n', "<leader>hp",         "<cmd>Gitsigns prev_hunk<cr>")
map('v', "<leader>hn",         "<cmd>Gitsigns next_hunk<cr>")
map('v', "<leader>hp",         "<cmd>Gitsigns prev_hunk<cr>")
map("n", "<leader>md",         "<cmd>Glow<cr>")
map("n", "<leader>he",         "gg<cmd>:r! date +%D<cr><ESC>I# <ESC>ddP")
map("i", "<C-E>",              "<Plug>luasnip-next-choice")
map("s", "<C-E>",              "<Plug>luasnip-next-choice")
