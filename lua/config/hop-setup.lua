local hop        = require('hop')
local directions = require('hop.hint').HintDirection

hop.setup({
  keys = 'etovxqpdygfblzhckisuran'
})

-- ------------------------------
-- mapping hop 
-- ------------------------------
vim.keymap.set({'n', 'x', 'o'}, '<leader>hbc1', '<cmd>HopChar1BC<cr>',             { noremap = true, silent = true })
vim.keymap.set({'n', 'x', 'o'}, '<leader>hac1', '<cmd>HopChar1AC<cr>',             { noremap = true, silent = true })
vim.keymap.set({'n', 'x', 'o'}, '<leader>hmc1', '<cmd>HopChar1MW<cr>',             { noremap = true, silent = true })
vim.keymap.set({'n', 'x', 'o'}, '<leader>hcc1', '<cmd>HopChar1CurrentLine<cr>',    { noremap = true, silent = true })
vim.keymap.set({'n', 'x', 'o'}, '<leader>hwc1', '<cmd>HopChar1<cr>',               { noremap = true, silent = true })
vim.keymap.set({'n', 'x', 'o'}, '<leader>hbc2', '<cmd>HopChar2BC<cr>',             { noremap = true, silent = true })
vim.keymap.set({'n', 'x', 'o'}, '<leader>hac2', '<cmd>HopChar2AC<cr>',             { noremap = true, silent = true })
vim.keymap.set({'n', 'x', 'o'}, '<leader>hmc2', '<cmd>HopChar2MW<cr>',             { noremap = true, silent = true })
vim.keymap.set({'n', 'x', 'o'}, '<leader>hcc2', '<cmd>HopChar2CurrentLine<cr>',    { noremap = true, silent = true })
vim.keymap.set({'n', 'x', 'o'}, '<leader>hwc2', '<cmd>HopChar2<cr>',               { noremap = true, silent = true })
vim.keymap.set({'n', 'x', 'o'}, '<leader>hbll', '<cmd>HopLineBC<cr>',              { noremap = true, silent = true })
vim.keymap.set({'n', 'x', 'o'}, '<leader>hall', '<cmd>HopLineAC<cr>',              { noremap = true, silent = true })
vim.keymap.set({'n', 'x', 'o'}, '<leader>hmll', '<cmd>HopLineMW<cr>',              { noremap = true, silent = true })
vim.keymap.set({'n', 'x', 'o'}, '<leader>hcll', '<cmd>HopLineCurrentLine<cr>',     { noremap = true, silent = true })
vim.keymap.set({'n', 'x', 'o'}, '<leader>hwll', '<cmd>HopLine<cr>',                { noremap = true, silent = true })
vim.keymap.set({'n', 'x', 'o'}, '<leader>hbls', '<cmd>HopLineStartBC<cr>',         { noremap = true, silent = true })
vim.keymap.set({'n', 'x', 'o'}, '<leader>hals', '<cmd>HopLineStartAC<cr>',         { noremap = true, silent = true })
vim.keymap.set({'n', 'x', 'o'}, '<leader>hmls', '<cmd>HopLineStartMW<cr>',         { noremap = true, silent = true })
vim.keymap.set({'n', 'x', 'o'}, '<leader>hwls', '<cmd>HopLineStart<cr>',           { noremap = true, silent = true })
vim.keymap.set({'n', 'x', 'o'}, '<leader>hbp',  '<cmd>HopPatternBC<cr>',           { noremap = true, silent = true })
vim.keymap.set({'n', 'x', 'o'}, '<leader>hap',  '<cmd>HopPatternAC<cr>',           { noremap = true, silent = true })
vim.keymap.set({'n', 'x', 'o'}, '<leader>hmp',  '<cmd>HopPatternMW<cr>',           { noremap = true, silent = true })
vim.keymap.set({'n', 'x', 'o'}, '<leader>hcp',  '<cmd>HopPatternCurrentLine<cr>',  { noremap = true, silent = true })
vim.keymap.set({'n', 'x', 'o'}, '<leader>hwp',  '<cmd>HopPattern<cr>',             { noremap = true, silent = true })
vim.keymap.set({'n', 'x', 'o'}, '<leader>hbw',  '<cmd>HopWordBC<cr>',              { noremap = true, silent = true })
vim.keymap.set({'n', 'x', 'o'}, '<leader>haw',  '<cmd>HopWordAC<cr>',              { noremap = true, silent = true })
vim.keymap.set({'n', 'x', 'o'}, '<leader>hmw',  '<cmd>HopWordMW<cr>',              { noremap = true, silent = true })
vim.keymap.set({'n', 'x', 'o'}, '<leader>hcw',  '<cmd>HopWordCurrentLine<cr>',     { noremap = true, silent = true })
vim.keymap.set({'n', 'x', 'o'}, '<leader>hww',  '<cmd>HopWord<cr>',                { noremap = true, silent = true })
vim.keymap.set({'n', 'x', 'o'}, '<leader>hba',  '<cmd>HopAnywhereBC<cr>',          { noremap = true, silent = true })
vim.keymap.set({'n', 'x', 'o'}, '<leader>haa',  '<cmd>HopAnywhereAC<cr>',          { noremap = true, silent = true })
vim.keymap.set({'n', 'x', 'o'}, '<leader>hma',  '<cmd>HopAnywhereMW<cr>',          { noremap = true, silent = true })
vim.keymap.set({'n', 'x', 'o'}, '<leader>hca',  '<cmd>HopAnywhereCurrentLine<cr>', { noremap = true, silent = true })
vim.keymap.set({'n', 'x', 'o'}, '<leader>hwa',  '<cmd>HopAnywhere<cr>',            { noremap = true, silent = true })
