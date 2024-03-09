local neodev = require('neodev')

neodev.setup({
  setup_jsonls = true,
  lspconfig    = true,
  pathStrict   = true,
  library = { plugins = { "nvim-dap-ui" }, types = true },
})
