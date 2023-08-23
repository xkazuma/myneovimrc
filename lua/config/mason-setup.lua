local mason           = require('mason')
local mason_lspconfig = require('mason-lspconfig')
local mason_package   = require('mason-core.package')
local mason_registry  = require('mason-registry')
local lspconfig       = require('lspconfig')
local cmp_nvim_lsp    = require('cmp_nvim_lsp')
local navic           = require('nvim-navic')
local linter          = require('lint')
local formatter       = require('formatter')
local formatter_util  = require('formatter.util')

mason.setup({
  ui = {
    border = 'single',
    icons = {
      package_installed   = "✓",
      package_pending     = "➜",
      package_uninstalled = "✗"
    }
  }
})
mason_lspconfig.setup()

mason_lspconfig.setup_handlers {
  function(server_name)
    lspconfig[server_name].setup {
      capabilities = cmp_nvim_lsp.default_capabilities(),
      on_attach = function(client, bufnr)
        navic.attach(client, bufnr)
      end,
    }
  end
}
