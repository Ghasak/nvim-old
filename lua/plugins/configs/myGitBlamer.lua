




M = { }

M.BlamerSetting = function()
  vim.cmd[[
          "##################################################
          "               blamer.nvim
          "           This for Git Repo to show
          "           how has worte the code
          "       https://github.com/APZelos/blamer.nvim
          "##################################################
          let g:blamer_enabled = 1
          let g:blamer_delay = 500
          let g:blamer_show_in_visual_modes = 1
          let g:blamer_show_in_insert_modes = 0
          let g:blamer_template = '   <committer>  <committer-time>  <summary>'
          let g:blamer_prefix = ' <- : '
          highlight Blamer guifg=red
  ]]
end


return M
