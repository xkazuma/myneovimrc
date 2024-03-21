return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "query",
        -- vim related
        "vim",
        "vimdoc",
        "regex",
        -- shell
        "bash",
        "fish",
        -- wev dev
        "html",
        "javascript",
        "jsdoc",
        "typescript",
        "tsx",
        -- programming language
        "c",
        "rust",
        "java",
        "lua",
        "luap",
        "luadoc",
        "python",
        -- file types
        "xml",
        "yaml",
        "toml",
        "json",
        "jsonc",
        "markdown",
        "markdown_inline",
        -- others
        "regex",
        "diff",
      },
    },
  },
}
