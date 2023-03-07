local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Highlight on yank
-- See `:help vim.highlight.on_yank()`
local highlight_group = augroup('YankHighlight', { clear = true })
autocmd('TextYankPost', {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = '*',
})


-- Change tsconfig.json to tsconfig.jsonc
autocmd({ "BufNewFile", "BufRead" }, {
	callback = function(args)
		if (args.file == "tsconfig.json") then
                        vim.cmd("set ft=jsonc")
		end
	end,
})

-- autocmd BufNewFile,BufRead tsconfig.json setlocal filetype=jsonc  
-- autocmd('BufNewFile',)

-- Currently, auto-session plugin is managing the saving and restoring of folds. But if for whatever reason it fails, switch back to this autocmd
-- Remember the state of folds when entering and leaving buffers
-- local save_fold = augroup("Persistent Folds", { clear = true })
-- autocmd("BufWinLeave", {
--   pattern = "*.*",
--   callback = function()
--     vim.cmd.mkview()
--   end,
--   group = save_fold,
-- })
-- autocmd("BufWinEnter", {
--   pattern = "*.*",
--   callback = function()
--     vim.cmd.loadview({ mods = { emsg_silent = true } })
--   end,
--   group = save_fold,
-- })
