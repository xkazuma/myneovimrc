local treesitter = require('nvim-treesitter')

treesitter.setup({
  sync_install = true,
  auto_install = true,
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = {
    -- shell
    "bash",
    -- lang
    "c",
    "lua",
    "python",
    "java",
    "rust",
    -- web app
    "html",
    "css",
    "scss",
    "javascript",
    "typescript",
    "vue",
    -- note
    "markdown",
    "markdown_inline",
    -- data structure
    "json",
    "toml",
    "yaml",
    "xml",
    -- editor
    "vim",
    "vimdoc",
    -- query
    "query",
    "sql",
    "graphql",
    -- tex
    "latex",
    "bibtex",
    -- docker
    "dockerfile",
    -- git
    "git_config",
    "git_rebase",
    "gitignore",
    "gitcommit",
  },
  ignore_install = {},
  highlight = {
    enable                            = true,
    additional_vim_regex_highlighting = false,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection    = "gnn",
      node_incremental  = "grn",
      scope_incremental = "grc",
      node_decremental  = "grm",
    }
  },
  indent = {
    enable = true
  }
})
