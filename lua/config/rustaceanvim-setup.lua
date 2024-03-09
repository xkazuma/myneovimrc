local vim = vim

vim.g.rustaceanvim = {
  tools = {
    code_actions = {
      ui_select_fallback = true,
    },
  },
  server = {
    on_attach = function (client, bufnr)
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
    end
  },
}
-- ------------------
-- Keybinds
-- ------------------
local keymap = vim.api.nvim_set_keymap
local keymapset = vim.keymap.set
local bufnr  = vim.api.nvim_get_current_buf()
local opts   = { noremap = true, silent = true }
local optswb = { noremap = true, silent = true, buffer = bufnr }
local n      = 'n'
local v      = 'v'
local nv     = { 'n', 'v' }

-- hover actions / hover range
keymapset(n, '<leader>Lha',   '<cmd>RustLsp hover actions<cr>', opts)
keymapset(v, '<leader>Lhr',   '<cmd>RustLsp hover range<cr>', opts)
keymapset(n, '<leader>Ld[',   vim.diagnostic.goto_prev,  opts)
keymapset(n, '<leader>Ld]',   vim.diagnostic.goto_next,  opts)
keymapset(n, '<leader>Ldset', vim.diagnostic.setloclist, opts)
-- search in codes and functions
keymapset(n, '<leader>Ldec', vim.lsp.buf.declaration, opts)
keymapset(n, '<leader>Ldef', vim.lsp.buf.definition,  opts)
keymapset(n, '<leader>Lref', vim.lsp.buf.references,  opts)
-- refactoring
keymapset(n, '<leader>Lrr',  vim.lsp.buf.rename, opts)
-- coding helper
keymapset(n, '<leader>Lca', '<cmd>RustLsp codeAction<cr>', optswb)
keymapset(n, '<leader>Lcf', function() vim.lsp.buf.format { async = true } end, opts)
keymapset(n, '<leader>Lcs', vim.lsp.buf.signature_help,  opts)
keymapset(n, '<leader>Lch', vim.lsp.buf.hover,           opts)
keymapset(n, '<leader>Lci', vim.lsp.buf.implementation,  opts)
keymapset(n, '<leader>Lct', vim.lsp.buf.type_definition, opts)
-- workspace manupulation.
keymapset(n,  '<leader>Lwmk', vim.lsp.buf.add_workspace_folder, opts)
keymapset(n,  '<leader>Lwls', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, opts)
keymapset(n,  '<leader>Lwrm', vim.lsp.buf.remove_workspace_folder, opts)
-- debuggables
keymapset(n,  '<leader>Rdd', '<cmd>RustLsp debuggables<cr>', opts)
keymapset(n,  '<leader>RdD', '<cmd>DapTerminate<cr>', opts)
keymapset(n,  '<leader>Rdr', '<cmd>RustLsp! debuggables<cr>', opts)
keymapset(n,  '<leader>Rda', "<cmd>RustLsp debuggables ['arg1', … ]", opts)
-- runnable
keymapset(n,  '<leader>Rrr', '<cmd>RustLsp runnables<cr>', opts)
keymapset(n,  '<leader>Rre', '<cmd>RustLsp! runnables<cr>', opts)
keymapset(n,  '<leader>Rra', "<cmd>RustLsp runnables ['arg1', … ]", opts)
-- testable
keymapset(n,  '<leader>Rtt', '<cmd>RustLsp testables<cr>', opts)
keymapset(n,  '<leader>Rtr', '<cmd>RustLsp! testables<cr>', opts)
keymapset(n,  '<leader>Rta', ":RustLsp testables ['arg1', … ]", opts)
-- explain errors
keymapset(n, '<leader>Ree', '<cmd>RustLsp explainError<cr>', opts)
-- render diagnostics
keymapset(n, '<leader>Rrd', '<cmd>RustLsp renderDiagnostic<cr>', opts)
-- expand macro
keymapset(n, '<leader>Rem', '<cmd>RustLsp expandMacro<cr>', opts)
-- rebuild proc macros
keymapset(n, '<leader>Rrpm', '<cmd>RustLsp rebuildProcMacros<cr>', opts)
-- Move item up/down
keymapset(n, '<leader>Rmu', '<cmd>RustLsp moveItem up<cr>', opts)
keymapset(n, '<leader>Rmd', '<cmd>RustLsp moveItem down<cr>', opts)
-- hover actions
keymapset(n, '<leader>Rha',  '<cmd>RustLsp hover actions<cr>', opts)
keymapset(nv, '<leader>Rhr', '<cmd>RustLsp hover range<cr>', opts)
-- code action
keymapset(n, '<leader>Rca', '<cmd>RustLsp codeAction<cr>', opts)
-- open cargo.toml
keymapset(n, '<leader>Roc', '<cmd>RustLsp openCargo<cr>', opts)
-- parent module
keymapset(n, '<leader>Rpm', '<cmd>RustLsp parentModule<cr>', opts)
-- filtered workspace symbol searchers
keymapset(n, '<leader>Rfws', '<cmd>RustLsp workspaceSymbol<cr>', opts)
keymapset(n, '<leader>Rfwq', ':RustLsp! workspaceSymbol [onlyTypes|allSymbols]? <query>?', opts)
-- join lines
keymapset(n, '<leader>Rj', '<cmd>RustLsp joinLines<cr>', opts)
keymapset(n, '<leader>RJ', '<cmd>RustLsp joinLines<cr>', opts)
-- structural search replace
keymapset(n, '<leader>Rss', ':RustLsp ssr <query>?', opts)
-- view crate graph
keymapset(n, '<leader>Rvc', '<cmd>RustLsp crateGraph<cr>', opts)
-- view syntax tree
keymapset(n, '<leader>Rvs', '<cmd>RustLsp syntaxTree<cr>', opts)
-- fly check
keymapset(n, '<leader>Rcr', '<cmd>RustLsp flyCheck run<cr>', opts)
keymapset(n, '<leader>Rcc', '<cmd>RustLsp flyCheck clear<cr>', opts)
keymapset(n, '<leader>RcC', '<cmd>RustLsp flyCheck cancel<cr>', opts)
-- view HIR / MIR
keymapset(n, '<leader>Rvh', '<cmd>RustLsp view hir<cr>', opts)
keymapset(n, '<leader>Rvm', '<cmd>RustLsp view mir<cr>', opts)
-- Rustc pretty
keymapset(n, '<leader>Ruh', '<cmd>Rustc unpretty hir<cr>', opts)
keymapset(n, '<leader>Rum', '<cmd>Rustc unpretty mir<cr>', opts)
