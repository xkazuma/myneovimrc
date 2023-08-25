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

  -- ---------------------------------------------
  -- plugin manager
  -- ---------------------------------------------
  use {"wbthomason/packer.nvim"}

  -- ---------------------------------------------
  -- git-related
  -- ---------------------------------------------
  use {'dinhhuy258/git.nvim',
    config   = function() require('config.git-setup') end}
  use {'lewis6991/gitsigns.nvim',
    config = function() require('config.gitsigns-setup') end}

  -- ---------------------------------------------
  -- colorscheme
  -- ---------------------------------------------
  use {'nanotech/jellybeans.vim'}
  use {'savq/melange-nvim'}

  -- ---------------------------------------------
  -- visual of editor
  -- ---------------------------------------------
  use {'nvim-lua/popup.nvim'}
  use {'nvim-tree/nvim-web-devicons',
    config   = function() require('config.nvim-web-devicons-setup') end}
  use {'nvim-lualine/lualine.nvim',
    requires = {{'nvim-tree/nvim-web-devicons', opt = true}, 'SmiteshP/nvim-navic'},
    config   = function() require('config.lualine-setup') end}
  use {'echasnovski/mini.indentscope',
    branch = 'stable',
    config   = function() require('config.mini-indentscope-setup') end}
  use {'norcalli/nvim-colorizer.lua',
    cmd    = 'ColorizerToggle',
    config = function() require('config.nvim-colorizer-setup') end}
  use {'folke/todo-comments.nvim',
    requires = {'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons' },
    config   = function() require('config.todo-comments-setup') end}

  -- ---------------------------------------------
  -- enhancing editor
  -- ---------------------------------------------
  -- filer
  use {'kyazdani42/nvim-tree.lua',
    requires = {'nvim-tree/nvim-web-devicons', opt = true},
    config   = function() require('config.nvim-tree-setup') end}
  -- fuzzy finder
  use {'nvim-telescope/telescope.nvim',
    requires = {'nvim-lua/plenary.nvim'},
    config   = function() require('config.telescope-setup') end}
  -- notification
  use {'folke/noice.nvim',
    requires = {'MunifTanjim/nui.nvim', 'rcarriga/nvim-notify'},
    config   = function() require('config.noice-setup') end}
  -- notification
  use {'rcarriga/nvim-notify',
    requires = {'nvim-lua/plenary.nvim'},
    config   = function() require('config.nvim-notify-setup') end}
  -- tab UI
  use {'akinsho/bufferline.nvim',
    tag      = '*',
    requires = {'nvim-tree/nvim-web-devicons', opt = true},
    config   = function() require('config.bufferline-setup') end}
  -- input helper
  use {'echasnovski/mini.surround',
    config = function() require('config.minisurround-setup') end}
  use {'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = function() require('config.nvim-autopairs-setup') end}
  use {'windwp/nvim-ts-autotag',
    config = function() require('config.nvim-ts-autotag-setup') end}
  -- show outline
  use {'simrat39/symbols-outline.nvim',
    config = function() require('config.symbols-outline-setup') end}
  -- show breadcrumbs
  use {'SmiteshP/nvim-navic',
    requires = {'nvim-tree/nvim-web-devicons', 'neovim/nvim-lspconfig'},
    config   = function() require('config.nvim-navic-setup') end}

  -- ---------------------------------------------
  -- enhanced move 
  -- ---------------------------------------------
  use {'phaazon/hop.nvim',
    branch = 'v2',
    config = function() require('config.hop-setup') end}
  use {'mfussenegger/nvim-treehopper',
    requires = {'nvim-treesitter/nvim-treesitter'},
    config   = function() require('config.nvim-treehopper-setup') end}

  -- ---------------------------------------------
  -- terminal
  -- ---------------------------------------------
  use {"akinsho/toggleterm.nvim",
    tag = '*',
    config = function() require('config.toggleterm-setup') end}

  -- ---------------------------------------------
  -- deno runtime plugin
  -- ---------------------------------------------
  use {'vim-denops/denops.vim',
    lazy   = false,
    config = function() require('config.denops-setup') end}
  use {'j-hui/fidget.nvim',
    event = 'LspAttach'}

  -- ---------------------------------------------
  -- Runner 
  -- ---------------------------------------------
  use {'michaelb/sniprun',
    run = 'sh ./install.sh',
    config = function() require('config.sniprun-setup') end}

  -- ---------------------------------------------
  -- LSP / Linter / DAP / Formatter integrated installer
  -- ---------------------------------------------
  -- LSP 
  -- ---
  use {'neovim/nvim-lspconfig',
        config = function() require('config.lspconfig-setup') end}
  use {'kkharji/lspsaga.nvim',
    after = 'nvim-lspconfig',
    config = function() require('config.lspsaga-setup') end}
  use {'folke/lsp-colors.nvim',
    config = function() require('config.lsp-colors-setup') end}
  -- Integrated installer
  -- --------------------
  use {'williamboman/mason.nvim',
    requires = {
      'williamboman/mason-lspconfig.nvim',
      'hrsh7th/cmp-nvim-lsp',
      'neovim/nvim-lspconfig',
      'mfussenegger/nvim-lint',
      'mhartington/formatter.nvim',
    },
    config = function() require('config.mason-setup') end}
  use {'WhoIsSethDaniel/mason-tool-installer.nvim',
    config = function() require('config.mason-tool-installer-setup') end}
  -- Linter
  -- ------
  use {'mfussenegger/nvim-lint',
    config = function() require('config.nvim-lint-setup') end}
  -- Formatter
  -- ---------
  use {'mhartington/formatter.nvim',
    config = function() require('config.formatter-setup') end}
  -- Debug Adapter Protocol (DAP)
  -- ----------------------------
  use {'rcarriga/nvim-dap-ui',
    config = function() require('config.nvim-dap-ui-setup') end,
    requires = {'mfussenegger/nvim-dap', 'neovim/nvim-lspconfig'}}
  use {'folke/neodev.nvim',
    config = function() require('config.neodev-setup') end}

  -- ---------------------------------------------
  -- related to TreeSitter
  -- ---------------------------------------------
  use {'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function() require('config.nvim-treesitter-setup') end}
  use {'David-Kunz/treesitter-unit',
    requires = {'nvim-treesitter/nvim-treesitter'},
    config   = function() require('config.treesitter-unit-setup') end}

  -- ---------------------------------------------
  -- completion tools
  -- ---------------------------------------------
  use {'hrsh7th/cmp-nvim-lsp',
       'hrsh7th/cmp-buffer',
       'hrsh7th/cmp-path',
       'hrsh7th/cmp-cmdline',
       'hrsh7th/cmp-calc',
       'petertriho/cmp-git',
       'saadparwaiz1/cmp_luasnip',
       'onsails/lspkind.nvim',
       requires = {'mortepau/codicons.nvim'}}
  use {'L3MON4D3/LuaSnip',
    tag      = 'v2.0.0',
    run      = 'make install_jsregexp',
    config   = function() require('config.luasnip-setup') end}
  use {'rafamadriz/friendly-snippets'}
  use {'hrsh7th/nvim-cmp',
    requires = {'hrsh7th/cmp-nvim-lsp'},
    config   = function() require('config.cmp-setup') end}

  -- ---------------------------------------------
  -- LaTeX
  -- ---------------------------------------------
  use {'lervag/vimtex',
    config = function() require('config.vimtex-setup') end}

  -- ---------------------------------------------
  -- Notebook
  -- ---------------------------------------------
  use {'kiyoon/jupynium.nvim',
    run = 'pip3 install --user .',
    config = function() require('config.jupynium-setup') end}

  -- ---------------------------------------------
  -- Waka time
  -- ---------------------------------------------
  use {'wakatime/vim-wakatime'}

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)
