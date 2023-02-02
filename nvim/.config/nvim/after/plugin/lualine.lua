local lualine = require("lualine")
lualine.setup {
  options = {
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
    theme = 'gruvbox'
  },
  sections = {
      lualine_x = {
          'encoding',
          'fileformat',
          'filetype'
      }
  }
}
