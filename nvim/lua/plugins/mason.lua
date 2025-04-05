return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim", -- Integrates Mason with LSP config
    "neovim/nvim-lspconfig",             -- Core LSP plugin
  },
  config = function()
    require("mason").setup() -- Mason setup

    require("mason-lspconfig").setup({
      ensure_installed = {
        "pyright",       -- Python type checker + LSP features
        "ruff",          -- Anotheer Python LSP
        "lua_ls",        -- For Lua development (Neovim config)
        "ts_ls",         -- TypeScript/JavaScript LSP
        -- "clangd",        -- C/C++ LSP
        "rust_analyzer", -- Rust LSP
        "gopls",         -- Go LSP
        "marksman",
        "bzl",
        "zls",
      },
      automatic_installation = true, -- Automatically install missing LSPs
    })
  end,
}
