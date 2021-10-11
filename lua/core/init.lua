
local global = require 'core.global'
local vim = vim


local init_modules = {
	-- following options are the default
	"core.global",
	"core.event",
	"plugins.packerInit",
	"plugins.packerPlugins",
}

for _, module in ipairs(init_modules) do
	local ok, err = pcall(require, module)
	if not ok then
		error("Error in loading modules ...< " .. module .. " > " .. "\n\n" .. err)
	end
end

-- ===========================================================================
--                 Create Directories for Caching files
-- ===========================================================================a
local createdir = function()
	-- This function is used to create cache directories for our nvim sessionn
	local data_dir = {
		global.cache_dir .. 'backup', global.cache_dir .. 'session',
		global.cache_dir .. 'swap', global.cache_dir .. 'tags',
		global.cache_dir .. 'undo'
	}
	for key, dirx in pairs(data_dir) do
		if vim.fn.empty(vim.fn.glob(dirx)) > 0 then
			vim.api.nvim_command(([[echohl WarningMsg | echomsg "[-] The directory:%s is not existed, will be created ." | echohl None]]):format(dirx))
			os.execute("mkdir -p " .. dirx )
		end
	end
end


-- ===========================================================================
--                      Disable distribution plugins
-- ===========================================================================a

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



-- ===========================================================================
--                       Applying the theme
-- ===========================================================================a

local function theme_loader()
	local gruvbox_theme_dir = "/site/pack/packer/start/gruvbox"
	local gruvbox_material_theme_dir = "/site/pack/packer/start/gruvbox-material"
	local fn = vim.fn
	local install_path = fn.stdpath "data" .. gruvbox_material_theme_dir
	if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
		vim.api.nvim_command(([[echohl WarningMsg | echomsg "[-] The theme:%s is not existed, will be created ." | echohl None]]):format(install_path))
		print(install_path)
	else
		vim.cmd[[colorscheme gruvbox-material]] -- Others:  gruvbox-flat, onedark
		--vim.cmd[[colorscheme gruvbox]] -- Others:  gruvbox-flat, onedark
		vim.o.background = "dark" -- or "light" for light mode

	end
end

-- ===========================================================================
--                      Remove any white space on saving event
-- ===========================================================================

-- remove whitespace on save
vim.cmd[[au BufWritePre * :%s/\s\+$//e]]

-- ===========================================================================
--              Main Function to start all modules and plugins
-- ===========================================================================

local load_core = function()
    createdir()
    disable_distribution_plugins()
    theme_loader()
end

load_core()










