local map = vim.api.nvim_set_keymap
local default_options = {noremap = true, silent = true}
local remap_options = {noremap = false,  silent = true}
-- local expr_options = {noremap = true, expr = true, silent = true}

map("n", "<leader>vr",         ":source ~/.config/nvim/init.lua<cr>",                                                                          default_options)
map("n", "<leader>ve",         ":edit ~/.config/nvim/init.lua<cr>",                                                                            default_options)
map("n", "<ESC>",              ":nohlsearch<Bar>:echo<CR>",                                                                                    default_options)
map("n", "gf",                 ":edit <cfile><cr>",                                                                                            default_options)
map("n", "<leader>l",          ":set list!<cr>",                                                                                               default_options)
map("n", "<C-t>h",             ":tabr<cr>",                                                                                                    default_options)
map("n", "<C-t>l",             ":tabl<cr>",                                                                                                    default_options)
map("n", "<C-t>j",             ":tabn<cr>",                                                                                                    default_options)
map("n", "<C-t>k",             ":tabp<cr>",                                                                                                    default_options)
map("n", "<C-t>t",             ":tabnew<cr>",                                                                                                  default_options)
map("n", "<leader>r",          ":lua vim.lsp.buf.formatting_sync(nil,100)<cr>",                                                                default_options)
map("n", "<leader>ss",         ":set spell!<cr>",                                                                                              default_options)
map("n", "<leader>sd",         "a<C-X>s",                                                                                                      default_options)
map('n', 'ga',                 '<Plug>(EasyAlign)',                                                                                            {silent = true, noremap = false})
map('x', 'ga',                 '<Plug>(EasyAlign)',                                                                                            {silent = true, noremap = false})
map('n', '<leader>w',          '<cmd>TagbarToggle<cr>',                                                                                        default_options)
map("n", "<leader>q",          "<cmd>NERDTreeToggle<cr>",                                                                                      default_options)
map('n', '<leader>w',          '<cmd>TagbarToggle<cr>',                                                                                        default_options)
map('n', 'gD',                 '<cmd>lua vim.lsp.buf.declaration()<CR>',                                                                       default_options)
map('n', 'gd',                 '<cmd>lua vim.lsp.buf.definition()<CR>',                                                                        default_options)
map('n', 'K',                  '<cmd>lua vim.lsp.buf.hover()<CR>',                                                                             default_options)
map('n', 'gi',                 '<cmd>lua vim.lsp.buf.implementation()<CR>',                                                                    default_options)
map('n', '<C-k>',              '<cmd>lua vim.lsp.buf.signature_help()<CR>',                                                                    default_options)
map('n', '<space>wa',          '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>',                                                              default_options)
map('n', '<space>wr',          '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>',                                                           default_options)
map('n', '<space>wl',          '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>',                                        default_options)
map('n', '<space>D',           '<cmd>lua vim.lsp.buf.type_definition()<CR>',                                                                   default_options)
map('n', '<space>rn',          '<cmd>lua vim.lsp.buf.rename()<CR>',                                                                            default_options)
map('n', '<space>ca',          '<cmd>lua vim.lsp.buf.code_action()<CR>',                                                                       default_options)
map('n', 'gr',                 '<cmd>lua vim.lsp.buf.references()<CR>',                                                                        default_options)
map('n', '<space>e',           '<cmd>lua vim.diagnostic.open_float()<CR>',                                                                     default_options)
map('n', '[d',                 '<cmd>lua vim.diagnostic.goto_prev()<CR>',                                                                      default_options)
map('n', ']d',                 '<cmd>lua vim.diagnostic.goto_next()<CR>',                                                                      default_options)
map('n', '<space>q',           '<cmd>lua vim.diagnostic.setloclist()<CR>',                                                                     default_options)
map('n', '<space>f',           '<cmd>lua vim.lsp.buf.formatting()<CR>',                                                                        default_options)
map("n", "<C-a>",              "<Plug>(dial-increment)",                                                                                       remap_options)
map("v", "<C-a>",              "<Plug>(dial-increment)",                                                                                       remap_options)
map("n", "<C-x>",              "<Plug>(dial-decrement)",                                                                                       remap_options)
map("v", "<C-x>",              "<Plug>(dial-decrement)",                                                                                       remap_options)
map("v", "g<C-a>",             "<Plug>(dial-increment-additional)",                                                                            remap_options)
map("v", "g<C-x>",             "<Plug>(dial-decrement-additional)",                                                                            remap_options)
map('n', '<leader>w<leader>n', '<cmd>VimwikiMakeTomorrowDiaryNote<cr>',                                                                        default_options)
map("n", "<leader>ff",         "<cmd>lua require('telescope.builtin').find_files()<cr>",                                                       default_options)
map("n", "<leader>fg",         "<cmd>lua require('telescope.builtin').live_grep()<cr>",                                                        default_options)
map("n", "<leader>fb",         "<cmd>lua require('telescope.builtin').buffers()<cr>",                                                          default_options)
map("n", "<leader>fh",         "<cmd>lua require('telescope.builtin').help_tags()<cr>",                                                        default_options)
map("n", "<leader>fd",         "<cmd>lua require('telescope.builtin').git_files({ hidden = true, cwd = '~/.dotfiles/'}, default_options)<cr>", default_options)
map("n", "<leader>fw",         "<cmd>Telescope vimwiki<cr>",                                                                                   default_options)
map("n", "<leader>r",          "<cmd>set number! relativenumber!<cr>",                                                                         default_options)
map("n", "<leader>sw",         "<cmd>StripWhitespace<cr>",                                                                                     default_options)
map("n", "<leader>ml",         "<cmd>set ft=ansible.yaml ts=2 et<cr>ggO# vim:ft=ansible.yaml ts=2 et<esc><C-o>",                               default_options)
map("n", "<leader>d",          "<cmd>lua vim.diagnostic.open_float()<cr>",                                                                     default_options)
map("n", "<leader>h",          "<cmd>vertical resize -10<cr>",                                                                                 default_options)
map("n", "<leader>l",          "<cmd>vertical resize +10<cr>",                                                                                 default_options)
map("n", "<leader>j",          "<cmd>vertical resize -10<cr>",                                                                                 default_options)
map("n", "<leader>k",          "<cmd>vertical resize +10<cr>",                                                                                 default_options)
map("n", "<leader>b",          "<cmd>BufferLinePick<cr>",                                                                                      default_options)
