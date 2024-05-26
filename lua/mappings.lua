require "nvchad.mappings"

local wk = require("which-key")
local default_opts = { noremap = true }
wk.register(mappings, opts)

wk.register({
  f = {
    name = "File Management",
    f = { "<cmd>lua require('fzf-lua').files()<cr>", "Find File", default_opts },
    F = { "<cmd>lua require('fzf-lua').files({ resume = true })<cr>", "Find File", default_opts },
    r = { "<cmd>lua require('fzf-lua').oldfiles()<cr>", "Open Recent File", noremap = false },
  },
  j = {
    name = "Buffer Management",
    s = { "<cmd>lua require('fzf-lua').buffers()<cr>", "List/Switch Buffers", },
    k = { "<cmd>bd<cr>", "Kill Current Buffer", },
    d = { "<cmd> <cr>", "Kill Specific Buffer", },
    ["<Tab>"] = { "<cmd>bnext <cr>", "Switch to Next Buffer", },
    ["<Space>"] = { "<cmd>bprevious <cr>", "Switch to Prev Buffer", },
    _ = { "<cmd> <cr>", "", },
    _ = { "<cmd> <cr>", "", },
    _ = { "<cmd> <cr>", "", },
    _ = { "<cmd> <cr>", "", },

  },
}, { prefix = "<leader>" })

wk.register({ -- Localleader bindings 
}, { prefix = "<localleader>" })
