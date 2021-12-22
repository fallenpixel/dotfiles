local packer = require('packer')
local use = packer.use

use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
}
