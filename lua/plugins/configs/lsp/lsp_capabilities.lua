local M = {}
-- ===========================================================================
--     4.                Capabilities for the language server
-- ===========================================================================
--
--
local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_cmp_ok then
  return
end



M.capabilities = vim.lsp.protocol.make_client_capabilities()

M.capabilities.textDocument.completion.completionItem.documentationFormat = {
  "markdown", "plaintext"
}
M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities.textDocument.completion.completionItem.preselectSupport = true
M.capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
M.capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
M.capabilities.textDocument.completion.completionItem.deprecatedSupport = true
M.capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
M.capabilities.textDocument.completion.completionItem.tagSupport = {
  valueSet = { 1 }
}
M.capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = { "documentatin", "detail", "additionalTextEdits" }
}
-- capabilities.offsetEncoding = {'utf-8', 'utf-16'}
M.capabilities.offsetEncoding = "utf-8"
M.capabilities = cmp_nvim_lsp.update_capabilities(M.capabilities)

return M
