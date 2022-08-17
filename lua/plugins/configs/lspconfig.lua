----------------------------------------------------------------------------------------------------------------------
-- ██╗░░░░░░█████╗░███╗░░██╗░██████╗░██╗░░░██╗░█████╗░░██████╗░███████╗  ░██████╗███████╗██████╗░██╗░░░██╗███████╗██████╗░
-- ██║░░░░░██╔══██╗████╗░██║██╔════╝░██║░░░██║██╔══██╗██╔════╝░██╔════╝  ██╔════╝██╔════╝██╔══██╗██║░░░██║██╔════╝██╔══██╗
-- ██║░░░░░███████║██╔██╗██║██║░░██╗░██║░░░██║███████║██║░░██╗░█████╗░░  ╚█████╗░█████╗░░██████╔╝╚██╗░██╔╝█████╗░░██████╔╝
-- ██║░░░░░██╔══██║██║╚████║██║░░╚██╗██║░░░██║██╔══██║██║░░╚██╗██╔══╝░░  ░╚═══██╗██╔══╝░░██╔══██╗░╚████╔╝░██╔══╝░░██╔══██╗
-- ███████╗██║░░██║██║░╚███║╚██████╔╝╚██████╔╝██║░░██║╚██████╔╝███████╗  ██████╔╝███████╗██║░░██║░░╚██╔╝░░███████╗██║░░██║
-- ╚══════╝╚═╝░░╚═╝╚═╝░░╚══╝░╚═════╝░░╚═════╝░╚═╝░░╚═╝░╚═════╝░╚══════╝  ╚═════╝░╚══════╝╚═╝░░╚═╝░░░╚═╝░░░╚══════╝╚═╝░░╚═╝
--
--                  ██████╗░██████╗░░█████╗░████████╗░█████╗░░█████╗░░█████╗░██╗░░░░░░██████╗  ░░░░░░
--                  ██╔══██╗██╔══██╗██╔══██╗╚══██╔══╝██╔══██╗██╔══██╗██╔══██╗██║░░░░░██╔════╝  ░░░░░░
--                  ██████╔╝██████╔╝██║░░██║░░░██║░░░██║░░██║██║░░╚═╝██║░░██║██║░░░░░╚█████╗░  █████╗
--                  ██╔═══╝░██╔══██╗██║░░██║░░░██║░░░██║░░██║██║░░██╗██║░░██║██║░░░░░░╚═══██╗  ╚════╝
--                  ██║░░░░░██║░░██║╚█████╔╝░░░██║░░░╚█████╔╝╚█████╔╝╚█████╔╝███████╗██████╔╝  ░░░░░░
--                  ╚═╝░░░░░╚═╝░░╚═╝░╚════╝░░░░╚═╝░░░░╚════╝░░╚════╝░░╚════╝░╚══════╝╚═════╝░  ░░░░░░
--
--                            ░█████╗░░█████╗░███╗░░██╗███████╗██╗░██████╗░░██████╗
--                            ██╔══██╗██╔══██╗████╗░██║██╔════╝██║██╔════╝░██╔════╝
--                            ██║░░╚═╝██║░░██║██╔██╗██║█████╗░░██║██║░░██╗░╚█████╗░
--                            ██║░░██╗██║░░██║██║╚████║██╔══╝░░██║██║░░╚██╗░╚═══██╗
--                            ╚█████╔╝╚█████╔╝██║░╚███║██║░░░░░██║╚██████╔╝██████╔╝
--                            ░╚════╝░░╚════╝░╚═╝░░╚══╝╚═╝░░░░░╚═╝░╚═════╝░╚═════╝░
-- --
-- ===========================================================================
--  0.      Checking all the necessary loaded libraries for LSP
-- ===========================================================================
if not packer_plugins["nvim-lsp-installer"].loaded then
	vim.cmd([[packadd nvim-lsp-installer]]) -- lspInstaller Deprecated
end

if not packer_plugins["nvim-lspconfig"].loaded then
	vim.cmd([[packadd nvim-lspconfig]])
end

if not packer_plugins["lspsaga.nvim"].loaded then
	vim.cmd([[packadd lspsaga.nvim]])
end

if not packer_plugins["lsp_signature.nvim"].loaded then
	vim.cmd([[packadd lsp_signature.nvim]])
end

local saga = require("lspsaga")
local nvim_lsp = require("lspconfig")
local lsp_installer = require("nvim-lsp-installer") -- This is very important variable
local capabilities = vim.lsp.protocol.make_client_capabilities()

