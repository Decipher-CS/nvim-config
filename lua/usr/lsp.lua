-- [[ Keymaps ]]

local on_attach = function(client, bufnr)
	if client.name == "tsserver" then
		client.server_capabilities.documentFormattingProvider = false
	end
	if client.name == "sumneko_lua" then
		client.server_capabilities.documentFormattingProvider = false
		-- client.resolved_capabilities.document_formatting = false
	end

	local nmap = function(keys, func, desc)
		if desc then
			desc = 'LSP: ' .. desc
		end

		vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
	end

	-- nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame keyword under cursor')
	nmap('<leader>la', vim.lsp.buf.code_action, 'Code [A]ction')
	-- Toggle lsp_lines on/off
	nmap('<leader>ll', require("lsp_lines").toggle, 'Toggle [L]SP [L]ines')

	nmap('<leader>ld', vim.lsp.buf.definition, '[G]oto [D]efinition')
	-- nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
	-- nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
	nmap('<leader>lD', vim.lsp.buf.type_definition, 'Goto Type [D]efinition')
	nmap('<leader>ls', require('telescope.builtin').lsp_document_symbols, 'Document [S]ymbols')
	nmap('<leader>lw', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace Symbols')

	nmap('<leader>ld', vim.lsp.buf.hover, 'Hover Documentation')
	nmap('<leader>ls', vim.lsp.buf.signature_help, 'Signature Documentation')

	-- Lesser used LSP functionality
	nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
	nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
	nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
	nmap('<leader>wl', function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, '[W]orkspace [L]ist Folders')

	nmap('<leader>fs', function(_)
		vim.lsp.buf.format()
	end, '[F]ormat [S]ource')
	-- Create a command `:Format` local to the LSP buffer
	vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
		vim.lsp.buf.format()
	end, { desc = 'Format current buffer with LSP' })
end


-- [[ LSP setup ]]

local status_mason_ok, mason = pcall(require, "mason")
local status_mason_lspconfig_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
local status_neodev_ok, neodev = pcall(require, "neodev")
local status_nulls_ok, nulls = pcall(require, "null-ls")
local status_lspconfig_ok, lspconfig = pcall(require, "lspconfig")
if not status_neodev_ok or not status_mason_ok or not status_mason_lspconfig_ok or not status_nulls_ok then
	print('lsp not configured')
	vim.notify('lsp not working', 'warn')
	return
end

neodev.setup()
mason.setup()

--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
--  Put your custom config here.
local servers = {
	-- tsserver = {
	-- 	-- See >>
	-- 	-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#tsserver
	-- 	-- https://github.com/typescript-language-server/typescript-language-server
	-- 	initializationOptions = {
	-- 		preferences = {
	-- 			includeCompletionsForModuleExports = true,
	-- 			includeCompletionsForImportStatements = true,
	-- 			includeCompletionsWithInsertText = true,
	-- 			allowIncompleteCompletions = true,
	-- 			jsxAttributeCompletionStyle = "auto",
	-- 			disableSuggestions = true,
	-- 			quotePreference = "single",
	-- 		},
	-- 	},
	-- },
	lua_ls = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
				disable = { 'unused-local' }, -- Disable the "unused variable" error
			},
			workspace = {
				checkThirdParty = false,
				library = {
					    [vim.fn.expand "$VIMRUNTIME/lua"] = true,
					    [vim.fn.stdpath "config" .. "/lua"] = true,
				},
			},
			telemetry = { enable = false },
		},
	},
}



-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)


-- Ensure the servers above are installed
mason_lspconfig.setup {
	ensure_installed = vim.tbl_keys(servers),
}

-- Automatically invoke lspconfig setup for every installed LSP server
mason_lspconfig.setup_handlers {
	function(server_name)
		-- This is the format -> require 'lspconfig'.tsserver.setup {}
		lspconfig[server_name].setup {
			capabilities = capabilities,
			on_attach = on_attach,
			settings = servers[server_name],
			root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git")
		}
	end,

	tsserver = function()
		lspconfig.tsserver.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			initializationoptions = {
				maxtsservermemory = 500,
				preferences = {
					includecompletionsformoduleexports = true,
					includecompletionsforimportstatements = true,
					includecompletionswithinserttext = true,
					allowincompletecompletions = true,
					jsxattributecompletionstyle = "auto",
					quotepreference = "single",
				},
			},
		})
	end,
}


-- [[ null-ls; linters & formatters ]]

nulls.setup({
	-- see -> https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/builtin_config.md#configuration
	sources = {
		-- formatters
		-- nulls.builtins.formatting.stylua,
		nulls.builtins.formatting.prettier,
		-- nulls.builtins.formatting.eslint_d,

		-- diagnostics
		-- nulls.builtins.diagnostics.semgrep,
		-- nulls.builtins.diagnostics.eslint_d,

		-- completion
		-- nulls.builtins.completion.spell,

		-- code action
		-- nulls.builtins.code_actions.xo,
		nulls.builtins.code_actions.eslint_d,
	},
})
