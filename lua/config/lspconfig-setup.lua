-- then setup your lsp server as usual
local lspconfig = require('lspconfig')

-- example to setup lua_ls and enable call snippets
lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      completion = {
        callSnippet = "Replace"
      }
    }
  }
})

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d',        vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d',        vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    -- search in codes and functions
    vim.keymap.set('n',          '<leader>sD',  vim.lsp.buf.declaration, opts)
    vim.keymap.set('n',          '<leader>sd',  vim.lsp.buf.definition, opts)
    vim.keymap.set('n',          '<leader>sr',  vim.lsp.buf.references, opts)
    -- refactoring
    vim.keymap.set('n',          '<leader>rr',  vim.lsp.buf.rename, opts)
    -- coding helper
    vim.keymap.set({ 'n', 'v' }, '<leader>cca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n',          '<leader>cf',  function() vim.lsp.buf.format { async = true } end, opts)
    vim.keymap.set('n',          '<leader>ch',  vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n',          '<leader>cH',  vim.lsp.buf.hover, opts)
    vim.keymap.set('n',          '<leader>ci',  vim.lsp.buf.implementation, opts)
    vim.keymap.set('n',          '<leader>ctd', vim.lsp.buf.type_definition, opts)
    -- workspace manupulation.
    vim.keymap.set('n',          '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n',          '<leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, opts)
    vim.keymap.set('n',          '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
  end,
})
