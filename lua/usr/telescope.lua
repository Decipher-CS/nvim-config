-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
local status_ok, telescope = pcall(require, 'telescope')
if not status_ok then
  return
end
telescope.setup {
  defaults = {
    mappings = {
      i = {
        -- ['<C-h>'] = "which_key",
        -- ['<C-u>'] = true,
        -- ['<C-d>'] = true,
      },
    },
    file_ignore_patterns = {
      "node_modules/",
      "%~",
      "%.swp",
      "%.swo",
    },
    prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "smart" },
  },
  extensions = {
    media_files = {
      filetypes = { "png", "webp", "jpg", "jpeg", "pdf", "mp4", "webm" },
      find_cmd = "fd"
    }
  },
  pickers = {
    colorscheme = {
      enable_preview = true
    }
  }
}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')
pcall(require('telescope').load_extension, 'notify')
pcall(require('telescope').load_extension, 'media_files')
-- pcall(require('telescope').load_extension, 'session-lens')
-- require('session-lens').setup {
--   path_display = { 'shorten' },
--   theme = 'ivy', -- default is dropdown
--   theme_conf = { border = true },
--   previewer = true
-- }

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>sb', require('telescope.builtin').buffers, { desc = '[S]earch existing [B]uffers' })
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>so', require('telescope.builtin').builtin, { desc = '[S]earch builtin [O]ptions' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep across files' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>ss', function()
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = 'Fuzzy [S]earch for [S]tring in current buffer' })
-- vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
-- vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord across files' })
-- vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
