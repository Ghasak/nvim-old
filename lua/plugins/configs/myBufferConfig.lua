
M = {}


local colors = {
   white = "#E4FDE1",
   darker_black = "#232323",
   black = "#282828", --  nvim bg
   black2 = "#2e2e2e",
   one_bg = "#353535",
   one_bg2 = "#3f3f3f",
   one_bg3 = "#444444",
   grey = "#464646",
   grey_fg = "#4e4e4e",
   grey_fg2 = "#505050",
   light_grey = "#565656",
   red = "#fb4934",
   baby_pink = "#cc241d",
   pink = "#ff75a0",
   --line = "#2c2f30", -- for lines like vertsplit
   line = "#ff75a0",  -- for lines like vertsplit
   --green = "#b8bb26",
   green = '#C6EBC5',
   vibrant_green = "#a9b665",
   nord_blue = "#83a598",
   blue = "#458588",
   yellow = "#d79921",
   sun = "#fabd2f",
   purple = "#b4bbc8",
   dark_purple = "#d3869b",
   teal = "#749689",
   orange = "#e78a4e",
   cyan = "#82b3a8",
   statusline_bg = "#2c2c2c",
   lightbg = "#353535",
   lightbg2 = "#303030",
   pmenu_bg = "#83a598",
   folder_bg = "#83a598",
   beautiful_black = "#343a43",

}


--- @module "bufferline.colors"

M.setup = function ()

  require("bufferline").setup{
    options = {
      numbers = "ordinal",
      right_mouse_command = "bdelete! %d",
      left_mosue_command = "buffer %d",
      -- indicator_icon = '▎',
      indicator = {
      icon ='▐',
      style = "icon",
       },
      buffer_close_icon = '',
      modified_icon = '',--'●',
      close_icon = '',
      left_trunc_marker = '',
      right_trunc_marker = '',
      max_name_length = 14,
      max_prefix_length = 13,
      tab_size = 20,
      show_tab_indicators = true,
      enforce_regular_tabs = false,
      view = "multiwindow",
      show_buffer_close_icons = true,
      separator_style = "thin",
      always_show_bufferline = true,
      diagnostics = false, -- "or nvim_lsp"
      custom_filter = function(buf_number)
         -- Func to filter out our managed/persistent split terms
         local present_type, type = pcall(function()
            return vim.api.nvim_buf_get_var(buf_number, "term_type")
         end)

         if present_type then
            if type == "vert" then
               return false
            elseif type == "hori" then
               return false
            else
               return true
            end
         else
            return true
         end
      end,
    },

   highlights = {
      background = {
         fg = colors.grey_fg,
         --bg = colors.black2,
         bg = colors.beautiful_black,
      },

      -- buffers
      buffer_selected = {
         fg = colors.white,
         --bg = colors.black,
         bg = colors.beautiful_black,
         fg = "bold",
      },
      buffer_visible = {
         fg = colors.light_grey,
         --bg = colors.black2,
         bg = colors.beautiful_black,
      },

      -- for diagnostics = "nvim_lsp"
      error = {
         fg = colors.light_grey,
         bg = colors.black2,
      },
      error_diagnostic = {
         fg = colors.light_grey,
         bg = colors.black2,
      },

      -- close buttons
      close_button = {
         fg = colors.light_grey,
         --bg = colors.black2,
         bg = colors.beautiful_black,
      },
      close_button_visible = {
         fg = colors.light_grey,
         --bg = colors.black2,
         bg = colors.beautiful_black,
      },
      close_button_selected = {
         fg = colors.red,
         --bg = colors.black,
         bg = colors.beautiful_black,
      },
      fill = {
         fg = colors.grey_fg,
         bg = colors.beautiful_black ,   -- This is the color that will fill the entire tab bar
      },
      indicator_selected = {
         fg = colors.black,
         --bg = colors.black,
         bg = colors.beautiful_black,
      },

      -- modified
      modified = {
         fg = colors.red,
         bg = colors.black2,
      },
      modified_visible = {
         fg = colors.red,
         --bg = colors.black2,
         bg = colors.beautiful_black,
      },
      modified_selected = {
         fg = colors.green,
         --bg = colors.black,
         bg = colors.beautiful_black,
      },

      -- separators
      separator = {
         --fg = colors.black2,
         fg = colors.beautiful_black,
         --bg = colors.black2,
         bg = colors.beautiful_black,
      },
      separator_visible = {
         --fg = colors.black2,
         fg = colors.beautiful_black,
         --bg = colors.black2,
         bg = colors.beautiful_black,
      },
      separator_selected = {
         --fg = colors.black2,
         fg = colors.beautiful_black,
         --bg = colors.black2,
         bg = colors.beautiful_black,
      },
      -- tabs
      tab = {
         fg = colors.light_grey,
         --bg = colors.one_bg3,
         bg = colors.beautiful_black,
      },
      tab_selected = {
         fg = colors.black2,
        -- bg = colors.nord_blue,
         bg = colors.beautiful_black,
      },
      tab_close = {
         fg = colors.red,
         --bg = colors.black,
         bg = colors.beautiful_black,
      },

  }
}

end

return M

