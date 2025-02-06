require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

local servers = {
  "asm_lsp", "clangd", "cmake", "csharp_ls", "css_variables", "cssls", "cssmodules_ls",
  "elixirls", "gdscript", "gopls", "guile_ls", "html", "htmx", "jsonls",
  "julials", "kotlin_language_server", "lua_ls", "markdown_oxide", "mdx_analyzer", "mesonlsp", "nim_langserver",
  "nixd", "perlls", "pyright", "rust_analyzer", "tailwindcss", "ts_ls", "yamlls",
  "zls"
}
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
