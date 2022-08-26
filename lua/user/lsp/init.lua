local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("user.lsp.mason")
require("user.lsp.handlers").setup()
require("user.lsp.null-ls")
-- status_ok, _ = pcall(require, "lsp_lines")
-- if status_ok then
--         _.setup()
-- 	vim.keymap.set("", "<Leader><leader>t", _.toggle, { desc = "Toggle lsp_lines" })
-- else
-- print('lsp_lines not working')
-- end
