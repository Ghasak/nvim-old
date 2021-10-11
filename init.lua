local init_modules = {
	-- following options are the defaults
	"core",
	"scripts",
	"settings",
}
for _, module in ipairs(init_modules) do
	local ok, err = pcall(require, module)
	if not ok then
		error("Error in loading modules ...< " .. module .. " > " .. "\n\n" .. err)
	end
end

















