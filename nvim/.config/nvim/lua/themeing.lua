local packer = require('packer')
local use = packer.use

use 'vim-airline/vim-airline'
use 'vim-airline/vim-airline-themes'
use {
	'eddyekofo94/gruvbox-flat.nvim',
	requires= {'ryanoasis/vim-devicons'}
}
vim.g.gruvbox_flat_style = "hard"
vim.cmd("colorscheme gruvbox-flat")
vim.g.airline_theme="base16_gruvbox_dark_hard"
vim.g.airline_powerline_fonts = 1
