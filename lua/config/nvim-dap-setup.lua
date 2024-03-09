local vim = vim
local dap = require 'dap'

vim.fn.sign_define(
  'DapBreakpoint',
  {
    text   = '🛑',
    texthl = '',
    linehl = '',
    numhl  = ''
  })
vim.fn.sign_define(
  'DapBreakpointCondition',
  {
    text   = '🟠',
    texthl = 'Error',
    linehl = '',
    numhl  = ''
  })
vim.fn.sign_define(
  'DapLogPoint',
  {
    text   = '⚪',
    texthl = '',
    linehl = '',
    numhl  = ''
  })
vim.fn.sign_define(
  'DapStopped',
  {
    text   = '🟥',
    texthl = '',
    linehl = '',
    numhl  = ''
  })
vim.fn.sign_define(
  'DapBreakpointRejected',
  {
    text   = '🚫',
    texthl = 'Error',
    linehl = '',
    numhl  = ''
  })

-- codelldb installed by mason
local codelldb_cmd = vim.fn.stdpath('data') .. '/mason/bin/codelldb'

-- start codelldb automatically
dap.adapters.codelldb = {
  type = 'server',
  port = '${port}',
  executable = {
    command = codelldb_cmd,
    args = {'--port', '${port}'},
  }
}

-- Rust
dap.configurations.rust = {
  {
    name           = 'Launch file',
    type           = 'codelldb',
    request        = 'launch',
    cwd            = '${workspaceFolder}',
    stopOnEntry    = false,
    program        = function ()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/', 'file')
    end,
  }
}

-- ------------------
-- Keybinds
-- ------------------
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

keymap('n', '<leader>Dd',  ':DapContinue<cr>', opts)
keymap('n', '<leader>DD',  ':DapTerminate<cr>', opts)
keymap('n', '<leader>Db',  ':DapToggleBreakpoint<cr>', opts)
keymap('n', '<leader>Dsn', ':DapStepOver<cr>', opts)
keymap('n', '<leader>Dsi', ':DapStepInto<cr>', opts)
keymap('n', '<leader>Dso', ':DapStepOut<cr>', opts)
