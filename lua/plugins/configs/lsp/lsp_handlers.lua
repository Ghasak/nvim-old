local M = {}

-- ===========================================================================
--    3.                 Handler for the language server
-- ===========================================================================

border = {
  { "╭", "FloatBorder" }, { "─", "FloatBorder" }, { "╮", "FloatBorder" },
  { "│", "FloatBorder" }, { "╯", "FloatBorder" }, { "─", "FloatBorder" },
  { "╰", "FloatBorder" }, { "│", "FloatBorder" }
}

-- LSP settings (for overriding per client)
M.handlers = {
  ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover,
    { border = border }),
  ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers
    .signature_help,
    { border = border })
}


return M
