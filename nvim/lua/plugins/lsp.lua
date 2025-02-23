return {
  "neovim/nvim-lspconfig",
  config = function()
    local lspconfig = require("lspconfig")

    -- TypeScript / JavaScript
    lspconfig.ts_ls.setup({})

    -- Lua (Fixes "undefined global vim")
    lspconfig.lua_ls.setup({
      settings = {
        Lua = {
          runtime = {
            version = "LuaJIT", -- Neovim uses LuaJIT
          },
          diagnostics = {
            globals = { "vim" }, -- Tell the LSP that "vim" is a global variable
          },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true), -- Recognize Neovim runtime files
            checkThirdParty = false, -- Prevent warning about 3rd-party plugins
          },
          telemetry = { enable = false }, -- Disable telemetry
        },
      },
    })


     -- ✅ Python LSP (Choose ONE: Pyright or Jedi)
    lspconfig.pyright.setup({}) -- Recommended

  end,
}

