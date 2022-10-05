-----------------------------------------------------------
-- Neovim settings
--- General Neovim settings
-----------------------------------------------------------
-----------------------------------------------------------
-- Neovim API aliases
-----------------------------------------------------------
-- local map = vim.api.nvim_set_keymap  -- set global keymap
local cmd = vim.cmd -- execute Vim commands
local exec = vim.api.nvim_exec -- execute Vimscript
local fn = vim.fn -- call Vim functions
local g = vim.g -- global variables
local opt = vim.opt -- global/buffer/windows-scoped options
local vim = vim
-----------------------------------------------------------
-- General
-----------------------------------------------------------
opt.mouse = "a" -- enable mouse support, clicking and scrolling, Now I use, option from my mac If you use iTerm, <<defaults write com.googlecode.iterm2 AlternateMouseScroll -bool true>>
opt.clipboard = "unnamedplus" -- copy/paste to system clipboard

vim.cmd([[
set clipboard=unnamed
if has("unnamedplus") " X11 support
    set clipboard+=unnamedplus
endif
]])

vim.cmd([[
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
]])

vim.cmd([[
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis
set fileformats=unix,dos,mac
]])

opt.swapfile = false -- don't use swapfile
cmd([[set guicursor=]]) -- This will keep the cursor form changing.
g.gruvbox_invert_selection = 0 -- In Visual Mode selection, turn-off multi-color, https://www.reddit.com/r/vim/comments/ejy7yp/how_would_you_tell_vim_to_change_the_visual/

-- mapping for paste  Ref: https://vim.fandom.com/wiki/Replace_a_word_with_yanked_text
vim.cmd([[
  xnoremap p "_dP
]])
--
-----------------------------------------------------------
--               For Tmux Support colors
-----------------------------------------------------------
vim.cmd([[
set background=dark
set t_Co=256
]])

vim.cmd([[
set modifiable
set write
]])
-----------------------------------------------------------
--              Spelling and dictionary
--        This takes so much time costing around 30 millsec
-----------------------------------------------------------
--vim.cmd([[
--    set spell
--    set spelllang=en_us
--    "set spellfile = /usr/share/myspell/en_US.dic
--]])
--vim.cmd("set dictionary+=/usr/share/dict/words")
-----------------------------------------------------------
--              Cursor shape
-----------------------------------------------------------
-- cmd[[set guicursor=a:/iCursor-blinkon40-blinkoff40-blinkwait10]]   -- To change the  cursor options such as the size and blinking, not used at the moment
-- cmd[[set guicursor=i-ci:ver30-iCursor-blinkon40-blinkoff40-blinkwait10]]   -- To change the  cursor options such as the size and blinking
-- (a) means all modes, (i) insert, (v) visual model, and iCursor is different from blcokCurosr see (:h guicurosr)
--cmd([[set guicursor=a:ver50-iCursor-blinkon40-blinkoff40-blinkwait10]]) -- To change the  cursor options such as the size and blinking,
--cmd([[set guicursor=i:ver50-iCursor-blinkon40-blinkoff40-blinkwait10]]) -- To change the  cursor options such as the size and blinking,

-----------------------------------------------------------
-- Configurations form my old vim script
-----------------------------------------------------------
opt.wrap = false
opt.relativenumber = true
opt.errorbells = false
opt.signcolumn = "yes"
opt.cursorline = true
opt.ruler = true
opt.fileencoding = "utf-8"
opt.pumheight = 10
opt.encoding = "utf-8"
opt.updatetime = 300
opt.timeoutlen = 500
cmd([[set formatoptions-=cro]]) -- Stop newline continution of comments
opt.laststatus = 2 -- originally its 0,  this will allow lua statusline to be shown, otherwise it will not
opt.backup = false -- Recommended by COC
opt.writebackup = false -- Recommended by COC
opt.showtabline = 2
opt.conceallevel = 0
opt.tabstop = 2
opt.shiftwidth = 2
opt.wildignore =
    ".git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**,**/bower_modules/**"
opt.fillchars = {
    vert = "▕", -- alternatives │
    fold = " ",
    eob = " ", -- suppress ~ at EndOfBuffer
    diff = "╱", -- alternatives = ⣿ ░ ─
    msgsep = "‾",
    foldopen = "▾",
    foldsep = "│",
    foldclose = "▸"
}
-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
opt.syntax = "enable" -- enable syntax highlighting
opt.number = true -- show line number
opt.showmatch = true -- highlight matching parenthesis
opt.foldmethod = "marker" -- enable folding (default 'foldmarker')
opt.colorcolumn = "130" -- line lenght marker at 80 columns
-- to show the color of the vertical ruler set to 120 width for now
-- vim.cmd([[hi ColorColumn ctermbg=0 guibg=lightgray]])
-- cmd([[highlight ColorColumn ctermbg=0 guibg=lightgrey]])
opt.splitright = true -- vertical split to the right
opt.splitbelow = true -- orizontal split to the bottom
opt.ignorecase = true -- ignore case letters when search
opt.smartcase = true -- ignore lowercase for the whole pattern

