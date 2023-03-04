-- [[ Keymaps ]]

local on_attach = function(_, bufnr)
	-- NOTE: Remember that lua is a real programming language, and as such it is possible
	-- to define small helper and utility functions so you don't have to repeat yourself
	-- many times.
	--
	-- In this case, we create a function that lets us more easily define mappings specific
	-- for LSP related items. It sets the mode, buffer and description for us each time.
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
if not status_neodev_ok or not status_mason_ok or not status_mason_lspconfig_ok then
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
	tsserver = {
		-- See >>
		-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#tsserver
		-- https://github.com/typescript-language-server/typescript-language-server

		-- root_dir = {
		-- 	'tsconfig.json'
		-- },
		-- root_dir = vim.fs.dirname(vim.fs.find({'jsconfig.json', 'tsconfig.json', 'package.json'}, { upward = true })[1]),
		-- root_dir = require('lspconfig').util.root_pattern('tsconfig.json', 'package.json', '.git'),
		initializationOptions = {
			preferences = {
				includeCompletionsForModuleExports = true,
				includeCompletionsForImportStatements = true,
				includeCompletionsWithInsertText = true,
				allowIncompleteCompletions = true,
				jsxAttributeCompletionStyle = "auto",
			},
		},
	},
	lua_ls = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = { checkThirdParty = false,

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
		require('lspconfig')[server_name].setup {
			capabilities = capabilities,
			on_attach = on_attach,
			settings = servers[server_name],
		}
	end,
}
