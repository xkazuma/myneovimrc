local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  print("Installing packer close and reopen Neovim...")
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require('packer.util').float({
        border = 'double',
      })
    end
  }
})

-- Install your plugins here
------------------------------------------------------------ 
-- lazy loading
------------------------------------------------------------ 
-- to load when you send a specified command
---- use { "rhysd/git-messenger.vim", opt = true, cmd = { "GitMessenger" } }
-- to load on a specified event
---- use { "tpope/vim-unimpaired", opt = true, event = { "FocusLost", "CursorHold" } }
-- to load when your editor open a specified file type
---- use { "fatih/vim-go", opt = true, ft = { "go" } }
-- to load when you input a specified key
---- keys = {
----   { "n", "<CR>" },
----   { "v", "<CR>" },
---- }
-- to load when you invocate a VimL function
---- use { "sainnhe/artify.vim", opt = true, fn = { "Artify" } }
-- to load if a specified condition become true.
---- use {
----   "thinca/vim-fontzoom",
----   cond = [[vim.fn.has"gui" == 1]],
----   -- conf = function()
----   --   return vim.fn.has "gui" == 1
----   -- end,
---- }

-- how to management a dependency between packages
---- use {
----   "tyru/capture.vim",
----   requires = {
----     { "thinca/vim-prettyprint" },
----   },
---- }

return packer.startup(
function(use) 

  use "wbthomason/packer.nvim"

  -- git-related
  use {
    "TimUntersberger/neogit",
    requires = "nvim-lua/plenary.nvim",
    config = function() require('config.neogit-setup') end
  }
  use {
    "lewis6991/gitsigns.nvim",
    config = function() require('config.gitsigns-setup') end
  }

  
  -- colorscheme
  use "nanotech/jellybeans.vim"
  
  -- visual of editor
  use "nvim-lua/popup.nvim"
  use {
    "nvim-lualine/lualine.nvim",
    requires = {
      "nvim-tree/nvim-web-devicons", opt = true
    },
    config = function() require('config.lualine-setup') end
  }

  -- enhancing editor
  use {
    "kyazdani42/nvim-tree.lua",
    requires = {
      "nvim-tree/nvim-web-devicons", opt = true
    },
    config = function() require('config.nvim-tree-setup') end
  }
  use "rcarriga/nvim-notify"
  use {
    "edluffy/hologram.nvim",
    config = function() require('config.hologram-setup') end
  }

  -- complition plugin

  -- python
  use {
    "dccsillag/magma-nvim",
    run = ':UpdateRemotePlugins',
    config = function() require('config.magma-setup') end
  }

  -- LaTeX
  use {
    "lervag/vimtex",
    config = function() require('config.vimtex-setup') end
  }


  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)

