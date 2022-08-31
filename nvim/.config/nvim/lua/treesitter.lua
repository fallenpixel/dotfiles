require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",
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
  },
  refactor = {
    highlight_definitions = {
    enable = true,
    clear_on_cursor_move = true
    },
    highlight_current_scope = { enable = true },
    smart_rename = {
        enable = true,
        keymaps = {
          smart_rename = "grr",
        }
    },
    navigation = {
      enable = true,
      keymaps = {
        goto_definition_lsp_fallback = "gnd",
        list_definitions = "gnD",
        list_definitions_toc = "gO",
        goto_next_usage = "<A-8>",
        goto_previous_usage = "<A-3>",
      },
    },
  }
}
