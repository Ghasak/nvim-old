M = {}

M.init = function()
	vim.opt.listchars = {
	    space = "⋅",
	    eol = "↴",
    },
  require("indent_blankline").setup {
    show_end_of_line = false,
    space_char_blankline = " "
	}
end

return M
