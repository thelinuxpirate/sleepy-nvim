--[[ TLP's TODOLIST 
- write a func that makes a list of optional buffers for 'j d'
- write a func that spawns ';ff' & opens in vertical & horizontal splits (';fv'..';fh')
]]--

local wk = require("which-key")
local default_opts = { noremap = true }
wk.register(mappings, opts)

vim.g.mapleader = ";"
vim.g.maplocalleader = " "

-- Create keybinds via which-key 
wk.register({
  f = {
    name = "File Management", 
    f = { "<cmd>Telescope find_files<cr>", "Find File", default_opts },
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File", noremap = false },
  },
  j = {
    name = "Buffer Management",
    s = { "<cmd>ls<cr>", "List Buffers", },
    k = { "<cmd>bd<cr>", "Kill Current Buffer", },
--    d = { "<cmd> <cr>", "Kill Specific Buffer", }, 
    _ = { "<cmd> <cr>", "", },
    _ = { "<cmd> <cr>", "", },
    _ = { "<cmd> <cr>", "", },
    _ = { "<cmd> <cr>", "", },
    _ = { "<cmd> <cr>", "", },
    _ = { "<cmd> <cr>", "", },
 
  },
}, { prefix = "<leader>" })

wk.register({ -- Localleader bindings
  f = {
    name = "File Management", 
    f = { "<cmd>Telescope find_files<cr>", "Find File", default_opts },
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File", noremap = false },
  },
}, { prefix = "<localleader>" })
