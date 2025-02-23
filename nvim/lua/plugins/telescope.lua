return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("telescope").setup({
      defaults = {
        layout_config = {
          prompt_position = "top",
        },
        sorting_strategy = "ascending",
        path_display = function(opts, path)
          -- Replace HOME with ~
          path = path:gsub(vim.fn.expand("$HOME"), "~")

          -- Keep only the last 2 directories + filename
          local max_segments = 2
          local parts = {}
          for segment in path:gmatch("[^/]+") do
            table.insert(parts, segment)
          end

          if #parts > max_segments then
            path = "…/" .. table.concat(parts, "/", #parts - max_segments + 1)
          end

          return path
        end,
      },
      pickers = {
        lsp_dynamic_workspace_symbols = {
          theme = "dropdown",
        },
      },
    })
  end,
}

