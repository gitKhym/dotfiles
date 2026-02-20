-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities
local lspconfig = require "lspconfig"

local servers = { "tailwindcss", "html", "jsonls", "jdtls", "pyright", "prismals" }

-- lsps with default config
for _, lsp in ipairs(servers) do
  if lsp ~= "jdtls" then
    lspconfig[lsp].setup {
      on_attach = on_attach,
      on_init = on_init,
      capabilities = capabilities,
    }

    vim.diagnostic.config { virtual_text = false }
  end
end

lspconfig.somesass_ls.setup {
  name = "somesass_ls",
  cmd = { "some-sass-language-server", "--stdio" },
  filetypes = { "scss", "sass" },
  root_markers = { ".git", ".package.json" },
  settings = {
    somesass = {
      suggestAllFromOpenDocument = true,
    },
  },

  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}

lspconfig.omnisharp.setup {
  cmd = { vim.fn.stdpath "data" .. "/mason/bin/OmniSharp" },
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}

lspconfig.gdscript.setup {
  name = "godot",
  cmd = vim.lsp.rpc.connect("127.0.0.1", 6005),
  filetypes = { "gd", "gdscript" },
}

-- CSS
lspconfig.cssls.setup {

  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  filetypes = { "css" },
  settings = {
    css = { validate = true, lint = {
      unknownAtRules = "ignore",
    } },
    scss = { validate = true, lint = {
      unknownAtRules = "ignore",
    } },
    less = { validate = true, lint = {
      unknownAtRules = "ignore",
    } },
  },
}

lspconfig.ltex_plus.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,

  filetypes = { "tex" },
  settings = {
    ltex = {
      language = "en-AU", -- Set the language here
    },
  },
}

-- Rust
vim.diagnostic.config { virtual_text = false }
lspconfig.rust_analyzer.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  filetypes = { "rust" },
  settings = {
    ["rust-analyzer"] = {
      cargo = { allFeatures = true },
      diagnostics = {
        enable = true,
      },
      inlayHints = {
        enable = true, -- Enable inlay hints
        showParameterNames = true,
        parameterHintsPrefix = "<- ",
        otherHintsPrefix = "=> ",
      },
    },
  },
}

-- eslint
lspconfig.eslint.setup {
  cmd = { "vscode-eslint-language-server", "--stdio" },
}

-- tailwind
lspconfig.tailwindcss.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,

  filetypes = {
    "typescriptreact",
    "javascriptreact",
    "javascript",
    "typescript",
    "html",
  },
}

-- typescript
lspconfig.ts_ls.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  init_options = {
    preferences = {
      includeInlayParameterNameHints = "all",
      includeInlayParameterNameHintsWhenArgumentMatchesName = true,
      includeInlayFunctionParameterTypeHints = false,
      includeInlayVariableTypeHints = false,
      includeInlayPropertyDeclarationTypeHints = false,
      includeInlayFunctionLikeReturnTypeHints = false,
      includeInlayEnumMemberValueHints = true,
      importModuleSpecifierPreference = "non-relative",
    },
  },
}
