return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- lua
        "stylua",
        -- shell
        "shellcheck",
        "shfmt",
        -- python
        "flake8",
        -- vue
        "vetur-vls",
      },
    },
  },
}
