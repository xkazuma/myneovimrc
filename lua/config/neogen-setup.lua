local ng   = require('neogen')

ng.setup({
  enabled             = true,
  input_after_comment = true,
  snippet_engine      = 'luasnip',
  languages = {
    ['sh.google_bash']           = require('neogen.configurations.sh'),
    ['lua.emmylua']              = require('neogen.configurations.lua'),
    ['java.javadoc']             = require('neogen.configurations.java'),
    ['javascript.jsdoc']         = require('neogen.configurations.javascript'),
    ['javascriptreact.jsdoc']    = require('neogen.configurations.javascriptreact'),
    ['typescript.jsdoc']         = require('neogen.configurations.typescript'),
    ['typescriptreact.jsdoc']    = require('neogen.configurations.typescriptreact'),
    ['vue.jsdoc']                = require('neogen.configurations.vue'),
    ['python.google_docstrings'] = require('neogen.configurations.python'),
    ['rust.rustdoc']             = require('neogen.configurations.rust'),
  }
})

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', '<leader>ng', '<cmd>lua require("neogen").generate()<CR>', opts)
vim.api.nvim_set_keymap('i', '<C-l>',      '<cmd>lua require("neogen").jump_next<CR>',  opts)
vim.api.nvim_set_keymap('i', '<C-h>',      '<cmd>lua require("neogen").jump_prev<CR>',  opts)
