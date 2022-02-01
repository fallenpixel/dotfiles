local packer = require ( 'packer' )
local use = packer.use

use('vimwiki/vimwiki')
vim.g.vimwiki_list = {{path='$HOME/.vimwiki', syntax='markdown', ext='.md'}}
vim.g.vimwiki_global_ext=0
