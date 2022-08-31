local status_ok, focus = pcall(require, "focus")
if not status_ok then
	print("WARN! Focus.nvim not found")
	return
end

focus.setup()

vim.api.nvim_set_keymap("n", "<leader><leader>h", ":FocusSplitLeft<CR>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<leader><leader>j", ":FocusSplitDown<CR>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<leader><leader>k", ":FocusSplitUp<CR>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<leader><leader>l", ":FocusSplitRight<CR>", { silent = true, noremap = true })

vim.api.nvim_set_keymap("n", "<leader><leader>ff", ":FocusToggle<CR>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<leader><leader>fw", ":FocusToggleWindow<CR>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<leader><leader>fm", ":FocusMaxOrEqual<CR>", { silent = true, noremap = true })

vim.api.nvim_set_keymap("n", "<leader><leader>n", ":FocusSplitNicely<CR>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<leader><leader>c", ":FocusSplitCycle<CR>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<leader><leader>rc", ":FocusSplitCycle reverse<CR>", { silent = true, noremap = true })
