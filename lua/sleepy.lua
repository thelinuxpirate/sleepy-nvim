-- if anything has to be ran as an init run add it here
function init()
	local initMsg = "Loading Requirements..."
	print(initMsg)
	require("plugins")
	require("theme")
	require("keybindings")
  end

init()

vim.wo.number = true
vim.o.expandtab = true

vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
