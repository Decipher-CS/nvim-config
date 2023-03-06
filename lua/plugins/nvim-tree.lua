return {
  'nvim-tree/nvim-tree.lua',
config = function ()
local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
	print('nvim-tree not loaded')
	return
end

-- disable netrw (strongly advised by nvim-tree)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1


local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

keymap('n', '<leader>fe', ':NvimTreeToggle<CR>', vim.tbl_extend("force", opts, { desc = "Toggle NvimTree [F]ile [E]xplorer" }))
keymap('n', '<leader>ff', ':NvimTreeFocus<CR>', vim.tbl_extend("force", opts, { desc = "Focus NvimTree" }))
keymap('n', '<leader>fr', ':NvimTreeRefresh<CR>', vim.tbl_extend("force", opts, { desc = "Refresh NvimTree" }))



nvim_tree.setup({
	update_focused_file = {
		enable = true,
		update_cwd = true,
	},
	renderer = {
		root_folder_modifier = ":t",
		icons = {
			glyphs = {
				default = "",
				symlink = "",
				folder = {
					arrow_open = "",
					arrow_closed = "",
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
					symlink_open = "",
				},
				git = {
					unstaged = "",
					staged = "S",
					unmerged = "",
					renamed = "➜",
					untracked = "U",
					deleted = "",
					ignored = "◌",
				},
			},
		},
	},
	diagnostics = {
		enable = true,
		show_on_dirs = true,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	view = {
		width = 30,
		-- height = 30,
		side = "left",
		mappings = {
			list = {
				{ key = "o", action = "edit" },
				{ key = "O", action = "close_node" },
				{ key = "v", action = "vsplit" },
				{ key = "h", action = "split" },
				{ key = "h", action = "vsplit" },
				{ key = "u", action = "dir_up" },
			},
		},
	},
	actions = { open_file = { quit_on_open = true } },
	filters = {
		dotfiles = true,
	},
	sort_by = "case_sensitive",
	open_on_setup = false,
})
        end,
}
