-- See `:help vim.keymap.set()`
-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- [[ Helper Functions ]]

local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- extend the opts with a description of the functionality of the key
local extend_desc = function(custom_desc)
  return vim.tbl_extend("force", opts, { desc = custom_desc })
end

-- [[ Basic Keymaps ]]

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
keymap("", "<K>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "


-- Navigate between splits
keymap("n", "<C-h>", "<C-w>h", extend_desc("Move To Left Pane"))
keymap("n", "<C-j>", "<C-w>j", extend_desc("Move To Down Pane"))
keymap("n", "<C-k>", "<C-w>k", extend_desc("Move To Above Pane"))
keymap("n", "<C-l>", "<C-w>l", extend_desc("Move To Right Pane"))

-- Navigate between buffers
keymap("n", "<Tab>", ":bnext<CR>", extend_desc("Next Buffer"))
keymap("n", "<S-Tab>", ":bprev<CR>", extend_desc("Prev Buffer"))

keymap("n", "<leader><leader>s", ":luafile ~/.config/nvim/init.lua<CR>:lua require('notify')('Config Reloaded!')<CR>",
  extend_desc("Source And Reload Lua Config"))

-- Keep cursor centered when moving half up/down
keymap("n", "<C-u>", "<C-u>zz", extend_desc("Move Half Page Up"))
keymap("n", "<C-d>", "<C-d>zz", extend_desc("Move Half Page Down"))

-- File state management
keymap("n", "<leader>ww", ":wa<CR>", extend_desc("Save File"))
keymap("n", "<leader>wq", ":wqa<CR>", extend_desc("Save File And Close Buffer"))
keymap("n", "<s-q>", ":bdelete<CR>", extend_desc("Delete Buffer"))
keymap("n", "<C-q>", ":qa!<CR>", extend_desc("Quit Nvim"))

-- Set the leader key (space in this case) to do nothing, Binding it to NULL
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })


-- [[ Visual Mode; 'x/v' ]]

-- Stay in indent mode
keymap("v", ">", ">gv", opts)
keymap("v", "<", "<gv", opts)

-- Move text up and down
-- keymap("v", "<A-j>", ":m .+1<CR>==", opts)
-- keymap("v", "<A-k>", ":m .-2<CR>==", opts)
-- keymap("v", "p", '"_dP', opts)

-- Move text up and down
-- keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
-- keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
-- keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
-- keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- [[ Edit Mode; 'i' ]]

-- delete word under cursor
keymap("i", "<C-BS>", "<C-W>", extend_desc("Delete from char under cursor to starting of word"))


-- [[ ToggleTerm ]]
keymap("n", "<leader>th", ":ToggleTerm direction=horizontal<CR>", extend_desc("Open ToggleTerm Horizontally"))
keymap("n", "<leader>tf", ":ToggleTerm direction=float<CR>", extend_desc("Open ToggleTerm in Floating Window"))
keymap("n", "<leader>tv", ":ToggleTerm direction=vertical<CR>", extend_desc("Open ToggleTerm In Vertically"))
keymap("n", "<leader>tt", ":ToggleTerm direction=tab<CR>", extend_desc("Open ToggleTerm In A New Tab"))
keymap("n", "<leader>ta", ":ToggleTermAll<CR>", extend_desc("Open All ToggleTerm Windows"))

-- Bindings for better window navigation when inside the terminal-mode
function _G.set_terminal_keymaps()
  local term_opts = { buffer = 0 }
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], term_opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], term_opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], term_opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], term_opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], term_opts)
  vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], term_opts)
end

-- Enables aformentioned bindings to run inside terminal-mode
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
