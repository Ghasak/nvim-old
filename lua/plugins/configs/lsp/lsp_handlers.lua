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
  ['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = false,
--    virtual_text = {
--      prefix = '',
--      indent = 2,
--      format = function(diagnostic) return string.format('       // %s', diagnostic.message) end,
--    },
    signs = true,
    severity_sort = true,
  }),
  ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover,
    { border = border }),
  ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers
    .signature_help,
    { border = border }),
}

return M
