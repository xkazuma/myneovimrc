local vim = vim

local lspsaga = require('lspsaga')
lspsaga.setup({
  border_style             = 'single',
  debug                    = false,
  use_saga_diagnostic_sign = true,
  highlight_prefix         = false,
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
    enable = false,
  },
  beacon = {
    enable    = true,
    frequency = 10,
  },
  ui = {
    code_action = '',
    actionfix   = ' ',
    imp_sign    = '󰳛 ',
    kind        = {},
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
