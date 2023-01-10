local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
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
  use 'kyazdani42/nvim-web-devicons'
  use {
    'kylechui/nvim-surround',
    config = function()
      require('nvim-surround').setup()
    end
  }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use 'junegunn/vim-easy-align'
  use {
    'TimUntersberger/neogit',
    requires = 'nvim-lua/plenary.nvim',
  }
  use 'nathanaelkane/vim-indent-guides'
  use 'scrooloose/nerdtree'
  use({'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'})
  use 'nvim-treesitter/playground'
  use 'akinsho/toggleterm.nvim'
  use 'folke/which-key.nvim'
  use 'junegunn/vim-peekaboo'
  use 'tomasiser/vim-code-dark'
  use {
    'folke/trouble.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
  }
  use {
  'someone-stole-my-name/yaml-companion.nvim',
  requires = {
      { 'neovim/nvim-lspconfig' },
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope.nvim' },
  },
  config = function()
    require('telescope').load_extension('yaml_schema')
    require('yaml-companion').setup()
  end,
  }
  use {'sindrets/diffview.nvim',
    requires = 'nvim-lua/plenary.nvim',
  }
  use  'monaqa/dial.nvim'
  use {
    'nvim-telescope/telescope.nvim',
    requires= {
      'nvim-lua/plenary.nvim',
      'nvim-lua/popup.nvim',
      'ahmedkhalf/project.nvim'
    }
  }
use({

  "folke/noice.nvim",
  config = function()
    require("noice").setup({
    })
  end,
  requires = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
    }
})
  use {'VonHeikemen/lsp-zero.nvim',
    requires = {
    -- LSP Support
    {'neovim/nvim-lspconfig'},
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},
    -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'saadparwaiz1/cmp_luasnip'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},

    -- Snippets
      {'L3MON4D3/LuaSnip'},
      {'rafamadriz/friendly-snippets'},
  }
}
  if packer_bootstrap then
    require('packer').sync()
  end
end)
