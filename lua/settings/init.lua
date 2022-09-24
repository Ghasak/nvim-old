local init_modules = {
	'settings.options',
  'settings.special_color_highlight'
}

for _, module in ipairs(init_modules) do
  local ok, err = pcall(require, module)
  if not ok then
    vim.notify('Error loading ' .. module .. '\n\n' .. err)
  end
end



