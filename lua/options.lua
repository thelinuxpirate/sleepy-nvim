require "nvchad.options"

local o = vim.o

-- neovide conditions
if vim.g.neovide then
  vim.o.guifont = "Comic Mono:h12.75"
  vim.wo.number = true
  vim.opt.cursorline = true
  vim.opt.linespace = 0
  vim.g.neovide_padding_top = 0
  vim.g.neovide_padding_bottom = 0
  vim.g.neovide_padding_right = 0
  vim.g.neovide_padding_left = 0
end

o.cursorlineopt = 'both'
