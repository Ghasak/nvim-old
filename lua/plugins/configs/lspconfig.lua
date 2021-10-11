if not packer_plugins["nvim-lspconfig"].loaded then
	vim.cmd([[packadd nvim-lspconfig]])
end

if not packer_plugins["lspsaga.nvim"].loaded then
	vim.cmd([[packadd lspsaga.nvim]])
end

if not packer_plugins["nvim-lspinstall"].loaded then
	vim.cmd([[packadd nvim-lspinstall]])
end

if not packer_plugins["lsp_signature.nvim"].loaded then
	vim.cmd([[packadd lsp_signature.nvim]])
end

local nvim_lsp = require("lspconfig")
local lsp_install = require("lspinstall")
local saga = require("lspsaga")
local capabilities = vim.lsp.protocol.make_client_capabilities()

-- saga.init_lsp_saga({code_action_icon = '💡'})

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
	properties = { "documentation", "detail", "additionalTextEdits" },
}

local function custom_attach()
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end
	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	-- Enable completion triggered by <c-x><c-o>
	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	local opts = { noremap = true, silent = true }
 -- Allow saga to do its magic (show diagnostic on hover of the line with error)
  --vim.api.nvim_command("autocmd CursorHold * Lspsaga show_line_diagnostics")
  require("plugins.configs.mysaga").conf()

  -- Native LSP with Lua
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	buf_set_keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
	buf_set_keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
	buf_set_keymap("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
	buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	buf_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	buf_set_keymap("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	--	buf_set_keymap("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
	buf_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
	buf_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
	--	buf_set_keymap("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
	buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
	require("lsp_signature").on_attach({
		bind = true,
		use_lspsaga = false,
		floating_window = true,
		fix_pos = true,
		hint_enable = true,
		hi_parameter = "Search",
		handler_opts = { "double" },
		hint_prefix = "      ", -- Panda for parameter
	})
end

local function switch_source_header_splitcmd(bufnr, splitcmd)
	bufnr = nvim_lsp.util.validate_bufnr(bufnr)
	local params = {
		uri = vim.uri_from_bufnr(bufnr),
	}
	vim.lsp.buf_request(bufnr, "textDocument/switchSourceHeader", params, function(err, _, result)
		if err then
			error(tostring(err))
		end
		if not result then
			print("Corresponding file can’t be determined")
			return
		end
		vim.api.nvim_command(splitcmd .. " " .. vim.uri_to_fname(result))
	end)
end

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

local function setup_servers()
	lsp_install.setup()
	local servers = lsp_install.installed_servers()
	for _, lsp in pairs(servers) do
		if lsp == "lua" then
			nvim_lsp[lsp].setup({
				capabilities = capabilities,
				flags = {
					debounce_text_changes = 500,
				},
				settings = {
					Lua = {
						runtime = {
							-- LuaJIT in the case of Neovim
							version = "LuaJIT",
							path = vim.split(package.path, ";"),
						},
						diagnostics = {
							globals = { "vim", "packer_plugins" },
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
				on_attach = custom_attach,
			})
		else
			nvim_lsp[lsp].setup({
				capabilities = capabilities,
				flags = {
					debounce_text_changes = 500,
				},
				on_attach = custom_attach,
			})
		end
	end
end

lsp_install.post_install_hook = function()
	setup_servers() -- reload installed servers
	vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end

setup_servers()

setup_cpp()

-- replace the default lsp diagnostic symbols
local function lspSymbol(name, icon)
	vim.fn.sign_define("LspDiagnosticsSign" .. name, {
		text = icon,
		numhl = "LspDiagnosticsDefaul" .. name,
	})
end

lspSymbol("Error", "")
lspSymbol("Information", "כֿ")
lspSymbol("Hint", "")
lspSymbol("Warning", "")

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	virtual_text = {
		-- prefix = "", -- "",
		spacing = 0,
		underline = false,
		update_in_insert = false,
		virtual_text = true,
	},
	signs = true,
	underline = true,
	update_in_insert = false, -- update diagnostics insert mode
})
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "rounded",
})
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	border = "rounded",
})

-- suppress error messages from lang servers
vim.notify = function(msg, log_level, _opts)
	if msg:match("exit code") then
		return
	end
	if log_level == vim.log.levels.ERROR then
		vim.api.nvim_err_writeln(msg)
	else
		vim.api.nvim_echo({ { msg } }, true, {})
	end
end

-- vim.cmd([[
--     " Errors in Red
--     hi LspDiagnosticsVirtualTextError guifg=Red ctermfg=Red
--     " Warnings in Yellow
--     hi LspDiagnosticsVirtualTextWarning guifg=Yellow ctermfg=Yellow
--     " Info and Hints in White
--     hi LspDiagnosticsVirtualTextInformation guifg=White ctermfg=White
--     hi LspDiagnosticsVirtualTextHint guifg=White ctermfg=White
--
--
--
--     autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()
-- ]])

-- Changing the color of the highlighting of the searching word (only this
-- location make this command work, conflicting with the tree-setter)
vim.cmd([[set hlsearch]])
vim.cmd([[hi Search term=reverse guibg=peru guifg=wheat]])

-- Language server for R
-- I have installed first the language server supprot for R language.
require("lspconfig").r_language_server.setup({
	cmd = { "R", "--slave", "-e", "languageserver::run()" },
})
