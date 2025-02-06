-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "tokyonight",

	hl_override = {
	  Comment = { italic = true },
  	["@comment"] = { italic = true },
	},
}

M.ui = {
  statusline = {
    enabled = true,
    theme = "vscode_colored"
  },

  tabufline = {
    enabled = true,
    lazyload = true,
    bufwidth = 21
  }
}

return M
