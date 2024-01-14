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
  -- File Browser & Tree
  { "nvim-tree/nvim-tree.lua", dependencies = { "nvim-tree/nvim-web-devicons" } },
  -- Key completions for keybindings 
  { "folke/which-key.nvim", event = "VeryLazy",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 230
    end, opts = {},
 },
  -- Dashboard for Sleepy
  { "startup-nvim/startup.nvim", dependencies = { 
    "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({
        defaults = {
          file_ignore_patterns = {}, 
        },
      })
    end
  },
  
  -- =+LSP PLUGINS+=
  -- LSP Plugin Manager
  { "williamboman/mason.nvim", dependencies = {
    "mhartington/formatter.nvim", "neovim/nvim-lspconfig", 
    "williamboman/mason-lspconfig.nvim", "mfussenegger/nvim-dap", 
    "rcarriga/nvim-dap-ui", "mfussenegger/nvim-lint"
    },
    config = function()
      require("mason").setup()
      vim.cmd(":MasonUpdate")
    end
  },
  -- Nvim LSP for Nvim 
  { "folke/neodev.nvim" },
  -- The little lightbulb that appears
  { "kosayoda/nvim-lightbulb" },

  -- =+MISC PLUGINS+=
  -- Manage global and project-local settings
  { "folke/neoconf.nvim", cmd = "Neoconf" },
  -- Another file finder & project manager 
  { "ThePrimeagen/harpoon", branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require("harpoon")
      harpoon:setup()
    end
  },
  -- Custom version of GNU Emacs Org Mode
  { "nvim-neorg/neorg", build = ":Neorg sync-parsers",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("neorg").setup {
        load = {
          ["core.defaults"] = {}, -- Loads default behaviour
          ["core.concealer"] = {}, -- Adds pretty icons to your documents
          ["core.dirman"] = { -- Manages Neorg workspaces
            config = {
              workspaces = {
                notes = "~/System/Notes",
              },
            },
          },
        },
      }
    end,
 },

  -- Nvim Discord status to be fancy
  { "andweeb/presence.nvim" },
  -- Sleey startup time & extra information
  { "dstein64/vim-startuptime" },
})

local completed = vim.g.lsp_init_completed or false
function lsp_init()
  print("Now installing TreeSitter support servers...") 
 
  local languages = {
    "bash", "c", "c_sharp", "clojure", "cmake", "commonlisp", "cpp", "css",
    "dockerfile", "elixir", "elm", "gdscript", "git_config", "git_rebase",
    "gitattributes", "gitcommit", "gitignore", "go", "godot_resource",
    "haskell", "javascript", "julia", "kotlin", "latex", "llvm", "lua",
    "luadoc", "make", "markdown", "markdown_inline", "meson", "nim", "ninja",
    "nix", "norg", "org", "perl", "php", "phpdoc", "python", "rasi", "regex",
    "ron", "rst", "ruby", "rust", "scheme", "scss", "ssh_config", "typescript",
    "v", "vim", "vimdoc", "xml", "yaml", "yuck", "zig"
  }
 
  local lsp_servers = {
    -- LSP Servers
    "asm-lsp", "bash-language-server", "clangd", "clojure-lsp", "cmake-language-server", 
    "csharp-language-server", "css-lsp", "dockerfile-language-server", "elixir-ls",
    "elm-language-server", "erlang-ls", "gopls", "grammarly-languageserver", 
    "haskell-language-server", "html-lsp", "htmx-lsp", "json-lsp", "julia-lsp",
    "kotlin-language-server", "lua-language-server", "nimlsp", "perlnavigator", 
    "python-lsp-server", "ruby-lsp", "rust-analyzer", "tailwindcss-language-server", 
    "typescript-language-server", "v-analyzer", "yaml-language-server", "zls",
    -- DAP
    "bash-debug-adapter", "cpptools", "erlang-debugger", "firefox-debug-adapter",
    "go-debug-adapter", "haskell-debug-adapter", "js-debug-adapter", "kotlin-debug-adapter",
    -- Linters
    "cmakelang", "cmakelint", "codespell", "gdtoolkit", "gitleaks", "gitlint", 
    "golangci-lint", "htmlhint", "markdownlint", "pylint", "typos" 
  }

  for _, lang in ipairs(languages) do
    vim.cmd(":noautocmd silent! TSInstall " .. lang)
  end
  for _, lsps in ipairs(lsp_servers) do
    vim.cmd(":noautocmd silent! MasonInstall " .. lsps )
  end

  print("=+DONE+=")
  -- set completion to true to save for future sessions
  vim.g.lsp_init_completed = true
end

if not completed then
  lsp_init()
end

-- plugin configuations
require("configs.lualine")
require("configs.startup")
require("configs.filefinders") 
require("configs.lsp")
