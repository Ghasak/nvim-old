local M = {}

-- load plugin after entering vim ui
M.packer_lazy_load = function(plugin, timer)
   if plugin then
      timer = timer or 0
      vim.defer_fn(function()
         --print(timer)
         require("packer").loader(plugin)
      end, timer)
   end
end

-- Keymapping function
M.keymapping = function(mode, lhs, rhs, opts)
   local options = {noremap = true}
   if opts then
      options = vim.tbl_extend("force", options, opts)
   end
   vim.api.nvim_set_keymap(mode, lhs, rhs, options)

end


M.load_module =  function(mod_name)
    local ok, err = pcall(require, mod_name)
    if not ok then
        local msg = "failed loading: " .. mod_name .. "\n " .. err
        vim.notify(msg, "error")
    end
end





return M

