
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
