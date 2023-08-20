local lspsaga = require('lspsaga')
lspsaga.init_lsp_saga({
  border_style = "single",
})

-- Buffer local mappings.
-- search in codes and functions
vim.keymap.set('n', '<leader>sff', '<cmd>Lspsaga lsp_finder<CR>')
vim.keymap.set('n', '<leader>sfr', '<cmd>Lspsaga finder ref<CR>')
vim.keymap.set('n', '<leader>sfR', '<cmd>Lspsaga finder ref ++inexist<CR>')
vim.keymap.set('n', '<leader>sfd', '<cmd>Lspsaga finder def+ref<CR>')
vim.keymap.set('n', '<leader>sfD', '<cmd>Lspsaga finder def+ref ++inexist<CR>')
vim.keymap.set('n', '<leader>sft', '<cmd>Lspsaga finder tyd+ref+imp+def<CR>')
vim.keymap.set('n', '<leader>sfT', '<cmd>Lspsaga finder tyd+ref+imp+def ++inexist<CR>')
vim.keymap.set("n", "<leader>spd", '<cmd>Lspsaga peek_definition<CR>')
vim.keymap.set("n", "<leader>sd[", '<cmd>Lspsaga diagnostic_jump_prev<CR>')
vim.keymap.set("n", "<leader>sd]", '<cmd>Lspsaga diagnostic_jump_next<CR>')
vim.keymap.set("n", "<leader>sdd", '<cmd>Lspsaga show_line_diagnostics<CR>')
-- refactoring
vim.keymap.set("n", "<leader>srr",  "<cmd>Lspsaga rename<CR>")
-- coding helper
vim.keymap.set("n", "<leader>sH",  "<cmd>Lspsaga hover_doc<CR>")
vim.keymap.set("n", "<leader>sca", "<cmd>Lspsaga code_action<CR>")
-- workspace manupulation.
vim.keymap.set("n", "<leader>st",  "<cmd>Lspsaga open_floaterm<CR>")
vim.keymap.set("t", "<leader>sT",  [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]])
-- vim.keymap.set("n", "<A-d>", "<cmd>Lspsaga open_floaterm lazygit<CR>")
