local M = {}

M.setup = function()
	-- Lua
	-- Use a protected call so we don't error out on first use
	local status_ok, onedark= pcall(require, "onedark")
	if not status_ok then
	  return
	end
	onedark.setup  {

	    -- Main options --
	    style = 'dark', -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
	    transparent =false,  -- Show/hide background
	    term_colors = true, -- Change terminal color as per the selected theme style
	    ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
	    cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

	    -- toggle theme style ---
	    toggle_style_key = nil, -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
	    toggle_style_list = {'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'}, -- List of styles to toggle between

	    -- Change code style ---
	    -- Options are italic, bold, underline, none
	    -- You can configure multiple style with comma seperated, For e.g., keywords = 'italic,bold'
	    code_style = {
		comments = 'italic',
		keywords = 'none',
		functions = 'none',
		strings = 'none',
		variables = 'none'
	    },

	    -- Lualine options --
	    lualine = {
		transparent = false, -- lualine center bar transparency
	    },

	    -- Custom Highlights --
	    colors = {
            bright_orange = "#ff8800",    -- define a new color
            green = '#00ffaa',            -- redefine an existing color
            beautiful_black = '#343a43',
            test = '#00ffaa',
            light_green = '#C6EBC5',
            light_Fiery_Rose = '#F56476',
            Cerise = '#E43F6F',
            Blush = '#DC6486',
            Charm_Pink = '#E18CA4'


      }, -- Override default colors
	    highlights = {
     -- Common
       Visual = { bg = '$Charm_Pink', fmt = 'bold'},
       Normal = { fg = '$beautiful_black' ,bg = '$beautiful_black' },                                -- backgorund default color
       Terminal= { fg = '$beautiful_black' ,bg = '$beautiful_black' },                               -- terminal color for nvim
       EndOfBuffer = { fg = '$beautiful_black' ,bg = '$beautiful_black' },                           -- End of buffer color
       VertSplit = { fg = '$light_green' ,bg = '$beautiful_black' },                                 -- when using vertical split
       SignColumn = { fg = '$beautiful_black' ,bg = '$beautiful_black' },                            -- SignColumn control the edge of nvim buffer
     -- Syntax
       String = {fg ='$light_green'},                                                                -- For only string in nvim
	   -- nvim-tree
	    NvimTreeVertSplit =  { fg = '$light_green' ,bg = '$beautiful_black' },                         -- When you split inside nvim-tree the fg will be activited
	    NvimTreeNormal = { fg = '$light_green' ,bg = '$beautiful_black' },                             -- fg means files names, folder names ..etc.
	    NvimTreeEndOfBuffer = { fg = '$light_green' ,bg = '$beautiful_black' },
      NvimTreeGitNew = {fg ='$light_green'  },                                                       -- This will change only the
     -- GGX = {fg = '#EEEDBF'}
     -- StatusLine
     --StatusLine = { fg = '#DADFF7' ,bg = '#008DD5' },
     -- StatusLineTerm = {},
     -- StatusLineNC = {},
     -- StatusLineTermNC = {},

     -- Nvim-treesitter
     --
      TSString = {fg ='$light_green'},                                                                -- For only string in nvim





      }, -- Override highlight groups


	   -- Plugins Config --
	  diagnostics = {
		darker = true, -- darker colors for diagnostic
		undercurl = true,   -- use undercurl instead of underline for diagnostics
		background = true,    -- use background color for virtual text
	    },
	}
	onedark.load()
end

return M
