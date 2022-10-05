local M = {}

M.setup = function()

  ---- *****************************************************************************************
  ----                                Prerequisites settings supports
  ---- *****************************************************************************************
  -- Pre settings for Rust language servers
  local rust_tools_settings = require("plugins.configs.lsp.custom_servers.rust_analyzer_server")
  -- Configurations for the lsp, offers varities of settings for the diagnostics
  -- messages and Icons on the gutters. (custom the erro icons mainly)
  require("plugins.configs.lsp.lsp_settings").setup()

  ---- *****************************************************************************************
  ----                     Mason Loader (similar to nvim-lsp-installer)
  ---- *****************************************************************************************
  -- 1.) >> Main lsp Mason LSP <<
  require("mason").setup()

  -- 2.) >> Loading Mason lspconfig (mason-config) <<
  local mason_status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
  if not mason_status_ok then
    vim.notify("Couldn't load Mason-LSP-Config" .. mason_lspconfig, "error")
    return
  end

  -- Extension to bridge mason.nvim with the lspconfig plugin
  mason_lspconfig.setup({
    -- A list of servers to automatically install if they're not already installed.
    ensure_installed = { "pyright", "sumneko_lua", "rust_analyzer", "tsserver" }
  })
  -- 3.) >> Mason-tool-installer: installing speicific linterning and tools for specific lps.
  -- Tools for serers
  require("mason-tool-installer").setup {
    ensure_installed = { "codelldb", "stylua", "shfmt", "shellcheck", "black", "isort", "prettierd" },
    auto_update = false,
    run_on_start = true,
  }
  -- 4.) >> lspconfig main loader for the lsp
  local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
  if not lspconfig_status_ok then
    vim.notify("Couldn't load LSP-Config" .. lspconfig, "error")
    return
  end

-- ==========================================================================
-- =                                                                        =
-- =                                                                        =
-- =                                                                        =
-- =                         Main LSP Engine                                =
-- =                   Custom Language Server (CLS)                         =
-- =                                                                        =
-- =                                                                        =
-- =                                                                        =
-- ==========================================================================
-- Read more Here: https://github.com/williamboman/mason.nvim/discussions/92#discussioncomment-3173425

  local opts = {
    on_attach    = require("plugins.configs.lsp.lsp_attach").custom_attach,
    capabilities = require("plugins.configs.lsp.lsp_capabilities").capabilities,
    handlers     = require("plugins.configs.lsp.lsp_handlers").handlers
  }
  --
  mason_lspconfig.setup_handlers({
    -- The first entry (without a key) will be the default handler
    -- and will be called for each installed server that doesn't have
    -- a dedicated handler.
    function(server_name) -- Default handler (optional)
      lspconfig[server_name].setup {
        on_attach    = opts.on_attach,
        capabilities = opts.capabilities,
        handlers     = opts.handlers
      }
    end,
    ["sumneko_lua"] = function()

      local sumneko_settings = require "plugins.configs.lsp.custom_servers.sumneko_lua_server"
      opts = vim.tbl_deep_extend("force", sumneko_settings, opts)
      lspconfig.sumneko_lua.setup({
        on_attach    = opts.on_attach,
        capabilities = opts.capabilities,
        handlers     = opts.handlers,
        settings     = opts.settings
      })
    end,

    -- Next, you can provide targeted overrides for specific servers.
    --For example, a handler override for the `rust_analyzer`:
    ["rust_analyzer"] = function()
      require('rust-tools').setup({
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
    end,

    ["pyright"] = function()
      lspconfig.pyright.setup({
        on_attach    = opts.on_attach,
        capabilities = opts.capabilities,
        handlers     = opts.handlers,
        settings     = {
          python = {
            analysis = {
              -- Disable strict type checking
              typeCheckingMode = "off"
            }
          }
        },
      })
    end,
  })

end
return M
