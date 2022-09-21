
local M = {}
M.setup = function()
	local impatient_loaded_success = pcall(require, "impatient")
	if impatient_loaded_success then require'impatient'.enable_profile() end
end
return M
