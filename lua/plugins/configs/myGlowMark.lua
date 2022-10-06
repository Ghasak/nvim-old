local M = {}

M.setup = function()
  require('glow').setup({
    vim.api.nvim_set_keymap('n', '<leader>m', ':Glow<CR>', { noremap = true, silent = true }),
    glow_binary_path = "~/.local/bin",
    glow_style = "dark",
    glow_use_pager = false,
    glow_width = 80,
    glow_border = "shadow"
  })
end

return M
