local init_modules = { "core", "scripts", "settings" }
for _, module in ipairs(init_modules) do
	local ok, err = pcall(require, module)
	if not ok then
		error("Error in loading modules ...< " .. module .. " > " .. "\n\n" .. err)
	end
end

-- local filename = vim.fn.expand "%:t"
-- local extension = vim.fn.expand "%:e"
-- local filename = vim.fn.expand "%:F"
-- print(filename)
-- print(extension)

local current_line = vim.fn.line(".")
local total_line = vim.fn.line("$")

--print(current_line,total_line )



