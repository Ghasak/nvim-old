vim.defer_fn(function()
  pcall(require, "impatient")
end, 0)

require "core"
require "core.options"


-- setup packer + plugins
local fn = vim.fn
local install_path = fn.stdpath "data" .. "/site/pack/packer/opt/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1e222a" })
  print "Cloning packer .."
  fn.system { "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path }

  -- install plugins + compile their configs
  vim.cmd "packadd packer.nvim"
  require "plugins"
  vim.cmd "PackerSync"

  -- install binaries from mason.nvim & tsparsers
  vim.api.nvim_create_autocmd("User", {
    pattern = "PackerComplete",
    callback = function()
      vim.cmd "bw | silent! MasonInstallAll" -- close packer window
      require("packer").loader "nvim-treesitter"
    end,
  })
end

pcall(require, "custom")

require("core.utils").load_mappings()



-- ===========================================================================
--                      Check for undotree if it is installed
-- ===========================================================================


local function undotree_loader()
    local undotree_package_path = "/site/pack/packer/start/undotree"
    install_path = fn.stdpath("data") .. undotree_package_path
    if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
        vim.api.nvim_command(
            ([[echohl WarningMsg | echomsg "[+] UndoTree library at :%s is not existed, will be installed after packer compiled ." | echohl None]]):format(
                install_path))
    else
        -- Loading undo-tree for our persistence data and saving directory
        require("plugins.configs.myUndoTreeConfig")
    end
end
undotree_loader()



