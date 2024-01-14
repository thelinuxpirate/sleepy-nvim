local telescope = require("telescope")
local actions = require("telescope.actions")

local harpoon = require("harpoon")
local conf = require("telescope.config").values
local setkey = vim.keymap.set

-- =+TELESCOPE PLUGIN+=
telescope.setup {
  pickers = {
    find_files = {
      hidden = true
    }
  }
}

-- =+HARPOON PLUGIN+=
-- TODO: Transfer into keybinds.lua
local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end

    require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
            results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
    }):find()
end

setkey("n", "<leader>a", function() harpoon:list():append() end)
setkey("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

setkey("n", "<C-h>", function() harpoon:list():select(1) end)
setkey("n", "<C-t>", function() harpoon:list():select(2) end)
setkey("n", "<C-n>", function() harpoon:list():select(3) end)
setkey("n", "<C-s>", function() harpoon:list():select(4) end)

-- Toggle previous & next buffers stored within Harpoon list
setkey("n", "<C-S-P>", function() harpoon:list():prev() end)
setkey("n", "<C-S-N>", function() harpoon:list():next() end)
