-- This plugin offer the GPS in the lualine and can be used to show many information about the given position.
-- local navic = require("nvim-navic")
-- navic.setup {
--     icons = {
-- 	File = " ",
-- 	Module = " ",
-- 	Namespace = " ",
-- 	Package = " ",
-- 	Class = " ",
-- 	Method = " ",
-- 	Property = " ",
-- 	Field = " ",
-- 	Constructor = " ",
-- 	Enum = "練",
-- 	Interface = "練",
-- 	Function = " ",
-- 	Variable = " ",
-- 	Constant = " ",
-- 	String = " ",
-- 	Number = " ",
-- 	Boolean = "◩ ",
-- 	Array = " ",
-- 	Object = " ",
-- 	Key = " ",
-- 	Null = "ﳠ ",
-- 	EnumMember = " ",
-- 	Struct = " ",
-- 	Event = " ",
-- 	Operator = " ",
-- 	TypeParameter = " "
--     },
--     highlight = false,
--     separator = " > ",
--     depth_limit = 0,
--     depth_limit_indicator = "..",
--     vim.o.statusline = "%{%v:lua.require'nvim-navic'.get_location()%}"
-- }


local status_ok, gps = pcall(require, "nvim-gps")
if not status_ok then
  return
end

local icons = require "user.icons"

-- vim.api.nvim_set_hl(0, "WinBarSeparator", { fg = "#111fff" })
-- local fg = vim.api.nvim_get_hl_by_name('DiffAdd', 0).background
-- local bg = vim.api.nvim_get_hl_by_name('DiffAdd', 0).foreground

local space = ""

if vim.fn.has "mac" == 1 then
  space = " "
end

vim.api.nvim_set_hl(0, "Winbar", { fg = "#6b737f" })

-- Customized config
gps.setup {

  disable_icons = false, -- Setting it to true will disable all icons

  icons = {
    ["class-name"] = "%#CmpItemKindClass#" .. icons.kind.Class .. "%*" .. space, -- Classes and class-like objects
    ["function-name"] = "%#CmpItemKindFunction#" .. icons.kind.Function .. "%*" .. space, -- Functions
    ["method-name"] = "%#CmpItemKindMethod#" .. icons.kind.Method .. "%*" .. space, -- Methods (functions inside class-like objects)
    ["container-name"] = "%#CmpItemKindProperty#" .. icons.type.Object .. "%*" .. space, -- Containers (example: lua tables)
    ["tag-name"] = "%#CmpItemKindKeyword#" .. icons.misc.Tag .. "%*" .. " ", -- Tags (example: html tags)
    ["mapping-name"] = "%#CmpItemKindProperty#" .. icons.type.Object .. "%*" .. space,
    ["sequence-name"] = "%#CmpItemKindProperty#" .. icons.type.Array .. "%*" .. space,
    ["null-name"] = "%#CmpItemKindField#" .. icons.kind.Field .. "%*" .. space,
    ["boolean-name"] = "%#CmpItemKindValue#" .. icons.type.Boolean .. "%*" .. space,
    ["integer-name"] = "%#CmpItemKindValue#" .. icons.type.Number .. "%*" .. space,
    ["float-name"] = "%#CmpItemKindValue#" .. icons.type.Number .. "%*" .. space,
    ["string-name"] = "%#CmpItemKindValue#" .. icons.type.String .. "%*" .. space,
    ["array-name"] = "%#CmpItemKindProperty#" .. icons.type.Array .. "%*" .. space,
    ["object-name"] = "%#CmpItemKindProperty#" .. icons.type.Object .. "%*" .. space,
    ["number-name"] = "%#CmpItemKindValue#" .. icons.type.Number .. "%*" .. space,
    ["table-name"] = "%#CmpItemKindProperty#" .. icons.ui.Table .. "%*" .. space,
    ["date-name"] = "%#CmpItemKindValue#" .. icons.ui.Calendar .. "%*" .. space,
    ["date-time-name"] = "%#CmpItemKindValue#" .. icons.ui.Table .. "%*" .. space,
    ["inline-table-name"] = "%#CmpItemKindProperty#" .. icons.ui.Calendar .. "%*" .. space,
    ["time-name"] = "%#CmpItemKindValue#" .. icons.misc.Watch .. "%*" .. space,
    ["module-name"] = "%#CmpItemKindModule#" .. icons.kind.Module .. "%*" .. space,
  },

  -- Add custom configuration per language or
  -- Disable the plugin for a language
  -- Any language not disabled here is enabled by default
  -- languages = {
  -- 	-- Some languages have custom icons
  -- 	["json"] = {
  -- 		icons = {
  -- 		}
  -- 	},
  -- 	["toml"] = {
  -- 		icons = {
  -- 		}
  -- 	},
  -- 	["verilog"] = {
  -- 		icons = {
  -- 		}
  -- 	},
  -- 	["yaml"] = {
  -- 		icons = {
  -- 		}
  -- 	},

  -- Disable for particular languages
  -- ["bash"] = false, -- disables nvim-gps for bash
  -- ["go"] = false,   -- disables nvim-gps for golang

  -- Override default setting for particular languages
  -- ["ruby"] = {
  --	separator = '|', -- Overrides default separator with '|'
  --	icons = {
  --		-- Default icons not specified in the lang config
  --		-- will fallback to the default value
  --		-- "container-name" will fallback to default because it's not set
  --		["function-name"] = '',    -- to ensure empty values, set an empty string
  --		["tag-name"] = ''
  --		["class-name"] = '::',
  --		["method-name"] = '#',
  --	}
  --}
  -- },

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



vim.api.nvim_set_hl(0, "SLGitIcon", { fg = "#E8AB53", bg = dark_gray })
vim.api.nvim_set_hl(0, "SLTermIcon", { fg = purple, bg = gray })
vim.api.nvim_set_hl(0, "SLBranchName", { fg = "#abb2bf", bg = dark_gray, bold = false })
vim.api.nvim_set_hl(0, "SLProgress", { fg = purple, bg = gray })
vim.api.nvim_set_hl(0, "SLLocation", { fg = blue, bg = gray })
vim.api.nvim_set_hl(0, "SLFT", { fg = cyan, bg = gray })
vim.api.nvim_set_hl(0, "SLIndent", { fg = orange, bg = gray })
vim.api.nvim_set_hl(0, "SLLSP", { fg = "#6b727f", bg = dark_gray })
vim.api.nvim_set_hl(0, "SLSep", { fg = gray, bg = "NONE" })
vim.api.nvim_set_hl(0, "SLFG", { fg = "#abb2bf", bg = orange })
vim.api.nvim_set_hl(0, "SLSeparator", { fg = "#6b727f", bg = red, italic = true })
vim.api.nvim_set_hl(0, "SLError", { fg = "#bf616a", bg =blue })
vim.api.nvim_set_hl(0, "SLWarning", { fg = "#D7BA7D", bg = green })
vim.api.nvim_set_hl(0, "SLCopilot", { fg = "#6CC644", bg = green })


  separator = " " .. icons.ui.ChevronRight .. " ",

  -- limit for amount of context shown
  -- 0 means no limit
  -- Note: to make use of depth feature properly, make sure your separator isn't something that can appear
  -- in context names (eg: function names, class names, etc)
  depth = 0,

  -- indicator used when context is hits depth limit
  depth_limit_indicator = "..",
  text_hl = "Winbar",
}
