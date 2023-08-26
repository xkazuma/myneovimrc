local ng   = require('neogen')

ng.setup({
  enabled             = true,
  input_after_comment = true,
  snippet_engine      = 'luasnip',
  languages = {
    ['sh.google_bash']           = ng.configurations.sh,
    ['lua.emmylua']              = ng.configurations.lua,
    ['java.javadoc']             = ng.configurations.java,
    ['javascript.jsdoc']         = ng.configurations.javascript,
    ['javascriptreact.jsdoc']    = ng.configurations.javascriptreact,
    ['typescript.jsdoc']         = ng.configurations.typescript,
    ['typescriptreact.jsdoc']    = ng.configurations.typescriptreact,
    ['vue.jsdoc']                = ng.configurations.vue,
    ['python.google_docstrings'] = ng.configurations.python,
    ['rust.rustdoc']             = ng.configurations.rust,
  }
})

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', '<leader>ng', '<cmd>lua require("neogen").generate()<CR>', opts)
vim.api.nvim_set_keymap('i', '<C-l>',      '<cmd>lua require("neogen").jump_next<CR>',  opts)
vim.api.nvim_set_keymap('i', '<C-h>',      '<cmd>lua require("neogen").jump_prev<CR>',  opts)
