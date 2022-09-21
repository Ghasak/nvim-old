

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

-- ===========================================================================
--                      Leader map function
-- ===========================================================================a
local leader_map = function()
	vim.g.mapleader = " "
end

disable_distribution_plugins() 
leader_map()









local load_module =  function(mod_name)
    local ok, err = pcall(require, mod_name)
    if not ok then
        local msg = "failed loading: " .. mod_name .. "\n " .. err
        vim.notify(msg, "error")
    end
end


local init_modules = {
	"plugins"
} for _, module in ipairs(init_modules) do load_module(module) end








-- autocmd! remove all autocommands, if entered under a group it will clear that group
--vim.cmd [[
--  augroup _general_settings
--    autocmd!
--    autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR> 
--    autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Search', timeout = 200}) 
--    autocmd BufWinEnter * :set formatoptions-=cro
--    autocmd FileType qf set nobuflisted
--  augroup end
--  ]]



