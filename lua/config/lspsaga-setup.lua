local vim = vim

local lspsaga = require('lspsaga')
lspsaga.setup({
  border_style             = 'single',
  debug                    = false,
  use_saga_diagnostic_sign = true,
  highlight_prefix         = false,
  -- diagnostic sign
  error_sign                = ' ',
  warn_sign                 = ' ',
  hint_sign                 = ' ',
  infor_sign                = ' ',
  diagnostic_header_icon    = '󱡴 ',
  finder_definition_icon    = ' ',
  finder_reference_icon     = ' ',
  definition_preview_icon   = ' ',
  rename_prompt_prefix      = '󰑕 ',
  server_filetype_map       = {},
  diagnostic_prefix_format  = '%d. ',
  diagnostic_message_format = '%m %c',
  max_preview_lines         = 10,
  symbol_in_winbar = {
    enable        = false,
  },
  ui = {
    code_action = '',
  },
  outline = {
    auto_preview = false,
    layout       = 'float'
  },
  code_action_prompt = {
    enable        = true,
    sign          = true,
    sign_priority = 40,
    virtual_text  = true,
  },
  rename_output_qflist = {
    enable           = true,
    auto_open_qflist = true,
  },
  finder_action_keys = {
    open        = 'o',
    vsplit      = 'v',
    split       = 's',
    quit        = 'q',
    scroll_down = '<C-j>',
    scroll_up   = '<C-k>',
  },
  code_action_keys = {
    quit = 'q',
    exec = '<CR>',
  },
  rename_action_keys = {
    quit = '<C-e>',
    exec = '<CR>',
  },
})

--  symbols = {
--    File          = { icon = "", hl = "@text.uri" },
--    Module        = { icon = "󱒌", hl = "@namespace" },
--    Namespace     = { icon = "", hl = "@namespace" },
--    Package       = { icon = "", hl = "@namespace" },
--    Class         = { icon = "󰯲", hl = "@type" },
--    Method        = { icon = "󰰑", hl = "@method" },
--    Property      = { icon = "󰰚", hl = "@method" },
--    Field         = { icon = "󰯼", hl = "@field" },
--    Constructor   = { icon = "", hl = "@constructor" },
--    Enum          = { icon = "󰯹", hl = "@type" },
--    Interface     = { icon = "󰰅", hl = "@type" },
--    Function      = { icon = "󰡱", hl = "@function" },
--    Variable      = { icon = "󰫧", hl = "@constant" },
--    Constant      = { icon = "", hl = "@constant" },
--    String        = { icon = "", hl = "@string" },
--    Number        = { icon = "", hl = "@number" },
--    Boolean       = { icon = "", hl = "@boolean" },
--    Array         = { icon = "󰅨", hl = "@constant" },
--    Object        = { icon = "󰲟", hl = "@type" },
--    Key           = { icon = "", hl = "@type" },
--    Null          = { icon = "󰟢", hl = "@type" },
--    EnumMember    = { icon = "", hl = "@field" },
--    Struct        = { icon = "󰰣", hl = "@type" },
--    Event         = { icon = "", hl = "@type" },
--    Operator      = { icon = "", hl = "@operator" },
--    TypeParameter = { icon = "", hl = "@parameter" },
--    Component     = { icon = "󰹫", hl = "@function" },
--    Fragment      = { icon = "", hl = "@constant" },
--  },



-- Buffer local mappings.
-- search in codes and functions
vim.keymap.set('n', '<leader>sff', '<cmd>Lspsaga lsp_finder<CR>')
vim.keymap.set('n', '<leader>sd[', '<cmd>Lspsaga diagnostic_jump_prev<CR>')
vim.keymap.set('n', '<leader>sd]', '<cmd>Lspsaga diagnostic_jump_next<CR>')
vim.keymap.set('n', '<leader>sdd', '<cmd>Lspsaga show_line_diagnostics<CR>')
vim.keymap.set('n', '<leader>ssh', '<cmd>Lspsaga signature_help<CR>')
vim.keymap.set('n', '<leader>sp',  '<cmd>Lspsaga preview_definition<CR>')
-- refactoring
vim.keymap.set('n', '<leader>srr', '<cmd>Lspsaga rename<CR>')
vim.keymap.set('n', '<leader>sri', '<cmd>Lspsaga implement<CR>')
-- coding helper
vim.keymap.set('n', '<leader>sh',  '<cmd>Lspsaga hover_doc<CR>')
vim.keymap.set('n', '<leader>sca', '<cmd>Lspsaga code_action<CR>')
vim.keymap.set('x', '<leader>sca', '<cmd>Lspsaga range_code_action<CR>')
-- visual
vim.keymap.set('x', '<leader>st',  '<cmd>Lspsaga toggle_virtual_text')
