local packer = require( 'packer' )
local use = packer.use
if ( vim.env.USECASE == 'personal' and vim.env.USEENV == 'local' )
    then
      use {
    'glacambre/firenvim',
    run = function() vim.fn['firenvim#install'](0) end
}
end
