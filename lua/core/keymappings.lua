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
vim.api.nvim_set_keymap('n', '<leader>p',"<cmd>lua require('fzf-lua').files()<CR>",{ noremap = true, silent = true })


