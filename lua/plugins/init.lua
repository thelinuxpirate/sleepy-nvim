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
    event = 'BufWritePre',
    config = function()
      require "configs.conform"
    end,
  },

  -- LSP, Lint, & Grammar
  { -- LSP
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require("configs.lspconfig")
    end,
  },

  { -- LSP
  	"williamboman/mason.nvim",
  	opts = {
  		ensure_installed = {
  			"lua-language-server", "stylua",
  			"html-lsp", "css-lsp" , "prettier"
  		},
  	},
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
  { -- File Finder
    "ibhagwan/fzf-lua",
    event = "BufRead",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("configs.fzf")
    end
  },

  { -- File Manager
    'stevearc/oil.nvim',
    lazy = false,
    config = function()
      require("oil").setup({
        default_file_explorer = true,
      })
    end,
    dependencies = { "nvim-tree/nvim-web-devicons" }
  },

  { -- Display Images
    "edluffy/hologram.nvim",
    config = function()
      require('hologram').setup{
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
  -- Misc
  { -- Highlight word under cursor
    "yamatsum/nvim-cursorline",
    lazy = false,
    config = function()
      require('nvim-cursorline').setup {
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
}
