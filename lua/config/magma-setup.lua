vim.api.nvim_set_keymap('n', '<LocalLeader>r',  ':MagmaEvaluateOperator<CR>',    { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<LocalLeader>rr', ':MagmaEvaluateLine<CR>',        { noremap = true, silent = true })
vim.api.nvim_set_keymap('x', '<LocalLeader>r',  ':<C-u>MagmaEvaluateVisual<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<LocalLeader>rc', ':MagmaReevaluateCell<CR>',      { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<LocalLeader>rd', ':MagmaDelete<CR>',              { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<LocalLeader>ro', ':MagmaShowOutput<CR>',          { noremap = true, silent = true })

vim.cmd('let g:magma_automatically_open_output = v:true')
vim.cmd('let g:magma_image_provider = "kitty"')
