
local exec = vim.api.nvim_exec 	-- execute Vimscript

vim.cmd([[
"==============================================================================
" This is a script will triger a terminal quickly than the FloatTerminal
" open new split panes to right and below
" Line: https://betterprogramming.pub/setting-up-neovim-for-web-development-in-2020-d800de3efacd
"==============================================================================
" set splitright
" set splitbelow
" turn terminal to normal mode with escape
" tnoremap <Esc> <C-\><C-n>
" " start terminal in insert mode
" au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" " open terminal on ctrl+n
" function! OpenTerminal()
"   split term:zsh
"   resize 10
" endfunction
" nnoremap <Leader> n :call OpenTerminal()<CR>
"
" open new split panes to right and below

" ------------ My Notes ------------------
" Parameters:
" Right Terminal:
"   - vsplit instead of split
"   - resize 100
" Down Terminal:
"   - split instead of vsplit
"   - resize 10 (default 10, I use 20)
"
set splitright
set splitbelow
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
  split term://zsh
  resize 10
endfunction
nnoremap <space>bn :call OpenTerminal()<CR>

" Exit any terminal opened using leader + Esc
tnoremap <leader><Esc> <C-\><C-n>:q!<CR>
]])

