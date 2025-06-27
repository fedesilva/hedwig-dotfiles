return {
  "neovim/nvim-lspconfig",
  config = function()
    local lspconfig = require("lspconfig")

    -- TypeScript / JavaScript
    lspconfig.ts_ls.setup({})

    -- Lua
    lspconfig.lua_ls.setup({
      settings = {
        Lua = {
          runtime = {
            version = "LuaJIT",
          },
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
            checkThirdParty = false,
          },
          telemetry = { enable = false },
        },
      },
    })

    -- ✅ Pyright (Only for Type Checking, No Linting)
    lspconfig.pyright.setup({
      settings = {
        python = {
          analysis = {
            -- ignore = { '*' },            -- Using Ruff
            typeCheckingMode = "strict", -- Enables full type checking
            useLibraryCodeForTypes = true,
            autoImportCompletions = true,
          },
        },
      },
    })

    -- ✅ Ruff (Only for Linting & Formatting)
    lspconfig.ruff.setup {
      init_options = {
        settings = {
          lint = {
            enable = false
          }
        }
      }
    }

    -- lspconfig.buf_ls.setup {}
    -- lspconfig.clangd.setup {}

    -- Rust
    lspconfig.rust_analyzer.setup({
      settings = {
        ["rust-analyzer"] = {
          cargo = {
            allFeatures = true,
          },
          checkOnSave = true,
          procMacro = {
            enable = true,
          },
        },
      },
    })

    lspconfig.gopls.setup {}
    lspconfig.bzl.setup {}
    lspconfig.zls.setup {}
  end,
}
