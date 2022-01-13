local packer = require ( 'packer' )
local use = packer.use

use("mickael-menu/zk-nvim")

require("zk").setup({
    picker = "telescope"
})
