local packer = require( 'packer' )
local use = packer.use
use( 'monaqa/dial.nvim' )
local map = vim.api.nvim_set_keymap
local remap_options = {noremap = false, silent = true}
map("n", "<C-a>", "<Plug>(dial-increment)", remap_options)
map("v", "<C-a>", "<Plug>(dial-increment)", remap_options)
map("n", "<C-x>", "<Plug>(dial-decrement)", remap_options)
map("v", "<C-x>", "<Plug>(dial-decrement)", remap_options)
map("v", "g<C-a>", "<Plug>(dial-increment-additional)", remap_options)
map("v", "g<C-x>", "<Plug>(dial-decrement-additional)", remap_options)
local dial = require('dial')
dial.augends["custom#boolean"] = dial.common.enum_cyclic{
    name = "boolean",
    strlist = {"true", "false"},
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
  "custom#boolean"
}
