local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1e222a" })
    local packer_bootstrap = fn.system({
        "git", "clone", "--depth", "1",
        "https://github.com/wbthomason/packer.nvim", install_path
    })
    
    vim.cmd('packadd packer.nvim')
    require("plugins.packerPluginsManager")
    vim.cmd "PackerSync"
    vim.cmd [[autocmd User PackerComplete ++once echo "Ready!" ]]
end

