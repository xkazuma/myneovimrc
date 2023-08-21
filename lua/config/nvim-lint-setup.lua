local lint = require('lint')

vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
  callback = function()
    lint.try_lint()
  end,
})
vim.api.nvim_create_autocmd({ 'InsertLeave' }, {
  callback = function()
    lint.try_lint()
  end,
})
