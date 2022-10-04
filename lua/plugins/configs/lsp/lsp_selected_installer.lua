

local M = {}

M.installer = function()

  local lsp_installer = require("nvim-lsp-installer") -- This is very important variable
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
    "jsonls", -- JSON  language server
    "julials", -- julia language server
    "yamlls", -- YAML  language server
    "html", -- html language server
    "cssls", -- css language server
    "svelte", "dockerls", "graphql", "tailwindcss", "textlab", -- textlab language server for latex writing
    "rust_analyzer", -- Rust Language server
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
end


return M

