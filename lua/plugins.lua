return {
  -- ---------------------------------------------
  -- colorscheme
  -- ---------------------------------------------
  {
    'nanotech/jellybeans.vim',
  },
  {
    'savq/melange-nvim',
  },
  {
    "folke/tokyonight.nvim",
    lazy     = false,
    priority = 1000,
    opts     = {},
    config =
      function()
        require('config.tokyonight-setup')
      end,
  },
  -- ---------------------------------------------
  -- visual of editor
  -- ---------------------------------------------
  {
    'nvim-lua/popup.nvim',
  },
  {
    'nvim-tree/nvim-web-devicons',
    config =
      function()
        require('config.nvim-web-devicons-setup')
      end,
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      'SmiteshP/nvim-navic',
      'wthollingsworth/pomodoro.nvim',
    },
    config =
      function()
        require('config.lualine-setup')
      end,
  },
  {
    'norcalli/nvim-colorizer.lua',
    cmd    = 'ColorizerToggle',
    config =
      function()
        require('config.nvim-colorizer-setup')
      end
  },
  {
    'folke/todo-comments.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons'
    },
    config =
      function()
        require('config.todo-comments-setup')
      end
  },
  {
    'kwkarlwang/bufresize.nvim',
    config =
      function()
        require('config.bufresize-setup')
      end
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
    },
    config =
      function()
        require('config.indent-blankline-setup')
      end
  },
  -- ---------------------------------------------
  -- enhancing editor
  -- ---------------------------------------------
  -- filer
  {
    'kyazdani42/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons'
    },
    config =
      function()
        require('config.nvim-tree-setup')
      end
  },
