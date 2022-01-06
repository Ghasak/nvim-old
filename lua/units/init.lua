-- Load all the sub modules under the core module
local core_modules = {
	"units.neovideConfig",
}

for _, module in ipairs(core_modules) do
	local ok, err = pcall(require, module)
	if not ok then
		error("Error loading " .. module .. "\n\n" .. err)
	end
end
