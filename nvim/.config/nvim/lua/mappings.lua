local map = vim.keymap.set
local luasnip = require('luasnip')
local wk = require('which-key')
local mappings = {
  ["b"] = { "<cmd>Telescope buffers theme=cursor<cr>", "Buffers" },
  ["c"] = { "<cmd>Bdelete!<cr>", "Close Buffer"},
  ["d"] = { "<cmd>lua vim.diagnostic.open_float()<cr>", "Diagnostics" },

  ["H"] = { "<cmd>vertical resize -10<cr>", "Vert Smaller" },
  ["L"] = { "<cmd>vertical resize +10<cr>", "Vert Bigger" },
  ["J"] = { "<cmd>vertical resize -10<cr>", "Horiz Smaller" },
  ["K"] = { "<cmd>vertical resize +10<cr>", "Horiz Bigger" },
  ["f"] = {
    "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{})<cr>",
    "Find files",
  },
  ["F"] = { "<cmd>Telescope live_grep theme=ivy<cr>", "Find Text" },
  ["k"] = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover" },
  ["M"] = { "<cmd>Glow<cr>", "Preview Markdown" },
  ["P"] = { "<cmd>Telescope projects<cr>", "Projects" },
  ["q"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
  ["w"] = { "<cmd>StripWhitespace<cr>", "Strip Whitespace" },
  g = {
    name = "Git",
    g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
    j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
    k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
    l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
    p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
    r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
    R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
    s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
    u = {
      "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
      "Undo Stage Hunk",
    },
    o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
    d = {
      "<cmd>Gitsigns diffthis HEAD<cr>",
      "Diff",
    },
  },
  l = {
    name = "LSP",
    a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
    d = {
      "<cmd>Telescope diagnostics<cr>",
      "Document Diagnostics",
    },
    f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
    i = { "<cmd>LspInfo<cr>", "Info" },
    j = {
      "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>",
      "Next Diagnostic",
    },
    k = {
      "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>",
      "Prev Diagnostic",
    },
    l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
    p = { "<cmd> lua vim.lsp.buf.add_workspace_folder()<cr>", "Add workspace folder" },
    P = { "<cmd> lua vim.lsp.buf.list_workspace_folders()<cr>", "List workspace folders" },
    q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
    r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
    s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
    S = {
      "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
      "Workspace Symbols",
    },
    t = { "<cmd>Telescope treesitter<cr>", "Treesitter symbols" },
    x = { "<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>", "Remove workspace folder" },
  },
  m = {
    name = "Modelines",
    a = { "<cmd>set ft=ansible.yaml ts=2 et<cr>ggO# vim:ft=yaml.ansible ts=2 et<esc><C-o>", "Ansible" },
  },
  p = {
    name = "Packer",
    c = { "<cmd>PackerCompile<cr>", "Compile" },
    i = { "<cmd>PackerInstall<cr>", "Install" },
    s = { "<cmd>PackerSync<cr>", "Sync" },
    S = { "<cmd>PackerStatus<cr>", "Status" },
    u = { "<cmd>PackerUpdate<cr>", "Update" },
  },
  s = {
    name = "Spelling",
    s = { "<cmd>set spell!<cr>", "Toggle spelling" },
    z = { "<cmd>Telescope spell_suggest theme=cursor<cr>", "Suggestions" },
  },
  t = {
    name = "Terminal",
    d = { "<cmd>lua _LAZYDOCKER()<cr>", "LazyDocker" },
    f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
    g = { "<cmd>lua _LAZYGIT()<cr>", "LazyGit" },
    h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
    q = { "<cmd>NERDTreeToggle<cr>", "NerdTree" },
    v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
    w = { "<cmd>TagbarToggle<cr>", "Tagbar" },
  },
  v = {
    name = "Vim Configs",
    e = { "<cmd>e ~/.config/nvim/init.lua<cr>", "Edit init.vim" },
    f = { "<cmd>source %<cr>", "Reload current file" },
    r = { "<cmd>source ~/.config/nvim/init.lua<cr>", "Reload init.lua" },
    R = { "<cmd>Telescope reloader<cr>", "Reload modules" },
  },
}
local vmappings = {
}
local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}
local vopts = {
  mode = "v", -- VISUAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}
wk.register(mappings, opts)
wk.register(vmappings,vopts)
map("n", "<C-t>h", ":tabr<cr>")
map("n", "<C-t>l", ":tabl<cr>")
map("n", "<C-t>j", ":tabn<cr>")
map("n", "<C-t>k", ":tabp<cr>")
map("n", "<C-t>t", ":tabnew<cr>")
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")
map('n', 'ga', "<Plug>(EasyAlign)")
map('x', 'ga', "<Plug>(EasyAlign)")
map('n', 'gi', "<cmd>lua vim.lsp.buf.implementation()<CR>")
map('n', '[d', "<cmd>lua vim.diagnostic.goto_prev()<CR>")
map('n', ']d', "<cmd>lua vim.diagnostic.goto_next()<CR>")
map("n", "<C-a>", "<Plug>(dial-increment)")
map("v", "<C-a>", "<Plug>(dial-increment)")
map("n", "<C-x>", "<Plug>(dial-decrement)")
map("v", "<C-x>", "<Plug>(dial-decrement)")
map("v", "g<C-a>", "<Plug>(dial-increment-additional)")
map("v", "g<C-x>", "<Plug>(dial-decrement-additional)")
map({ "i", "s" }, "<a-p>", function()
  if luasnip.expand_or_jumpable() then
    luasnip.expand()
  end
end)
map({ "i", "s" }, "<a-j>", function()
  if luasnip.jumpable(1) then
    luasnip.jump(1)
  end
end)
map({ "i", "s" }, "<a-k>", function()
  if luasnip.jumpable(-1) then
    luasnip.jump(-1)
  end
end)
map({ "i", "s" }, "<a-h>", function()
  if luasnip.choice_active() then
    luasnip.change_choice(-1)
  end
end)
map({ "i", "s" }, "<a-l>", function()
  if luasnip.choice_active() then
    luasnip.change_choice(1)
  end
end)
map("i", "<C-E>", "<Plug>luasnip-next-choice")
map("s", "<C-E>", "<Plug>luasnip-next-choice")
