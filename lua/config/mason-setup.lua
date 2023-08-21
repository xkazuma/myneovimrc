local on_attach = function(client, bufnr)
end

require('mason-lspconfig').setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = require('cmp_nvim_lsp').update_capabilities(
        vim.lsp.protocol.make_client_capabilities()
      ),
      on_attach = on_attach
    }
  end
}

require("mason").setup({
  ui = {
    icons = {
      package_installed   = "✓",
      package_pending     = "➜",
      package_uninstalled = "✗"
    }
  }
})
