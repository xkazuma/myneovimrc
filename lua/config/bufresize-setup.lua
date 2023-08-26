local br  = require('bufresize')

local opts = { noremap = true, silent = true }

br.setup({
  register = {
    trigger_events = { 'BufWinEnter', 'WinEnter' },
    keys           = {
      { 'n', '<leader>w<',    '30<C-w><',           opts },
      { 'n', '<leader>w>',    '30<C-w>>',           opts },
      { 'n', '<leader>w+',    '10<C-w>+',           opts },
      { 'n', '<leader>w-',    '10<C-w>-',           opts },
      { 'n', '<leader>w_',    '<C-w>_',             opts },
      { 'n', '<leader>w=',    '<C-w>=',             opts },
      { 'n', '<leader>w|',    '<C-w>|',             opts },
      { 'n', '<leader>wo',    '<C-w>|<C-w>_',       opts },
      { '',  '<LeftRelease>', '<LeftRelease>',      opts },
      { 'i', '<LeftRelease>', '<LeftRelease><C-o>', opts },
    },
  },
  resize = {
    keys           = {},
    trigger_events = { 'VimResized' },
    increment      = 5,
  },
})
