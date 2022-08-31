local status_ok, fold = pcall(require, "pretty-fold")
if not status_ok then
	print("WARN! Pretty_Fold not found.")
	return
end

fold.setup({
	sections = {
		left = {
			"━ ",
			function()
				return string.rep("*", vim.v.foldlevel)
			end,
			" ━┫",
			"content",
			"┣",
		},
		right = {
			"┫ ",
			"number_of_folded_lines",
			": ",
			"percentage",
			" ┣━━",
			function(config)
				return config.fill_char:rep(3)
			end,
		},
	},
	fill_char = "━",

	remove_fold_markers = true,

	-- Keep the indentation of the content of the fold string.
	keep_indentation = true,

	-- Possible values:
	-- "delete" : Delete all comment signs from the fold string.
	-- "spaces" : Replace all comment signs with equal number of spaces.
	-- false    : Do nothing with comment signs.
	process_comment_signs = "spaces",

	-- Comment signs additional to the value of `&commentstring` option.
	comment_signs = {},

	-- List of patterns that will be removed from content foldtext section.
	stop_words = {
		"@brief%s*", -- (for C++) Remove '@brief' and all spaces after.
	},

	add_close_pattern = true, -- true, 'last_line' or false
	matchup_patterns = {
		-- ╟─ Start of line ──╭───────╮── "do" ── End of line ─╢
		--                    ╰─ WSP ─╯
		{ "^%s*do$", "end" }, -- `do ... end` blocks

		-- ╟─ Start of line ──╭───────╮── "if" ─╢
		--                    ╰─ WSP ─╯
		{ "^%s*if", "end" },

		-- ╟─ Start of line ──╭───────╮── "for" ─╢
		--                    ╰─ WSP ─╯
		{ "^%s*for", "end" },

		-- ╟─ "function" ──╭───────╮── "(" ─╢
		--                 ╰─ WSP ─╯
		{ "function%s*%(", "end" }, -- 'function(' or 'function ('

		{ "{", "}" },
		{ "%(", ")" }, -- % to escape lua pattern char
		{ "%[", "]" }, -- % to escape lua pattern char
	},

	ft_ignore = { "neorg" },
})

local status_ok_fold, preview = pcall(require, "fold-preview")
local status_ok_amend, _ = pcall(require, "keymap-amend")
if not status_ok_fold or not status_ok_amend then
	print("WARN! fold-preview not setup")
	return
end
preview.setup()
