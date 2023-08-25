local api        = api
local treehopper = require('tsht')

treehopper.config.hint_keys = {
  'e', 't', 'o', 'v', 'x', 'q', 'p', 'd', 'y', 'g',
  'f', 'b', 'l', 'z', 'h', 'c', 'k', 'i', 's', 'u',
  'r', 'a', 'n',
}

api.nvim_set_keymap('o',
  '<leader>ht', '<cmd>lua require("tsht").nodes()<cr>',
  { noremap = false, silent = true })
api.nvim_set_keymap({ 'n', 'x' },
  '<leader>ht', '<cmd>lua require("tsht").nodes()<cr>',
  { noremap = true, silent = true })
