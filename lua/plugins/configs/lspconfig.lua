local custom_attach = require("plugins.configs.lsp.lsp_attach").custom_attach
local capabilities  = require("plugins.configs.lsp.lsp_capabilities")
local handlers      = require("plugins.configs.lsp.lsp_handlers")
local installer     = require("plugins.configs.lsp.lsp_selected_installer")
local lsp_installer = require("nvim-lsp-installer") -- This is very important variable



require("plugins.configs.lsp.lsp_settings").setup()


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

  -- local rust_tools_settings = require("plugins.configs.lsp.custom_servers.rust_analyzer_server")
  -- -- We will skip the default for now and we will define this server later in the custom servers.
  -- require("rust-tools").setup {
  --   tools = {
  --     on_initialized = function()
  --       vim.cmd [[
  --         autocmd BufEnter,CursorHold,InsertLeave,BufWritePost *.rs silent! lua vim.lsp.codelens.refresh()
  --       ]]
  --     end,
  --   },
  --   server = {
  --     on_attach = custom_attach,
  --     handlers = handlers,
  --     capabilities = capabilities, -- doesn't work with Rust
  --     rust_tools_settings
  --   },
  -- }
  --
  --

  if server.name == "rust_analyzer" then
    -- We will skip the default for now and we will define this server later in the custom servers.
    require("rust-tools").setup {
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
        settings = {

          ["rust-analyzer"] = {
            imports = {
              granularity = {
                group = "module",
              },
              prefix = "self",
            },
            cargo = {
              buildScripts = {
                enable = true,
              },
            },
            procMacro = {
              enable = true
            },

            lens = {
              enable = true,
            },
            checkOnSave = {
              command = "clippy",
            },
          },
        },
      },
    }
    goto continue
  end

  server:setup(opts)
  ::continue::
end)
