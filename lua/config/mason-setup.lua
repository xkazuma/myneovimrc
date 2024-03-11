local vim = vim

local neodev          = require('neodev')
local mason           = require('mason')
local null_ls         = require('null-ls')
local mason_lspconfig = require('mason-lspconfig')
local mason_null_ls   = require('mason-null-ls')
local neoconf         = require('neoconf')
local lspconfig       = require('lspconfig')
local cmp_nvim_lsp    = require('cmp_nvim_lsp')
local navic           = require('nvim-navic')

local myensure_installed = {
    -- shell
    'bash-language-server', 'shellcheck', 'shfmt',
    -- vim
    'vim-language-server',
    -- lua
    'lua-language-server',
    -- tex
    'vale', 'ltex-ls', 'texlab', 'tectonic', 'latexindent',
    -- java
    -- rust
    'codelldb', 'rust-analyzer',
    -- LSP settings
    'jsonls',
  }
local my_null_ls_sources = {
    -- text
    --     null_ls.builtins.completion.spell,
    -- null_ls.builtins.diagnostics.ltrs.with({ extra_filetypes = { 'tex', 'toml', }, }),
    -- Typescript / Javascript
    -- fish shell
    null_ls.builtins.diagnostics.fish,
    null_ls.builtins.formatting.fish_indent,
    -- Lua
    null_ls.builtins.formatting.stylua,
    -- GitHub Actions
    null_ls.builtins.diagnostics.actionlint,
  }
-- ------------------------
-- Keybinds
-- ------------------------
local set_keybinds = function(ev)
  -- Enable completion triggered by <c-x><c-o>
  vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

  -- Buffer local mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local opts = { buffer = ev.buf }
  local n    = { 'n' }
  local nv   = { 'n', 'v' }
  vim.keymap.set(n, '<leader>Lo',    vim.diagnostic.open_float, opts)
  vim.keymap.set(n, '<leader>Ld[',   vim.diagnostic.goto_prev,  opts)
  vim.keymap.set(n, '<leader>Ld]',   vim.diagnostic.goto_next,  opts)
  vim.keymap.set(n, '<leader>Ldset', vim.diagnostic.setloclist, opts)
  -- search in codes and functions
  vim.keymap.set(n, '<leader>Ldec', vim.lsp.buf.declaration, opts)
  vim.keymap.set(n, '<leader>Ldef', vim.lsp.buf.definition,  opts)
  vim.keymap.set(n, '<leader>Lref', vim.lsp.buf.references,  opts)
  -- refactoring
  vim.keymap.set(n, '<leader>Lrr', vim.lsp.buf.rename, opts)
  -- coding helper
  vim.keymap.set(nv, '<leader>Lca', vim.lsp.buf.code_action, opts)
  vim.keymap.set(n,  '<leader>Lcf', function() vim.lsp.buf.format { async = true } end, opts)
  vim.keymap.set(n,  '<leader>Lcsh',  vim.lsp.buf.signature_help,  opts)
  vim.keymap.set(n,  '<leader>Lcho',  vim.lsp.buf.hover,           opts)
  vim.keymap.set(n,  '<leader>Lcimp', vim.lsp.buf.implementation,  opts)
  vim.keymap.set(n,  '<leader>Lctd',  vim.lsp.buf.type_definition, opts)
  -- workspace manupulation.
  vim.keymap.set(n,  '<leader>Lwmk', vim.lsp.buf.add_workspace_folder, opts)
  vim.keymap.set(n,  '<leader>Lwls', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, opts)
  vim.keymap.set(n,  '<leader>Lwrm', vim.lsp.buf.remove_workspace_folder, opts)
end

-- ----------------------------
-- Diagnostic signs
-- ----------------------------
vim.cmd [[ 
  sign define DiagnosticSignError text=  linehl= texthl=DiagnosticSignError numhl=
  sign define DiagnosticSignWarn  text=  linehl= texthl=DiagnosticSignWarn  numhl=
  sign define DiagnosticSignInfo  text=  linehl= texthl=DiagnosticSignInfo  numhl=
  sign define DiagnosticSignHint  text=  linehl= texthl=DiagnosticSignHint  numhl=
]]

-- ----------------------------
-- neodev setup
-- ----------------------------
neodev.setup()

-- It's important that you set up the plugins in the following order:
-- 1. mason.nvim
-- 2. mason-lspconfig.nvim
-- 3. Setup servers via lspconfig

-- 1.
mason.setup({
  ui = {
    border = 'rounded',
    icons = {
      package_installed   = "✓",
      package_pending     = "➜",
      package_uninstalled = "✗"
    }
  }
})

-- 2. set up neoconf.nvim BEFORE nvim-lspconfig.
neoconf.setup()
mason_lspconfig.setup()

-- 3.
mason_lspconfig.setup_handlers({
  function(server_name)
    lspconfig[server_name].setup {
      capabilities = cmp_nvim_lsp.default_capabilities(),
      on_attach = function(client, bufnr)
        -- Server capabilities spec:
        -- https://microsoft.github.io/language-server-protocol/specifications/lsp/3.17/specification/#serverCapabilities
        if client.server_capabilities.documentHighlightProvider then
          vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
          vim.api.nvim_clear_autocmds { buffer = bufnr, group = "lsp_document_highlight" }
          vim.api.nvim_create_autocmd("CursorHold", {
            callback = vim.lsp.buf.document_highlight,
            buffer   = bufnr,
            group    = "lsp_document_highlight",
            desc     = "Document Highlight",
          })
          vim.api.nvim_create_autocmd("CursorMoved", {
            callback = vim.lsp.buf.clear_references,
            buffer   = bufnr,
            group    = "lsp_document_highlight",
            desc     = "Clear All the References",
          })
        end
        -- for navic
        navic.attach(client, bufnr)
      end,
    }
  end,
  ["rust_analyzer"] = function ()
      require("config.rustaceanvim-setup")
  end,
})

-- extra: mason-null-ls and null-ls
null_ls.setup({
  border = 'rounded',
  sources = my_null_ls_sources,
})
mason_null_ls.setup({
  ensure_installed = myensure_installed,
  automatic_installation = false,
  handlers = {},
})
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    set_keybinds(ev)
  end,
})
