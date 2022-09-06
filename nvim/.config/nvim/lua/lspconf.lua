local function file_exists(name)
    local f=io.open(name,"r")
   if f~=nil then io.close(f) return true else return false end
end
local luasnip_status, luasnip = pcall(require, 'luasnip')
if not luasnip_status then
  vim.notify("luasnip failed to load", "error")
  return
end
local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end
vim.opt.completeopt = {'menu', 'menuone' , 'noselect'}
local lspkind_status, lspkind = pcall(require, 'lspkind')
if not lspkind_status then
  vim.notify("lspkind failed to load", error)
  return
end
local cmp_status, cmp = pcall(require, 'cmp')
if not cmp_status then
  vim.notify("cmp failed to load", error)
  return
end
cmp.setup {
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    -- ["<Tab>"] = cmp.mapping(function(fallback)
    --   if cmp.visible() then
    --     cmp.select_next_item()
    --   elseif luasnip.expand_or_jumpable() then
    --     luasnip.expand_or_jump()
    --   elseif has_words_before() then
    --     cmp.complete()
    --   else
    --     fallback()
    --   end
    -- end, { "i", "s" }),
    --
    -- ["<S-Tab>"] = cmp.mapping(function(fallback)
    --   if cmp.visible() then
    --     cmp.select_prev_item()
    --   elseif luasnip.jumpable(-1) then
    --     luasnip.jump(-1)
    --   else
    --     fallback()
    --   end
    -- end, { "i", "s" }),
  }),
  sources = {
    { name = 'luasnip' },
    { name = 'nvim_lsp' },
    -- { name = 'buffer' },
    { name = 'path' },
    { name = 'cmdline' }
  },
  experimental = {
    ghost_text = true,
    native_menu = false,
  },
  formatting = {
  format = lspkind.cmp_format({
    mode = 'symbol', -- show only symbol annotations
    maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
  })
}
}
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
local lspconfig_status, lspconfig  = pcall(require, 'lspconfig')
if not lspconfig_status then
  vim.notify("lspconfig failed to load", "error")
  return
end
local servers = { 'texlab', 'terraformls', 'bashls', 'jedi_language_server', 'pyright',
                  'ansiblels', 'yamlls', 'dockerls', 'sumneko_lua', 'eslint', 'tsserver'}
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    -- on_attach = my_custom_on_attach,
    capabilities = capabilities,
    settings = {
      ansible = {
        ansible = {
          useFullyQualifiedCollectionNames = true
        }
      },
      Lua = {
        runtime = {
          -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
          version = 'LuaJIT',
          -- Setup your lua path
          path = '/usr/bin/luajit',
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = { "vim" },
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
      yaml = {
        schemas = {
          ["https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] = "/.gitlab-ci.yml",
          ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
          ["https://raw.githubusercontent.com/garethr/openshift-json-schema/master/v4.1.0/buildconfig.json"] = "buildconfig.yml"
        },
      }
    }
  }

local groovy_paths = {'/usr/share/java/groovy-language-server/groovy-language-server.jar',
  '/usr/local/share/java/groovy-language-server/groovy-language-server.jar'}
for _, groovy_ls in ipairs(groovy_paths) do
  if file_exists(groovy_ls) then
    require'lspconfig'.groovyls.setup{
      cmd = { "java", "-jar", groovy_ls },
    }
    break
  end
end
end
