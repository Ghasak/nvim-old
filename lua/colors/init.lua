local M ={}

_G.myTheme = "gruvbox"              -- Specify the color scheme used to our configuration, currently it is called only from the (mybufferConfig)
--_G.myTheme = "onedark"              -- Specify the color scheme used to our configuration, currently it is called only from the (mybufferConfig)
-- if theme given, load given theme if given, otherwise nvchad_theme
M.init = function(theme)
      -- then load the highlights
      require("colors.highlights." .. myTheme)
end

-- returns a table of colors for given or current theme
M.get = function()
   return require("colors.themes." .. myTheme)
end

return  M







