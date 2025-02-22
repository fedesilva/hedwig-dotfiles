return {
  "neovim/nvim-lspconfig",
  config = function()
    require("lspconfig").ts_ls.setup({})
    require("lspconfig").lua_ls.setup({})
  end,
}
