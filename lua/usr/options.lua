-- [[ Setting options ]]
-- See `:help vim.o`


vim.wo.number = true -- Make line numbers default
vim.wo.signcolumn = 'yes' -- Keep signcolumn on by default
-- vim.cmd.colorscheme 'onedark'
-- vim.nohls
local options = {
	hlsearch = false, -- highlight all matches on previous search pattern
	foldmethod = 'expr', -- try other methods such as syntax, expr, indent. See :h foldmethod
	foldexpr="nvim_treesitter#foldexpr()",
	foldlevel=10,
	sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions", -- What is saved by :mkview
	-- Enable break indent
	breakindent = true,
	completeopt = 'menuone,noselect', -- Set completeopt to have a better completion experience
	-- NOTE: You should make sure your terminal supports this

	backup = false, -- creates a backup file
	cb= "unnamedplus", -- allows neovim to access the system clipboard
	cmdheight = 0, -- more space in the neovim command line for displaying messages
	conceallevel = 0, -- so that `` is visible in markdown files

	-- fileencoding gives error??
	-- fileencoding = "utf-8", -- the encoding written to a file
	ignorecase = true, -- ignore case in search patterns
	mouse = "a", -- allow the mouse to be used in neovim
	mouseshape = "a:beam", -- Mouse pointer shape
	pumheight = 10, -- pop up menu height
	showmode = false, -- we don't need to see things like -- INSERT -- anymore
	showtabline = 2, -- always show tabs
	smartcase = true, -- smart case
	smartindent = true, -- make indenting smarter again
	splitbelow = true, -- force all horizontal splits to go below current window
	splitright = true, -- force all vertical splits to go to the right of current window
	swapfile = true, -- creates a swapfile
	termguicolors = true, -- set term gui colors (most terminals support this)
	-- changed from 100 to 500. 100 was to fast.
	timeoutlen = 500, -- time to wait for a mapped sequence to complete (in milliseconds)
	undofile = true, -- enable persistent undo
	updatetime = 300, -- faster completion (4000ms default)
	timeout = true,
	writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
	expandtab = true, -- convert tabs to spaces
	shiftwidth = 8, -- the number of spaces inserted for each indentation
	tabstop = 8, -- insert x spaces for a tab
	cursorline = true, -- highlight the current line
	number = true, -- set numbered lines
	relativenumber = true, -- set relative numbered lines
	numberwidth = 4, -- set number column width to 2 {default 4}
	signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
	wrap = true, -- display lines as one long line
	scrolloff = 10, -- is one of my fav
	sidescrolloff = 8,
	winheight = 2,
	winminheight = 0,
	guifont = "monospace:h17", -- the font used in graphical neovim applications
}

for k, v in pairs(options) do
	vim.opt[k] = v
end
