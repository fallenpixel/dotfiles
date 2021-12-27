local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

-- returns the require for use in `config` parameter of packer's use
-- expects the name of the config file
function get_config(name)
    return string.format("require(\"config/%s\")", name)
end

-- bootstrap packer if not installed
if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({
        "git", "clone", "https://github.com/wbthomason/packer.nvim",
        install_path
    })
    execute "packadd packer.nvim"
end

-- initialize and configure packer
local packer = require("packer")
packer.init {
    enable = true, -- enable profiling via :PackerCompile profile=true
    threshold = 0 -- the amount in ms that a plugins load time must be over for it to be included in the profile
}
local use = packer.use
packer.reset()
use 'wbthomason/packer.nvim'
require('themeing')
require('polyglot')
require('telescope')
require('signify')
require('fugitive')
require('easyalign')
require('tagbar')
require('indentguides')
require('nerdtree')
require('tagbar')
require('indentguides')
require('nerdtree')
require('surround')
require('lspconf')
require('colorizer')
require('lion')
require('peekaboo')
require('targets')
require('floatingterm')
require('betterwhitespace')
require('comment')
