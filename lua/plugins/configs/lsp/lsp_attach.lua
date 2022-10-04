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
end

M.custom_attach = function(client, bufnr)

  if client.server_capabilities.document_highlight then
    --  vim.cmd [[
    --    hi! LspReferenceRead  cterm=bold ctermbg=235 guibg=LightYellow
    --    hi! LspReferenceText  cterm=bold ctermbg=235 guibg=LightYellow
    --    hi! LspReferenceWrite cterm=bold ctermbg=235 guibg=LightYellow
    --  ]]
    --  vim.api.nvim_create_augroup('lsp_document_highlight', {})
    --  vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
    --    group = 'lsp_document_highlight',
    --    buffer = 0,
    --    callback = vim.lsp.buf.document_highlight,
    --  })
    --  vim.api.nvim_create_autocmd('CursorMoved', {
    --    group = 'lsp_document_highlight',
    --    buffer = 0,
    --    callback = vim.lsp.buf.clear_references,
    --  })
    --
    vim.cmd([[
                hi LspReferenceRead cterm=bold ctermbg=black guibg=#FAFF7F
                hi LspReferenceText cterm=bold ctermbg=black guibg=#505050
                hi LspReferenceWrite cterm=bold ctermbg=black guibg=#E5989B
                augroup lsp_document_highlight
                autocmd! * <buffer>
                autocmd CursorHold  <buffer> lua vim.lsp.buf.document_highlight()
                autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
                augroup end
        ]])
    vim.cmd([[
                hi LspDiagnosticsVirtualTextError guifg=red gui=bold,italic,underline
                hi LspDiagnosticsVirtualTextWarning guifg=orange gui=bold,italic,underline
                hi LspDiagnosticsVirtualTextInformation guifg=yellow gui=bold,italic,underline
                hi LspDiagnosticsVirtualTextHint guifg=green gui=bold,italic,underline
        ]])
    vim.cmd([[
                hi DiagnosticLineNrError guibg=#51202A guifg=#FF0000 gui=bold
                hi DiagnosticLineNrWarn  guibg=#51412A guifg=#FFA500 gui=bold
                hi DiagnosticLineNrInfo  guibg=#1E535D guifg=#00FFFF gui=bold
                hi DiagnosticLineNrHint  guibg=#1E205D guifg=#0000FF gui=bold


                hi LspReferenceText cterm=bold gui=bold
                hi LspReferenceRead cterm=bold gui=bold
                hi LspReferenceWrite cterm=bold gui=bold
        ]])

  end

  -----------------------------------------------------------------------------------
  --          The above keymapping will be overwritten by lsp-saga
  -----------------------------------------------------------------------------------
  -- Allow saga to do its magic (show diagnostic on hover of the line with error)
  -- vim.api.nvim_command("autocmd CursorHold * Lspsaga show_line_diagnostics")
  -- require("plugins.configs.mySaga").conf()
  -----------------------------------------------------------------------------------
  --          							lsp signture with nvim
  -----------------------------------------------------------------------------------
  cfg = require("plugins.configs.mySignture")
  require "lsp_signature".on_attach(cfg, bufnr)


  if client.name == "tsserver" then
    -- client.resolved_capabilities.document_formatting = false  -- deperated since nvim 0.8
    client.server_capabilities.document_formatting = false
  end

  if client.name == "sumneko_lua" then
    client.server_capabilities.document_formatting = false
  end

  lsp_keymaps(bufnr)
  --   local status_ok, illuminate = pcall(require, "illuminate")
  --   if not status_ok then
  --     return
  --   end
  --   illuminate.on_attach(client)
end

return M
