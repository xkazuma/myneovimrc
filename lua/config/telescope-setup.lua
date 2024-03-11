local telescope = require('telescope')
local tsactions = require('telescope.actions')
local tsbuiltin = require('telescope.builtin')

telescope.setup{
  defaults = {
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  }
}

telescope.load_extension("noice")

local keymap = vim.keymap.set
keymap('n', '<leader>ff', tsbuiltin.find_files,         {})
keymap('n', '<leader>fg', tsbuiltin.live_grep,          {})
keymap('n', '<leader>fb', tsbuiltin.buffers,            {})
keymap('n', '<leader>fh', tsbuiltin.help_tags,          {})
keymap('n', '<leader>fn', '<cmd>Telescope noice<cr>',   {})
keymap('n', '<leader>ft', '<cmd>Trouble telescope<cr>', {})
keymap('n', '<leader>fT', '<cmd>TodoTelescope<cr>',     {})
