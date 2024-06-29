require("telescope").setup {
  defaults = {
    file_ignore_patterns = { "node_modules" },
    hidden = true,
    mappings = {
      i = {
        ["<M-j>"] = "move_selection_next",
        ["<M-k>"] = "move_selection_previous",
    	  ['<c-d>'] = require('telescope.actions').delete_buffer
      },
      n = {
        ["<M-j>"] = "move_selection_next",
        ["<M-k>"] = "move_selection_previous",
    	  ['<c-d>'] = require('telescope.actions').delete_buffer
      },
    },
  },
  extensions = {
    file_browser = {
      theme = "ivy",
      hijack_netrw = false, -- Oil.Nvim is used instead
      grouped = true,
      prompt_path = true,
      hidden = { file_browser = true, folder_browser = true },
      mappings = {
        ["i"] = {
          ["<M-j>"] = "move_selection_next",
          ["<M-k>"] = "move_selection_previous",
        },
        ["n"] = {
          ["<M-j>"] = "move_selection_next",
          ["<M-k>"] = "move_selection_previous",
        },
      },
    },
  },
}
