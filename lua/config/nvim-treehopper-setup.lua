local api        = api
local treehopper = require('tsht')

treehopper.setup({
  hint_keys = {
    'e', 't', 'o', 'v', 'x', 'q', 'p', 'd', 'y', 'g',
    'f', 'b', 'l', 'z', 'h', 'c', 'k', 'i', 's', 'u',
    'r', 'a', 'n',
  }
})

api.nvim_set_keymap('o',
  '<leader>th', '<cmd><C-U>lua require("tsht").nodes()<cr>',
  { noremap = false, silent = true })
api.nvim_set_keymap('x',
  '<leader>th', '<cmd>lua require("tsht").nodes()<cr>',
  { noremap = true, silent = true })
