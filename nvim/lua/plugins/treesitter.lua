return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "c",
        "lua",
        "vim",
        "vimdoc",
        "query",
        "markdown",
        "python",
        "scala",
        "json",
        "yaml",
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "jsonc",
        "php",
        "proto",
        "php",
      },
      auto_install = true,
      highlight = { enable = true },
    })
  end,
}
