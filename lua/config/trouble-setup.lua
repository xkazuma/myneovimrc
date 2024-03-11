local trouble = require('trouble')

trouble.setup({
    position             = "bottom", -- position of the list can be: bottom, top, left, right
    height               = 10,       -- height of the trouble list when position is top or bottom
    width                = 50,       -- width of the list when position is left or right
    icons                = true,     -- use devicons for filenames
    mode                 = "workspace_diagnostics", -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
    severity             = nil,   -- nil (ALL) or vim.diagnostic.severity.ERROR | WARN | INFO | HINT
    fold_open            = "",   -- icon used for open folds
    fold_closed          = "",   -- icon used for closed folds
    group                = true,  -- group results by file
    padding              = true,  -- add an extra new line on top of the list
    cycle_results        = true,  -- cycle item list when reaching beginning or end of list
    multiline            = true,  -- render multi-line messages
    indent_lines         = true,  -- add an indent guide below the fold icons
    auto_open            = false, -- automatically open the list when you have diagnostics
    auto_close           = false, -- automatically close the list when you have no diagnostics
    auto_preview         = true,  -- automatically preview the location of the diagnostic. <esc> to close preview and go back to last window
    auto_fold            = false, -- automatically fold a file trouble list at creation
    use_diagnostic_signs = true,  -- enabling this will use the signs defined in your lsp client
    win_config = { -- window configuration for floating windows. See |nvim_open_win()|.
      border = "single"
    },
    action_keys = { -- key mappings for actions in the trouble list
                    -- map to {} to remove a mapping, for example: close = {},
        close           = "q", -- close the list
        cancel          = "<esc>", -- cancel the preview and get back to your last window / buffer / cursor
        refresh         = "r", -- manually refresh
        toggle_mode     = "m", -- toggle between "workspace" and "document" diagnostics mode
        switch_severity = "s", -- switch "diagnostics" severity filter level to HINT / INFO / WARN / ERROR
        toggle_preview  = "P", -- toggle auto_preview
        hover           = "K", -- opens a small popup with the full multiline message
        preview         = "p", -- preview the diagnostic location
        open_code_href  = "c", -- if present, open a URI with more information about the diagnostic error
        previous        = "k", -- previous item
        next            = "j", -- next item
        help            = "?", -- help menu
        close_folds = { -- close all folds
          "zM",
          "zm",
        },
        open_folds = { -- open all folds
          "zR",
          "zr",
        },
        toggle_fold = { -- toggle fold of current file
          "zA",
          "za",
        },
        jump = {       -- jump to the diagnostic or open / close folds
          "<cr>",
          "<tab>",
          "<2-leftmouse>",
        },
        open_split = {  -- open buffer in new split
          "<c-,x>"
        },
        open_vsplit = { -- open buffer in new vsplit
          "<c-v>",
        },
        open_tab = { -- open buffer in new tab
          "<c-t>",
        },
        jump_close = {  -- jump to the diagnostic and close the list
          "o",
        },
    },
    auto_jump = { -- for the given modes, automatically jump if there is only a single result
      "lsp_definitions"
    },
    include_declaration = { -- for the given modes, include the declaration of the current symbol in the results
      "lsp_references",
      "lsp_implementations",
      "lsp_definitions",
    },
})

-- --------------------
-- Keybinds
-- --------------------
local opts = {
  silent  = true,
  noremap = true
}
local n = 'n'
vim.api.nvim_set_keymap(n, "<leader>tt", "<cmd>Trouble<cr>",                       opts)
vim.api.nvim_set_keymap(n, "<leader>tw", "<cmd>Trouble workspace_diagnostics<cr>", opts)
vim.api.nvim_set_keymap(n, "<leader>td", "<cmd>Trouble document_diagnostics<cr>",  opts)
vim.api.nvim_set_keymap(n, "<leader>tl", "<cmd>Trouble loclist<cr>",               opts)
vim.api.nvim_set_keymap(n, "<leader>tq", "<cmd>Trouble quickfix<cr>",              opts)
vim.api.nvim_set_keymap(n, "gR",         "<cmd>Trouble lsp_references<cr>",        opts)
vim.api.nvim_set_keymap(n, '<leader>tn', "<cmd>lua require('trouble').next({skip_groups = true, jump = true})<cr>",     opts)
vim.api.nvim_set_keymap(n, '<leader>t]', "<cmd>lua require('trouble').next({skip_groups = true, jump = true})<cr>",     opts)
vim.api.nvim_set_keymap(n, '<leader>tp', "<cmd>lua require('trouble').previous({skip_groups = true, jump = true})<cr>", opts)
vim.api.nvim_set_keymap(n, '<leader>t[', "<cmd>lua require('trouble').previous({skip_groups = true, jump = true})<cr>", opts)
