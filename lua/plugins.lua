require("lazy").setup({
  -- =+BASE SLEEPY PLUGINS+=
 
  -- Sleepy Nvim ColorScheme
  { "folke/tokyonight.nvim", lazy = false, priority = 1000 },
  -- Modeline for Sleepy
  { "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },
  -- Makes Syntax Highlighting 10x better
  { "nvim/nvim-treesitter", 
    config = function()
      vim.cmd(":TSUpdate")
    end
  },
  -- File Finder/Project Manager
  { "nvim-telescope/telescope.nvim", tag = "0.1.5", branch = "0.1.x", 
    dependencies = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter" } },
  -- Key completions for keybindings 
  { "folke/which-key.nvim" },
  -- Dashboard for Sleepy
  { "startup-nvim/startup.nvim", dependencies = { 
    "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  },
  
  -- =+LSP PLUGINS+=
  -- Nvim LSP for Nvim 
  { "folke/neodev.nvim" },

  -- =+MISC PLUGINS+=
  -- Manage global and project-local settings
  { "folke/neoconf.nvim", cmd = "Neoconf" },
})

--function pluginInits()
--end

-- plugin configuations
require("configs.lualine")
require("configs.startup")
