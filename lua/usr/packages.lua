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
    "jackMort/ChatGPT.nvim",
    dependencies={
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    },
    opts={}
  },
  {
	"iamcco/markdown-preview.nvim", -- Markdown preview
    -- build = '',
    -- cond = function()
    --   return vim.fn.executable 'make' == 1
    -- end,
  },
  {
    "cbochs/portal.nvim" -- https://github.com/cbochs/portal.nvim#portals
  },
  {
    'chentoast/marks.nvim',
    opts = {}
  },
  {
    "mfussenegger/nvim-dap"
  },
  {
    "anuvyklack/pretty-fold.nvim",
    dependencies = { 'anuvyklack/fold-preview.nvim', 'anuvyklack/keymap-amend.nvim' }
  },
  { -- Theme inspired by Atom
    'navarasu/onedark.nvim',
    config = function()
      vim.cmd.colorscheme 'onedark'
    end,
  },
  {
    "windwp/nvim-autopairs"
  },
  {
    "rmagatti/auto-session"
  },
  {
    'glepnir/dashboard-nvim',
    event = 'VimEnter',
    dependencies = { { 'nvim-tree/nvim-web-devicons' } }
  },
  {
    'nvim-tree/nvim-web-devicons'
  },
  {
    "kdheepak/tabline.nvim"
  },
  {
    "ggandor/leap.nvim",
    dependencies = { "tpope/vim-repeat" },
  },
  {
    'nvim-tree/nvim-tree.lua'
  },
  {
    'folke/noice.nvim',
    dependencies = {
      "MunifTanjim/nui.nvim",
      'rcarriga/nvim-notify',
    },
  },
  { 'akinsho/toggleterm.nvim', version = "*", opts = { open_mapping = [[<C-\>]], } },
  -- NOTE: First, some plugins that don't require any configuration

  -- Git related plugins
  -- wip

  -- Detect tabstop and shiftwidth automatically
  {
    'tpope/vim-sleuth'
  },

  -- NOTE: This is where your plugins related to LSP can be installed.
  --  The configuration is done below. Search for lspconfig to find it below.
  { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim', opts = {} },

      -- Additional lua configuration, makes nvim stuff amazing!
      'folke/neodev.nvim',
    },
  },

  { -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = { 'hrsh7th/cmp-nvim-lsp',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline"
    },
  },

  -- Useful plugin to show you pending keybinds.
  {
    'folke/which-key.nvim', opts = {}
  },
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
    'sainnhe/sonokai',
    priority = 1000,
    -- config = function()
    --   vim.cmd.colorscheme 'sonokai'
    -- end,
  },

  {
    -- Set lualine as statusline
    -- See `:help lualine.txt`
    'nvim-lualine/lualine.nvim',
  },

  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help indent_blankline.txt`
    opts = {
      char = '┊',
      show_trailing_blankline_indent = false,
    },
  },

  -- "gc" to comment visual regions/lines
  {
    'numToStr/Comment.nvim', opts = {}
  },

  -- Fuzzy Finder (files, lsp, etc)
  {
    'nvim-telescope/telescope.nvim', version = '*', dependencies = {
    'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-media-files.nvim', 'nvim-lua/popup.nvim', "rmagatti/auto-session", 'rmagatti/session-lens' }
  },
  -- Fuzzy Finder Algorithm which requires local dependencies to be built.
  -- Only load if `make` is available. Make sure you have the system
  -- requirements installed.
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    -- NOTE: If you are having trouble with this installation,
    --       refer to the README for telescope-fzf-native for more instructions.
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
  },

  { -- Highlight, edit, and navigate code
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
require("lazy").setup(plugins)
