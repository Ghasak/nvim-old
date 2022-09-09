
local status_ok, navic  = pcall(require, "nvim-navics")
if not status_ok then
  return
end
local icons = require "user.icons"

local gray = "#32363e"
local dark_gray = "#282C34"
local dark_gray = "#282C34"
local red = "#D16969"
local blue = "#569CD6"
local green = "#6A9955"
local cyan = "#4EC9B0"
local orange = "#CE9178"
local yellow = "#DCDCAA"
local yellow_orange = "#D7BA7D"
local purple = "#C586C0"



navic.setup {
    icons = {
	File = " ",
	Module = " ",
	Namespace = " ",
	Package = " ",
	Class = " ",
	Method = " ",
	Property = " ",
	Field = " ",
	Constructor = " ",
	Enum = "練",
	Interface = "練",
	Function = " ",
	Variable = " ",
	Constant = " ",
	String = " ",
	Number = " ",
	Boolean = "◩ ",
	Array = " ",
	Object = " ",
	Key = " ",
	Null = "ﳠ ",
	EnumMember = " ",
	Struct = " ",
	Event = " ",
	Operator = " ",
	TypeParameter = " "
    },
    --highlight = false,
    highlight = true,
    --separator = " > ",
    --separator = " > ",
    separator = " " .. icons.ui.ChevronRight .. " ",

    depth_limit = 0,
    depth_limit_indicator = "..",

}





