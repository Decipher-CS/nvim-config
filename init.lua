-- vim.wo.foldmethod = 'indent'
-- vim.wo.foldmethod = 'expr'
require('usr.packages')
require('usr.autosession')
require("usr.keymaps")
require("usr.options")
require('usr.dashboard')
require("usr.lualine")
require("usr.tabline")
require('usr.notify')
require('usr.autocommands')
require('usr.telescope')
require('usr.treesitter')
require('usr.lsp')
require('usr.nvim-cmp')
require('usr.nvim-tree')
require('usr.noice')
require('usr.leap')
require('usr.autopairs')
require('usr.prettyfold')
require('usr.dap')
require('Comment').setup { -- enable Comment plugin alongside support for tsx/jsx
        pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
}
