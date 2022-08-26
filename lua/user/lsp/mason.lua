local status_ok, mason = pcall(require, "mason")
if not status_ok then
  print('WARNING! PACKAGE "MASON" NOT FOUND')
  return
end


mason.setup({

ui = {
        check_outdated_packages_on_open = true,
        -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
        border = "rounded",
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        },
        keymaps = {
            -- Keymap to expand a package
            toggle_package_expand = "<CR>",
            -- Keymap to install the package under the current cursor position
            install_package = "i",
            -- Keymap to reinstall/update the package under the current cursor position
            update_package = "u",
            -- Keymap to check for new version for the package under the current cursor position
            check_package_version = "c",
            -- Keymap to update all installed packages
            update_all_packages = "U",
            -- Keymap to check which installed packages are outdated
            check_outdated_packages = "C",
            -- Keymap to uninstall a package
            uninstall_package = "X",
            -- Keymap to cancel a package installation
            cancel_installation = "<C-c>",
            -- Keymap to apply language filter
            apply_language_filter = "<C-f>",
        },
    },
    pip = {
        -- These args will be added to `pip install` calls. Note that setting extra args might impact intended behavior
        -- and is not recommended.
        --
        -- Example: { "--proxy", "https://proxyserver" }
        install_args = {},
    },

    -- Controls to which degree logs are written to the log file. It's useful to set this to vim.log.levels.DEBUG when
    -- debugging issues with package installations.
    log_level = vim.log.levels.INFO,

    -- Limit for the maximum amount of packages to be installed at the same time. Once this limit is reached, any further
    -- packages that are requested to be installed will be put in a queue.
    max_concurrent_installers = 10,

    github = {
        -- The template URL to use when downloading assets from GitHub.
        -- The placeholders are the following (in order):
        -- 1. The repository (e.g. "rust-lang/rust-analyzer")
        -- 2. The release version (e.g. "v0.3.0")
        -- 3. The asset name (e.g. "rust-analyzer-v0.3.0-x86_64-unknown-linux-gnu.tar.gz")
        download_url_template = "https://github.com/%s/releases/download/%s/%s",
    },

})

        --[[ mason_lsp setup ]]
local mason_lsp_ok, mason_lsp = pcall(require, 'mason-lspconfig')
if not mason_lsp_ok then
	print("WARN! Couldn't load 'mason-lspconfig'")
	return
end


local opts
  opts = {
    on_attach = require("user.lsp.handlers").on_attach,
    capabilities = require("user.lsp.handlers").capabilities,
  }
mason_lsp.setup_handlers {
	-- Automatically invoke lspconfig setup for every installed LSP server
	function (server_name)
		require('lspconfig')[server_name].setup(opts)
	end,

	sumneko_lua = function ()
		local lua_opts = vim.tbl_deep_extend("force", require('user.lsp.settings.sumneko_lua'), opts)
		require('lspconfig').sumneko_lua.setup(lua_opts)
	end,
--[[ 
	jsonls = function ()
		local json_opts = vim.tbl_deep_extend("force", require('user.lsp.settings.jsonls'), opts)
		require('lspconfig').jsonls.setup(json_opts)
	end,
 ]]
	omnisharp = function ()
		local omnisharp_opts = {
			handlers = {
				["textDocument/definition"] = require('omnisharp_extended').handler,
			},
		}
		require('lspconfig').omnisharp.setup(
			vim.tbl_deep_extend("force", omnisharp_opts, opts)
		)
	end,
}


