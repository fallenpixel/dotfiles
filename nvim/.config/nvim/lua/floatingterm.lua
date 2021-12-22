local packer = require('packer')
local use = packer.use

use 'voldikss/vim-floaterm'
vim.g.floaterm_keymap_toggle = '<F1>'
vim.g.floaterm_keymap_next   = '<F2>'
vim.g.floaterm_keymap_prev   = '<F3>'
vim.g.floaterm_keymap_new    = '<F4>'
