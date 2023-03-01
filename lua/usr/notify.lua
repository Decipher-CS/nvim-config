-- See :h notify.Config for options and :h notify.setup() for default values.

local status_ok, notify = pcall(require, "notify")
if not status_ok then
	print("notify not loaded")
	return
end
vim.notify = notify

notify.setup({
	background_colour = "Normal",
	fps = 30,
	icons = {
		DEBUG = "",
		ERROR = "",
		INFO = "",
		TRACE = "✎",
		WARN = ""
	},
	level = 2,
	minimum_width = 50,
	-- render = "compact",
	stages = "slide",
	timeout = 2000,
	top_down = true 
})
