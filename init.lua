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

require 'lazy'.setup({
        {'folke/zen-mode.nvim'},
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
                "anuvyklack/pretty-fold.nvim",
                enabled = false,
                dependencies = { 'anuvyklack/fold-preview.nvim', 'anuvyklack/keymap-amend.nvim' }
        },
        {
                "iamcco/markdown-preview.nvim", -- Markdown preview
                -- build = '',
                -- cond = function()
                --   return vim.fn.executable 'make' == 1
                -- end,
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
                -- Add indentation guides even on blank lines
                'lukas-reineke/indent-blankline.nvim',
                -- See `:help indent_blankline.txt`
                opts = {
                        char = '┊',
                        show_trailing_blankline_indent = false,
                },
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
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'make',
                cond = function()
                        return vim.fn.executable 'make' == 1
                end,
        },
        {
                'chentoast/marks.nvim',
                opts = {}
        },
        { "cbochs/portal.nvim" }, -- https://github.com/cbochs/portal.nvim#portals
        { 'folke/which-key.nvim',    opts = {} },
        { "mfussenegger/nvim-dap" },
        { 'tpope/vim-sleuth' }, -- Detect tabstop and shiftwidth automatically
        { 'akinsho/toggleterm.nvim', version = "*", opts = {} },
        {
                "ggandor/leap.nvim",
                dependencies = { "tpope/vim-repeat" },
                config = function()
                        local leap = require('leap')
                        leap.add_default_mappings()
                        leap.opts.case_sensitive = false
                end
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
                -- colorschemes
                -- 'sainnhe/sonokai',
                -- 'navarasu/onedark.nvim',
                'folke/tokyonight.nvim',
                priority = 1000,
                config = function()
                        vim.cmd.colorscheme 'tokyonight-night'
                end,
        },
        { import = 'plugins' },
})
require("usr.keymaps")
require("usr.options")
require('usr.autocommands')
