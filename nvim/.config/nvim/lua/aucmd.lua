local augroup = vim.api.nvim_create_augroup   -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd

autocmd('BufWritePre', {
  pattern = '*',
  command = ":%s/\\s\\+$//e"
})

augroup('markdownPrefs', { clear = true})
autocmd('FileType', {
    group = 'markdownPrefs',
    pattern = {'markdown'},
    command = 'set spell'
})

