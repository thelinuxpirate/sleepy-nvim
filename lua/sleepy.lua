-- sleepy.lua the configuration of Sleepy-Nvim
require("plugins")
require("keybindings")
require("theme")

if vim.g.neovide then
  vim.o.guifont = "Comic Mono:h11.8"
  vim.wo.number = true
  vim.opt.linespace = 0
  vim.g.neovide_padding_top = 0
  vim.g.neovide_padding_bottom = 0
  vim.g.neovide_padding_right = 0 
  vim.g.neovide_padding_left = 0
end

vim.wo.number = true
vim.o.expandtab = true

vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
