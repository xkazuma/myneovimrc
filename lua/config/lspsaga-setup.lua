local lspsaga = require('lspsaga')
lspsaga.init_lsp_saga({})
lspsaga.setup({
  debug                    = false,
  use_saga_diagnostic_sign = true,
  -- diagnostic sign
  error_sign             = " ",
  warn_sign              = " ",
  hint_sign              = " ",
  infor_sign             = " ",
  diagnostic_header_icon = "󱡴 ",
  -- code action title icon
  code_action_icon   = " ",
  code_action_prompt = {
    enable        = true,
    sign          = true,
    sign_priority = 40,
    virtual_text  = true,
  },
  finder_definition_icon = " ",
  finder_reference_icon  = " ",
  max_preview_lines      = 10,
  finder_action_keys = {
    open        = "o",
    vsplit      = "v",
    split       = "s",
    quit        = "q",
    scroll_down = "<C-j>",
    scroll_up   = "<C-k>",
  },
  code_action_keys = {
    quit = "q",
    exec = "<CR>",
  },
  rename_action_keys = {
    quit = "<C-e>",
    exec = "<CR>",
  },
  definition_preview_icon = " ",
  rename_prompt_prefix    = "󰑕 ",
  rename_output_qflist = {
    enable           = true,
    auto_open_qflist = true,
  },
  server_filetype_map       = {},
  diagnostic_prefix_format  = "%d. ",
  diagnostic_message_format = "%m %c",
  highlight_prefix          = false,
})

-- Buffer local mappings.
-- search in codes and functions
vim.keymap.set('n', '<leader>sff', '<cmd>Lspsaga lsp_finder<CR>')
vim.keymap.set('n', '<leader>sfr', '<cmd>Lspsaga finder ref<CR>')
vim.keymap.set('n', '<leader>sfR', '<cmd>Lspsaga finder ref ++inexist<CR>')
vim.keymap.set('n', '<leader>sfd', '<cmd>Lspsaga finder def+ref<CR>')
vim.keymap.set('n', '<leader>sfD', '<cmd>Lspsaga finder def+ref ++inexist<CR>')
vim.keymap.set('n', '<leader>sft', '<cmd>Lspsaga finder tyd+ref+imp+def<CR>')
vim.keymap.set('n', '<leader>sfT', '<cmd>Lspsaga finder tyd+ref+imp+def ++inexist<CR>')
vim.keymap.set("n", "<leader>spd", '<cmd>Lspsaga peek_definition<CR>')
vim.keymap.set("n", "<leader>sd[", '<cmd>Lspsaga diagnostic_jump_prev<CR>')
vim.keymap.set("n", "<leader>sd]", '<cmd>Lspsaga diagnostic_jump_next<CR>')
vim.keymap.set("n", "<leader>sdd", '<cmd>Lspsaga show_line_diagnostics<CR>')
-- refactoring
vim.keymap.set("n", "<leader>srr",  "<cmd>Lspsaga rename<CR>")
-- coding helper
vim.keymap.set("n", "<leader>sH",  "<cmd>Lspsaga hover_doc<CR>")
vim.keymap.set("n", "<leader>sca", "<cmd>Lspsaga code_action<CR>")
-- workspace manupulation.
vim.keymap.set("n", "<leader>st",  "<cmd>Lspsaga open_floaterm<CR>")
vim.keymap.set("t", "<leader>sT",  [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]])
-- vim.keymap.set("n", "<A-d>", "<cmd>Lspsaga open_floaterm lazygit<CR>")
