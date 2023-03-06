vim.g.mapleader = " "
vim.g.maplocalleader = " "
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
local plugins = {
  {
    -- auto complete stuff
    'ms-jpq/coq_nvim',
    enabled = false,
    dependencies = { 'ms-jpq/coq.artifacts' },
    init = function()
      vim.g.coq_settings = { auto_start = true }
    end,
  },
  {
    "jackMort/ChatGPT.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    },
    opts = {}
  },
  {
    "iamcco/markdown-preview.nvim", -- Markdown preview
    -- build = '',
    -- cond = function()
    --   return vim.fn.executable 'make' == 1
    -- end,
  },
  { "cbochs/portal.nvim" }, -- https://github.com/cbochs/portal.nvim#portals
  {
    'chentoast/marks.nvim',
    opts = {}
  },
  { "mfussenegger/nvim-dap" },
  {
    "anuvyklack/pretty-fold.nvim",
    dependencies = { 'anuvyklack/fold-preview.nvim', 'anuvyklack/keymap-amend.nvim' }
  },
  { "windwp/nvim-autopairs" },
  { "rmagatti/auto-session" },
  -- {
  --   'glepnir/dashboard-nvim',
  --   event = 'VimEnter',
  --   dependencies = { { 'nvim-tree/nvim-web-devicons' } }
  -- },
  { 'nvim-tree/nvim-web-devicons' },
  {
    "ggandor/leap.nvim",
    dependencies = { "tpope/vim-repeat" },
  },
  { 'nvim-tree/nvim-tree.lua' },
  {
    'rcarriga/nvim-notify',
    opts = {
      stages = "fade_in_slide_out",
      render = "compact",
      timeout = 2000,
    },
    init = function()
      vim.opt.termguicolors = true
      vim.notify = require('notify')
    end
  },
  {
    'folke/noice.nvim',
    config = true,
    dependencies = {
      "MunifTanjim/nui.nvim",
      'rcarriga/nvim-notify',
    },
    -- config = true
    -- init = function()
    --   vim.notify = require('notify')
    -- end
  },
  { 'akinsho/toggleterm.nvim', version = "*", opts = {} },
  { 'tpope/vim-sleuth' }, -- Detect tabstop and shiftwidth automatically

  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'jose-elias-alvarez/null-ls.nvim',
      {
        "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
        opts = {},
        cond = function()
          vim.diagnostic.config({
            -- Setting this to false to avoid duplication error messages from lsp_lines plugin
            virtual_text = false,
            severity_sort = true
          })
          return true
        end,
      },

      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim', opts = {} },

      -- Additional lua configuration, makes nvim stuff amazing!
      'folke/neodev.nvim',
    },
  },

  {
    -- replaced with coq.nvim
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = { 'hrsh7th/cmp-nvim-lsp',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "rafamadriz/friendly-snippets"
    },
  },

  { 'folke/which-key.nvim',      opts = {} },
  {
    -- Adds git releated signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      -- See `:help gitsigns.txt`
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },


  {
    -- colorschemes
    -- 'sainnhe/sonokai',
    -- 'navarasu/onedark.nvim',
    'folke/tokyonight.nvim',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'tokyonight-night'
    end,
  },

  { 'nvim-lualine/lualine.nvim', },
  { "kdheepak/tabline.nvim" },
  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- See `:help indent_blankline.txt`
    opts = {
      char = '┊',
      show_trailing_blankline_indent = false,
    },
  },

  {
    'numToStr/Comment.nvim',
    dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
    event = "VeryLazy",
    config = function()
      require("Comment").setup({
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      })
    end
  },

  {
    -- Fuzzy Finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',
    version = '*',
    dependencies = {
      'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-media-files.nvim', 'nvim-lua/popup.nvim',
      -- "rmagatti/auto-session",
      -- 'rmagatti/session-lens'
    }
  },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
  },

  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      "nvim-treesitter/nvim-treesitter-refactor"
    },
    config = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  },
}
local ok, lazy = pcall(require, 'lazy')
if not ok then
  print('Lazy nvim failed to load')
  return
end
lazy.setup(plugins)
