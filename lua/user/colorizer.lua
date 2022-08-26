local status_ok, colorizer = pcall(require, "colorizer")
if not status_ok then
	print("WARN! colorizer not working.")
	return
end

-- rgb(12, 24, 55)
-- #101010

local opts = {
	RGB = true, -- #RGB hex codes
	RRGGBB = true, -- #RRGGBB hex codes
	names = true, -- "Name" codes like Blue
	RRGGBBAA = false, -- #RRGGBBAA hex codes
	-- rgb_fn = true, -- CSS rgb() and rgba() functions
	-- hsl_fn = true, -- CSS hsl() and hsla() functions
	css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
	css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
	-- Available modes: foreground, background
	mode = "foreground", -- Set the display mode.
}
-- colorizer.setup()
colorizer.setup({
	css = opts,
	scss = opts,
	html = opts,
	javascript = opts,
	typescript = opts,
	jsx = opts,
}, opts)
