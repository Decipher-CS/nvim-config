-- https://github.com/rmagatti/auto-session

local status_ok, session = pcall(require, "auto-session")
if not status_ok then
	print("WARN! auto-sessin not found")
	return
end

session.setup({
	log_level = "error",
	auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/", "~/Code", "~/Music" },
	auto_session_enable_last_session = false,
	auto_session_root_dir = vim.fn.stdpath('data') .. "/sessions/",
	auto_session_enabled = true,
	auto_save_enabled = true,
	auto_restore_enabled = true,
	auto_session_use_git_branch = nil,
	-- the configs below are lua only
	bypass_session_save_file_types = nil,
      post_cwd_changed_hook = function() -- example refreshing the lualine status line _after_ the cwd changes
	    require("lualine").refresh() -- refresh lualine so the new session name is displayed in the status bar
	  end,
})
