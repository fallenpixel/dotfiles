vim.cmd('filetype plugin indent on')
vim.g.mapleader                           = ","
vim.g.localleader                         = ","
vim.opt.showbreak                         = "↪"
vim.opt.listchars:append({ tab            = "<->" })
vim.opt.listchars:append({ eol            = "↲" })
vim.opt.listchars:append({ nbsp           = "␣" })
vim.opt.listchars:append({ trail          = "•" })
vim.opt.listchars:append({ extends        = "⟩" })
vim.opt.listchars:append({ precedes       = "⟨" })
vim.g.mouse                               = "true"
vim.g.tex_flavor                          = "latex"
vim.opt.splitbelow                        = true
vim.opt.splitright                        = true
vim.opt.number                            = true
vim.opt.relativenumber                    = true
vim.opt.autoread                          = true
vim.opt.smartcase                         = true
vim.opt.incsearch                         = true
vim.opt.autoindent                        = true
vim.opt.smartindent                       = true
vim.opt.wrap                              = true
vim.opt.modeline                          = true
vim.opt.foldmethod                        = "marker"
vim.opt.colorcolumn                       = "80"
vim.opt.tabstop                           = 2
vim.opt.softtabstop                       = 2
vim.opt.shiftwidth                        = 2
vim.opt.expandtab                         = true
vim.g.ansible_unindent_after_newline      = 1
vim.g.ansible_extra_keywords_highlight    = 1
vim.g.compatible                          = true
vim.g.spelllang                           = "en"
vim.g.indent_guides_enable_on_vim_startup = 1
vim.g.floaterm_keymap_toggle              = '<F1>'
vim.g.floaterm_keymap_next                = '<F2>'
vim.g.floaterm_keymap_prev                = '<F3>'
vim.g.floaterm_keymap_new                 = '<F4>'
vim.g.vimwiki_list = {{path='$HOME/.vimwiki', syntax='markdown', ext='.md'}}
vim.g.vimwiki_global_ext = 0
vim.g.vimwiki_foldering = 'custom'
vim.g.gruvbox_baby_background_color = "dark"
vim.cmd("colorscheme gruvbox-baby")
vim.g.airline_theme="base16_gruvbox_dark_hard"
vim.g.airline_powerline_fonts = 1
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
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  sync_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  },
}
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = false,
})
