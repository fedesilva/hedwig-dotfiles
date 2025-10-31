return {
  "neovim/nvim-lspconfig",
  version = false, -- use latest
  config = function()
    -- TypeScript / JavaScript
    vim.lsp.config("ts_ls", {})

    -- Lua
    vim.lsp.config("lua_ls", {
      settings = {
        Lua = {
          runtime = { version = "LuaJIT" },
          diagnostics = { globals = { "vim" } },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
            checkThirdParty = false,
          },
          telemetry = { enable = false },
        },
      },
    })

    -- Pyright (type checking only)
    vim.lsp.config("pyright", {
      settings = {
        python = {
          analysis = {
            typeCheckingMode = "strict",
            useLibraryCodeForTypes = true,
            autoImportCompletions = true,
          },
        },
      },
    })

    -- Ruff (lint/format only; lint disabled here)
    vim.lsp.config("ruff", {
      init_options = {
        settings = {
          lint = { enable = false },
        },
      },
    })

    -- Rust
    vim.lsp.config("rust_analyzer", {
      settings = {
        ["rust-analyzer"] = {
          cargo = { allFeatures = true },
          checkOnSave = true,
          procMacro = { enable = true },
        },
      },
    })

    -- Go
    vim.lsp.config("gopls", {})

    -- Bazel/Starlark
    vim.lsp.config("bzl", {})

    -- Zig
    vim.lsp.config("zls", {})

    -- Enable filetype-based activation for all of the above
    vim.lsp.enable("ts_ls")
    vim.lsp.enable("lua_ls")
    vim.lsp.enable("pyright")
    vim.lsp.enable("ruff")
    vim.lsp.enable("rust_analyzer")
    vim.lsp.enable("gopls")
    vim.lsp.enable("bzl")
    vim.lsp.enable("zls")
  end,
}
