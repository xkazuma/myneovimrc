local rt = require("rust-tools")

rt.setup({
  -- rust-tools options
  tools = {
    -- how to execute terminal commands
    -- options right now: termopen / quickfix / toggleterm / vimux
    executor = require("rust-tools.executors").termopen,
    -- callback to execute once rust-analyzer is done initializing the workspace
    -- The callback receives one parameter indicating the `health` of the server: "ok" | "warning" | "error"
    on_initialized = nil,
    -- automatically call RustReloadWorkspace when writing to a Cargo.toml file.
    reload_workspace_from_cargo_toml = true,
    -- These apply to the default RustSetInlayHints command
    inlay_hints = {
      auto                   = true,      -- automatically set inlay hints (type hints)
      only_current_line      = false,     -- Only show inlay hints for the current line
      show_parameter_hints   = true,      -- whether to show parameter hints with the inlay hints or not
      parameter_hints_prefix = "<- ",     -- prefix for parameter hints
      other_hints_prefix     = "=> ",     -- prefix for all the other hints (type, chaining)
      max_len_align          = false,     -- whether to align to the length of the longest line in the file
      max_len_align_padding  = 1,         -- padding from the left if max_len_align is true
      right_align            = false,     -- whether to align to the extreme right or not
      right_align_padding    = 7,         -- padding from the right if right_align is true
      highlight              = "Comment", -- The color of the hints
    },
    -- options same as lsp hover / vim.lsp.util.open_floating_preview()
    hover_actions = {
      -- the border that is used for the hover window. see vim.api.nvim_open_win()
      border = {
        { "╭", "FloatBorder" },
        { "─", "FloatBorder" },
        { "╮", "FloatBorder" },
        { "│", "FloatBorder" },
        { "╯", "FloatBorder" },
        { "─", "FloatBorder" },
        { "╰", "FloatBorder" },
        { "│", "FloatBorder" },
      },
      max_width  = nil,   -- Maximal width of the hover window. Nil means no max.
      max_height = nil,   -- Maximal height of the hover window. Nil means no max.
      auto_focus = false, -- whether the hover action window gets automatically focused
    },
    -- settings for showing the crate graph based on graphviz and the dot command
    crate_graph = {
      backend = "x11", -- Backend used for displaying the graph. see: https://graphviz.org/docs/outputs/
      output  = nil,   -- where to store the output, nil for no output stored (relative path from pwd)
      full    = true,  -- true for all crates.io and external crates, false only the local crates
      -- List of backends found on: https://graphviz.org/docs/outputs/
      -- Is used for input validation and autocompletion
      -- Last updated: 2021-08-26
      enabled_graphviz_backends = {
        "bmp",
        "canon",
        "cgimage",
        "cmap",
        "cmapx",
        "cmapx_np",
        "dot",
        "dot_json",
        "eps",
        "exr",
        "fig",
        "gd",
        "gd2",
        "gif",
        "gtk",
        "gv",
        "ico",
        "imap",
        "imap_np",
        "ismap",
        "jp2",
        "jpe",
        "jpeg",
        "jpg",
        "json",
        "json0",
        "pct",
        "pdf",
        "pic",
        "pict",
        "plain",
        "plain-ext",
        "png",
        "pov",
        "ps",
        "ps2",
        "psd",
        "sgi",
        "svg",
        "svgz",
        "tga",
        "tif",
        "tiff",
        "tk",
        "vml",
        "vmlz",
        "wbmp",
        "webp",
        "x11",
        "xdot",
        "xdot1.2",
        "xdot1.4",
        "xdot_json",
        "xlib",
      },
    },
  },
  -- all the opts to send to nvim-lspconfig
  -- these override the defaults set by rust-tools.nvim
  -- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
  server = {
    standalone = true, -- standalone file support setting it to false may improve startup time
    on_attach  = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<leader>sh",  rt.hover_actions.hover_actions,         { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<leader>sca", rt.code_action_group.code_action_group, { buffer = bufnr })
      -- Expand Macros Recursively
      vim.keymap.set('n', '<leader>rem', '<cmd>RustExpandMacro<cr>',     { noremap = true, silent = true })
      -- Move Item Up/Down
      vim.keymap.set('n', '<leader>rmd', '<cmd>RustMoveItemUp<cr>',      { noremap = true, silent = true })
      vim.keymap.set('n', '<leader>rmu', '<cmd>RustMoveItemDown<cr>',    { noremap = true, silent = true })
      -- Hover Actions
      vim.keymap.set('n', '<leader>rha', '<cmd>RustHoverActions<cr>',    { noremap = true, silent = true })
      -- Hover Range
      vim.keymap.set('n', '<leader>rhr', '<cmd>RustHoverRange<cr>',      { noremap = true, silent = true })
      -- Open Cargo.toml
      vim.keymap.set('n', '<leader>roc', '<cmd>RustOpenCargo<cr>',       { noremap = true, silent = true })
      -- Parent Module
      vim.keymap.set('n', '<leader>rpm', '<cmd>RustParentModule<cr>',    { noremap = true, silent = true })
      -- Join Lines
      vim.keymap.set('n', '<leader>rjl', '<cmd>RustJoinLines<cr>',       { noremap = true, silent = true })
      -- Structural Search Replace
      vim.keymap.set('n', '<leader>rssr', '<cmd>RsutSSR<cr>',            { noremap = true, silent = true })
      -- View Crate Graph
      vim.keymap.set('n', '<leader>rvcg', '<cmd>RustViewCrateGraph<cr>', { noremap = true, silent = true })
    end,
  },
  -- debugging stuff
  dap = {
    adapter = {
      type    = "executable",
      command = "lldb-vscode",
      name    = "rt_lldb",
    },
  },
})
