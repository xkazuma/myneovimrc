-- Utilities for creating configurations
local util = require "formatter.util"

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup {
  -- Enable or disable logging
  logging = true,
  -- Set the log level
  log_level = vim.log.levels.WARN,
  -- All formatter configurations are opt-in
  filetype = {
    lua = { require("formatter.filetypes.lua").stylua },
    tex = { require("formatter.filetypes.tex").latexindent },

    -- Use the special "*" filetype for defining formatter configurations on any filetype
    ["*"] = {
      -- "formatter.filetypes.any" defines default configurations for any filetype
      require("formatter.filetypes.any").remove_trailing_whitespace
    }
  }
}

local keymap = vim.keymap.set
keymap('n', '<leader>Ff', '<cmd>Format<cr>',      {})
keymap('n', '<leader>FF', '<cmd>FormatWrite<cr>', {})
