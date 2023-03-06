-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
require('nvim-treesitter.configs').setup {
        -- Add languages to be installed here that you want installed for treesitter
        ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'tsx', 'typescript', 'help', 'vim', 'javascript',
                'vim', 'regex', 'markdown', 'json', 'markdown_inline', 'bash' },

        sync_install = true,

        -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
        auto_install = true,

        -- Makes treesitter aware of the autopair plugin... I think.
        autopairs = { enable = true },

        -- A Neovim extension to highlight same-name identifiers with the same color.
        highlight = { enable = true },
        refactor = {
                highlight_current_scope = { enable = false },
                highlight_definitions = { enable = false }
        },
        indent = { enable = true, disable = { 'python' } },
        incremental_selection = {
                enable = true,
                keymaps = {
                        init_selection = '<c-space>',
                        node_incremental = '<c-space>',
                        scope_incremental = '<c-s>',
                        node_decremental = '<M-space>',
                },
        },
        context_commentstring = {
                enable = true,
                enable_autocmd = false,
        },
        textobjects = {
                select = {
                        enable = true,
                        lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
                        keymaps = {
                                -- You can use the capture groups defined in textobjects.scm
                                    ['aa'] = '@parameter.outer',
                                    ['ia'] = '@parameter.inner',
                                    ['af'] = '@function.outer',
                                    ['if'] = '@function.inner',
                                    ['ac'] = '@class.outer',
                                    ['ic'] = '@class.inner',
                        },
                },
                move = {
                        enable = true,
                        set_jumps = true, -- whether to set jumps in the jumplist
                        goto_next_start = {
                                    [']m'] = '@function.outer',
                                    [']]'] = '@class.outer',
                        },
                        goto_next_end = {
                                    [']M'] = '@function.outer',
                                    [']['] = '@class.outer',
                        },
                        goto_previous_start = {
                                    ['[m'] = '@function.outer',
                                    ['[['] = '@class.outer',
                        },
                        goto_previous_end = {
                                    ['[M'] = '@function.outer',
                                    ['[]'] = '@class.outer',
                        },
                },
                swap = {
                        enable = true,
                        swap_next = {
                                    ['<leader>a'] = '@parameter.inner',
                        },
                        swap_previous = {
                                    ['<leader>A'] = '@parameter.inner',
                        },
                },
        },
}

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Goto prev diagnostic" })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Goto next diagnostic" })
vim.keymap.set('n', '<leader>fw', vim.diagnostic.open_float, { desc = "Open diagnostic in floating window" })
vim.keymap.set('n', '<leader>ll', vim.diagnostic.setloclist, { desc = "Set localist" })
