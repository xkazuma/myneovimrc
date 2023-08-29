local lualine  = require('lualine')
local navic    = require('nvim-navic')

local navic_status = {
  function()
    return navic.get_location()
  end,
  cond = function()
    return navic.is_available()
  end
}

local colors = {
  blue   = '#80a0ff',
  cyan   = '#79dac8',
  black  = '#080808',
  white  = '#c6c6c6',
  red    = '#ff5189',
  violet = '#d183e8',
  grey   = '#303030',
}

local bubbles_theme = {
  normal = {
    a = { fg = colors.black, bg = colors.violet },
    b = { fg = colors.white, bg = colors.grey },
    c = { fg = colors.black, bg = colors.black },
  },

  insert  = { a = { fg = colors.black, bg = colors.blue } },
  visual  = { a = { fg = colors.black, bg = colors.cyan } },
  replace = { a = { fg = colors.black, bg = colors.red } },

  inactive = {
    a = { fg = colors.white, bg = colors.black },
    b = { fg = colors.white, bg = colors.black },
    c = { fg = colors.black, bg = colors.black },
  },
}

lualine.setup {
  options = {
    globalstatus         = true,
    theme                = bubbles_theme,
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
      }
    },
  },
  sections = {
    lualine_a = { 'filename' },
    lualine_b = { 'branch' },
    lualine_c = {},
    lualine_x = {},
    lualine_y = { 'filetype', 'progress' },
    lualine_z = {
      { 'location', left_padding = 2 },
    },
  },
  inactive_sections = {
    lualine_a = { 'filename' },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'location' },
  },
  tabline    = {},
  extensions = {},
  winbar     = {
    lualine_a = {
      { 'mode', right_padding = 2 },
    },
    lualine_b = {},
    lualine_c = { navic_status },
    lualine_x = {},
    lualine_y = {},
    lualine_z = { require('pomodoro').statusline }
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