-- fuzzy finder
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'folke/noice.nvim',
      'folke/trouble.nvim',
    },
    config =
      function()
        require('config.telescope-setup')
      end
  },
  {
    'rcarriga/nvim-notify',
    dependencies = {
      'nvim-lua/plenary.nvim'
    },
    config =
      function()
        require('config.nvim-notify-setup')
      end,
  },
  {
    'folke/noice.nvim',
    dependencies = {
      'MunifTanjim/nui.nvim',
      'rcarriga/nvim-notify'
    },
    config =
      function()
        require('config.noice-setup')
      end
  },
  -- tab UI
  {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config =
      function()
        require('config.bufferline-setup')
      end,
  },
  -- input helper
  {
    'echasnovski/mini.surround',
    config =
      function()
        require('config.minisurround-setup')
      end
  },
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config =
      function()
        require('config.nvim-autopairs-setup')
      end,
  },
  {
    'windwp/nvim-ts-autotag',
    config =
      function()
        require('config.nvim-ts-autotag-setup')
      end,
  },
  -- comments
  {
    'numToStr/Comment.nvim',
    config =
      function()
        require('config.comment-setup')
      end,
  },
  {
    'LudoPinelli/comment-box.nvim',
    config =
      function()
        require('config.comment-box-setup')
      end,
  },
  -- ---------------------------------------------
  -- enhanced move 
  -- ---------------------------------------------
  {
    'phaazon/hop.nvim',
    version = 'v2.*',
    config =
      function()
        require('config.hop-setup')
      end,
  },
  {
    'mfussenegger/nvim-treehopper',
    dependencies = {
      'nvim-treesitter/nvim-treesitter'
    },
    config =
      function()
        require('config.nvim-treehopper-setup')
      end
  },
  -- ---------------------------------------------
  -- terminal
  -- ---------------------------------------------
  {
    "akinsho/toggleterm.nvim",
    dependencies = {'kwkarlwang/bufresize.nvim'},
    config       =
      function()
        require('config.toggleterm-setup')
      end,
  },
  -- ---------------------------------------------
  -- deno runtime plugin
  -- ---------------------------------------------
  {
    'vim-denops/denops.vim',
    lazy = true,
    config =
      function()
        require('config.denops-setup')
      end,
  },
  {
    'j-hui/fidget.nvim',
    event = 'LspAttach'
  },
  -- ---------------------------------------------
  -- Runner 
  -- ---------------------------------------------
  {
    'michaelb/sniprun',
    build = 'sh ./install.sh',
    config =
      function()
        require('config.sniprun-setup')
      end,
  },
  -- ---------------------------------------------
  -- Code Completion
  -- ---------------------------------------------
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      'hrsh7th/cmp-nvim-lsp',
      'petertriho/cmp-git',
      'L3MON4D3/LuaSnip',
      'onsails/lspkind.nvim',
    },
    config =
      function()
        require('config.cmp-setup')
      end,
  },
  {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-calc',
    'saadparwaiz1/cmp_luasnip',
    'onsails/lspkind.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
  },
  {
    'petertriho/cmp-git',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
  },
  {
    'L3MON4D3/LuaSnip',
    version    = 'v2.*',
    build  = 'make install_jsregexp',
    dependencies = {
      'rafamadriz/friendly-snippets',
    },
    config =
      function()
        require('config.luasnip-setup')
      end,
  },
  -- related to TreeSitter
  -- ---------------------
  {
    'nvim-treesitter/nvim-treesitter',
    build  = ':TSUpdate',
    config =
      function()
        require('config.nvim-treesitter-setup')
      end,
  },
  {
    'David-Kunz/treesitter-unit',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
    },
    config =
      function()
        require('config.treesitter-unit-setup')
      end,
  },
  {
    'danymat/neogen',
    dependencies = {
      'nvim-treesitter/nvim-treesitter'
    },
    config =
      function()
        require('config.neogen-setup')
      end
  },
  -- ---------------------------------------------
  -- LSP / Linter / DAP / Formatter integrated installer
  -- ---------------------------------------------
  {
    'williamboman/mason.nvim',
    dependencies = {
      'williamboman/mason-lspconfig.nvim',
      'neovim/nvim-lspconfig',
      "folke/trouble.nvim",
      'nvimtools/none-ls.nvim',
      'tamago324/nlsp-settings.nvim',
    },
    config =
      function()
        require('config.mason-setup')
      end,
  },
  {
    'jay-babu/mason-null-ls.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      'williamboman/mason.nvim',
      'nvimtools/none-ls.nvim',
    },
  },
  {
    'nvimtools/none-ls.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
  },
  {
    "folke/neoconf.nvim",
    lazy = true
  },
  {
    'folke/neodev.nvim',
    opts = {},
    config =
      function()
        require('config.neodev-setup')
      end,
  },
  {
    "folke/trouble.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config =
      function()
        require('config.trouble-setup')
      end,
  },
  -- Debug Adapter Protocol (DAP)
  -- ----------------------------
  {
    'mfussenegger/nvim-dap',
    build = ':helptags ALL',
    config =
      function()
        require('config.nvim-dap-setup')
      end,
  },
  -- UI for DAP
  -- ----------
  {
    'rcarriga/nvim-dap-ui',
    dependencies = {
      'mfussenegger/nvim-dap',
      'nvim-tree/nvim-web-devicons',
    },
    config =
      function()
        require('config.nvim-dap-ui-setup')
      end,
  },
  -- Rust
  -- -----
  {
    'mrcjkb/rustaceanvim',
    version = '^4',
    build   = ':helptags ALL',
    ft = {
      'rust'
    },
    dependencies = {
      'mfussenegger/nvim-dap',
    },
  },
  {
    'saecki/crates.nvim',
    tag = 'stable',
    event = {
      'BufRead Cargo.toml',
    },
    config =
      function()
        require('config.crates-setup')
      end,
  },
  -- LSP 
  -- ---
  {
    'nvimdev/lspsaga.nvim',
    event = 'LspAttach',
    dependencies = {
      'williamboman/mason.nvim',
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    },
    config =
      function()
        require('config.lspsaga-setup')
      end
  },
  {
    'folke/lsp-colors.nvim',
    config =
      function()
        require('config.lsp-colors-setup')
      end
  },
  -- ---------------------------------------------
  -- LaTeX
  -- ---------------------------------------------
  {
    'lervag/vimtex',
    lazy = true,
    config =
      function()
        require('config.vimtex-setup')
      end
  },
  -- ---------------------------------------------
  -- Notebook
  -- ---------------------------------------------
  {
    'dccsillag/magma-nvim',
    cmd = 'UpdateRemotePlugins',
    ft = {
      'python'
    },
    dependencies = {
      'nvimdev/lspsaga.nvim',
    },
    config =
      function ()
        require('config.magma-nvim-setup')
      end,
  },
  -- ---------------------------------------------
  -- File type dependencies
  -- ---------------------------------------------
  -- csv
  {
    'Decodetalkers/csv-tools.lua',
    config =
      function()
        require('config.csv-tools-setup')
      end
  },
  -- ---------------------------------------------
  -- Work management
  -- ---------------------------------------------
  -- working time
  -- ------------
  {
    'wthollingsworth/pomodoro.nvim',
    dependencies = {
      'MunifTanjim/nui.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    config =
      function()
        require('config.pomodoro-setup')
      end,
  },
}
