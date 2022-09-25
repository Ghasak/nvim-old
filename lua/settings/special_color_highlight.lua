
-- Function used to color (yellow) the upper cases words
_G.highlight_upper_letter_cases = function()
    -- The following
    -- This will work if you add to (common) for the color scheme.
    -- Defing first the synatx group by linking them to existed on using:
    -- highlight def link <you_custom_group_name> guifg=<hash-color-name>
    -- Then assign to the specific pattern that you want to highlight
    -- You can link from other group using:
    -- vim.api.nvim_command([[hi def link GGX Title]])
    -- Or create a new group
    vim.highlight.create('GGX', {guifg="#EEEDBF"}, true)
    --vim.api.nvim_command([[highlight GGX guifg=#EEEDBF]])
    vim.api.nvim_command([[syn match GGX /[A-Z]+/]])
    vim.api.nvim_command([[syn match GGX /[A-Z]\{2,\}/]])
    vim.api.nvim_command([[syn match GGX "\v<[A-Z]+>"]])
    -- this will be executed only when open vim on event VimEnter (then source all nvim files)
    vim.cmd([[autocmd VimEnter ~/.config/nvim/* source %]])
end

local function status_line()
  local mode = "%-5{%v:lua.string.upper(v:lua.vim.fn.mode())%}"
  local file_name = "%-.16t"
  local buf_nr = "[%n]"
  local modified = " %-m"
  local file_type = " %y"
  local right_align = "%="
  local line_no = "%10([%l/%L%)]"
  local pct_thru_file = "%5p%%"

  return string.format(
    "%s%s%s%s%s%s%s%s",
    mode,
    file_name,
    buf_nr,
    modified,
    file_type,
    right_align,
    line_no,
    pct_thru_file
  )
end

--vim.opt.statusline = status_line()
-- this function will be trigger only when TextYankPost event happens.
_G.highlight_while_yank = function()
  local exec = vim.api.nvim_exec -- execute Vimscript
  -- highlight on yank
  vim.highlight.create('YANK_HIGHLIGHT_COLOR_GROUP', {ctermbg=0, guibg="#FFC49B", guifg="#EEEDBF"}, true)

  exec([[
    augroup YankHighlight
      autocmd!
      autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="YANK_HIGHLIGHT_COLOR_GROUP", timeout=700}
      autocmd TextYankPost  ~/.config/nvim/* source %
    augroup end
  ]], true)
end



-- ----------------------------------------------------------------------------------------
--                        nvim-tree helper
-- ----------------------------------------------------------------------------------------

-- This is special configuration to close nvim-tree automatically if we closed the last buffer
-- See disucssion here (https://github.com/kyazdani42/nvim-tree.lua/issues/1005)

-- nvim-tree is also there in modified buffers so this function filter it out
local modifiedBufs = function(bufs)
    local t = 0
    for k,v in pairs(bufs) do
        if v.name:match("NvimTree_") == nil then
            t = t + 1
        end
    end
    return t
end

vim.api.nvim_create_autocmd("BufEnter", {
    nested = true,
    callback = function()
        if #vim.api.nvim_list_wins() == 1 and
        vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil and
        modifiedBufs(vim.fn.getbufinfo({bufmodified = 1})) == 0 then
            vim.cmd "quit"
        end
    end
})
