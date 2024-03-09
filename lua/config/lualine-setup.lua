local lualine     = require('lualine')
local saganavic   = require('lspsaga.symbol.winbar')
local podomoro    = require('pomodoro')
local lazy_status = require('lazy.status')

local navic_status = {
  function()
    return saganavic.get_bar()
  end,
  cond = function()
    return saganavic.get_bar() ~= nil
  end
}

lualine.setup {
  options = {
    globalstatus         = true,
    --theme                = bubbles_theme,
    theme                = 'tokyonight',
    section_separators   = { left = '', right = '' },
    component_separators = { left = '', right = '' },
    disabled_filetypes   = {
      statusline = {},
      winbar     = {
        'NvimTree',
        'toggleterm',
        'Outline',
        'help',
        'quickfix',
        'qf',
        -- dap
        'dapui_console', 'dap-repl',
        'dapui_stacks',  'dapui_scopes',
        'dapui_watches', 'dapui_breakpoints',
        -- lspsaga
        'sagaoutline',
      }
    },
  },
  sections = {
    lualine_a = { 'filename' },
    lualine_b = { 'branch' },
    lualine_c = {
      {
        lazy_status.updates,
        cond  = lazy_status.has_updates,
        color = { fg = "#ff9e64" },
      }
    },
    lualine_x = {},
    lualine_y = { 'filetype', 'progress' },
    lualine_z = { podomoro.statusline },
  },
  inactive_sections = {
    lualine_a = { 'filename' },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { podomoro.statusline },
  },
  tabline    = {},
  extensions = {},
  winbar     = {
    lualine_a = {
      { 'mode', right_padding = 2 },
    },
    lualine_b = { navic_status },
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  inactive_winbar = {
    lualine_a = {
      { 'mode', right_padding = 2 },
    },
    lualine_b = {},
    lualine_c = { navic_status },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  }
}
