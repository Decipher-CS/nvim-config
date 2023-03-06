-- vim.wo.foldmethod = 'indent'
-- vim.wo.foldmethod = 'expr'
require("usr.options")
require('usr.packages')
require('usr.autosession')
require("usr.keymaps")
require('usr.dashboard')
require("usr.lualine")
require("usr.tabline")
require('usr.notify')
require('usr.autocommands')
require('usr.telescope')
require('usr.treesitter')
require('usr.lsp')
-- require('usr.nvim-cmp')
require('usr.nvim-tree')
require('usr.noice')
require('usr.leap')
require('usr.autopairs')
require('usr.prettyfold')
require('usr.dap')

vim.g.coq_settings = {
        auto_start = true,
        -- ["display.pum.fast_close"] = false
        -- ["keymap.recommended"] = false
}