-- ===========================================================================
--  1.                Custom attach for the langauge server
-- ===========================================================================
-- Check :
-- 1. https://github.com/neovim/nvim-lspconfig/tree/feat/tcp-support
-- 2. http://118.127.101.89/ashleyis/dotfiles/src/branch/master/private_dot_config/nvim/lua/config/lsp.lua
-- 3. https://github.com/neovim/nvim-lspconfig/issues/836
-- 4. [Still many things to be investigated] https://github.com/LunarVim/Neovim-from-scratch/tree/06-LSP/lua/user/lsp
-- Adding the gps for the language server
local navic = require("nvim-navic")
vim.g.navic_silence = true

local function custom_attach(client, bufnr)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
		navic.attach(client, bufnr) -- gps utility
	end
	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
		navic.attach(client, bufnr) -- gps utility
	end

	-- Enable completion triggered by <c-x><c-o>
	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	local opts = {
		noremap = true,
		silent = true,
	}

	-- Native LSP with Lua
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	buf_set_keymap("n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	--	buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	buf_set_keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
	buf_set_keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
	buf_set_keymap("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
	buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	buf_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	buf_set_keymap("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	buf_set_keymap("n", "gy", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	--	buf_set_keymap("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
	buf_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
	buf_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
	--	buf_set_keymap("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
	buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
	-----------------------------------------------------------------------------------
	--          The above keymapping will be overwritten by lsp-saga
	-----------------------------------------------------------------------------------
	-- Allow saga to do its magic (show diagnostic on hover of the line with error)
	-- vim.api.nvim_command("autocmd CursorHold * Lspsaga show_line_diagnostics")
	require("plugins.configs.mysaga").conf()
	-----------------------------------------------------------------------------------
	--          							lsp signture with nvim
	-----------------------------------------------------------------------------------
	require("lsp_signature").on_attach({
		navic.attach(client, bufnr), -- gps utility,
		bind = true,
		use_lspsaga = false,
		floating_window = true,
		fix_pos = true,
		hint_enable = true,
		hi_parameter = "LspSignatureActiveParameter", -- how your parameter will be highlight
		hint_prefix = "      ", -- Panda for parameter
		-- hi_parameter = "Search",
		-- handler_opts = { "double" },
		handler_opts = {
			border = "rounded",
		}, -- double, rounded, single, shadow, none},
		shadow_blend = 36, -- if you using shadow as border use this set the opacity
		shadow_guibg = "Black", -- if you using shadow as border use this set the color e.g. 'Green' or '#121315'
		auto_close_after = 100, -- autoclose signature float win after x sec, disabled if nil.
		timer_interval = 100, -- default timer check interval set to lower value if you want to reduce latency
	})
	-- Set some keybinds conditional on server capabilities
	if client.resolved_capabilities.document_formatting then
		buf_set_keymap("n", "ff", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
	elseif client.resolved_capabilities.document_range_formatting then
		buf_set_keymap("n", "ff", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
	end

	-----------------------------------------------------------------------------------
	--             This will highlight the soope and words instances in the code
	--             with color white, I put it here  to be compatable only with
	--             the  language server that support such highlight, right now
	--             javascript, R, and SQL are not supported
	-----------------------------------------------------------------------------------
	-- Set autocommands conditional on server_capabilities
	-- check :
	-- https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization#change-diagnostic-symbols-in-the-sign-column-gutter
	-- passing here a HEX color for light gray assume the terminal supports termguicolors
	-- Read about color scheme here:
	-- https://vi.stackexchange.com/questions/9754/how-to-change-vim-background-color-in-hex-code-or-rgb-color-code

	if client.resolved_capabilities.document_highlight then
		-- gray color =>  #505050
		vim.cmd([[
			      hi LspReferenceRead cterm=bold ctermbg=black guibg=#FAFF7F
			      hi LspReferenceText cterm=bold ctermbg=black guibg=#505050
			      hi LspReferenceWrite cterm=bold ctermbg=black guibg=#E5989B
			      augroup lsp_document_highlight
				autocmd! * <buffer>
				autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
				autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
			      augroup end
			]])
	end
end

-- ===========================================================================
--   2.                Specified Language server Installer
-- ===========================================================================
-- You can specify any language server protocol a head in the given  list , or
-- simply using `LspInstallor` to get the specified installed language server.

local servers = {
	"bashls", -- Bash script language server.
	"pyright", -- Microsoft python language server.
	"tsserver", -- javascript language server.
	"emmet_ls", -- Emmet Language server with JS
	"sumneko_lua", -- Lua Language server
	"ltex", -- LaTeX  Language server for using latext with neovim
	"rust_analyzer", -- Rust Language server
	"jsonls", -- JSON  language server
	"julials", -- julia language server
	"yamlls", -- YAML  language server
	"html", -- html language server
	"cssls", -- css language server
	-- "ls_emmet",
	"svelte",
	"dockerls",
	"graphql",
	"tailwindcss",
	"textlab", -- textlab language server for latex writing
	-- "ansiblels",
}

for _, name in pairs(servers) do
	local server_is_found, server = lsp_installer.get_server(name)
	if server_is_found then
		if not server:is_installed() then
			-- Show a warning message to the installed language server form the above list
			vim.api.nvim_command(
				(
					[[echohl WarningMsg | echomsg "[-] The language server:%s is not existed, will be created ... " | echohl None]]
				):format(name)
			)
			server:install()
		end
	end
end

-- ===========================================================================
--    3.                 Handler for the language server
-- ===========================================================================

local border = {
	{ "╭", "FloatBorder" },
	{ "─", "FloatBorder" },
	{ "╮", "FloatBorder" },
	{ "│", "FloatBorder" },
	{ "╯", "FloatBorder" },
	{ "─", "FloatBorder" },
	{ "╰", "FloatBorder" },
	{ "│", "FloatBorder" },
}

-- LSP settings (for overriding per client)
local handlers = {
	["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = border,
	}),
	["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = border,
	}),
}

-- ===========================================================================
--     4.                Capabilities for the language server
-- ===========================================================================

capabilities.textDocument.completion.completionItem.documentationFormat = {
	"markdown",
	"plaintext",
}
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.preselectSupport = true
capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
capabilities.textDocument.completion.completionItem.deprecatedSupport = true
capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
capabilities.textDocument.completion.completionItem.tagSupport = {
	valueSet = { 1 },
}
capabilities.textDocument.completion.completionItem.resolveSupport = {
	properties = { "documentatin", "detail", "additionalTextEdits" },
}
--capabilities.offsetEncoding = {'utf-8', 'utf-16'}
capabilities.offsetEncoding = 'utf-8'

-- ===========================================================================
--      5.       Core Server loading with handler and capabilities
-- Heavly Modified based on https://github.com/williamboman/nvim-lsp-installer
-- ===========================================================================
-- Put all costom_attach, server loading, handler and capabilities  all together for each given server.
lsp_installer.on_server_ready(function(server)
	-- Options for the given
	local opts = {
		handlers = handlers,
		on_attach = custom_attach,
		capabilities = capabilities,
		flags = {
			debounce_text_changes = 150,
		},
	}
	-- Special case for the language server Lua -> sumenko_lua
	if server.name == "sumneko_lua" then
		opts = {
			handlers = handlers,
			on_attach = custom_attach,
			capabilities = capabilities,
			-- cmd = {"somewhere/bin/Linux/lua-language-server", "-E", "somewhere/main.lua"},
			flags = {
				debounce_text_changes = 150,
			},
			settings = {
				Lua = {
					runtime = {
						-- LuaJIT inn the case of Neovim
						version = "LuaJIT",
						path = vim.split(package.path, ";"),
					},
					diagnostics = {
						globals = { "vim", "use" },
					},
					workspace = {
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
						},
						maxPreload = 100000,
						preloadFileSize = 10000,
					},
					telemetry = {
						enable = false,
					},
				},
			},
		}
	end
	-- Here were the installation happen to each sever which is ready to be
	-- luanched with the specified, handlers, capababilities, custom_attach.
	server:setup(opts)
end)

-- ===========================================================================
--                   Custom Language Server (CLS)
-- ===========================================================================
-- These are the language servers for programming language not shown in the
-- above list.
-- Language server for R
-- I have installed first the language server supprot for R language.
require("lspconfig").r_language_server.setup({
	cmd = { "R", "--slave", "-e", "languageserver::run()" },
	handlers = handlers,
	on_attach = custom_attach,
	capabilities = capabilities,
})
-- Adding sql language server
-- Insure you installed first the sql-language serer with (npm i -g sql-language-server)
-- To know the location of the sql-language-server use (type, or which command)
require("lspconfig").sqlls.setup({
	cmd = { "/usr/local/bin/sql-language-server", "up", "--method", "stdio" },
	on_attach = custom_attach,
	handlers = handlers,
	filetypes = { "sql", "mysql" },
})

local function setup_cpp()
	nvim_lsp.clangd.setup({
		capabilities = capabilities,
		flags = {
			debounce_text_changes = 500,
		},
		on_attach = custom_attach,
		commands = {
			ClangdSwitchSourceHeader = {
				function()
					switch_source_header_splitcmd(0, "edit")
				end,
				description = "Open source/header in current buffer",
			},
			ClangdSwitchSourceHeaderVSplit = {
				function()
					switch_source_header_splitcmd(0, "vsplit")
				end,
				description = "Open source/header in a new vsplit",
			},
			ClangdSwitchSourceHeaderSplit = {
				function()
					switch_source_header_splitcmd(0, "split")
				end,
				description = "Open source/header in a new split",
			},
		},
	})
end

local function setup_textlab()
	nvim_lsp.texlab.setup({
		on_attach = custom_attach,
		handlers = handlers,
		settings = {
			latex = {
				rootDirectory = ".",
				build = {
					args = {
						"-pdf",
						"-interaction=nonstopmode",
						"-synctex=1",
						"-pvc",
					},
					forwardSearchAfter = true,
					onSave = true,
				},
				forwardSearch = {
					executable = "zathura",
					args = { "--synctex-forward", "%l:1:%f", "%p" },
					onSave = true,
				},
			},
		},
	})
end

-- julia language server
require("lspconfig").julials.setup({
	on_attach = custom_attach,
	capabilities = capabilities,
	settings = {
		filetypes = { "julia" },
		handlers = handlers,
		single_file_support = true,
		cmd = {
			"julia",
			"--startup-file=no",
			"--history-file=no",
			"-e",
			'    # Load LanguageServer.jl: attempt to load from ~/.julia/environments/nvim-lspconfig\n    # with the regular load path as a fallback\n    ls_install_path = joinpath(\n        get(DEPOT_PATH, 1, joinpath(homedir(), ".julia")),\n        "environments", "nvim-lspconfig"\n    )\n    pushfirst!(LOAD_PATH, ls_install_path)\n    using LanguageServer\n    popfirst!(LOAD_PATH)\n    depot_path = get(ENV, "JULIA_DEPOT_PATH", "")\n    project_path = let\n        dirname(something(\n            ## 1. Finds an explicitly set project (JULIA_PROJECT)\n            Base.load_path_expand((\n                p = get(ENV, "JULIA_PROJECT", nothing);\n                p === nothing ? nothing : isempty(p) ? nothing : p\n            )),\n            ## 2. Look for a Project.toml file in the current working directory,\n            ##    or parent directories, with $HOME as an upper boundary\n            Base.current_project(),\n            ## 3. First entry in the load path\n            get(Base.load_path(), 1, nothing),\n            ## 4. Fallback to default global environment,\n            ##    this is more or less unreachable\n            Base.load_path_expand("@v#.#"),\n        ))\n    end\n    @info "Running language server" VERSION pwd() project_path depot_path\n    server = LanguageServer.LanguageServerInstance(stdin, stdout, project_path, depot_path)\n    server.runlinter = true\n    run(server)\n  ',
		},
	},
})

-----  call the special servers -------
-- For CPP language server
setup_cpp()
-- For Latex language server better than latex, support to complie your markdonw file to pdf with zathura
-- setup_textlab() --- you need to install the  server on your machine check:
-- https://github.com/latex-lsp/texlab, also you will need Zathura compiled on
-- your machine, also check :
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md of texlab lsp
-- ===========================================================================
--                    LSP Deep configurations
-- ===========================================================================
-- For more details check:
-- https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization#change-diagnostic-symbols-in-the-sign-column-gutter
-- ================= Change the lsp icons gutter of diagnostics ==============
-- Change the icons of the gutter of the diagnostics based on the neovim diagonsitc built-in APIs.
local signs = {
	Error = "",
	Information = "כֿ",
	Hint = "",
	Warn = "",
}
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, {
		text = icon,
		texthl = hl,
		numhl = hl,
	})
end

-- =================  Customizing how diagnostics are displayed ==============

vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = false,
})

