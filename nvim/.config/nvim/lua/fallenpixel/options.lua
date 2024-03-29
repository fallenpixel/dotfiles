vim.cmd('filetype plugin indent on')
vim.g.clipboard                           = "namedplus"
vim.o.background                          = "dark"
vim.opt.termguicolors                     = true
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader                           = " "
vim.g.localleader                         = " "
vim.opt.showbreak                         = "↪"
vim.opt.listchars:append({ tab            = "<->" })
vim.opt.listchars:append({ eol            = "↲" })
vim.opt.listchars:append({ nbsp           = "␣" })
vim.opt.listchars:append({ trail          = "•" })
vim.opt.listchars:append({ extends        = "⟩" })
vim.opt.listchars:append({ precedes       = "⟨" })
-- vim.g.mouse                               = "true"
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
vim.g.spellsuggest                        = "best,9"
vim.g.indent_guides_enable_on_vim_startup = 1
vim.g.floaterm_keymap_toggle              = '<F1>'
vim.g.floaterm_keymap_next                = '<F2>'
vim.g.floaterm_keymap_prev                = '<F3>'
vim.g.floaterm_keymap_new                 = '<F4>'
vim.diagnostic.config({
  virtual_text                            = false,
  signs                                   = true,
  underline                               = true,
  float                                   = {
    show_header                           = true,
    source                                = 'if_many',
    border                                = 'rounded',
    focusable                             = false,
  },
  update_in_insert                        = false,
  severity_sort                           = false,
})
