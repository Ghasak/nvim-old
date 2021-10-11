

-- Following the post:  https://alpha2phi.medium.com/new-neovim-plugins-you-should-try-18aac675f595
-- Steps of using:
-- 1.) highlight all the code you wan to execute.
-- 2.) :SnipRun in the command prompt.
local M = {}
function M.setup()
  require("sniprun").setup {
    display = {
      "Classic",
      "VirtualTextOk",
      "TempFloatingWindow",
    },
  }
end
return M
