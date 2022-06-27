-- ===================================================================================================================

--               ██████╗░███████╗██████╗░██╗░░░██╗░██████╗░░██████╗░██╗███╗░░██╗░██████╗░
--               ██╔══██╗██╔════╝██╔══██╗██║░░░██║██╔════╝░██╔════╝░██║████╗░██║██╔════╝░
--               ██║░░██║█████╗░░██████╦╝██║░░░██║██║░░██╗░██║░░██╗░██║██╔██╗██║██║░░██╗░
--               ██║░░██║██╔══╝░░██╔══██╗██║░░░██║██║░░╚██╗██║░░╚██╗██║██║╚████║██║░░╚██╗
--               ██████╔╝███████╗██████╦╝╚██████╔╝╚██████╔╝╚█████╔╝██║██║░╚███║╚██████╔╝
--               ╚═════╝░╚══════╝╚═════╝░░╚═════╝░░╚═════╝░░╚═════╝░╚═╝╚═╝░░╚══╝░╚═════╝░

--                        ███╗░░░███╗░█████╗░██████╗░██╗░░░██╗██╗░░░░░███████╗
--                        ████╗░████║██╔══██╗██╔══██╗██║░░░██║██║░░░░░██╔════╝
--                        ██╔████╔██║██║░░██║██║░░██║██║░░░██║██║░░░░░█████╗░░
--                        ██║╚██╔╝██║██║░░██║██║░░██║██║░░░██║██║░░░░░██╔══╝░░
--                        ██║░╚═╝░██║╚█████╔╝██████╔╝╚██████╔╝███████╗███████╗
--                        ╚═╝░░░░░╚═╝░╚════╝░╚═════╝░░╚═════╝░╚══════╝╚══════╝█
--
-- ===================================================================================================================

--                 █▀▄ █▀▀ █▄▄ █░█ █▀▀ █▀▀ █ █▄░█ █▀▀   █▄▀ █▀▀ █▄█   █▀▄▀█ ▄▀█ █▀█ █▀█ █ █▄░█ █▀▀
--                 █▄▀ ██▄ █▄█ █▄█ █▄█ █▄█ █ █░▀█ █▄█   █░█ ██▄ ░█░   █░▀░█ █▀█ █▀▀ █▀▀ █ █░▀█ █▄█
--
local map = require("core.utils").keymapping

map("n", "<leader>db", ':lua require"dap".toggle_breakpoint()<CR>')
map("n", "<leader>dB", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
-- ------------------------- Navigation ------------------
map("n", "<leader><F1>", ':lua require"dap".step_out()<CR>')
map("n", "<leader><F2>", ':lua require"dap".step_into()<CR>')
map("n", "<leader><F3>", ':lua require"dap".step_over()<CR>')
map("n", "<leader><F4>", ':lua require"dap".continue()<CR>')

map("n", "<leader>dn", ':lua require"dap".run_to_cursor()<CR>')
map("n", "<leader>dk", ':lua require"dap".up()<CR>')
map("n", "<leader>dj", ':lua require"dap".down()<CR>')
map("n", "<leader>dc", ':lua require"dap".terminate()<CR>')
map("n", "<leader>dr", ':lua require"dap".repl.toggle({}, "vsplit")<CR><C-w>l')
map("n", "<leader>de", ':lua require"dap".set_exception_breakpoints({"all"})<CR>')
map("n", "<leader>da", ':lua require"debugHelper".attach()<CR>')
map("n", "<leader>dA", ':lua require"debugHelper".attachToRemote()<CR>')
map("n", "<leader>di", ':lua require"dap.ui.widgets".hover()<CR>')
map("n", "<leader>d?", ':lua local widgets=require"dap.ui.widgets";widgets.centered_float(widgets.scopes)<CR>')

-- nvim-telescope/telescope-dap.nvim
require("telescope").load_extension("dap")
map("n", "<leader>df", ":Telescope dap frames<CR>")
-- map('n', '<leader>dc', ':Telescope dap commands<CR>')
map("n", "<leader>dt", ":Telescope dap list_breakpoints<CR>")

-- theHamsta/nvim-dap-virtual-text and mfussenegger/nvim-dap
require("nvim-dap-virtual-text").setup()

--                 █▀ █ █▀▀ █▄░█ █▀   █▀▀ █▀█ █▄░█ █▀▀ █ █▀▀ █░█ █▀█ ▄▀█ ▀█▀ █ █▀█ █▄░█
--                 ▄█ █ █▄█ █░▀█ ▄█   █▄▄ █▄█ █░▀█ █▀░ █ █▄█ █▄█ █▀▄ █▀█ ░█░ █ █▄█ █░▀█
--
-- nvim-dap uses five signs:
-- - `DapBreakpoint` which defaults to `B` for breakpoints
-- - `DapBreakpointCondition` which defaults to `C` for conditional breakpoints
-- - `DapLogPoint` which defaults to `L` and is for log-points
-- - `DapStopped` which defaults to `→` and is used to indicate the position where
--   the debugee is stopped.
-- - `DapBreakpointRejected`, defaults to `R` for breakpoints which the debug
--   adapter rejected.

local venv = os.getenv("VIRTUAL_ENV")
local dap = require("dap")
require("dap").set_log_level("INFO")
dap.defaults.fallback.terminal_win_cmd = "80vsplit new"

vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "red", linehl = "", numhl = "" })
--vim.fn.sign_define('DapBreakpoint', {text='', texthl='', linehl='', numhl=''})
vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "yellow", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "", texthl = "green", linehl = "", numhl = "" })
vim.fn.sign_define("DapLogPoint", { text = "", texthl = "blue", linehl = "", numhl = "" })

