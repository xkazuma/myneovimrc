-- then setup your lsp server as usual
local lspconfig  = require('lspconfig')

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

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
    vim.keymap.set('n',          '<leader>LfD',  vim.lsp.buf.declaration, opts)
    vim.keymap.set('n',          '<leader>Lfd',  vim.lsp.buf.definition, opts)
    vim.keymap.set('n',          '<leader>Lfr',  vim.lsp.buf.references, opts)
    -- refactoring
    vim.keymap.set('n',          '<leader>Lrr',  vim.lsp.buf.rename, opts)
    -- coding helper
    vim.keymap.set({ 'n', 'v' }, '<leader>Lca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n',          '<leader>Lcf', function() vim.lsp.buf.format { async = true } end, opts)
    vim.keymap.set('n',          '<leader>Lch', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n',          '<leader>LcH', vim.lsp.buf.hover, opts)
    vim.keymap.set('n',          '<leader>Lci', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n',          '<leader>Lct', vim.lsp.buf.type_definition, opts)
    -- workspace manupulation.
    vim.keymap.set('n',          '<leader>Lwa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n',          '<leader>Lwl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, opts)
    vim.keymap.set('n',          '<leader>Lwr', vim.lsp.buf.remove_workspace_folder, opts)
  end,
})
