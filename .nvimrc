version 6.0
let s:cpo_save=&cpo
set cpo&vim
cnoremap <silent> <Plug>(TelescopeFuzzyCommandSearch) e "lua require('telescope.builtin').command_history { default_text = [=[" . escape(getcmdline(), '"') . "]=] }"
noremap! <silent> <Plug>luasnip-expand-repeat <Cmd>lua require'luasnip'.expand_repeat()
noremap! <silent> <Plug>luasnip-delete-check <Cmd>lua require'luasnip'.unlink_current_if_deleted()
inoremap <silent> <Plug>luasnip-jump-prev <Cmd>lua require'luasnip'.jump(-1)
inoremap <silent> <Plug>luasnip-jump-next <Cmd>lua require'luasnip'.jump(1)
inoremap <silent> <Plug>luasnip-prev-choice <Cmd>lua require'luasnip'.change_choice(-1)
inoremap <silent> <Plug>luasnip-next-choice <Cmd>lua require'luasnip'.change_choice(1)
inoremap <silent> <Plug>luasnip-expand-snippet <Cmd>lua require'luasnip'.expand()
inoremap <silent> <Plug>luasnip-expand-or-jump <Cmd>lua require'luasnip'.expand_or_jump()
tmap <silent>  h
nnoremap <silent>  h
tmap <silent> <NL> j
nnoremap <silent> <NL> j
tmap <silent>  k
nnoremap <silent>  k
tmap <silent>  l
nnoremap <silent>  l
nnoremap <silent>  <Cmd>Telescope live_grep
nnoremap <silent> Þ <Nop>
nnoremap <silent>  <Cmd>lua require("which-key").show("\23", {mode = "n", auto = true})
nnoremap <silent>  <Cmd>execute v:count . "ToggleTerm"
xnoremap <silent>  <Cmd>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())
nnoremap <silent>  <Cmd>lua require('Comment.api').toggle_current_linewise()
xnoremap <silent>  Þ <Nop>
xnoremap <silent>   <Cmd>lua require("which-key").show(" ", {mode = "v", auto = true})
nnoremap <silent>  pÞ <Nop>
nnoremap <silent>  gÞ <Nop>
nnoremap <silent>  tÞ <Nop>
nnoremap <silent>  lÞ <Nop>
nnoremap <silent>  dsÞ <Nop>
nnoremap <silent>  dÞ <Nop>
nnoremap <silent>   Þ <Nop>
nnoremap <silent>  sÞ <Nop>
nnoremap <silent>  crÞ <Nop>
nnoremap <silent>  Þ <Nop>
nnoremap <silent>   <Cmd>lua require("which-key").show(" ", {mode = "n", auto = true})
nnoremap <nowait> <silent>  pc <Cmd>PackerCompile
nnoremap <nowait> <silent>  pS <Cmd>PackerStatus
nnoremap <nowait> <silent>  pu <Cmd>PackerUpdate
nnoremap <nowait> <silent>  ps <Cmd>PackerSync
nnoremap <nowait> <silent>  pi <Cmd>PackerInstall
nnoremap <nowait> <silent>  a <Cmd>Alpha
nnoremap <nowait> <silent>  h <Cmd>nohlsearch
nnoremap <nowait> <silent>  P <Cmd>lua require('telescope').extensions.projects.projects()
nnoremap <nowait> <silent>  w <Cmd>wa
nnoremap <nowait> <silent>  Q <Cmd>qa
nnoremap <nowait> <silent>  F <Cmd>Telescope live_grep theme=ivy
nnoremap <nowait> <silent>  gp <Cmd>lua require 'gitsigns'.preview_hunk()
nnoremap <nowait> <silent>  gl <Cmd>lua require 'gitsigns'.blame_line()
nnoremap <nowait> <silent>  gr <Cmd>lua require 'gitsigns'.reset_hunk()
nnoremap <nowait> <silent>  gs <Cmd>lua require 'gitsigns'.stage_hunk()
nnoremap <nowait> <silent>  gj <Cmd>lua require 'gitsigns'.next_hunk()
nnoremap <nowait> <silent>  go <Cmd>Telescope git_status
nnoremap <nowait> <silent>  gk <Cmd>lua require 'gitsigns'.prev_hunk()
nnoremap <nowait> <silent>  gg <Cmd>lua _LAZYGIT_TOGGLE()
nnoremap <nowait> <silent>  gc <Cmd>Telescope git_commits
nnoremap <nowait> <silent>  gb <Cmd>Telescope git_branches
nnoremap <nowait> <silent>  gR <Cmd>lua require 'gitsigns'.reset_buffer()
nnoremap <nowait> <silent>  gu <Cmd>lua require 'gitsigns'.undo_stage_hunk()
nnoremap <nowait> <silent>  gd <Cmd>Gitsigns diffthis HEAD
nnoremap <nowait> <silent>  tp <Cmd>lua _PYTHON_TOGGLE()
nnoremap <nowait> <silent>  th <Cmd>ToggleTerm size=10 direction=horizontal
nnoremap <nowait> <silent>  tn <Cmd>tabnew %
nnoremap <nowait> <silent>  ta <Cmd>ToggleTermToggleAll
nnoremap <nowait> <silent>  tv <Cmd>ToggleTerm size=80 direction=vertical
nnoremap <nowait> <silent>  tu <Cmd>lua _NCDU_TOGGLE()
nnoremap <nowait> <silent>  tf <Cmd>ToggleTerm direction=float
nnoremap <nowait> <silent>  tt <Cmd>lua _HTOP_TOGGLE()
nnoremap <nowait> <silent>  la <Cmd>lua vim.lsp.buf.code_action()
nnoremap <nowait> <silent>  lk <Cmd>lua vim.lsp.diagnostic.goto_prev()
nnoremap <nowait> <silent>  ld <Cmd>Telescope lsp_document_diagnostics
nnoremap <nowait> <silent>  lw <Cmd>Telescope lsp_workspace_diagnostics
nnoremap <nowait> <silent>  lj <Cmd>lua vim.lsp.diagnostic.goto_next()
nnoremap <nowait> <silent>  ll <Cmd>lua vim.lsp.codelens.run()
nnoremap <nowait> <silent>  lI <Cmd>LspInstallInfo
nnoremap <nowait> <silent>  lr <Cmd>lua vim.lsp.buf.rename()
nnoremap <nowait> <silent>  ls <Cmd>Telescope lsp_document_symbols
nnoremap <nowait> <silent>  lS <Cmd>Telescope lsp_dynamic_workspace_symbols
nnoremap <nowait> <silent>  lq <Cmd>lua vim.lsp.diagnostic.set_loclist()
nnoremap <nowait> <silent>  lf <Cmd>lua vim.lsp.buf.formatting_sync()
nnoremap <nowait> <silent>  li <Cmd>LspInfo
nnoremap <nowait> <silent>  dtb <Cmd>lua require'dap'.toggle_breakpoint()
nnoremap <nowait> <silent>  dC <Cmd>FocusSplitCycle reverse
nnoremap <nowait> <silent>  dh <Cmd>FocusSplitLeft
nnoremap <nowait> <silent>  dk <Cmd>FocusSplitUp
nnoremap <nowait> <silent>  dw <Cmd>FocusToggleWindow
nnoremap <nowait> <silent>  dtt <Cmd>lua require'dap'.terminate()
nnoremap <nowait> <silent>  dn <Cmd>FocusSplitNicely
nnoremap <nowait> <silent>  dm <Cmd>FocusMaxOrEqual
nnoremap <nowait> <silent>  dj <Cmd>FocusSplitDown
nnoremap <nowait> <silent>  dsi <Cmd>lua require'dap'.step_into()<Cmd>WhichKey <leader>d
nnoremap <nowait> <silent>  dso <Cmd>lua require'dap'.step_over()<Cmd>WhichKey <leader>d
nnoremap <nowait> <silent>  dsb <Cmd>lua require'dap'.step_out()<Cmd>WhichKey <leader>d
nnoremap <nowait> <silent>  dx <Cmd>WinShift
nnoremap <nowait> <silent>  sk <Cmd>Telescope keymaps
nnoremap <nowait> <silent>  sh <Cmd>Telescope help_tags
nnoremap <nowait> <silent>  sr <Cmd>Telescope oldfiles
nnoremap <nowait> <silent>  sC <Cmd>Telescope commands
nnoremap <nowait> <silent>  sM <Cmd>Telescope man_pages
nnoremap <nowait> <silent>  sb <Cmd>Telescope git_branches
nnoremap <nowait> <silent>  sc <Cmd>Telescope colorscheme
nnoremap <nowait> <silent>  sR <Cmd>Telescope registers
nnoremap <nowait> <silent>  b <Cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})
nnoremap <nowait> <silent>  c <Cmd>Bdelete!
nnoremap <nowait> <silent>  q <Cmd>q
nnoremap  crp :CRProjects
nnoremap  crf :CRFiletype
nnoremap  rc :RunClose
nnoremap  rp :RunProject
nnoremap  rft :RunFile tab
nnoremap  rf :RunFile
nnoremap  r :w | RunCode
nnoremap <silent>   s :lua require('nvim-window').pick()
nnoremap <nowait> <silent>  e <Cmd>NvimTreeToggle
nnoremap <nowait> <silent>  f <Cmd>lua require('telescope.builtin').find_files(require('telescope.themes'))
nnoremap <silent>   x :e
nnoremap <nowait> <silent>  dt <Cmd>FocusToggle
nnoremap <silent>  du <Cmd>lua require'dapui'.toggle()
nnoremap <nowait> <silent>  dl <Cmd>lua require'dap'.continue()
nnoremap <silent>  dr <Cmd>lua require'dap'.repl.toggle()
nnoremap <silent>  dO <Cmd>lua require'dap'.step_out()
nnoremap <silent>  do <Cmd>lua require'dap'.step_over()
nnoremap <silent>  di <Cmd>lua require'dap'.step_into()
nnoremap <nowait> <silent>  dc <Cmd>lua require'dap'.continue()<Cmd>WhichKey <leader>d
nnoremap <silent>  db <Cmd>lua require'dap'.toggle_breakpoint()
snoremap <silent>   <Nop>
onoremap <silent>   <Nop>
nnoremap <silent> " <Cmd>lua require("which-key").show("\"", {mode = "n", auto = true})
omap <silent> % <Plug>(MatchitOperationForward)
xmap <silent> % <Plug>(MatchitVisualForward)
nmap <silent> % <Plug>(MatchitNormalForward)
nnoremap <silent> ' <Cmd>lua require("which-key").show("'", {mode = "n", auto = true})
vnoremap <silent> < <gv
vnoremap <silent> > >gv
nnoremap <silent> @Þ <Nop>
nnoremap <silent> @ <Cmd>lua require("which-key").show("@", {mode = "n", auto = true})
nnoremap <silent> H :bprevious
xnoremap <silent> J :move '>+1gv-gv
xnoremap <silent> K :move '<-2gv-gv
nnoremap <silent> L :bnext
nnoremap <silent> Q :Bdelete
nnoremap Y y$
xnoremap <silent> [Þ <Nop>
xnoremap <silent> [ <Cmd>lua require("which-key").show("[", {mode = "v", auto = true})
nnoremap <silent> [Þ <Nop>
nnoremap <silent> [ <Cmd>lua require("which-key").show("[", {mode = "n", auto = true})
omap <silent> [% <Plug>(MatchitOperationMultiBackward)
xmap <silent> [% <Plug>(MatchitVisualMultiBackward)
nmap <silent> [% <Plug>(MatchitNormalMultiBackward)
xnoremap <silent> ]Þ <Nop>
xnoremap <silent> ] <Cmd>lua require("which-key").show("]", {mode = "v", auto = true})
nnoremap <silent> ]Þ <Nop>
nnoremap <silent> ] <Cmd>lua require("which-key").show("]", {mode = "n", auto = true})
omap <silent> ]% <Plug>(MatchitOperationMultiForward)
xmap <silent> ]% <Plug>(MatchitVisualMultiForward)
nmap <silent> ]% <Plug>(MatchitNormalMultiForward)
nnoremap <silent> ` <Cmd>lua require("which-key").show("`", {mode = "n", auto = true})
xnoremap <silent> aÞ <Nop>
xnoremap <silent> a <Cmd>lua require("which-key").show("a", {mode = "v", auto = true})
xmap a% <Plug>(MatchitVisualTextObject)
nnoremap <silent> dÞ <Nop>
nnoremap <silent> d <Cmd>lua require("which-key").show("d", {mode = "n", auto = true})
nnoremap <silent> dm0 <Cmd>lua require'marks'.delete_bookmark0()
nnoremap <silent> dm3 <Cmd>lua require'marks'.delete_bookmark3()
nnoremap <silent> dm5 <Cmd>lua require'marks'.delete_bookmark5()
nnoremap <silent> dm- <Cmd>lua require'marks'.delete_line()
nnoremap <silent> dm6 <Cmd>lua require'marks'.delete_bookmark6()
nnoremap <silent> dm9 <Cmd>lua require'marks'.delete_bookmark9()
nnoremap <silent> dm= <Cmd>lua require'marks'.delete_bookmark()
nnoremap <silent> dm8 <Cmd>lua require'marks'.delete_bookmark8()
nnoremap <silent> dm2 <Cmd>lua require'marks'.delete_bookmark2()
nnoremap <silent> dm <Cmd>lua require'marks'.delete()
nnoremap <silent> dm4 <Cmd>lua require'marks'.delete_bookmark4()
nnoremap <silent> dm7 <Cmd>lua require'marks'.delete_bookmark7()
nnoremap <silent> dm1 <Cmd>lua require'marks'.delete_bookmark1()
nnoremap <silent> dm  <Cmd>lua require'marks'.delete_buf()
xnoremap <silent> gÞ <Nop>
xnoremap <silent> g <Cmd>lua require("which-key").show("g", {mode = "v", auto = true})
nnoremap <silent> gÞ <Nop>
nnoremap <silent> g <Cmd>lua require("which-key").show("g", {mode = "n", auto = true})
xmap gx <Plug>NetrwBrowseXVis
nmap gx <Plug>NetrwBrowseX
omap <silent> g% <Plug>(MatchitOperationBackward)
xmap <silent> g% <Plug>(MatchitVisualBackward)
nmap <silent> g% <Plug>(MatchitNormalBackward)
nnoremap gcA <Cmd>lua require("Comment.api").locked.insert_linewise_eol()
nnoremap gcO <Cmd>lua require("Comment.api").locked.insert_linewise_above()
nnoremap gco <Cmd>lua require("Comment.api").locked.insert_linewise_below()
xnoremap gb <Plug>(comment_toggle_blockwise_visual)
xnoremap gc <Plug>(comment_toggle_linewise_visual)
nnoremap gb <Plug>(comment_toggle_blockwise)
nnoremap gc <Plug>(comment_toggle_linewise)
nmap <expr> gbc v:count == 0 ? '<Plug>(comment_toggle_current_blockwise)' : '<Plug>(comment_toggle_blockwise_count)'
nmap <expr> gcc v:count == 0 ? '<Plug>(comment_toggle_current_linewise)' : '<Plug>(comment_toggle_linewise_count)'
xnoremap <silent> iÞ <Nop>
xnoremap <silent> i <Cmd>lua require("which-key").show("i", {mode = "v", auto = true})
tnoremap <silent> lk 
nnoremap <silent> m6 <Cmd>lua require'marks'.set_bookmark6()
nnoremap <silent> m} <Cmd>lua require'marks'.next_bookmark()
nnoremap <silent> m1 <Cmd>lua require'marks'.set_bookmark1()
nnoremap <silent> m: <Cmd>lua require'marks'.preview()
nnoremap <silent> m3 <Cmd>lua require'marks'.set_bookmark3()
nnoremap <silent> m] <Cmd>lua require'marks'.next()
nnoremap <silent> m5 <Cmd>lua require'marks'.set_bookmark5()
nnoremap <silent> m <Cmd>lua require'marks'.set()
nnoremap <silent> m0 <Cmd>lua require'marks'.set_bookmark0()
nnoremap <silent> m{ <Cmd>lua require'marks'.prev_bookmark()
nnoremap <silent> m9 <Cmd>lua require'marks'.set_bookmark9()
nnoremap <silent> m7 <Cmd>lua require'marks'.set_bookmark7()
nnoremap <silent> m4 <Cmd>lua require'marks'.set_bookmark4()
nnoremap <silent> m, <Cmd>lua require'marks'.set_next()
nnoremap <silent> m2 <Cmd>lua require'marks'.set_bookmark2()
nnoremap <silent> m[ <Cmd>lua require'marks'.prev()
nnoremap <silent> m8 <Cmd>lua require'marks'.set_bookmark8()
nnoremap <silent> m; <Cmd>lua require'marks'.toggle()
vnoremap <silent> p "_dP
nnoremap <silent> zÞ <Nop>
nnoremap <silent> z <Cmd>lua require("which-key").show("z", {mode = "n", auto = true})
xnoremap <Plug>(comment_toggle_blockwise_visual) <Cmd>lua require("Comment.api").locked.toggle_blockwise_op(vim.fn.visualmode())
xnoremap <Plug>(comment_toggle_linewise_visual) <Cmd>lua require("Comment.api").locked.toggle_linewise_op(vim.fn.visualmode())
nnoremap <Plug>(comment_toggle_blockwise) <Cmd>lua require("Comment.api").call("toggle_blockwise_op")g@
nnoremap <Plug>(comment_toggle_linewise) <Cmd>lua require("Comment.api").call("toggle_linewise_op")g@
nnoremap <Plug>(comment_toggle_current_blockwise) <Cmd>lua require("Comment.api").call("toggle_current_blockwise_op")g@$
nnoremap <Plug>(comment_toggle_current_linewise) <Cmd>lua require("Comment.api").call("toggle_current_linewise_op")g@$
nnoremap <Plug>(comment_toggle_blockwise_count) <Cmd>lua require("Comment.api").call("toggle_blockwise_count_op")g@$
nnoremap <Plug>(comment_toggle_linewise_count) <Cmd>lua require("Comment.api").call("toggle_linewise_count_op")g@$
nnoremap <Plug>PlenaryTestFile :lua require('plenary.test_harness').test_directory(vim.fn.expand("%:p"))
nnoremap <Plug>(Marks-prev-bookmark9) <Cmd> lua require'marks'.prev_bookmark9()
nnoremap <Plug>(Marks-next-bookmark9) <Cmd> lua require'marks'.next_bookmark9()
nnoremap <Plug>(Marks-delete-bookmark9) <Cmd> lua require'marks'.delete_bookmark9()
nnoremap <Plug>(Marks-set-bookmark9) <Cmd> lua require'marks'.set_bookmark9()
nnoremap <Plug>(Marks-prev-bookmark8) <Cmd> lua require'marks'.prev_bookmark8()
nnoremap <Plug>(Marks-next-bookmark8) <Cmd> lua require'marks'.next_bookmark8()
nnoremap <Plug>(Marks-delete-bookmark8) <Cmd> lua require'marks'.delete_bookmark8()
nnoremap <Plug>(Marks-set-bookmark8) <Cmd> lua require'marks'.set_bookmark8()
nnoremap <Plug>(Marks-prev-bookmark7) <Cmd> lua require'marks'.prev_bookmark7()
nnoremap <Plug>(Marks-next-bookmark7) <Cmd> lua require'marks'.next_bookmark7()
nnoremap <Plug>(Marks-delete-bookmark7) <Cmd> lua require'marks'.delete_bookmark7()
nnoremap <Plug>(Marks-set-bookmark7) <Cmd> lua require'marks'.set_bookmark7()
nnoremap <Plug>(Marks-prev-bookmark6) <Cmd> lua require'marks'.prev_bookmark6()
nnoremap <Plug>(Marks-next-bookmark6) <Cmd> lua require'marks'.next_bookmark6()
nnoremap <Plug>(Marks-delete-bookmark6) <Cmd> lua require'marks'.delete_bookmark6()
nnoremap <Plug>(Marks-set-bookmark6) <Cmd> lua require'marks'.set_bookmark6()
nnoremap <Plug>(Marks-prev-bookmark5) <Cmd> lua require'marks'.prev_bookmark5()
nnoremap <Plug>(Marks-next-bookmark5) <Cmd> lua require'marks'.next_bookmark5()
nnoremap <Plug>(Marks-delete-bookmark5) <Cmd> lua require'marks'.delete_bookmark5()
nnoremap <Plug>(Marks-set-bookmark5) <Cmd> lua require'marks'.set_bookmark5()
nnoremap <Plug>(Marks-prev-bookmark4) <Cmd> lua require'marks'.prev_bookmark4()
nnoremap <Plug>(Marks-next-bookmark4) <Cmd> lua require'marks'.next_bookmark4()
nnoremap <Plug>(Marks-delete-bookmark4) <Cmd> lua require'marks'.delete_bookmark4()
nnoremap <Plug>(Marks-set-bookmark4) <Cmd> lua require'marks'.set_bookmark4()
nnoremap <Plug>(Marks-prev-bookmark3) <Cmd> lua require'marks'.prev_bookmark3()
nnoremap <Plug>(Marks-next-bookmark3) <Cmd> lua require'marks'.next_bookmark3()
nnoremap <Plug>(Marks-delete-bookmark3) <Cmd> lua require'marks'.delete_bookmark3()
nnoremap <Plug>(Marks-set-bookmark3) <Cmd> lua require'marks'.set_bookmark3()
nnoremap <Plug>(Marks-prev-bookmark2) <Cmd> lua require'marks'.prev_bookmark2()
nnoremap <Plug>(Marks-next-bookmark2) <Cmd> lua require'marks'.next_bookmark2()
nnoremap <Plug>(Marks-delete-bookmark2) <Cmd> lua require'marks'.delete_bookmark2()
nnoremap <Plug>(Marks-set-bookmark2) <Cmd> lua require'marks'.set_bookmark2()
nnoremap <Plug>(Marks-prev-bookmark1) <Cmd> lua require'marks'.prev_bookmark1()
nnoremap <Plug>(Marks-next-bookmark1) <Cmd> lua require'marks'.next_bookmark1()
nnoremap <Plug>(Marks-delete-bookmark1) <Cmd> lua require'marks'.delete_bookmark1()
nnoremap <Plug>(Marks-set-bookmark1) <Cmd> lua require'marks'.set_bookmark1()
nnoremap <Plug>(Marks-prev-bookmark0) <Cmd> lua require'marks'.prev_bookmark0()
nnoremap <Plug>(Marks-next-bookmark0) <Cmd> lua require'marks'.next_bookmark0()
nnoremap <Plug>(Marks-delete-bookmark0) <Cmd> lua require'marks'.delete_bookmark0()
nnoremap <Plug>(Marks-set-bookmark0) <Cmd> lua require'marks'.set_bookmark0()
nnoremap <Plug>(Marks-prev-bookmark) <Cmd> lua require'marks'.prev_bookmark()
nnoremap <Plug>(Marks-next-bookmark) <Cmd> lua require'marks'.next_bookmark()
nnoremap <Plug>(Marks-delete-bookmark) <Cmd> lua require'marks'.delete_bookmark()
nnoremap <Plug>(Marks-prev) <Cmd> lua require'marks'.prev()
nnoremap <Plug>(Marks-next) <Cmd> lua require'marks'.next()
nnoremap <Plug>(Marks-preview) <Cmd> lua require'marks'.preview()
nnoremap <Plug>(Marks-deletebuf) <Cmd> lua require'marks'.delete_buf()
nnoremap <Plug>(Marks-deleteline) <Cmd> lua require'marks'.delete_line()
nnoremap <Plug>(Marks-delete) <Cmd> lua require'marks'.delete()
nnoremap <Plug>(Marks-toggle) <Cmd> lua require'marks'.toggle()
nnoremap <Plug>(Marks-setnext) <Cmd> lua require'marks'.set_next()
nnoremap <Plug>(Marks-set) <Cmd> lua require'marks'.set()
snoremap <silent> <Plug>luasnip-jump-prev <Cmd>lua require'luasnip'.jump(-1)
snoremap <silent> <Plug>luasnip-jump-next <Cmd>lua require'luasnip'.jump(1)
snoremap <silent> <Plug>luasnip-prev-choice <Cmd>lua require'luasnip'.change_choice(-1)
snoremap <silent> <Plug>luasnip-next-choice <Cmd>lua require'luasnip'.change_choice(1)
snoremap <silent> <Plug>luasnip-expand-snippet <Cmd>lua require'luasnip'.expand()
snoremap <silent> <Plug>luasnip-expand-or-jump <Cmd>lua require'luasnip'.expand_or_jump()
noremap <silent> <Plug>luasnip-expand-repeat <Cmd>lua require'luasnip'.expand_repeat()
noremap <silent> <Plug>luasnip-delete-check <Cmd>lua require'luasnip'.unlink_current_if_deleted()
xnoremap <silent> <Plug>NetrwBrowseXVis :call netrw#BrowseXVis()
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#BrowseX(netrw#GX(),netrw#CheckIfRemote(netrw#GX()))
xmap <silent> <Plug>(MatchitVisualTextObject) <Plug>(MatchitVisualMultiBackward)o<Plug>(MatchitVisualMultiForward)
onoremap <silent> <Plug>(MatchitOperationMultiForward) :call matchit#MultiMatch("W",  "o")
onoremap <silent> <Plug>(MatchitOperationMultiBackward) :call matchit#MultiMatch("bW", "o")
xnoremap <silent> <Plug>(MatchitVisualMultiForward) :call matchit#MultiMatch("W",  "n")m'gv``
xnoremap <silent> <Plug>(MatchitVisualMultiBackward) :call matchit#MultiMatch("bW", "n")m'gv``
nnoremap <silent> <Plug>(MatchitNormalMultiForward) :call matchit#MultiMatch("W",  "n")
nnoremap <silent> <Plug>(MatchitNormalMultiBackward) :call matchit#MultiMatch("bW", "n")
onoremap <silent> <Plug>(MatchitOperationBackward) :call matchit#Match_wrapper('',0,'o')
onoremap <silent> <Plug>(MatchitOperationForward) :call matchit#Match_wrapper('',1,'o')
xnoremap <silent> <Plug>(MatchitVisualBackward) :call matchit#Match_wrapper('',0,'v')m'gv``
xnoremap <silent> <Plug>(MatchitVisualForward) :call matchit#Match_wrapper('',1,'v'):if col("''") != col("$") | exe ":normal! m'" | endifgv``
nnoremap <silent> <Plug>(MatchitNormalBackward) :call matchit#Match_wrapper('',0,'n')
nnoremap <silent> <Plug>(MatchitNormalForward) :call matchit#Match_wrapper('',1,'n')
xnoremap <silent> <M-k> :move '<-2gv-gv
xnoremap <silent> <M-j> :move '>+1gv-gv
snoremap <silent> <M-k> :m .-2==
snoremap <silent> <M-j> :m .+1==
nnoremap <silent> <M-k> :m .-2==gi
nnoremap <silent> <M-j> :m .+1==gi
nnoremap <silent> <C-Right> :vertical resize -2
nnoremap <silent> <C-Left> :vertical resize +2
nnoremap <silent> <C-Down> :resize -2
nnoremap <silent> <C-Up> :resize +2
nnoremap <silent> <C-/> gcc
imap <silent>  
cnoremap <silent>  <Cmd>lua require("which-key").show("\18", {mode = "c", auto = true})
inoremap <silent>  <Cmd>lua require("which-key").show("\18", {mode = "i", auto = true})
inoremap  u
inoremap  u
inoremap <silent> lÞ <Nop>
inoremap <silent> l <Cmd>lua require("which-key").show("l", {mode = "i", auto = true})
cnoremap <silent> lÞ <Nop>
cnoremap <silent> l <Cmd>lua require("which-key").show("l", {mode = "c", auto = true})
cnoremap <silent> lk 
inoremap <silent> lk 
let &cpo=s:cpo_save
unlet s:cpo_save
set clipboard=unnamedplus
set cmdheight=2
set completeopt=menuone,noselect
set expandtab
set formatoptions=jql
set guicursor=n-v-ve-o-r-sm:block,i:ver100,a:blinkwait0-blinkoff0-blinkon0
set guifont=monospace:h17
set helplang=en
set ignorecase
set indentkeys=0{,0},0),0],:,0#,!^F,o,O,e,0=end,0=until
set laststatus=3
set mouse=a
set pumheight=10
set runtimepath=~/.config/nvim,/etc/xdg/xdg-xubuntu/nvim,/etc/xdg/nvim,/etc/xdg/nvim,~/.local/share/nvim/site,~/.local/share/nvim/site/pack/packer/start/packer.nvim,~/.local/share/nvim/site/pack/*/start/*,/usr/share/xubuntu/nvim/site,/usr/share/xfce4/nvim/site,/usr/local/share/nvim/site,/usr/share/nvim/site,/var/lib/snapd/desktop/nvim/site,/usr/share/nvim/site,/usr/share/nvim/runtime,/usr/share/nvim/runtime/pack/dist/opt/matchit,/usr/lib/nvim,~/.local/share/nvim/site/pack/*/start/*/after,/usr/share/nvim/site/after,/var/lib/snapd/desktop/nvim/site/after,/usr/share/nvim/site/after,/usr/local/share/nvim/site/after,/usr/share/xfce4/nvim/site/after,/usr/share/xubuntu/nvim/site/after,~/.local/share/nvim/site/after,/etc/xdg/nvim/after,/etc/xdg/nvim/after,/etc/xdg/xdg-xubuntu/nvim/after,~/.config/nvim/after
set scrolloff=10
set shortmess=ifncTFtOolx
set noshowmode
set showtabline=2
set sidescrolloff=8
set smartcase
set smartindent
set splitbelow
set splitright
set statusline=%{%v:lua.require'lualine'.statusline()%}
set tabline=%!v:lua.nvim_bufferline()
set termguicolors
set timeoutlen=500
set undofile
set updatetime=300
set window=38
set winheight=24
set winminheight=4
set winminwidth=21
set winwidth=106
set nowritebackup
" vim: set ft=vim :
