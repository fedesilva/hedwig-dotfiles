return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("telescope").setup({
      defaults = {
        layout_strategy = "vertical",
        layout_config = {
          prompt_position = "top",
          mirror = true, -- Ensures results appear above
        },
        sorting_strategy = "ascending",
        path_display = function(_, path)
          -- Replace HOME with ~
          local home = vim.fn.expand("$HOME")
          path = path:gsub(home, "~")

          -- Extract filename
          local filename = path:match("[^/]+$")

          -- Ensure full path is displayed, with filename first
          return string.format("%s — %s", filename, path)
        end,
      },
      pickers = {
        find_files = {
          layout_strategy = "vertical",
          layout_config = {
            prompt_position = "top",
            mirror = true,
          },
        },
        lsp_dynamic_workspace_symbols = {
          layout_strategy = "vertical",
          layout_config = {
            prompt_position = "top",
            mirror = true,
          },
        },
        live_grep = {
          layout_strategy = "vertical",
          layout_config = {
            prompt_position = "top",
            mirror = true,
          },
        },
      },
    })
  end,
}

