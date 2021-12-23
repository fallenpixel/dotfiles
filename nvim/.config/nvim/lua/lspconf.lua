local packer = require('packer')
local use = packer.use
local default_options = {noremap = true, silent = true}

use 'neovim/nvim-lspconfig'
use 'hrsh7th/cmp-nvim-lsp'
use 'hrsh7th/cmp-buffer'
use 'hrsh7th/cmp-path'
use 'hrsh7th/cmp-cmdline'
use 'hrsh7th/nvim-cmp'
use 'L3MON4D3/LuaSnip'
use 'saadparwaiz1/cmp_luasnip'

local cmp = require'cmp'
cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
    { name = 'buffer'},
    { name = 'path' },
    { name = 'cmdline' }
  })
})
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
require('lspconfig')['pyright'].setup{
  capabilities = update_capabilities
}
require('lspconfig')['texlab'].setup {
  capabilities = capabilities
}
require('lspconfig')['ansiblels'].setup {
  capabilities = capabilities
}
require('lspconfig')['tflint'].setup {
  capabilities = capabilities
}
require('lspconfig')['yamlls'].setup {
  capabilities = capabilities
}
require('lspconfig')['bashls'].setup {
  capabilities = capabilities
}
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require'lspconfig'.sumneko_lua.setup {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

vim.api.nvim_set_keymap('n', 'gD',        '<cmd>lua vim.lsp.buf.declaration()<CR>',                                default_options)
vim.api.nvim_set_keymap('n', 'gd',        '<cmd>lua vim.lsp.buf.definition()<CR>',                                 default_options)
vim.api.nvim_set_keymap('n', 'K',         '<cmd>lua vim.lsp.buf.hover()<CR>',                                      default_options)
vim.api.nvim_set_keymap('n', 'gi',        '<cmd>lua vim.lsp.buf.implementation()<CR>',                             default_options)
vim.api.nvim_set_keymap('n', '<C-k>',     '<cmd>lua vim.lsp.buf.signature_help()<CR>',                             default_options)
vim.api.nvim_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>',                       default_options)
vim.api.nvim_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>',                    default_options)
vim.api.nvim_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', default_options)
vim.api.nvim_set_keymap('n', '<space>D',  '<cmd>lua vim.lsp.buf.type_definition()<CR>',                            default_options)
vim.api.nvim_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>',                                     default_options)
vim.api.nvim_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>',                                default_options)
vim.api.nvim_set_keymap('n', 'gr',        '<cmd>lua vim.lsp.buf.references()<CR>',                                 default_options)
vim.api.nvim_set_keymap('n', '<space>e',  '<cmd>lua vim.diagnostic.open_float()<CR>',                              default_options)
vim.api.nvim_set_keymap('n', '[d',        '<cmd>lua vim.diagnostic.goto_prev()<CR>',                               default_options)
vim.api.nvim_set_keymap('n', ']d',        '<cmd>lua vim.diagnostic.goto_next()<CR>',                               default_options)
vim.api.nvim_set_keymap('n', '<space>q',  '<cmd>lua vim.diagnostic.setloclist()<CR>',                              default_options)
vim.api.nvim_set_keymap('n', '<space>f',  '<cmd>lua vim.lsp.buf.formatting()<CR>',                                 default_options)
