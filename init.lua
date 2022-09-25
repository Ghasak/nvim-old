
local load_module =  function(mod_name)
    local ok, err = pcall(require, mod_name)
    if not ok then
        local msg = "failed loading: " .. mod_name .. "\n " .. err
        vim.notify(msg, "error")
    end
end


local init_modules = {
	"plugins", "core", "settings"
} for _, module in ipairs(init_modules) do load_module(module) end

-- Highlight on yankinking
highlight_while_yank()
