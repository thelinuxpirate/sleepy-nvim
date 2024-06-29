require "nvchad.mappings"

local wk = require("which-key")
local keymap = vim.api.nvim_set_keymap
local default = { noremap = true }
local quiet = { noremap = true, silent = true }
wk.register(mappings, opts)

wk.register({
  f = {
    name = "Files (Telescope)",
    f = { "<cmd>lua require('telescope').extensions.file_browser.file_browser({cwd = vim.fn.expand('%:p:h')})<cr>", "Find Files (CWD)", default },
    F = { "<cmd>lua require('telescope').extensions.file_browser.file_browser()<cr>", "Find Files (~/)", default },
    d = { "<cmd>lua require('telescope.builtin').man_pages()<cr>", "Man Docs", default },
    r = { "<cmd>lua require('telescope.builtin').oldfiles()<cr>", "Open Recent Files", default },
  },

  j = {
    name = "Buffer Management",
    s = { "<cmd>lua require('telescope.builtin').buffers()<cr>", "List/Switch Buffers", default },
    k = { "<cmd>bd<cr>", "Kill Current Buffer", default },
    ["<Tab>"] = { "<cmd>bnext <cr>", "Switch to Next Buffer", default },
    ["<Space>"] = { "<cmd>bprevious <cr>", "Switch to Prev Buffer", default },
--    _ = { "<cmd> <cr>", "", default },
  },

  w = {
    name = "Window",
    v = { "<cmd>vsp<cr>", "Vertical Split", default },
    h = { "<cmd>sp<cr>", "Horizontal Split", default },
    k = { "<cmd>bd<cr>", "Kill Buffer Only", default },
    c = { "<cmd>close<cr>", "Kill Current Window", default },
    a = { "<cmd>only<cr>", "Kill All Win but Current", default },
    l = { "<cmd>bd | close<cr>", "Kill Buffer & Window", default },
  }
}, { prefix = "<leader>" })

wk.register({ -- Localleader bindings
  w = {
    name = "Window",
    -- Frame Focus
    h = { "<cmd>wincmd h<cr>", "Focus Left", default },
    j = { "<cmd>wincmd j<cr>", "Focus Down", default },
    k = { "<cmd>wincmd k<cr>", "Focus Up", default },
    l = { "<cmd>wincmd l<cr>", "Focus Right", default },
    -- Move Frame
    H = { "<cmd>wincmd H<cr>", "Move Left", default },
    J = { "<cmd>wincmd J<cr>", "Move Down", default },
    K = { "<cmd>wincmd K<cr>", "Move Up", default },
    L = { "<cmd>wincmd L<cr>", "Move Right", default },
    -- Shift Frame
    r = { "<cmd>wincmd r<cr>", "Shift Down/Right", default },
    R = { "<cmd>wincmd R<cr>", "Shift Up/Left", default },
    x = { "<cmd>wincmd x<cr>", "Switch Current for Next", default },
    -- Resize Frame
    f = { "<cmd>resize<cr>", "Fullscreen Current", default },
    F = { "<cmd>resize!<cr>", "Restore All", default },
    i = { "<cmd>resize +N<cr>", "+ Height", default },
    o = { "<cmd>resize -N<cr>", "- Height", default },
    I = { "<cmd>vertical resize +N<cr>", "+ Width", default },
    O = { "<cmd>vertical resize -N<cr>", "- Width", default },
    d = { "<cmd>wincmd =<cr>", "Reset All Sizes", default },
  },

  m = {
   name = "Ui",
    m = { "<cmd>lua require('mini.map').toggle()<cr>", "Toggle Minimap", default },
    s = { "<cmd>lua require('scrollbar').ScrollbarToggle()<cr>", "Toggle Scrollbar", default },
  }
}, { prefix = "<localleader>" })

-- Keymap Rules
keymap("n", "<Esc>", "<cmd>nohlsearch<cr>", default) -- Disable Highlight After Search
keymap("t", "<Esc><Esc>", "C-c", { desc = "Exit Terminal" }) -- Exit Terminal
keymap("n", "-", "<cmd>Oil<cr>", default)
keymap("n", "<M-e>", "<Esc>", quiet)
keymap("i", "<M-e>", "<Esc>", quiet) -- Alt-E acts as <Esc> x3
keymap("v", "<M-e>", "<Esc>", quiet)
