--
--         ██╗░░██╗███████╗██╗░░░██╗  ███╗░░░███╗░█████╗░██████╗░██████╗░██╗███╗░░██╗░██████╗░░██████╗
--         ██║░██╔╝██╔════╝╚██╗░██╔╝  ████╗░████║██╔══██╗██╔══██╗██╔══██╗██║████╗░██║██╔════╝░██╔════╝
--         █████═╝░█████╗░░░╚████╔╝░  ██╔████╔██║███████║██████╔╝██████╔╝██║██╔██╗██║██║░░██╗░╚█████╗░
--         ██╔═██╗░██╔══╝░░░░╚██╔╝░░  ██║╚██╔╝██║██╔══██║██╔═══╝░██╔═══╝░██║██║╚████║██║░░╚██╗░╚═══██╗
--         ██║░╚██╗███████╗░░░██║░░░  ██║░╚═╝░██║██║░░██║██║░░░░░██║░░░░░██║██║░╚███║╚██████╔╝██████╔╝
--         ╚═╝░░╚═╝╚══════╝░░░╚═╝░░░  ╚═╝░░░░░╚═╝╚═╝░░╚═╝╚═╝░░░░░╚═╝░░░░░╚═╝╚═╝░░╚══╝░╚═════╝░╚═════╝░
--
-- Basics Configurations
-- Following: https://youtu.be/ppMX4LHIuy4
-- There are three types of configuration options
-- 1.) Global optoins (vim.o)
-- 2.) Local to window (vim.wo)
-- 3.) Local to buffer (vim.bo)
-- Adding some configurations
-- How to know to which configuration use :h expandtab
-- My Leader key
vim.bo.expandtab = true
vim.bo.shiftwidth = 2
vim.bo.softtabstop = 2


vim.api.nvim_set_keymap("n", "<c-s>", ":w<CR>",{noremap = true, silent = true})
vim.api.nvim_set_keymap("i", "<c-s>", "<Esc>:w<CR>",{noremap= true, silent = true})

