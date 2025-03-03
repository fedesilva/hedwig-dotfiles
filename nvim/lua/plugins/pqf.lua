return {
  "yorickpeterse/nvim-pqf",
  event = "VeryLazy",
  config = function()
    require("pqf").setup({
      -- You can customize these options as needed
      signs = {
        error = "E",
        warning = "W",
        info = "I",
        hint = "H"
      },
      -- Other configuration options from the README
      -- show_multiple_lines = false,
      -- max_filename_length = 0,
    })
  end,
}
