local status_ok, focus = pcall(require, "focus")
if not status_ok then
	print("WARN! Focus.nvim not found")
	return
end

focus.setup()
