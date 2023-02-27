<<<<<<< HEAD
require("user.keybindings")
require("user.options")
require("user.colorscheme")
require("user.plugins")
require("user.telescope")
require("user.cmp")
-- require("user.coq")
require("user.lsp")
require("user.treesitter")
require("user.autopairs")
require("user.comment")
require("user.tree")
-- Pick one
require("user.bufferline") -- A
-- require("user.cokeline")   -- B
require("user.toggleterm")
require("user.indentline")
require("user.whichkey")
require("user.illuminate")
require("user.dap")
require("user.autocommands")
require("user.alpha")
require("user.project")
require("user.impatient")
require("user.window")
require("user.coderunner")
require("user.prettyfold")
require("user.marks")
require("user.focus")
require("user.winshift")
require("user.lualine")
require("user.persisted")
require("user.colorizer")
require("user.hlargs")
require("user.markdownpreview")
-- require("user.ccc")
require("user.leap")

-- -- jsonc
-- vim.filetype.add({
-- 	extension = {
--                 json = "jsonc",
-- 	},
-- 	filename = {
-- 		["tsconfig.json"] = "jsonc",
-- 		["tsconfig"] = "jsonc",
-- 		-- ["json"] = "jsonc",
-- 	},
-- })
=======
-- vim.wo.foldmethod = 'indent'
-- vim.wo.foldmethod = 'expr'
require('usr.autosession')
require('usr.packages')
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
>>>>>>> 1ee2872 (inital setup)
