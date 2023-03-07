return {
  "anuvyklack/pretty-fold.nvim",
  enabled = true,
  dependencies = { { 'anuvyklack/fold-preview.nvim', opts = {} }, { 'anuvyklack/keymap-amend.nvim' } },
  opts = {
    sections = {
      left = {
        "━ ",
        function()
          return string.rep("*", vim.v.foldlevel)
        end,
        " ━┫",
        "content",
        "┣",
      },
      right = {
        "┫ ",
        "number_of_folded_lines",
        ": ",
        "percentage",
        " ┣━━",
        function(config)
          return config.fill_char:rep(3)
        end,
      },
    },
    fill_char = "━",
    remove_fold_markers = false,
    -- Keep the indentation of the content of the fold string.
    keep_indentation = true,
    -- Possible values:
    -- "delete" : Delete all comment signs from the fold string.
    -- "spaces" : Replace all comment signs with equal number of spaces.
    -- false    : Do nothing with comment signs.
    process_comment_signs = "spaces",
    -- Comment signs additional to the value of `&commentstring` option.
    comment_signs = {},
    -- List of patterns that will be removed from content foldtext section.
    stop_words = {
      "@brief%s*",            -- (for C++) Remove '@brief' and all spaces after.
    },
    add_close_pattern = true, -- true, 'last_line' or false
    matchup_patterns = {
      -- ╟─ Start of line ──╭───────╮── "do" ── End of line ─╢
      --                    ╰─ WSP ─╯
      { "^%s*do$",       "end" }, -- `do ... end` blocks

      -- ╟─ Start of line ──╭───────╮── "if" ─╢
      --                    ╰─ WSP ─╯
      { "^%s*if",        "end" },

      -- ╟─ Start of line ──╭───────╮── "for" ─╢
      --                    ╰─ WSP ─╯
      { "^%s*for",       "end" },

      -- ╟─ "function" ──╭───────╮── "(" ─╢
      --                 ╰─ WSP ─╯
      { "function%s*%(", "end" }, -- 'function(' or 'function ('

      { "{",             "}" },
      { "%(",            ")" }, -- % to escape lua pattern char
      { "%[",            "]" }, -- % to escape lua pattern char
    },
    ft_ignore = { "neorg" },
  },
}
