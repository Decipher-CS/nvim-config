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
    -- vim.g.mapleader = " "
    -- vim.g.maplocalleader = " "

    -- Enter normal mode
    keymap("i", "kl", "<ESC>", extend_desc("Exit Insert Mode"))

    -- Navigate between splits
    keymap("n", "<C-h>", "<C-w>h", extend_desc("Move To Left Pane"))
    keymap("n", "<C-j>", "<C-w>j", extend_desc("Move To Down Pane"))
    keymap("n", "<C-k>", "<C-w>k", extend_desc("Move To Above Pane"))
    keymap("n", "<C-l>", "<C-w>l", extend_desc("Move To Right Pane"))

    -- Resize with arrows
    keymap("n", "<C-Up>", ":resize -2<CR>", opts)
    keymap("n", "<C-Down>", ":resize +2<CR>", opts)
    keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
    keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

    -- Navigate between buffers
    keymap("n", "<Tab>", ":bnext<CR>", extend_desc("Next Buffer"))
    keymap("n", "<S-Tab>", ":bprev<CR>", extend_desc("Prev Buffer"))

    -- Keep cursor centered when moving half up/down
    keymap("n", "<C-u>", "<C-u>zz", extend_desc("Move Half Page Up"))
    keymap("n", "<C-d>", "<C-d>zz", extend_desc("Move Half Page Down"))

    -- File state management
    keymap("n", "<leader>ww", ":wa<CR>", extend_desc("[W]rite File"))
    keymap("n", "<leader>wq", ":wqa!<CR>", extend_desc("[W]rite File And [Q]uit Buffer"))
    keymap("n", "<leader>qq", ":qa!<CR>", extend_desc("[W]rite File And [Q]uit Buffer"))
    keymap("n", "<s-q>", ":bdelete<CR>", extend_desc("Close Split/Buffer"))
    keymap("n", "<C-q>", ":qa!<CR>", extend_desc("Quit Nvim"))

    -- Set the leader key (space in this case) to do nothing, Binding it to NULL
    vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

    -- Remap for dealing with word wrap
    vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
    vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

    -- keymap("n", "<leader>o", require("portal").jump_backward(), extend_desc('Jumlist Next'))
    -- keymap("n", "<leader>i", require("portal").jump_forward(), extend_desc('Jumplist Prev'))

    -- [[ Visual Mode; 'x/v' ]]

    -- Stay in indent mode
    keymap("v", ">", ">gv", extend_desc("Unindent Line"))
    keymap("v", "<", "<gv", extend_desc("Indent Line"))

    -- Move text up and down
    keymap("v", "<A-j>", ":m .+1<CR>==", extend_desc("Move Selected Text Down"))
    keymap("v", "<A-k>", ":m .-2<CR>==", extend_desc("Move Selected Text Up"))
    keymap("v", "p", '"_dP', extend_desc("Sync with system clipboard"))
    -- keymap("t", "p", '"_dP', extend_desc("Sync with system clipboard"))
    keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", extend_desc("Move Selected Text Down"))
    keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", extend_desc("Move Selected Text Up"))

    -- [[ Edit Mode; 'i' ]]

    -- delete word under cursor
    -- keymap("i", "<C-BS>", "<C-w>", extend_desc("Delete from char under cursor to starting of word"))
    -- keymap("c", "<C-BS>", "<C-w>", extend_desc("Delete from char under cursor to starting of word"))


    -- [[ ToggleTerm ]]
    keymap("n", "<leader>tt", ":ToggleTerm<CR>", extend_desc("[T]oggle [T]erm Window"))
    keymap("n", "<leader>th", ":ToggleTerm direction=horizontal<CR>", extend_desc("Open ToggleTerm Horizontally"))
    keymap("n", "<leader>tf", ":ToggleTerm direction=float<CR>", extend_desc("Open ToggleTerm in Floating Window"))
    keymap("n", "<leader>tv", ":ToggleTerm direction=vertical<CR>", extend_desc("Open ToggleTerm In Vertically"))
    keymap("n", "<leader>tn", ":ToggleTerm direction=tab<CR>", extend_desc("Open ToggleTerm In A [N]ew Tab"))
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
