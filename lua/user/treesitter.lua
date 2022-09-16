local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

local m = require("markid")
m.colors = {
	dark = {
		"#619e9d",
		"#9E6162",
		"#81A35C",
		"#7E5CA3",
		"#9E9261",
		"#616D9E",
		"#97687B",
		"#689784",
		"#999C63",
		"#66639C",
		"#967869",
		"#698796",
		"#9E6189",
		"#619E76",
	},
	bright = { "#f5c0c0", "#f5d3c0", "#f5eac0", "#dff5c0", "#c0f5c8", "#c0f5f1", "#c0dbf5", "#ccc0f5", "#f2c0f5" },
	medium = {
		"#c99d9d",
		"#c9a99d",
		"#c9b79d",
		"#c9c39d",
		"#bdc99d",
		"#a9c99d",
		"#9dc9b6",
		"#9dc2c9",
		"#9da9c9",
		"#b29dc9",
		"#c99dc1",
	},
	-- custom = { "#c724b1", "#7b25f0", "#dfff00", "#f70096", "#44D62C", "#FFAD00", "#4D4DFF" }, -- table of hex strings
	test = { "#000000" },
	monokai = { "#a6e22e", "#66d9ef", "#fd971f", "#ae81ff", "#ff6257", "#ffd966", "#7b25f0", "#dfff00" },
}

m.queries = {
	-- default = "(identifier) @markid",
	-- javascript = "(member_expression object: (identifier) @markid) (member_expression property: (property_identifier) @markid) (arrow_function identifier @markid) (variable_declarator name: (identifier) @markid)"
	javascript = "(member_expression object: (identifier) @markid)",
}

-- javascript = " (identifier) @markid (property_identifier) @markid (shorthand_property_idetifier_pattern) @markid"
m.queries.typescript = m.queries.javascript

configs.setup({
	ensure_installed = {
		"c",
		"lua",
		"javascript",
		"python",
		"cpp",
		"typescript",
		"css",
		"rust",
		"go",
		"html",
		"markdown",
	}, -- one of "all" or a list of languages
	sync_install = true,
	auto_install = true,
	--ignore_install = { "" }, -- List of parsers to ignore installing
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "css" }, -- list of language that will be disabled
	},
	autopairs = {
		enable = true,
	},
	indent = { enable = true, disable = { "python", "css" } },
	rainbow = {
		enable = true,
		disable = { "jsx", "cpp" }, -- List of languages you want to disable the plugin for
		extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = nil, -- Do not enable for files with more than n lines, int
		colors = { "#c724b1", "#7b25f0", "#dfff00", "#f70096", "#44D62C", "#FFAD00", "#4D4DFF" }, -- table of hex strings
		-- termcolors = {} -- table of colour name strings
	},
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
	markid = {
		enable = true,
		colors = m.colors.monokai,
		queries = m.queries,
		is_supported = function(lang)
			local queries = configs.get_module("markid").queries
			return pcall(vim.treesitter.parse_query, lang, queries[lang] or queries["default"])
		end,
	},
})
