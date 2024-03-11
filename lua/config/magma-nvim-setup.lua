local vim = vim

vim.g.magma_automatically_open_output = false
vim.g.magma_image_provider            = "kitty"
vim.g.magma_wrap_output               = true
vim.g.magma_cell_highlight_group      = "CursorLine"
vim.g.magma_save_path                 = vim.fn.stdpath("data") .. "/magma"
vim.g.magma_copy_output               = false
vim.g.magma_show_mimetype_debug       = false

function MagmaInitPython()
    vim.cmd[[
    :MagmaInit python3
    :MagmaEvaluateArgument a=5
    ]]
end

vim.cmd[[
  :command MagmaInitPython lua MagmaInitPython()
]]


-- --------------
-- Keybinds
-- --------------
local opts = {
  silent = true,
}
local optse = {
  silent = true,
  expr   = true,
}
local n = { 'n' }
vim.keymap.set(n, "<leader>M",   "<cmd>MagmaInit<cr>",             opts)
vim.keymap.set(n, "<leader>mi",  "<cmd>MagmaInit<cr>",             opts)
vim.keymap.set(n, "<leader>mr",  "<cmd>MagmaEvaluateOperator<cr>", optse)
vim.keymap.set(n, "<leader>mrr", "<cmd>MagmaEvaluateLine<cr>",     opts)
vim.keymap.set(n, "<leader>mrc", "<cmd>MagmaReevaluateCell<cr>",   opts)
vim.keymap.set(n, "<leader>md",  "<cmd>MagmaDelete<cr>",           opts)
vim.keymap.set(n, "<leader>mo",  "<cmd>MagmaShowOutput<cr>",       opts)
local x = { 'x' }
vim.keymap.set(x, "<leader>mr", "<cmd>MagmaEvaluateVisual<cr>", opts)