-- =================  Show source in diagnostics ==============

vim.diagnostic.config({
	virtual_text = {
		source = "always", -- Or "if_many"
	},
	float = {
		source = "always", -- Or "if_many"
	},
})

-- ================== Change prefix/character preceding the diagnostics' virtual text ==================

vim.diagnostic.config({
	virtual_text = {
		prefix = "■", -- Could be '●', '▎', 'x'
	},
})

-- ================== Highlight line number instead of having icons in sign column ==================
vim.cmd([[
  highlight DiagnosticLineNrError guibg=#51202A guifg=#FF0000 gui=bold
  highlight DiagnosticLineNrWarn  guibg=#51412A guifg=#FFA500 gui=bold
  highlight DiagnosticLineNrInfo  guibg=#1E535D guifg=#00FFFF gui=bold
  highlight DiagnosticLineNrHint  guibg=#1E205D guifg=#0000FF gui=bold
]])

-- ================== Highlight symbols with (/) search command event ========================

-- Setting for the multi-instance searching with /
vim.cmd([[set hlsearch]])
vim.cmd([[hi Search term=reverse guibg=peru guifg=wheat]])

-- suppress error messages from lang servers
vim.notify = function(msg, log_level, _opts)
    if msg:match("exit code") then
        return
    end
    if log_level == vim.log.levels.ERROR then
        vim.api.nvim_err_writeln(msg)
    else
        vim.api.nvim_echo({{msg}}, true, {})
    end
end





