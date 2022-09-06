local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics
-- local codeaction = null_ls.builtins.code_action
-- local completation = null_ls.completation

-- https://github.com/prettier-solidity/prettier-plugin-solidity
null_ls.setup({
	debug = false,
	sources = {
		formatting.prettier.with({
			extra_filetypes = { "toml" },
			extra_args = { "--no-semi=false", "--single-quote", "--jsx-single-quote", "--tab-width=8" },
		}),
		-- formatting.black.with({ extra_args = { "--fast" } }),
		formatting.stylua,
		-- formatting.autopep8,
		formatting.google_java_format,

		-- diagnostics
		diagnostics.flake8.with({
                        extra_args = {"--max-line-length=null"}
                }),
		-- diagnostics.mypy,
                -- diagnostics.eslint_d,
                -- codeaction.eslint_d,
                 null_ls.builtins.code_actions.eslint_d,
                diagnostics.codespell,
                diagnostics.markdownlint

		-- codeaction
	},
})
