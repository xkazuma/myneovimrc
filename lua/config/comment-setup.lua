local cm = require('Comment')
local ft = require('Comment.ft')

cm.setup({
  padding = true,          -- Add a space b/w comment and the line
  sticky  = true,          -- Whether the cursor should stay at its position
  ignore  = function()     -- Only ignore empty lines for lua files
        if vim.bo.filetype == 'lua' then
          return '^$'
        end
    end,                   -- Lines to be ignored while (un)comment
  toggler = {              -- LHS of toggle mappings in NORMAL mod
    line  = '<leader>cll', -- Line-comment toggle keymap
    block = '<leader>cbb', -- Block-comment toggle keymap
  },
  opleader = {             -- LHS of operator-pending mappings in NORMAL and VISUAL mode
    line  = '<leader>cl',  -- Line-comment keymap
    block = '<leader>cb',  -- Block-comment keymap
  },
  extra = {                -- LHS of extra mappings
    above = '<leader>clO', -- Add comment on the line above
    below = '<leader>clo', -- Add comment on the line below
    eol   = '<leader>clA', -- Add comment at the end of line
  },
  mappings = {             -- Enable keybindings NOTE: If given `false` then the plugin won't create any mappings
    basic = true,          -- Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
    extra = true,          -- Extra mapping; `gco`, `gcO`, `gcA`
  },
  pre_hook  = nil,         -- Function to call before (un)comment
  post_hook = nil,         -- Function to call after (un)comment
})

ft.javascript = {'//%s', '/*%s*/'}

ft.rust       = ft.get('c')

ft.yaml       = '#%s'
ft.toml       = '#%s'
ft.graphql    = '#%s'

ft.latex      = {'%%%s', '\\begin{comment}\n%s\n\\end{comment}'}