-- Using Ctrl-jhkl to navigate splits (buffers)
vim.api.nvim_set_keymap("n", "<c-k>", "<c-w>k",{noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<c-h>", "<c-w>h",{noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<c-j>", "<c-w>j",{noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<c-l>", "<c-w>l",{noremap = true, silent = true})


-- Better indenting using (<) and (>)
vim.api.nvim_set_keymap("v", "<", "<gv", {noremap = true,silent = true,})
vim.api.nvim_set_keymap("v", ">", ">gv", {noremap = true,silent = true,})

-- Tab switch buffers
vim.api.nvim_set_keymap("n", "<TAB>", ":bnext<CR>", {noremap = true,silent = true})
vim.api.nvim_set_keymap("n", "<S-TAB>", ":bprevious<CR>", {noremap = true,silent = true})

-- map the leader in nvim to space
vim.g.mapleader = " "
-- Explorer with Nvim-tree( ensure first the undotree is not toggled )
vim.api.nvim_set_keymap("n", "<Leader>e", ":<cmd>UndotreeHide<CR>:NvimTreeToggle<CR>", {noremap = true,silent = true})
-- this will be source with setting directory which shoould be put at the end of the loaded dictionaries
vim.api.nvim_set_keymap("n", "<leader>u", ":<cmd>NvimTreeClose<CR> :UndotreeToggle<CR>", {noremap = true,silent = true})
-- Ctrl + P to open the the navigator faster
--vim.api.nvim_set_keymap('n', '<leader>p',"<cmd>lua require('fzf-lua').files()<CR>",{ noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>p',"<cmd>lua require('fzf-lua').files({ fzf_opts = {['--layout'] = 'reverse-list'} })<CR>",{ noremap = true, silent = true })

-- Move/selected line / block of text in visual mode
vim.api.nvim_set_keymap("x", "K", ":move '<-2<CR>gv-gv", { noremap = true, silent = true,})
vim.api.nvim_set_keymap("x", "J", ":move '>+2<CR>gv-gv", { noremap = true, silent = true,})
vim.api.nvim_set_keymap("n", "K", ":move .-2<CR>==",     { noremap = true, silent = true,})
vim.api.nvim_set_keymap("n", "J", ":move .+1<CR>==",     { noremap = true, silent = true,})

-- yank to the end of a line
vim.api.nvim_set_keymap("n", "Y", "y$", { noremap = true,  silent = true,})
vim.api.nvim_set_keymap("n", "<leader>y", "y$", { noremap = true,  silent = true,})

-- close all windows and exit from neovim
vim.api.nvim_set_keymap("n", "<leader>q", ":qa<CR>",{ noremap = true, silent = true,})

-- mapping for paste  Ref: https://vim.fandom.com/wiki/Replace_a_word_with_yanked_text
vim.cmd([[
  xnoremap p "_dP
  xnoremap <silent> p p:let @+=@0<CR>
]])
-- Paste over currently selected text without yanking it
vim.api.nvim_set_keymap("v", "p", '"_dP',{ noremap = true, silent = true,})

-- Cancel search highlighting with ESC
vim.api.nvim_set_keymap("n", "<ESC>", ":nohlsearch<Bar>:echo<CR>",{ noremap = true, silent = true,})


-- Maximize and minimize windows
vim.api.nvim_set_keymap("n", "<space>+", ":vertical resize +5<CR>", { noremap = true,  silent = true,})
vim.api.nvim_set_keymap("n", "<space>-", ":vertical resize -5<CR>", { noremap = true,  silent = true,})

-- close windows without affecting other buffers
vim.api.nvim_set_keymap("n", "<leader>w", "<cmd>Bdelete<cr>", {  noremap =  true,  silent = false,})


-- Move to beginning and end of line in normal mode
vim.api.nvim_set_keymap("n", "<leader>h", "<ESC>^", {  noremap = true,  silent = false,})
vim.api.nvim_set_keymap("n", "<leader>l", "<ESC>$", {  noremap = true,  silent = false,})

-- close windows without affecting other buffers
vim.api.nvim_set_keymap("n", "<leader>w", "<cmd>Bdelete<cr>", {  noremap = true,  silent = false,})

-- Rnvim (Ranger) for Nvim
vim.api.nvim_set_keymap("n", "<Leader>r", ":RnvimrToggle<CR>",{  noremap = true,  silent = false,})

-- Floating terminal for nvim
vim.api.nvim_set_keymap("n", "<Leader>t", ":FloatermToggle<CR>",{  noremap = true,  silent = false,})

-- Better nav for omni-complete
vim.api.nvim_set_keymap("i", "<c-j>", '("<C-n>")', {  noremap = true,  silent = true,  expr = true,})
vim.api.nvim_set_keymap("i", "<c-k>", '("<C-p>")', {  noremap = true,  silent = true,  expr = true,})


-- open a link in vim in browser: in linux use : xdg-open instead of open (for mac).
-- source: " https://stackoverflow.com/questions/9458294/open-url-under-cursor-in-vim-with-browser "
-- nnoremap <silent> gx :execute 'silent! !open ' . shellescape(expand('<cWORD>'), 1)<cr>
-- let path="/Applications/Safari.app", the web-link should have soome space
-- with quotation like " www.something.com ", not "www.something.com"
vim.cmd([[
function! OpenUrlUnderCursor()
    let path="/Applications/Firefox.app",
    execute "normal BvEy"
    let url=matchstr(@0, '[a-z]*:\/\/[^ >,;]*')
    if url != ""
        silent exec "!open -a ".path." '".url."'" | redraw!
        echo "opened ".url
    else
        echo "No URL under cursor."
    endif
endfunction
nmap <leader>gu :call OpenUrlUnderCursor()<CR>
nmap gx :call OpenUrlUnderCursor()<CR>

]])

vim.cmd([[
nmap <leader>gw :call Google()<CR>
fun! Google()
    let keyword = expand("<cword>")
    let url = "http://www.google.com/search?q=" . keyword
    let path="/Applications/Firefox.app"
    "let path = "C:/Program Files/Mozilla Firefox/"
    "exec 'silent ! path url'
    silent exec "!open -a ".path." '".url."'" | redraw!
endfun

]])


-- Turn-off the default key-bindings of the coq-nvim code snippets +9000
vim.cmd([[
    " Set recommended to false
    let g:coq_settings = { "keymap.recommended": v:false }
]])




vim.cmd([[
         nmap j <plug>(accelerated_jk_gj_position)
         nmap k <plug>(accelerated_jk_gk_position)
         ]])
