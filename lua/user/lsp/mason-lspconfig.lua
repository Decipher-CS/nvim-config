--[[ mason_lsp setup ]]
local mason_lsp_ok, mason_lsp = pcall(require, "mason-lspconfig")
if not mason_lsp_ok then
	print("WARN! Couldn't load 'mason-lspconfig'")
	return
end

local opts
opts = {
	on_attach = require("user.lsp.handlers").on_attach,
	capabilities = require("user.lsp.handlers").capabilities,
}
mason_lsp.setup_handlers({
	-- Automatically invoke lspconfig setup for every installed LSP server
	function(server_name)
		require("lspconfig")[server_name].setup(opts)
	end,

	pylsp = function()
		require("lspconfig").pylsp.setup({
			on_attach = require("user.lsp.handlers").on_attach,
			capabilities = require("user.lsp.handlers").capabilities,
			settings = {
				pylsp = {
					plugins = {
						pycodestyle = {
							ignore = { "W391" },
							maxLineLength = 200,
						},
					},
				},
			},
		})
	end,

	sumneko_lua = function()
		local lua_opts = vim.tbl_deep_extend("force", require("user.lsp.settings.sumneko_lua"), opts)
		require("lspconfig").sumneko_lua.setup(lua_opts)
	end,
	-- jsonls = function()
	-- 	local json_opts = vim.tbl_deep_extend("force", require("user.lsp.settings.jsonls"), opts)
	-- 	require("lspconfig").jsonls.setup(json_opts)
	-- end,
	omnisharp = function()
		local omnisharp_opts = {
			handlers = {
				["textDocument/definition"] = require("omnisharp_extended").handler,
			},
		}
		require("lspconfig").omnisharp.setup(vim.tbl_deep_extend("force", omnisharp_opts, opts))
	end,

	tsserver = function()
		require("lspconfig").tsserver.setup({
			-- require("coq").lsp_ensure_capabilities(),
			on_attach = require("user.lsp.handlers").on_attach,
			capabilities = require("user.lsp.handlers").capabilities,
			cmd = {
				"typescript-language-server",
				"--stdio",
				-- "--jsx",
				-- "--tsserver-path=/home/privileged/.nvm/versions/node/v18.1.0/lib/node_modules/typescript/lib/",
				-- "disableAutomaticTypingAcquisition=false",
			},
			-- See >> https://github.com/typescript-language-server/typescript-language-server << for options
			initializationOptions = {
				maxTsServerMemory = 500,
				preferences = {
					includeCompletionsForModuleExports = true,
					includeCompletionsForImportStatements = true,
					includeCompletionsWithInsertText = true,
					allowIncompleteCompletions = true,
					jsxAttributeCompletionStyle = "auto",
				},
			},
		})
	end,

	-- eslint = function()
	-- 	require("lspconfig").eslint.setup({
	-- 		on_attach = require("user.lsp.handlers").on_attach,
	-- 		capabilities = require("user.lsp.handlers").capabilities,
	-- 	})
	-- end,
})
