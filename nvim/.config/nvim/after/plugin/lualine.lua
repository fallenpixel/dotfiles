local function get_schema()
  local schema = require("yaml-companion").get_buf_schema(0)
  if schema.result[1].name == "none" then
    return ""
  end
  return schema.result[1].name
end
local lualine = require("lualine")
lualine.setup {
  options = {
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
    theme = 'gruvbox'
  },
  sections = {
      lualine_x = {
          get_schema,
          'encoding',
          'fileformat',
          'filetype'
      }
  }
}
