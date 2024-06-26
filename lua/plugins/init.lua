return {
  { -- Dashboard for Sleepy
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    config = function()
      require("configs.startup")
   end,
    dependencies = { "nvim-tree/nvim-web-devicons" }
  },
  -- UI
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    config = function()
      require "configs.conform"
    end,
  },

  -- LSP, Lint, & Grammar
  { -- LSP Package Manager
  	"williamboman/mason.nvim",
    lazy = false,
  	opts = {
  		ensure_installed = {
  			"lua-language-server", "stylua",
  			"html-lsp", "css-lsp" , "prettier"
  		},
  	},
    config = function() 
      require("mason").setup({
        PATH = "prepend"
      })
    end
  },

  { -- LSP Configuration
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require("configs.lspconfig")
    end,
  },

  { -- Syntax Highlighting
  	"nvim-treesitter/nvim-treesitter",
  	opts = {
  		ensure_installed = {
  		  "vim", "lua", "vimdoc",
        "html", "css"
  		},
  	},
  },

  -- Util
  { -- Telescope Plugin
    "nvim-telescope/telescope-file-browser.nvim",
    config = function()
      require("configs.telescope")
    end,
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  },

  { -- File Manager
    "stevearc/oil.nvim",
    lazy = false,
    config = function()
      require("oil").setup({
        default_file_explorer = true,
      })
    end,
    dependencies = { "nvim-tree/nvim-web-devicons" }
  },

  { -- Project Manager
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    config = function ()
      require("harpoon"):setup()
    end,
    dependencies = { "nvim-lua/plenary.nvim" }
  },

  { -- Display Images
    "edluffy/hologram.nvim",
    config = function()
      require("hologram").setup{
        auto_display = true
      }
    end
  },

  { -- Translate Text
    "uga-rosa/translate.nvim",
    config = function()
      require("translate").setup({
        default = {
         command = "deepl_pro",
        },
        preset = {
          output = {
              split = {
                  append = true,
              },
          },
        },
      })
    end
  },

  { -- Markdown Preview
    "ellisonleao/glow.nvim",
    config = true,
    cmd = "Glow"
  },

  -- Misc
  { -- Highlight Word Under Cursor
    "yamatsum/nvim-cursorline",
    lazy = false,
    config = function()
      require("nvim-cursorline").setup {
        cursorline = {
          enable = true,
          timeout = 1000,
          number = true,
        },
        cursorword = {
          enable = true,
          min_length = 3,
          hl = { underline = true },
        }
    }
    end
  },

  { -- A Minimap
    "echasnovski/mini.map",
    version = "*",
    config = function()
      require("mini.map").setup({
        window = {
          focusable = true,
          side = "right",
          show_integration_count = true,
        }
      })
    end
  },

  {
    "andweeb/presence.nvim",
    lazy = false,
    config = function()
      require("presence").setup({
        auto_update = true,
        enable_line_number = true,
        show_time = true,
        neovim_image_text = "NvChad",
      })
    end
  }
}
