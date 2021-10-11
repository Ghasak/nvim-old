







local init_modules = {
	'settings.mappings',
	'settings.options'
}

for _, module in ipairs(init_modules) do
  local ok, err = pcall(require, module)
  if not ok then
    vim.notify('Error loading ' .. module .. '\n\n' .. err)
  end
end
