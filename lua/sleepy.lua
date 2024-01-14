-- if anything has to be ran as init add it here
function init()
	local initMsg = "Loading Sleepy-Init..."
	print(initMsg)
  vim.g.loaded_netrw       = 1
  vim.g.loaded_netrwPlugin = 1
	require("plugins")
  require("keybindings")
	require("theme")
  end

init()

vim.wo.number = true
vim.o.expandtab = true

vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
