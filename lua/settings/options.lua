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
--opt.cmdheight = 1

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
--              Spelling and dictionary
-----------------------------------------------------------
vim.cmd([[
    set spell
    set spelllang=en_us
    "set spellfile = /usr/share/myspell/en_US.dic
]])
vim.cmd("set dictionary+=/usr/share/dict/words")
-----------------------------------------------------------
--              Cursor shape
-----------------------------------------------------------
-- cmd[[set guicursor=a:/iCursor-blinkon40-blinkoff40-blinkwait10]]   -- To change the  cursor options such as the size and blinking, not used at the moment
-- cmd[[set guicursor=i-ci:ver30-iCursor-blinkon40-blinkoff40-blinkwait10]]   -- To change the  cursor options such as the size and blinking
-- (a) means all modes, (i) insert, (v) visual model, and iCursor is different from blcokCurosr see (:h guicurosr)
-- cmd([[set guicursor=a:ver50-iCursor-blinkon40-blinkoff40-blinkwait10]]) -- To change the  cursor options such as the size and blinking,
cmd([[set guicursor=i:ver50-iCursor-blinkon40-blinkoff40-blinkwait10]]) -- To change the  cursor options such as the size and blinking,
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
-- Neovim Integration with tmux
-----------------------------------------------------------
vim.cmd([[
    :set t_Co=256
    :set termguicolors
]])

-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
opt.syntax = "enable" -- enable syntax highlighting
opt.number = true -- show line number
opt.showmatch = true -- highlight matching parenthesis
opt.foldmethod = "marker" -- enable folding (default 'foldmarker')
opt.colorcolumn = "120" -- line lenght marker at 80 columns
--vim.cmd([[hi ColorColumn ctermbg=0 guibg=lightgray]])
cmd([[highlight ColorColumn ctermbg=0 guibg=lightgrey]])
opt.splitright = true -- vertical split to the right
opt.splitbelow = true -- orizontal split to the bottom
opt.ignorecase = true -- ignore case letters when search
opt.smartcase = true -- ignore lowercase for the whole pattern

