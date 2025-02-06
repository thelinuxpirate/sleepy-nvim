--[[
=====================================================================
==================== Sleepy-NvChad Configuration ====================
=====================================================================
========                                    .-----.          ========
========         .----------------------.   | === |          ========
========         |.-""""""""""""""""""-.|   |-----|          ========
========         ||                    ||   | === |          ========
========         ||  Slippi-Launcher   ||   |-----|          ========
========         ||                    ||   | === |          ========
========         ||                    ||   |-----|          ========
========         ||:20XX               ||   |:::::|          ========
========         |'-..................-'|   |____o|          ========
========         `"")----------------(""`   ___________      ========
========        /::::::::::|  |::::::::::\  \ I am...  \     ========
========       /:::========|  |==hjkl==:::\  \ TRONG    \    ========
========      '""""""""""""'  '""""""""""""'  '""""""""""'   ========
========                                                     ========
=====================================================================
=====================================================================
--]]

require "nvchad.options"

local g = vim.g
local o = vim.o
local wo = vim.wo
local opt = vim.opt

o.spelllang = "en_us"
o.cursorlineopt = "both"
o.foldcolumn = "1"
o.foldlevel = 99
o.foldlevelstart = 99
o.foldenable = true

opt.cursorline = true
opt.relativenumber = true
opt.mouse = 'a'
opt.showmode = false
opt.breakindent = true
opt.undofile = true
opt.ignorecase = false
opt.smartcase = true
opt.timeoutlen = 283
opt.splitright = true
opt.splitbelow = true
opt.scrolloff = 15
opt.hlsearch = true

-- NeoVide Settings
if g.neovide then
  o.guifont = "Comic Mono:h12.75"
  g.neovide_padding_top = 0
  g.neovide_padding_bottom = 0
  g.neovide_padding_right = 0
  g.neovide_padding_left = 0
  opt.linespace = 0

  wo.number = true
  opt.relativenumber = false
end

o.cursorlineopt ='both'
