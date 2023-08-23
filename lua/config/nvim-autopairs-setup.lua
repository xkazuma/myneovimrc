local autopairs = require('nvim-autopairs')
autopairs.setup({
  disable_filetype          = {
    "TelescopePrompt",
    "spectre_panel"
  },
  disable_in_macro          = true,  -- disable when recording or executing a macro
  disable_in_visualblock    = false, -- disable when insert after visual block mode
  disable_in_replace_mode   = true,
  ignored_next_char         = [=[[%w%%%'%[%"%.%`%$]]=],
  enable_moveright          = true,
  enable_afterquote         = true,  -- add bracket pairs after quote
  enable_check_bracket_line = true,  -- check bracket in same line
  enable_bracket_in_quote   = true,
  enable_abbr               = false, -- trigger abbreviation
  break_undo                = true,  -- switch for basic rule break undo sequence
  check_ts                  = false,
  map_cr                    = true,
  map_bs                    = true,  -- map the <BS> key
  map_c_h                   = false, -- Map the <C-h> key to delete a pair
  map_c_w                   = false, -- map <c-w> to delete a pair if possible

})

-- cmp setting
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)

local handlers = require('nvim-autopairs.completion.handlers')
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done({
    filetypes = {
      -- "*" is a alias to all filetypes
      ["*"] = {
        ["("] = {
          kind = {
            cmp.lsp.CompletionItemKind.Function,
            cmp.lsp.CompletionItemKind.Method,
          },
          handler = handlers["*"]
        }
      },
      lua = {
        ["("] = {
          kind = {
            cmp.lsp.CompletionItemKind.Function,
            cmp.lsp.CompletionItemKind.Method
          },
          ---@param char string
          ---@param item table item completion
          ---@param bufnr number buffer number
          ---@param rules table
          ---@param commit_character table<string>
          handler = function(char, item, bufnr, rules, commit_character)
            -- Your handler function. Inpect with print(vim.inspect{char, item, bufnr, rules, commit_character})
          end
        }
      },
      -- Disable for tex
      tex = false
    }
  })
)


-- rule setting
local Rule = require('nvim-autopairs.rule')
local autopairs = require('nvim-autopairs')

autopairs.add_rule(Rule("$$","$$","tex"))
-- you can use some built-in conditions
local cond = require('nvim-autopairs.conds')
autopairs.add_rules({
  Rule("$", "$",{"tex", "latex"})
    -- don't add a pair if the next character is %
    :with_pair(cond.not_after_regex("%%"))
    -- don't add a pair if  the previous character is xxx
    :with_pair(cond.not_before_regex("xxx", 3))
    -- don't move right when repeat character
    :with_move(cond.none())
    -- don't delete if the next character is xx
    :with_del(cond.not_after_regex("xx"))
    -- disable adding a newline when you press <cr>
    :with_cr(cond.none())
  },
  -- disable for .vim files, but it work for another filetypes
  Rule("a","a","-vim")
)
--- check ./lua/nvim-autopairs/rules/basic.lua


-- tree-sitter
autopairs.setup({
    check_ts = true,
    ts_config = {
        lua        = {'string'},-- it will not add a pair on that treesitter node
        javascript = {'template_string'},
        java       = false,-- don't check treesitter on java
    }
})

local ts_conds = require('nvim-autopairs.ts-conds')
-- press % => %% only while inside a comment or string
autopairs.add_rules({
  Rule("%", "%", "lua")
    :with_pair(ts_conds.is_ts_node({'string','comment'})),
  Rule("$", "$", "lua")
    :with_pair(ts_conds.is_not_ts_node({'function'}))
})
