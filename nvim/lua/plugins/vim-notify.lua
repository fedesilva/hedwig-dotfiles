return {
  "rcarriga/nvim-notify",
  event = "VeryLazy",
  opts = {
    stages = "fade_in_slide_out",
    timeout = 3000,
    max_width = 50,
    max_height = 10,
    top_down = false,
  },
  config = function()
    require("notify").setup({
      -- your configuration comes here
      -- or leave it empty to use the default settings
    })
  end,
}
