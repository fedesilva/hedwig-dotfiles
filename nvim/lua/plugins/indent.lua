return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  config = function()
    require("ibl").setup({
      scope = { enabled = false },                                               -- Highlights current indent scope
      exclude = { filetypes = { "help", "dashboard", "neo-tree", "NvimTree" } }, -- Skip certain file types
    })
  end,
}
