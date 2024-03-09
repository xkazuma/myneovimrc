local vim = vim

local dap    = require('dap')
local dapui  = require("dapui")

dapui.setup({
  icons = {
    expanded = '',
    collapsed = ''
  },
  layouts = {
    {
      position = 'left',
      size     = 0.15,
      elements = {
        { id = 'breakpoints', size = 0.20 },
        { id = 'watches',     size = 0.20 },
        { id = 'scopes',      size = 0.40 },
        { id = 'stacks',      size = 0.20 },
      },
    },
    {
      size     = 0.20,
      position = 'bottom',
      elements = {
        'repl',
        'console',
      },
    }
  }
})

-- ------------------
-- Event hooks
-- ------------------
dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end

-- ------------------
-- Keybinds
-- ------------------
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

keymap("n", "<leader>Duo", "<cmd>lua require('dapui').open()<cr>", opts)
keymap("n", "<leader>Duc", "<cmd>lua require('dapui').close()<cr>", opts)
keymap("n", "<leader>Duu", "<cmd>lua require('dapui').toggle()<cr>", opts)

keymap("v", "<leader>De", "<cmd>lua require('dapui').eval()<cr>", opts)
