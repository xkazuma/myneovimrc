local api        = api
local treehopper = require('tsht')

treehopper.setup({
  hint_keys = { "h", "j", "f", "d", "n", "v", "s", "l", "a" }
})

api.nvim_set_keymap('o', '<leader>th', '<cmd><C-U>lua require("tsht").nodes()<cr>', { noremap = false, silent = true })
api.nvim_set_keymap('x', '<leader>th', '<cmd>lua require("tsht").nodes()<cr>',      { noremap = true,  silent = true })
