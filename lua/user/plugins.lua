local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	print("Packer not working")
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
		show_all_info = true,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here

	use({ "wbthomason/packer.nvim", commit = "00ec5adef58c5ff9a07f11f45903b9dbbaa1b422" }) -- Have packer manage itself
	use({ "nvim-lua/plenary.nvim", commit = "968a4b9afec0c633bc369662e78f8c5db0eba249" }) -- Useful lua functions used by lots of plugins
	use("windwp/nvim-autopairs") -- Autopairs, integrates with both cmp and treesitter
	use({ "numToStr/Comment.nvim", commit = "2c26a00f32b190390b664e56e32fd5347613b9e2" })

	use("https://gitlab.com/yorickpeterse/nvim-window") -- Better switching between splits with visual queues

	-- use({ "kyazdani42/nvim-web-devicons", commit = "8d2c5337f0a2d0a17de8e751876eeb192b32310e" })
	use("kyazdani42/nvim-web-devicons")
	use({ "kyazdani42/nvim-tree.lua", commit = "bdb6d4a25410da35bbf7ce0dbdaa8d60432bc243" })
	use({ "moll/vim-bbye", commit = "25ef93ac5a87526111f43e5110675032dbcacf56" })
	-- visit this
	use({ "nvim-lualine/lualine.nvim", commit = "3362b28f917acc37538b1047f187ff1b5645ecdd" })
	-- use({ "akinsho/toggleterm.nvim", commit = "aaeed9e02167c5e8f00f25156895a6fd95403af8" })
	use("akinsho/toggleterm.nvim")
	--use({ "ahmedkhalf/project.nvim", commit = "541115e762764bc44d7d3bf501b6e367842d3d4f" })
	-- visit this
	use({ "lewis6991/impatient.nvim", commit = "969f2c5c90457612c09cf2a13fee1adaa986d350" })
	-- visit this
	use({ "lukas-reineke/indent-blankline.nvim", commit = "6177a59552e35dfb69e1493fd68194e673dc3ee2" })
	use({ "goolord/alpha-nvim", commit = "ef27a59e5b4d7b1c2fe1950da3fe5b1c5f3b4c94" })
	-- visit this
	use("folke/which-key.nvim")

	use("iamcco/markdown-preview.nvim") -- Markdown preview
	-- use({
	-- 	"iamcco/markdown-preview.nvim",
	-- 	run = "cd app && npm install",
	-- 	setup = function()
	-- 		vim.g.mkdp_filetypes = { "markdown" }
	-- 	end,
	-- 	ft = { "markdown" },
	-- })

	-- Sessions
	-- use("rmagatti/auto-session")
	-- use("jedrzejboczar/possession.nvim")
	use("olimorris/persisted.nvim")

	-- Telescope
	use({ "nvim-telescope/telescope.nvim", commit = "d96eaa914aab6cfc4adccb34af421bdd496468b0" })
	-- use("rmagatti/session-lens") -- auto-session assistant
	-- use({ "nvim-telescope/telescope.nvim" })
	-- use("nvim-telescope/telescope-media-files.nvim") -- Preview images in teleschope. ~~( 。・o・)💗~~
	-- use "yatli/gui-widgets.nvim"

	-- Colorschemes
	-- use("JoosepAlviste/palenightfall.nvim")
	-- use("EdenEast/nightfox.nvim") -- nordFos
	-- use("ellisonleao/gruvbox.nvim") -- gruvbox
	-- use("patstockwell/vim-monokai-tasty")
	-- use("projekt0n/github-nvim-theme")
	-- Colorschemes with treesitter suppport
	-- use("rafamadriz/neon")
	use("sainnhe/sonokai")
	use("marko-cerovac/material.nvim")
	-- use("/tanvirtin/monokai.nvim")

	-- Buffer liness
	-- use({ "akinsho/bufferline.nvim", commit = "c78b3ecf9539a719828bca82fc7ddb9b3ba0c353" })
	-- use("kdheepak/tabline.nvim")
	use("akinsho/bufferline.nvim")
	use("noib3/nvim-cokeline")

	-- Visual flair
	use("RRethy/vim-illuminate") -- Highlight all instensis of similar text
	use("norcalli/nvim-colorizer.lua")
	use("https://git.sr.ht/~whynothugo/lsp_lines.nvim")
	-- use("https://github.com/uga-rosa/ccc.nvim") -- nvim colour picker/ wheel... meh. doesn't work as expected
	-- Test plugins are here...
	-- use("https://github.com/Djancyp/custom-theme.nvim") -- custom theme setup
	use("theHamsta/nvim-semantic-tokens")
	use("m-demare/hlargs.nvim")

	-- Folds and Marks
	use("anuvyklack/pretty-fold.nvim")
	use("anuvyklack/fold-preview.nvim") -- Preview the content of the folds without opening them
	use("anuvyklack/keymap-amend.nvim") -- No idea why but it is required for the fold preview plugin. uuffff
	use("beauwilliams/focus.nvim")
	use("chentoast/marks.nvim") -- Put marks on gutter
	use("sindrets/winshift.nvim") -- Rearrange splits

	-- cmp plugins
	-- use({ "hrsh7th/nvim-cmp", commit = "df6734aa018d6feb4d76ba6bda94b1aeac2b378a" }) -- The completion plugin
	-- use({ "hrsh7th/cmp-buffer", commit = "62fc67a2b0205136bc3e312664624ba2ab4a9323" }) -- buffer completions
	-- use({ "hrsh7th/cmp-path", commit = "466b6b8270f7ba89abd59f402c73f63c7331ff6e" }) -- path completions
	-- use({ "saadparwaiz1/cmp_luasnip", commit = "a9de941bcbda508d0a45d28ae366bb3f08db2e36" }) -- snippet completions
	-- use({ "hrsh7th/cmp-nvim-lsp", commit = "affe808a5c56b71630f17aa7c38e15c59fd648a8" })
	-- use({ "hrsh7th/cmp-nvim-lua", commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21" })
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-nvim-lua")

	-- Big coq
	use("ms-jpq/coq_nvim")
	use("ms-jpq/coq.artifacts")

	-- snippets
	use({ "L3MON4D3/LuaSnip", commit = "79b2019c68a2ff5ae4d732d50746c901dd45603a" }) --snippet engine
	use({ "rafamadriz/friendly-snippets", commit = "d27a83a363e61009278b6598703a763ce9c8e617" }) -- a bunch of snippets to use

	-- LSP
	--[[ use({ "williamboman/nvim-lsp-installer", commit = "e9f13d7acaa60aff91c58b923002228668c8c9e6" }) -- simple to use language server installer  No Longer maintained ]]
	use({ "williamboman/mason.nvim" })
	use("williamboman/mason-lspconfig.nvim")
	use({ "neovim/nvim-lspconfig", commit = "148c99bd09b44cf3605151a06869f6b4d4c24455" }) -- enable LSP
	use({ "jose-elias-alvarez/null-ls.nvim", commit = "ff40739e5be6581899b43385997e39eecdbf9465" }) -- for formatters and linters

	-- Multiple cursors
	-- use("mg979/vim-visual-multi") -- Too many issued. Doesn't work right. Aslo conflicts with keybindins.

	-- DAP (Debug Adapter Protocol)
	use("mfussenegger/nvim-dap")
	use("mfussenegger/nvim-dap-python")
	use("rcarriga/nvim-dap-ui")
	use("https://github.com/ravenxrz/DAPInstall.nvim")
	--[[ use "microsoft/vscode-mock-debug" ]]

	-- Run code
	use("CRAG666/code_runner.nvim")

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		commit = "518e27589c0463af15463c9d675c65e464efc2fe",
		-- commit = "5bc96f02b81ea6750baaeeab7880204c8c3bac56",
	})
	use("p00f/nvim-ts-rainbow")
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use("David-Kunz/markid") -- Treesitter sytax highlighting
	use("nvim-treesitter/playground")

	-- Git
	--use({ "lewis6991/gitsigns.nvim", commit = "c18e016864c92ecf9775abea1baaa161c28082c3" })

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