-- remove whitespace on save
cmd([[au BufWritePre * :%s/\s\+$//e]])

-- highlight on yank
exec([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
  augroup end
]], false)
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

-- Adding beautiful tab with icons , using akinsho/bufferline
vim.opt.termguicolors = true
-- require("bufferline").setup{}

-- Allow a tab in airline
--cmd([[let g:airline#extensions#tabline#enabled = 1]])

-- -- Changing the color of the highlighting of the searching word
-- vim.cmd([[set hlsearch
-- hi Search guibg=peru guifg=wheat
-- ]])
--
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
-- Show full path of current file at startup
--vim.cmd[[echo resolve(expand('%:p'))]]
-- Allow the vim to be transparent,
-- vim.cmd([[
-- autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE
-- au ColorScheme * hi Normal ctermbg=none guibg=none
-- autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE " transparent bg
-- au ColorScheme myspecialcolors hi Normal ctermbg=red guibg=red
-- ]])

-- vim.cmd([[ "au ColorScheme * hi Normal ctermbg=none guibg=none"]])
-- vim.cmd([[ "au ColorScheme * hi SignColumn ctermbg=none guibg=none"]])
-- vim.cmd([["au ColorScheme * hi NormalNC ctermbg=none guibg=none" ]])
-- vim.cmd([[ "au ColorScheme * hi MsgArea ctermbg=none guibg=none"]])
-- vim.cmd([["au ColorScheme * hi TelescopeBorder ctermbg=none guibg=none" ]])
-- vim.cmd([["au ColorScheme * hi NvimTreeNormal ctermbg=none guibg=none" ]])
-- vim.cmd([[ "let &fcs='eob: '"]])

-- Loading the options for the neovide terminal
if vim.g.neovide then
    --   vim.g.neovide_cursor_animation_length = 0.01
    --   vim.g.neovide_cursor_trail_length = 0.05
    --   vim.g.neovide_cursor_antialiasing = true
    --   vim.g.neovide_remember_window_size = true
    --   vim.cmd [[set guifont=JetBrainsMono\ Nerd\ Font:h16]]
    --
--    vim.api.nvim_exec([[
--  augroup Packer
--    autocmd!
--    autocmd BufRead init.lua PackerCompile
--  augroup end
--]], false)

    vim.cmd [[set guifont=VictorMono\ Nerd\ Font\:h17]]
    -- vim.cmd [[set guifont=JetBrainsMono\ Nerd\ Font:h12]]
    vim.g.neovide_refresh_rate = 60
    vim.g.neovide_cursor_vfx_mode = "railgun"
    vim.g.neovide_no_idle = true
    vim.g.neovide_cursor_animation_length = 0.03
    vim.g.neovide_cursor_trail_length = 0.05
    vim.g.neovide_cursor_antialiasing = true
    vim.g.neovide_cursor_vfx_opacity = 80.0
    vim.g.neovide_cursor_vfx_particle_lifetime = 1.2
    vim.g.neovide_cursor_vfx_particle_speed = 20.0
    vim.g.neovide_cursor_vfx_particle_density = 5.0
--    vim.cmd([[ "au ColorScheme * hi Normal ctermbg=none guibg=none"]])
--    vim.cmd([[ "au ColorScheme * hi SignColumn ctermbg=none guibg=none"]])
--    vim.cmd([["au ColorScheme * hi NormalNC ctermbg=none guibg=none" ]])
--    vim.cmd([[ "au ColorScheme * hi MsgArea ctermbg=none guibg=none"]])
--    vim.cmd([["au ColorScheme * hi TelescopeBorder ctermbg=none guibg=none" ]])
--    vim.cmd([["au ColorScheme * hi NvimTreeNormal ctermbg=none guibg=none" ]])
--    vim.cmd([[ "let &fcs='eob: '"]])
end
-- Before I used to source this directory to make neovide works
-- Configurations of the neovide
-- require("units.neovideConfig").neovide_config()

-----------------------------------------------------------
--          Glow for Markdown
-----------------------------------------------------------
vim.g.glow_border = "rounded"
vim.g.glow_width = 200
--vim.g.glow_use_pager = true
--vim.g.glow_style = "light"
-----------------------------------------------------------
--          Air Line Configurations
-----------------------------------------------------------
-- You will need (Airline installed, all the rest configurations are written in native vim)


-- vim.cmd([[
-- let w:airline_disable_statusline = 0
-- let g:airline_statusline_ontop = 0
-- let g:airline_section_c_only_filename = 1
-- let g:airline#extensions#battery#enabled = 1
-- let g:airline#extensions#ctrlp#show_adjacent_modes = 1
-- let g:airline#extensions#keymap#enabled = 1
-- ]])
--

-- vim.cmd([[
-- let g:airline#extensions#lsp#enabled = 1
-- let g:airline_stl_path_style = 'long'
--
-- if !exists('g:airline_symbols')
--   let g:airline_symbols = {}
-- endif
--
-- "set guifont=Monaco:h10
-- set guifont=VictorMono\ Nerd\ Font:h21
-- let g:airline_symbols.space = "\ua0"
-- " testing rounded separators (extra-powerline-symbols):
-- let g:airline_left_sep = "\ue0c6"
-- let g:airline_right_sep = "\ue0c7"
-- "let g:airline_section_z = airline#section#create(['windowswap', '%3p%% ', 'linenr', ':%2v'])
-- "let g:airline_section_z = airline#section#create(["\uE0A1" . '%{line(".")}' . "\uE0A3" . '%{col(".")}'])
-- let g:airline_skip_empty_sections = 1
--
-- ]])
--
-- vim.cmd([[
--   let g:airline_left_sep = ''
--   let g:airline_left_alt_sep = ''
--   let g:airline_right_sep = ''
--   let g:airline_right_alt_sep = ''
--   "let g:airline_symbols.branch = ''
--   let g:airline_symbols.branch = ''
--   let g:airline_symbols.colnr = ' :'
--   let g:airline_symbols.readonly = ''
--   let g:airline_symbols.linenr = ' :'
--   let g:airline_symbols.maxlinenr = ' ☰  '
--   "let g:airline_symbols.maxlinenr = ' '
--   let g:airline_symbols.dirty='⚡'
--   let g:airline_stl_path_style = 'long'
-- ]])
-- -- change sections
-- -- Reference:   https://stackoverflow.com/questions/10488717/how-can-i-permanently-display-the-path-of-the-current-file-in-vim
--               -- https://github.com/vim-airline/vim-airline/issues/235
-- vim.cmd([[
-- "set statusline +=%{resolve(expand('%:p'))}\ %*
-- "let g:airline_section_a += ''
-- let g:airline_section_a = airline#section#create(['  ','mode'])  "--   
-- "let g:airline_section_b = airline#section#create(['mode','hunks', 'branch'])
-- "let g:airline_section_a = 'b%n, w%{winnr()}%#__accent_bold#%{winnr()==winnr("#")?" [LW]":""}%#__restore__#'
-- let g:airline_section_c = '%<%F%m %#__accent_red#%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#'
-- ]])
--
--
--

