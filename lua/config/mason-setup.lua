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

for _, package in ipairs(mason_registry.get_installed_packages()) do
  local package_categories = package.spec.categories[1]
  if package_categories == mason_package.Cat.Formatter then
    for lang in package.spec.languages do
      formatter.config.filetype[lang] = {
        function()
          return {
            exe   = package.name,
            args  = {},
            stdin = true,
          }
        end
      }
    end
  end
  if package_categories == mason_package.Cat.Linter then
    for lang in package.spec.languages do
      linter.linters_by_ft[lang] = { package.name }
    end
  end
end
