local fn = vim.fn
local install_path = fn.stdpath("data") .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end
return require('packer').startup({function(use)
  use 'wbthomason/packer.nvim'
  use 'mhinz/vim-signify'
  use 'tpope/vim-fugitive'
  use 'junegunn/vim-easy-align'
  use 'preservim/tagbar'
  use 'nathanaelkane/vim-indent-guides'
  use 'scrooloose/nerdtree'
  use 'neovim/nvim-lspconfig'
  use 'onsails/lspkind-nvim'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'norcalli/nvim-colorizer.lua'
  use 'junegunn/vim-peekaboo'
  use 'wellle/targets.vim'
  use 'voldikss/vim-floaterm'
  use 'ntpeters/vim-better-whitespace'
  use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
  }
  use {'monaqa/dial.nvim',
    config = {
      function()
        local dial = require('dial')
        dial.augends["custom#boolean"] = dial.common.enum_cyclic{
        name = "boolean",
        strlist = {"true", "false"},
        }
        dial.augends["custom#upperboolean"] = dial.common.enum_cyclic{
        name = "upperboolean",
        strlist = {"True", "False"},
        }
        dial.augends["custom#yesno"] = dial.common.enum_cyclic{
        name = "yesno",
        strlist = {"yes", "no"},
        }
        dial.augends["custom#check"] = dial.common.enum_cyclic{
        name = "check",
        strlist = {"[ ]", "[x]"},
        }
        dial.config.searchlist.normal = {
          "number#decimal",
          "number#decimal#int",
          "number#decimal#fixed#zero",
          "number#decimal#fixed#space",
          "number#hex",
          "number#binary",
          "date#[%Y/%m/%d]",
          "date#[%-m/%-d]",
          "date#[%Y-%m-%d]",
          "date#[%H:%M]",
          "color#hex",
          "markup#markdown#header",
          "custom#boolean",
          "custom#upperboolean",
          "custom#yesno",
          "custom#check"
        }
      end
    }
  }
  use 'christoomey/vim-tmux-navigator'
  use {'vimwiki/vimwiki',
  config = function ()
    vim.g.vimwiki_list = {{path='$HOME/.vimwiki', syntax='markdown', ext='.md'}}
    vim.g.vimwiki_global_ext = 0
    vim.g.vimwiki_foldering = 'custom'
  end
  }
  use {'blackCauldron7/surround.nvim',
  config = function()
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
end
}
  use { 'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
    require'nvim-treesitter.configs'.setup {
      ensure_installed = "maintained",
      sync_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = true,
      },
  }
  end
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
  use {
  'nvim-lualine/lualine.nvim',
  requires = { 'kyazdani42/nvim-web-devicons' },
  config = function()
    require('lualine').setup{
    options = { theme = "auto" }
    }
  end
  }
  use {
    'luisiacc/gruvbox-baby',
    requires= {'ryanoasis/vim-devicons'},
    config = function ()
      vim.g.gruvbox_baby_background_color = "dark"
      vim.cmd("colorscheme gruvbox-baby")
      vim.g.gruvbox_baby_telescope_theme = 1
    end
  }
  use {
    'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require("bufferline").setup()
    end
  }
  if packer_bootstrap then
    require('packer').sync()
  end
end,
config = { display = { open_fn = require('packer.util').float,}}
})
