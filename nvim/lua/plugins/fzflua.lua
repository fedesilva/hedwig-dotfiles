return {
  "ibhagwan/fzf-lua",

  dependencies = { "nvim-tree/nvim-web-devicons" },
  enabled = false,  -- 🔴 This disables the plugin
  config = function()
    require("fzf-lua").setup({
      winopts = {
        preview = { layout = "vertical", flip_columns = 100 },
      },
      fzf_opts = {
        ["--layout"] = "reverse",
      },
    })
  end,
}

