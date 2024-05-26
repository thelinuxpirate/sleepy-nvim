require("fzf-lua").setup({
  winopts = {
    height = 0.87,
    on_create = function()
      vim.api.nvim_buf_set_keymap(0, "t", "<M-k>", "<Up>", {noremap = true, silent = true})
      vim.api.nvim_buf_set_keymap(0, "t", "<M-j>", "<Down>", {noremap = true, silent = true})
    end,
  },

  previewers = {
    builtin = {
      extensions = {
        ["png"] = { "viu", "-b" },
        ["jpg"] = { "ueberzug" },
      },
      ueberzug_scaler = "cover",
    }
  },

  files = {
      prompt = "Files> ",
      file_ignore_patterns = {
        "%.bun$",
        "%.cache$",
        "%.cargo$",
        "%.choosenim$",
        "%.discord-rpc$",
        "%.dotnet$",
        "%.git$",
        "%.gnupg$",
        "%.icons$",
        "%.java$",
        "%.klei$",
        "%.minecraft$",
        "%.mozilla$",
        "%.nimble$",
        "%.node_modules$",
        "%.nix-defexpr$",
        "%.nix$",
        "%.npm$",
        "%.nuget$",
        "%.pki$",
        "%.repos$",
        "%.rustup$",
        "%.ssh$",
        "%.var$",
      },
    }
})

