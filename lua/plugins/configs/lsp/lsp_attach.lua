local M = {}

local function lsp_keymaps(bufnr)
  local opts = { noremap = true, silent = true }
  local keymap = vim.api.nvim_buf_set_keymap
  keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  keymap(bufnr, "n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  keymap(bufnr, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
  keymap(bufnr, "n", "<leader>lf", "<cmd>lua vim.lsp.buf.format()<cr>", opts)
  keymap(bufnr, "n", "<leader>li", "<cmd>LspInfo<cr>", opts)
  keymap(bufnr, "n", "<leader>lI", "<cmd>LspInstallInfo<cr>", opts)
  keymap(bufnr, "n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
  keymap(bufnr, "n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", opts)
  keymap(bufnr, "n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", opts)
  keymap(bufnr, "n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
  keymap(bufnr, "n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  keymap(bufnr, "n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
  -- Enable completion triggered by <c-x><c-o>
end

M.custom_attach = function(client, bufnr)
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  lsp_keymaps(bufnr)
  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

  -- This will add an error message in rounded popmenu to show the error which is same as the virtual-text.
  -- Read More Here : https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization
  -- Also Read: https://jdhao.github.io/2022/10/05/nvim-v08-release/
  vim.api.nvim_create_autocmd("CursorHold", {
    buffer = bufnr,
    callback = function()
      local opts = {
        focusable = false,
        close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
        border = 'rounded',
        source = 'always',
        prefix = ' ',
        scope = 'cursor',
      }
      vim.diagnostic.open_float(nil, opts)
    end
  })
  if client.server_capabilities.documentHighlightProvider then -- Since Nvim v.0.8
    vim.cmd [[
          hi LspReferenceRead cterm=bold ctermbg=black guibg=#FAFF7F
          hi LspReferenceText cterm=bold ctermbg=black guibg=#505050
          hi LspReferenceWrite cterm=bold ctermbg=black guibg=#E5989B
 ]]
    vim.api.nvim_create_augroup('lsp_document_highlight', {
      clear = false
    })
    vim.api.nvim_clear_autocmds({
      buffer = bufnr,
      group = 'lsp_document_highlight',
    })
    vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
      group = 'lsp_document_highlight',
      buffer = bufnr,
      callback = vim.lsp.buf.document_highlight,
    })
    vim.api.nvim_create_autocmd('CursorMoved', {
      group = 'lsp_document_highlight',
      buffer = bufnr,
      callback = vim.lsp.buf.clear_references,
    })
  end
  vim.cmd [[
 highlight! DiagnosticLineNrError guibg=#51202A guifg=#FF0000 gui=bold
 highlight! DiagnosticLineNrWarn guibg=#51412A guifg=#FFA500 gui=bold
 highlight! DiagnosticLineNrInfo guibg=#1E535D guifg=#00FFFF gui=bold
 highlight! DiagnosticLineNrHint guibg=#1E205D guifg=#0000FF gui=bold

"" sign define DiagnosticSignError text= texthl=DiagnosticSignError linehl= numhl=DiagnosticLineNrError
"" sign define DiagnosticSignWarn text= texthl=DiagnosticSignWarn linehl= numhl=DiagnosticLineNrWarn
"" sign define DiagnosticSignInfo text= texthl=DiagnosticSignInfo linehl= numhl=DiagnosticLineNrInfo
"" sign define DiagnosticSignHint text= texthl=DiagnosticSignHint linehl= numhl=DiagnosticLineNrHint
]]
  -----------------------------------------------------------------------------------
  --          The above keymapping will be overwritten by lsp-saga
  -----------------------------------------------------------------------------------
  -- Allow saga to do its magic (show diagnostic on hover of the line with error)
  -- vim.api.nvim_command("autocmd CursorHold * Lspsaga show_line_diagnostics")
  -- require("plugins.configs.mySaga").conf()
  -----------------------------------------------------------------------------------
  --          							lsp signture with nvim
  -----------------------------------------------------------------------------------
  local cfg = require("plugins.configs.mySignture")
  require "lsp_signature".on_attach(cfg, bufnr)

  if client.name == "tsserver" then
    -- client.resolved_capabilities.document_formatting = false  -- deperated since nvim 0.8
    client.server_capabilities.document_formatting = false
  end

  if client.name == "sumneko_lua" then
    client.server_capabilities.document_formatting = true
  end

  --   local status_ok, illuminate = pcall(require, "illuminate")
  --   if not status_ok then
  --     return
  --   end
  --   illuminate.on_attach(client)
end

return M
