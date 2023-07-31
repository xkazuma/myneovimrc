local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Terminal-related --
-- open terminal window below
vim.cmd("command! -nargs=* T split | wincmd j | resize 10 | terminal <args>")
vim.cmd("command! -nargs=* F NvimTreeToggle | NvimTreeResize 30")

-- open terminal with insert mode
autocmd("TermOpen", {
  pattern = "*",
  command = "startinsert"
})
-- without line number
autocmd("TermOpen", {
  pattern = "*",
  command = "setlocal norelativenumber"
})
autocmd("TermOpen", {
  pattern = "*",
  command = "setlocal nonumber"
})
