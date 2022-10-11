local fn = vim.fn
local install_path = fn.stdpath("data") .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  Packer_Bootstrap = fn.system({ 'git', 'clone', '--depth', '1',
    'https://github.com/wbthomason/packer.nvim', install_path })
end
return require('packer').startup({ function(use)
  use 'wbthomason/packer.nvim'
  use { 'rcarriga/nvim-notify',
    config = function()
      vim.notify = require("notify")
    end
  }
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = function()
      require('gitsigns').setup()
    end
  }
  use {
    'TimUntersberger/neogit',
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      vim.keymap.set('n', '<leader>gg', '<cmd>Neogit<CR>')
      require('neogit').setup {
      }
    end
  }
  use {
    'sindrets/diffview.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      vim.keymap.set('n', '<leader>gd', '<cmd>DiffviewOpen<CR>')
    end
  }

  use 'junegunn/vim-easy-align'
  use 'sheerun/vim-polyglot'
  use 'phelipetls/jsonpath.nvim'
  use 'preservim/tagbar'
  use 'nathanaelkane/vim-indent-guides'
  use 'scrooloose/nerdtree'
  use 'neovim/nvim-lspconfig'
  use 'onsails/lspkind-nvim'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use {
    'kosayoda/nvim-lightbulb',
    requires = 'antoinemadec/FixCursorHold.nvim',
    config = function()
      require('nvim-lightbulb').setup({ autocmd = { enabled = true } })
    end
  }
  use 'hrsh7th/nvim-cmp'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'norcalli/nvim-colorizer.lua'
  use 'andrewferrier/debugprint.nvim'
  use {
    'junegunn/vim-peekaboo',
    config = function()
      require("debugprint").setup()
    end
  }
  use 'wellle/targets.vim'
  use 'ntpeters/vim-better-whitespace'
  use 'akinsho/toggleterm.nvim'
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }
  use { 'monaqa/dial.nvim',
    config = {
      function()
        local dial = require('dial.config')
        local augend = require('dial.augend')
        dial.augends:register_group {
          default = {
            augend.integer.alias.decimal,
            augend.integer.alias.hex,
            augend.date.alias["%m/%d/%Y"],
            augend.constant.alias.bool,
            augend.constant.new {
              elements = { "yes", "no" },
              word = true,
              cyclic = true
            },
            augend.constant.new {
              elements = { "Yes", "No" },
              word = true,
              cyclic = true
            },
            augend.constant.new {
              elements = { "[ ]", "[x]" },
              word = false,
              cyclic = true
            }
          }
        }
      end
    }
  }
  -- use 'christoomey/vim-tmux-navigator'
  use { 'kylechui/nvim-surround',
    config = function()
      require("nvim-surround").setup({})
    end
  }
  if getHostname() ~= 'winterfell' then
    use { 'p00f/nvim-ts-rainbow' }
    use { 'nvim-treesitter/nvim-treesitter-textobjects' }
    use {'nvim-treesitter/nvim-treesitter'}
    use {'nvim-treesitter/playground'}
    use { 'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
    }
  end
  use {
    'ellisonleao/gruvbox.nvim',
    requires = { 'ryanoasis/vim-devicons' },
    config = function()
      require("gruvbox").setup({
        undercurl = true,
        underline = true,
        bold = true,
        italic = true,
        strikethrough = true,
        contrast = "soft",
      })
      vim.o.background = "dark"
      vim.cmd("colorscheme gruvbox")
    end
  }
  use {
    'ahmedkhalf/project.nvim',
    require = 'nvim-telescope/telescope',
    config = function()
      require("project_nvim").setup {
        active = true,
        detection_methods = { "pattern" },
        patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },
        show_hidden = true,
        datapath = vim.fn.stdpath("data"),
      }
    end
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-lua/popup.nvim',
      'ElPiloto/telescope-vimwiki.nvim',
      'ahmedkhalf/project.nvim',
      config = function()
        require('telescope').setup()
      end
    }
  }
  local tele_status_ok, telescope = pcall(require, "telescope")
  if tele_status_ok then
    local project_status_ok, project = pcall(require, "project_nvim")
    if project_status_ok then
      telescope.load_extension("projects")
    end
  end
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      require('lualine').setup {
        options = { theme = "auto" }
      }
    end
  }
  use {
    'akinsho/bufferline.nvim', branch = 'main',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require("bufferline").setup()
    end
  }
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
  }
  use {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require("null-ls").setup({
        sources = {
          require("null-ls").builtins.code_actions.eslint,
          require("null-ls").builtins.code_actions.shellcheck,
          require("null-ls").builtins.diagnostics.flake8,
          require("null-ls").builtins.diagnostics.vale,
          require("null-ls").builtins.diagnostics.ansiblelint,
          require("null-ls").builtins.diagnostics.chktex,
          require("null-ls").builtins.diagnostics.eslint,
          require("null-ls").builtins.diagnostics.hadolint,
          require("null-ls").builtins.diagnostics.markdownlint,
          require("null-ls").builtins.diagnostics.shellcheck,
          require("null-ls").builtins.diagnostics.zsh,
          require("null-ls").builtins.diagnostics.gitlint,
          require("null-ls").builtins.formatting.black,
          require("null-ls").builtins.formatting.eslint,
          require("null-ls").builtins.formatting.markdownlint,
          require("null-ls").builtins.formatting.prettier,
          require("null-ls").builtins.formatting.terraform_fmt,
          require("null-ls").builtins.formatting.trim_newlines,
          require("null-ls").builtins.formatting.trim_whitespace,
          require("null-ls").builtins.formatting.yamlfmt
        },
      })
    end
  }
  use { "ellisonleao/glow.nvim" }
  if Packer_Bootstrap then
    require('packer').sync()
  end
  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup()
    end
  }
end,
  config = { display = { open_fn = require('packer.util').float, } }
})