--         █▀█ █▄█ ▀█▀ █░█ █▀█ █▄░█   █░░ ▄▀█ █▄░█ █▀▀ █░█ ▄▀█ █▀▀ █▀▀   █▀▄ █▀▀ █▄▄ █░█ █▀▀ █▀▀ █▀▀ █▀█
--         █▀▀ ░█░ ░█░ █▀█ █▄█ █░▀█   █▄▄ █▀█ █░▀█ █▄█ █▄█ █▀█ █▄█ ██▄   █▄▀ ██▄ █▄█ █▄█ █▄█ █▄█ ██▄ █▀▄
--
-- PYTHON REQUIREMENTS: You  require to install a library called `Debugpy`
-- mkdir .virtualenvs
-- cd .virtualenvs
-- python -m venv debugpy
-- debugpy/bin/python -m pip install debugpy
dap.adapters.python = {
	type = "executable",
	-- Adding the current directory with the virtualenv that created with python
	--command = '/Users/ghasak.ibrahim/Desktop/DevTesting/debugpy/mydebugpyEnv/bin/python';
	command = vim.fn.getcwd() .. string.format("%s/bin/python", venv),
	args = { "-m", "debugpy.adapter" },
}

dap.configurations.python = {
	{
		-- The first three options are required by nvim-dap
		type = "python", -- the type here established the link to the adapter definition: `dap.adapters.python`
		request = "launch",
		name = "Launch file",

		-- Options below are for debugpy, see
		-- https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings
		-- for supported options

		program = "${file}", -- This configuration will launch the current file if used.
		pythonPath = function()
			-- debugpy supports launching an application with a different interpreter
			-- then the one used to launch debugpy itself. The code below looks for a
			-- `venv` or `.venv` folder in the current directly and uses the python
			-- within.
			-- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
			local env_path = string.format("%s/bin/python", venv)
			local cwd = vim.fn.getcwd()
			--if vim.fn.executable(cwd .. '/mydebugpyEnv/bin/python') == 1 then
			if vim.fn.executable(cwd .. env_path) == 1 then
				--return cwd .. '/mydebugpyEnv/bin/python'
				return cwd .. env_path
			elseif vim.fn.executable(cwd .. env_path) == 1 then
				return cwd .. env_path
			else
				return "~/opt/anaconda3/bin/python"
			end
		end,
	},
}


-- dap ui
require("dap-python").setup("/Users/ghasak.ibrahim/Desktop/DevTesting/debugpy/mydebugpyEnv/bin/python")

require("dapui").setup({
	icons = { expanded = "▾", collapsed = "▸" },
	mappings = {
		-- Use a table to apply multiple mappings
		expand = { "<CR>", "<2-LeftMouse>" },
		open = "o",
		remove = "d",
		edit = "e",
		repl = "r",
	},
	layouts = {
		-- You can change the order of elements in the sidebar
		elements = {
							{
											-- Provide as ID strings or tables with "id" and "size" keys
											{
												id = "scopes",
												size = 0.25, -- Can be float or integer > 1
											},
											{ id = "breakpoints", size = 0.25 },
											{ id = "stacks", size = 0.25 },
											{ id = "watches", size = 00.25 },
										},
										size = 40,
										position = "left", -- Can be "left", "right", "top", "bottom"
									},
						},
					  {
		elements = { "repl" },
		size = 10,
		position = "bottom", -- Can be "left", "right", "top", "bottom"
	},
	floating = {
		max_height = nil, -- These can be integers or a float between 0 and 1.
		max_width = nil, -- Floats will be treated as percentage of your screen.
		border = "single", -- Border style. Can be "single", "double" or "rounded"
		mappings = {
			close = { "q", "<Esc>" },
		},
	},
	windows = { indent = 1 },
})


