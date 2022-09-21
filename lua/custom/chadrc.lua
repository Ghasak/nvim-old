-- First read our docs (completely) then check the example_config repo

local M = {}

M.ui = {
  theme = "gruvchad",
}
M.plugins = {
  ['ibhagwan/fzf-lua'] = {
    -- optional for icon support
    requires = {'kyazdani42/nvim-web-devicons'},
    -- Loading necessary
    require('plugins.configs.myfzf')

  },
  ['rainbowhxch/accelerated-jk.nvim'] = {}

}

return M
