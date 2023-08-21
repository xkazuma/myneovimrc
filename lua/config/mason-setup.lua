local mason           = require('mason')
local mason_lspconfig = require('mason-lspconfig')
local lspconfig       = require('lspconfig')
local cmp_nvim_lsp    = require('cmp_nvim_lsp')
local navic           = require('nvim-navic')

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

