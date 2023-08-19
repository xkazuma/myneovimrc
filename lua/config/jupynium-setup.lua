require("jupynium").setup({
  --- For Conda environment named "jupynium",
  -- python_host = { "conda", "run", "--no-capture-output", "-n", "jupynium", "python" },
  python_host = vim.g.python3_host_prog or "python3",

  default_notebook_URL = "localhost:8888/nbclassic",

  -- Write jupyter command but without "notebook"
  -- When you call :JupyniumStartAndAttachToServer and no notebook is open,
  -- then Jupynium will open the server for you using this command. (only when notebook_URL is localhost)
  jupyter_command = "jupyter",
  --- For Conda, maybe use base environment
  --- then you can `conda install -n base nb_conda_kernels` to switch environment in Jupyter Notebook
  -- jupyter_command = { "conda", "run", "--no-capture-output", "-n", "base", "jupyter" },

  -- Used when notebook is launched by using jupyter_command.
  -- If nil or "", it will open at the git directory of the current buffer,
  -- but still navigate to the directory of the current buffer. (e.g. localhost:8888/nbclassic/tree/path/to/buffer)
  notebook_dir = nil,

  -- Used to remember the last session (password etc.).
  -- e.g. '~/.mozilla/firefox/profiles.ini'
  -- or '~/snap/firefox/common/.mozilla/firefox/profiles.ini'
  firefox_profiles_ini_path = nil,
  -- nil means the profile with Default=1
  -- or set to something like 'default-release'
  firefox_profile_name = nil,

  -- Open the Jupynium server if it is not already running
  -- which means that it will open the Selenium browser when you open this file.
  -- Related command :JupyniumStartAndAttachToServer
  auto_start_server = {
    enable = true,
    file_pattern = { "*.ju.*" },
  },

  -- Attach current nvim to the Jupynium server
  -- Without this step, you can't use :JupyniumStartSync
  -- Related command :JupyniumAttachToServer
  auto_attach_to_server = {
    enable = true,
    file_pattern = { "*.ju.*", "*.md" },
  },

  -- Automatically open an Untitled.ipynb file on Notebook
  -- when you open a .ju.py file on nvim.
  -- Related command :JupyniumStartSync
  auto_start_sync = {
    enable = true,
    file_pattern = { "*.ju.*", "*.md" },
  },

  -- Automatically keep filename.ipynb copy of filename.ju.py
  -- by downloading from the Jupyter Notebook server.
  -- WARNING: this will overwrite the file without asking
  -- Related command :JupyniumDownloadIpynb
  auto_download_ipynb = false,

  -- Automatically close tab that is in sync when you close buffer in vim.
  auto_close_tab = true,

  -- Always scroll to the current cell.
  -- Related command :JupyniumScrollToCell
  autoscroll = {
    enable = true,
    mode = "always", -- "always" or "invisible"
    cell = {
      top_margin_percent = 20,
    },
  },

  scroll = {
    page = { step = 0.5 },
    cell = {
      top_margin_percent = 20,
    },
  },

  -- Files to be detected as a jupynium file.
  -- Add highlighting, keybindings, commands (e.g. :JupyniumStartAndAttachToServer)
  -- Modify this if you already have lots of files in Jupytext format, for example.
  jupynium_file_pattern = { "*.ju.*" },

  use_default_keybindings = false,
  textobjects = {
    use_default_keybindings = false,
  },

  syntax_highlight = {
    enable = true,
  },

  -- Dim all cells except the current one
  -- Related command :JupyniumShortsightedToggle
  shortsighted = false,

  -- Configure floating window options
  -- Related command :JupyniumKernelHover
  kernel_hover = {
    floating_win_opts = {
      max_width = 84,
      border = "none",
    },
  },
})

-- You can link highlighting groups.
-- This is the default (when colour scheme is unknown)
-- Try with CursorColumn, Pmenu, Folded etc.
vim.cmd [[
hi! link JupyniumCodeCellSeparator CursorLine
hi! link JupyniumMarkdownCellSeparator CursorLine
hi! link JupyniumMarkdownCellContent CursorLine
hi! link JupyniumMagicCommand Keyword
]]

-- Please share your favourite settings on other colour schemes, so I can add defaults.
-- Currently, tokyonight is supported.
--
local keymap = vim.keymap.set
keymap({ "n" },      "<space>jS",  "<cmd>JupyniumStartAndAttachToServer<CR>",           { desc = "Jupynium start and attach to server" })
keymap({ "n" },      "<space>jss", "<cmd>JupyniumStartSync<CR>",                        { desc = "Jupynium sync start" })
keymap({ "n" },      "<space>jsS", "<cmd>JupyniumStopSync<CR>",                         { desc = "Jupynium sync stop" })
keymap({ "n" },      "<space>jh",  "<cmd>JupyniumKernelHover<cr>",                      { desc = "Jupynium hover (inspect a variable)"})
keymap({ "n", "x" }, "<space>jx",  "<cmd>JupyniumExecuteSelectedCells<CR>",             { desc = "Jupynium execute selected cells" })
keymap({ "n", "x" }, "<space>jcj", "<cmd>JupyniumScrollToCell<cr>",                     { desc = "Jupynium scroll to cell" })
keymap({ "n", "x" }, "<space>joc", "<cmd>JupyniumClearSelectedCellsOutputs<CR>",        { desc = "Jupynium clear selected cells" })
keymap({ "n", "x" }, "<space>joj", "<cmd>JupyniumToggleSelectedCellsOutputsScroll<cr>", { desc = "Jupynium toggle selected cell output scroll" })
keymap("",           "<PageUp>",   "<cmd>JupyniumScrollUp<cr>",                         { desc = "Jupynium scroll up" })
keymap("",           "<PageDown>", "<cmd>JupyniumScrollDown<cr>",                       { desc = "Jupynium scroll down" })

keymap({ "n", "x", "o" }, "<space>jk", "<cmd>lua require'jupynium.textobj'.goto_previous_cell_separator()<cr>", { desc = "Go to previous Jupynium cell" })
keymap({ "n", "x", "o" }, "<space>jj", "<cmd>lua require'jupynium.textobj'.goto_next_cell_separator()<cr>",     { desc = "Go to next Jupynium cell" })
keymap({ "n", "x", "o" }, "<space>jC", "<cmd>lua require'jupynium.textobj'.goto_current_cell_separator()<cr>",  { desc = "Go to current Jupynium cell" })
keymap({ "x", "o" },      "aj",        "<cmd>lua require'jupynium.textobj'.select_cell(true, false)<cr>",       { desc = "Select around Jupynium cell" })
keymap({ "x", "o" },      "ij",        "<cmd>lua require'jupynium.textobj'.select_cell(false, false)<cr>",      { desc = "Select inside Jupynium cell" })
keymap({ "x", "o" },      "aJ",        "<cmd>lua require'jupynium.textobj'.select_cell(true, true)<cr>",        { desc = "Select around Jupynium cell (include next cell separator)" })
keymap({ "x", "o" },      "iJ",        "<cmd>lua require'jupynium.textobj'.select_cell(false, true)<cr>",       { desc = "Select inside Jupynium cell (include next cell separator)" })