-- remove whitespace on save
cmd([[au BufWritePre * :%s/\s\+$//e]])


-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
opt.hidden = true -- enable background buffers
opt.history = 100 -- remember n lines in history
opt.lazyredraw = true -- faster scrolling
opt.synmaxcol = 240 -- max column for syntax highlight
-- Added new options
opt.scrolloff = 2 -- make scrolling better
opt.sidescroll = 2 -- make scrolling better
opt.shiftwidth = 2 -- set indentation width
opt.sidescrolloff = 15 -- make scrolling better
-----------------------------------------------------------
-- Colorscheme
-----------------------------------------------------------
opt.termguicolors = true -- enable 24-bit RGB colors
-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
opt.expandtab = true -- use spaces instead of tabs
opt.shiftwidth = 4 -- shift 4 spaces when tab
opt.tabstop = 4 -- 1 tab == 4 spaces
opt.smartindent = true -- autoindent new lines
opt.autoindent = true
-- don't auto commenting new lines
cmd([[au BufEnter * set fo-=c fo-=r fo-=o]])

-- remove line lenght marker for selected filetypes
cmd([[
  autocmd FileType text,markdown,xml,html,xhtml,javascript setlocal cc=0
]])

-- 2 spaces for selected filetypes
cmd([[
  autocmd FileType xml,html,xhtml,css,scss,javascript,lua,yaml setlocal shiftwidth=2 tabstop=2
]])

-- 8 spaces for Go files
cmd([[autocmd FileType go setlocal shiftwidth=8 tabstop=8]])

-- IndentLine
-- g.indentLine_setColors = 0  -- set indentLine color
-- g.indentLine_char = '|'       -- set indentLine character

-- disable IndentLine for markdown files (avoid concealing)
cmd([[
	autocmd FileType markdown let g:indentLine_enabled=0
]])


-- Configurations for the mac
local global = require("core.global")
if global.is_mac then
    vim.g.clipboard = {
        name = "macOS-clipboard",
        copy = {
            ["+"] = "pbcopy",
            ["*"] = "pbcopy"
        },
        paste = {
            ["+"] = "pbpaste",
            ["*"] = "pbpaste"
        },
        cache_enabled = 0
    }

    vim.g.python_host_prog = "/usr/bin/python2"
    vim.g.python3_host_prog = "$HOME/opt/anaconda3/bin/python3" -- '/usr/local/bin/python3'
end
-----------------------------------------------------------
--          Glow for Markdown
-----------------------------------------------------------
vim.g.glow_border = "rounded"
vim.g.glow_width = 200
--vim.g.glow_use_pager = true
--vim.g.glow_style = "light"
vim.opt.termguicolors = true


-----------------------------------------------------------
--      Unload some default plugins shipped with nvim
-----------------------------------------------------------
local g = vim.g

-- Disable some builtin vim plugins
local disabled_built_ins = {
  "2html_plugin",
  "getscript",
  "getscriptPlugin",
  "gzip",
  "logipat",
  -- "netrw",
  -- "netrwPlugin",
  -- "netrwSettings",
  -- "netrwFileHandlers",
  "matchit",
  "matchparen",
  "tar",
  "tarPlugin",
  "rrhelper",
  "vimball",
  "vimballPlugin",
  "zip",
  "zipPlugin",
}

for _, plugin in pairs(disabled_built_ins) do
  g["loaded_" .. plugin] = 1
end

local disable_distribution_plugins = function()
	vim.g.loaded_gzip = 1
	vim.g.loaded_tar = 1
	vim.g.loaded_tarPlugin = 1
	vim.g.loaded_zip = 1
	vim.g.loaded_zipPlugin = 1
	vim.g.loaded_getscript = 1
	vim.g.loaded_getscriptPlugin = 1
	vim.g.loaded_vimball = 1
	vim.g.loaded_vimballPlugin = 1
	vim.g.loaded_matchit = 1
	vim.g.loaded_matchparen = 1
	vim.g.loaded_2html_plugin = 1
	vim.g.loaded_logiPat = 1
	vim.g.loaded_rrhelper = 1
	vim.g.loaded_netrw = 1
	vim.g.loaded_netrwPlugin = 1
	vim.g.loaded_netrwSettings = 1
	vim.g.loaded_netrwFileHandlers = 1
end



-----------------------------------------------------------
--            Remove whitespace on save
-----------------------------------------------------------
vim.cmd([[au BufWritePre * :%s/\s\+$//e]])

-----------------------------------------------------------
-- This will auto load the nvim if the file got changed
--        by other editor or buffer
--  (if you change the file in vscode for example)
-----------------------------------------------------------
vim.cmd([[
au BufWinEnter *.<fileextension> set updatetime=300 | set ft=<filetype>| set autoread
au CursorHold *.<fileextension>  checktime
]])


--vim.highlight.create('XXX', {ctermbg=0, guibg="#FFC49B", guifg="#EEEDBF"}, true)
-- Having source % can cause problems for certain files
--  exec([[
--    augroup YankHighlight
--      autocmd!
--      autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="YANK_HIGHLIGHT_COLOR_GROUP", timeout=700}
--      autocmd TextYankPost  ~/.config/nvim/* source %
--    augroup end
--  ]], true)
vim.cmd [[
  augroup _general_settings
    autocmd!
    autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR>
    autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'IncSearch', timeout = 700})
    autocmd BufWinEnter * :set formatoptions-=cro
    autocmd FileType qf set nobuflisted
  augroup end
  ]]
--

-- This will highlight the Cursor Line Number ()
-- Read more here:
-- https://www.folkstalk.com/2022/09/vim-line-numbers-background-color-with-code-examples.html
-- :hi LineNr ctermfg=grey ctermbg=white
-- :hi CursorLineNr ctermfg=45 cterm=bold
vim.cmd([[
    hi CursorLineNr term=bold cterm=bold ctermfg=green guifg=red guibg=black2
]])
-----------------------------------------------------------
--  Highlight symbols with (/) search command event
-----------------------------------------------------------
-- Setting for the multi-instance searching with /
--vim.cmd([[set hlsearch]])
--vim.cmd([[hi Search term=reverse guibg=peru guifg=wheat]])
--

