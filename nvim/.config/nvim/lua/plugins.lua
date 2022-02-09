local fn = vim.fn
local install_path = fn.stdpath("data") .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end
return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'mhinz/vim-signify'
  use 'tpope/vim-fugitive'
  use 'junegunn/vim-easy-align'
  use 'preservim/tagbar'
  use 'nathanaelkane/vim-indent-guides'
  use 'scrooloose/nerdtree'
  use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  use 'L3MON4D3/LuaSnip' -- Snippets plugin
  use 'norcalli/nvim-colorizer.lua'
  use 'junegunn/vim-peekaboo'
  use 'wellle/targets.vim'
  use 'voldikss/vim-floaterm'
  use 'ntpeters/vim-better-whitespace'
  use 'numToStr/Comment.nvim'
  require('Comment').setup()
  use 'monaqa/dial.nvim'
  use 'christoomey/vim-tmux-navigator'
  use 'vimwiki/vimwiki'
  use 'blackCauldron7/surround.nvim'
  require"surround".setup {
    context_offset = 100,
    load_autogroups = false,
    mappings_style = "surround",
    map_insert_mode = true,
    quotes = {"'", '"'},
    brackets = {"(", '{', '['},
    space_on_closing_char = false,
    pairs = {
      nestable = { b = { "(", ")" }, s = { "[", "]" }, B = { "{", "}" }, a = { "<", ">" } },
      linear = { q = { "'", "'" }, t = { "`", "`" }, d = { '"', '"' }, j = { '"{{ ', ' }}"' }, l = { '[', ']()'}, L = { '[](', ')' } }
    },
    prefix = "s"
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-lua/popup.nvim',
      'ElPiloto/telescope-vimwiki.nvim',
      {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'} }
  }
  require('telescope').load_extension('fzf')
  require('telescope').load_extension('vimwiki')
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
  use {
  	'eddyekofo94/gruvbox-flat.nvim',
  	requires= {'ryanoasis/vim-devicons'}
  }
if packer_bootstrap then
  require('packer').sync()
end
end)
