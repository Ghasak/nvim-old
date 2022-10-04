local custom_attach = require("plugins.configs.lsp.lsp_attach").custom_attach
local capabilities  = require("plugins.configs.lsp.lsp_capabilities")
local handlers      = require("plugins.configs.lsp.lsp_handlers")

local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  local msg = "failed loading: " .. "nvim-lsp-installer" .. "\n "
  -- vim.notify(msg, "error")
  vim.notify("nvim-lsp-installer is not loaded ...")
  return
end

-- LSP installer (defined list of langauge servers to be installed if missing at startup)
-- nvim-lsp-installer to be installed and loaded.
--local server_installer = require("plugins.configs.lsp.lsp_selected_installer")
--server_installer.installer()


local servers = {
  "bashls", -- Bash script language server.
  "pyright", -- Microsoft python language server.
  "tsserver", -- javascript language server.
  "emmet_ls", -- Emmet Language server with JS
  "sumneko_lua", -- Lua Language server
  "ltex", -- LaTeX  Language server for using latext with neovim
  "jsonls", -- JSON  language server
  "julials", -- julia language server
  "yamlls", -- YAML  language server
  "html", -- html language server
  "cssls", -- css language server
  "svelte", "dockerls", "graphql", "tailwindcss", "textlab", -- textlab language server for latex writing
  "rust_analyzer", -- Rust Language server
  "clangd",
  -- "ls_emmet",
  -- "ansiblels",
}

for _, name in pairs(servers) do
  local server_is_found, server = lsp_installer.get_server(name)
  if server_is_found then
    if not server:is_installed() then
      -- Show a warning message to the installed language server form the above list
      -- vim.api.nvim_command(
      --     ([[echohl WarningMsg | echomsg "[-] The language server:%s is not existed, will be created ... " | echohl None]]):format(
      --         name))
      vim.notify_once(string.format("Installation in progress for [%s]", name), vim.log.levels.INFO)
      server:install()
    end
  end
end


--
-- Configurations for the lsp, offers varies of settings for the diagnostics
-- messages and Icons.
require("plugins.configs.lsp.lsp_settings").setup()

-- *****************************************************************************************
--                                 Main LSP Engine
-- *****************************************************************************************
lsp_installer.on_server_ready(function(server)
  local opts = {
    capabilities = capabilities,
    handlers = handlers,
    on_attach = custom_attach,
    -- flags = { debounce_text_changes = 150 }
  }

  if server.name == "sumneko_lua" then
    local sumneko_settings = require "plugins.configs.lsp.custom_servers.sumneko_lua_server"
    opts = {
      capabilities = capabilities,
      handlers = handlers,
      on_attach = custom_attach,

    }
    opts = vim.tbl_deep_extend("force", sumneko_settings, opts)

  end

  if server.name == "rust_analyzer" then
    -- We will skip the default for now and we will define this server later in the custom servers.
    local rust_tools_settings = require("plugins.configs.lsp.custom_servers.rust_analyzer_server")
    require("rust-tools").setup({
      tools = {
        on_initialized = function()
          vim.cmd [[
            autocmd BufEnter,CursorHold,InsertLeave,BufWritePost *.rs silent! lua vim.lsp.codelens.refresh()
          ]]
        end,
      },
      server = {
        on_attach = custom_attach,
        handlers = handlers,
        --capabilities = capabilities,  -- doesn't work with Rust
        rust_tools_settings
      }

    })
    goto continue
  end

  server:setup(opts)
  ::continue::
end)
