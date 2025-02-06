require "nvchad.mappings"

local map = vim.keymap.set

-- Leader key mappings
  -- Files
map("n", "<leader>.", "<cmd>lua require('telescope').extensions.file_browser.file_browser({cwd = vim.fn.expand('%:p:h')})<cr>", { desc = "Find Files (CWD)" })
map("n", "<leader>ff", "<cmd>lua require('telescope').extensions.file_browser.file_browser()<cr>", { desc = "Find Files (~/)" })
map("n", "<leader>fm", "<cmd>lua require('telescope.builtin').man_pages()<cr>", { desc = "Man Docs" })
map("n", "<leader>fr", "<cmd>lua require('telescope.builtin').oldfiles()<cr>", { desc = "Open Recent Files" })
map("n", "<leader>/", "<cmd>lua require('telescope.builtin').oldfiles()<cr>", { desc = "Open Recent Files" })

  -- Buffers
map("n", "<leader>bs", "<cmd>lua require('telescope.builtin').buffers()<cr>", { desc = "List/Switch Buffers" })
map("n", "<leader>bd", "<cmd>bd<cr>", { desc = "Kill Current Buffer" })
map("n", "<leader>b.", "<cmd>bnext<cr>", { desc = "Switch to Next Buffer" })
map("n", "<leader>b,", "<cmd>bprevious<cr>", { desc = "Switch to Prev Buffer" })

map("n", "<leader>cf", "<cmd>lua require('neoclip.fzf')()<cr>", { desc = "Open Menu" })
map("n", "<leader>ct", "<cmd>lua require('neoclip.fzf').toggle()<cr>", { desc = "Toggle Clipboard Registration" })
map("n", "<leader>cc", "<cmd>lua require('neoclip').clear_history()<cr>", { desc = "Clear Clipboard History" })

map("n", "<leader>wv", "<cmd>vsp<cr>", { desc = "Vertical Split" })
map("n", "<leader>wh", "<cmd>sp<cr>", { desc = "Horizontal Split" })
map("n", "<leader>wk", "<cmd>bd<cr>", { desc = "Kill Buffer Only" })
map("n", "<leader>wc", "<cmd>close<cr>", { desc = "Kill Current Window" })
map("n", "<leader>wa", "<cmd>only<cr>", { desc = "Kill All Win but Current" })
map("n", "<leader>wl", "<cmd>bd | close<cr>", { desc = "Kill Buffer & Window" })

-- Localleader key mappings
map("n", "<localleader>wh", "<cmd>wincmd h<cr>", { desc = "Focus Left" })
map("n", "<localleader>wj", "<cmd>wincmd j<cr>", { desc = "Focus Down" })
map("n", "<localleader>wk", "<cmd>wincmd k<cr>", { desc = "Focus Up" })
map("n", "<localleader>wl", "<cmd>wincmd l<cr>", { desc = "Focus Right" })

map("n", "<localleader>wH", "<cmd>wincmd H<cr>", { desc = "Move Left" })
map("n", "<localleader>wJ", "<cmd>wincmd J<cr>", { desc = "Move Down" })
map("n", "<localleader>wK", "<cmd>wincmd K<cr>", { desc = "Move Up" })
map("n", "<localleader>wL", "<cmd>wincmd L<cr>", { desc = "Move Right" })

map("n", "<localleader>wr", "<cmd>wincmd r<cr>", { desc = "Shift Down/Right" })
map("n", "<localleader>wR", "<cmd>wincmd R<cr>", { desc = "Shift Up/Left" })
map("n", "<localleader>wx", "<cmd>wincmd x<cr>", { desc = "Switch Current for Next" })

map("n", "<localleader>wf", "<cmd>resize<cr>", { desc = "Fullscreen Current" })
map("n", "<localleader>wF", "<cmd>resize!<cr>", { desc = "Restore All" })
map("n", "<localleader>wi", "<cmd>resize +N<cr>", { desc = "+ Height" })
map("n", "<localleader>wo", "<cmd>resize -N<cr>", { desc = "- Height" })
map("n", "<localleader>wI", "<cmd>vertical resize +N<cr>", { desc = "+ Width" })
map("n", "<localleader>wO", "<cmd>vertical resize -N<cr>", { desc = "- Width" })
map("n", "<localleader>wd", "<cmd>wincmd =<cr>", { desc = "Reset All Sizes" })

map("n", "<localleader>mm", "<cmd>lua require('mini.map').toggle()<cr>", { desc = "Toggle Minimap" })

-- Additional keymaps
map("n", "<Esc>", "<cmd>nohlsearch<cr>", { desc = "Disable Highlight After Search" })
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit Terminal" })
map("n", "-", "<cmd>Oil<cr>", { desc = "Open Oil" })
map("n", "<M-e>", "<Esc>", { desc = "Alt-E acts as <Esc>" })
map("i", "<M-e>", "<Esc>", { desc = "Alt-E acts as <Esc>" })
map("v", "<M-e>", "<Esc>", { desc = "Alt-E acts as <Esc>" })

-- Hlslens keymaps
map("n", "n", [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]], { silent = true })
map("n", "N", [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]], { silent = true })
map("n", "*", [[*<Cmd>lua require('hlslens').start()<CR>]], { silent = true })
map("n", "#", [[#<Cmd>lua require('hlslens').start()<CR>]], { silent = true })
map("n", "g*", [[g*<Cmd>lua require('hlslens').start()<CR>]], { silent = true })
map("n", "g#", [[g#<Cmd>lua require('hlslens').start()<CR>]], { silent = true })
