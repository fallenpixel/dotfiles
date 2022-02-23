local fn = vim.fn
local install_path = fn.stdpath("data") .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  Packer_Bootstrap = fn.system({'git', 'clone', '--depth', '1',
    'https://github.com/wbthomason/packer.nvim', install_path})
end
return require('packer').startup({function(use)
  use 'wbthomason/packer.nvim'
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = function()
      require('gitsigns').setup()
    end
  }
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
        local dial = require('dial.config')
        local augend = require('dial.augend')
        dial.augends:register_group{
          default = {
            augend.integer.alias.decimal,
            augend.integer.alias.hex,
            augend.date.alias["%m/%d/%Y"],
            augend.constant.alias.bool,
            augend.constant.new{
              elements = { "yes", "no" },
              word = true,
              cyclic = true
            },
            augend.constant.new{
              elements = { "Yes", "No" },
              word = true,
              cyclic = true
            },
            augend.constant.new{
              elements = {"[ ]", "[x]"},
              word = false,
              cyclic = true
            }
          }
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
  -- use {'blackCauldron7/surround.nvim', Repo disappeared
  use {'ur4ltz/surround.nvim',
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
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "gnn",
          node_incremental = "grn",
          scope_incremental = "grc",
          node_decremental = "grm",
        },
      },
      indent = {
        enable = true
      }
    }
    end
  }
  use {
    'ellisonleao/gruvbox.nvim',
    requires= {'ryanoasis/vim-devicons'},
    config = function ()
      vim.o.background = "dark"
      vim.cmd("colorscheme gruvbox")
    end
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-lua/popup.nvim',
      'ElPiloto/telescope-vimwiki.nvim',
      {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'},
    config = function()
      require('telescope').setup()
      require('telescope').load_extension('fzf')
      require('telescope').load_extension('vimwiki')
    end
    }
  }
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
    'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require("bufferline").setup()
    end
  }
  -- use {
  --   "windwp/nvim-autopairs",
  --   requires = {
  --     'hrsh7th/nvim-cmp',
  --     'nvim-treesitter/nvim-treesitter'
  --   },
  --   config = function()
  --     require("nvim-autopairs").setup{
  --       check_ts = true,
  --       ts_config = {
  --         lua = { "string", "source" },
  --         javascript = { "string", "template_string" },
  --         java = false,
  --       },
  --       disable = true,
  --       disable_filetype = { "TelescopePrompt", "spectre_panel" },
  --       fast_wrap = {
  --         map = "<M-e>",
  --         chars = { "{", "[", "(", '"', "'" },
  --         pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
  --         offset = 0, -- Offset from pattern match
  --         end_key = "$",
  --         keys = "qwertyuiopzxcvbnmasdfghjkl",
  --         check_comma = true,
  --         highlight = "PmenuSel",
  --         highlight_grey = "LineNr",
  --       },
  --   }
  --     local cmp_autopairs = require "nvim-autopairs.completion.cmp"
  --     local cmp_status_ok, cmp = pcall(require, "cmp")
  --       if not cmp_status_ok then
  --     return
  --     end
  --     cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })
  --   end
  -- }
  use {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require("null-ls").setup({
        sources = {
          require("null-ls").builtins.diagnostics.ansiblelint,
          require("null-ls").builtins.diagnostics.luacheck,
          require("null-ls").builtins.diagnostics.markdownlint,
          -- require("null-ls").builtins.diagnostics.shellcheck, -- way too noisy
          require("null-ls").builtins.diagnostics.zsh,
          require("null-ls").builtins.formatting.markdownlint,
          require("null-ls").builtins.formatting.markdownlint,
          require("null-ls").builtins.formatting.terraform_fmt,
          require("null-ls").builtins.formatting.trim_newlines,
          require("null-ls").builtins.formatting.trim_whitespace
        },
      })
    end
  }
  use {"ellisonleao/glow.nvim"}
  if Packer_Bootstrap then
    require('packer').sync()
  end
end,
config = { display = { open_fn = require('packer.util').float,}}
})
