return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim" },
  config = function()
    require("neo-tree").setup({
      close_if_last_window = false, -- Optional: Close Neotree if it's the last window
      filesystem = {
        follow_current_file = {
          enabled = true, -- Auto-update Neotree when switching buffers
        }
      },
      sources = { "filesystem", "buffers" }, -- Enable buffers in NeoTree
      buffers = {
        -- Auto-update NeoTree when switching buffers
        follow_current_file = { enabled = true }
      },
    })

    -- Auto-reveal the current file in Neotree when changing buffers
    vim.api.nvim_create_autocmd("BufEnter", {
      callback = function()
        local win_id = vim.fn.bufwinid("Neotree") -- Check if Neotree is open
        if win_id ~= -1 then
          vim.cmd("Neotree reveal")               -- Run Neotree reveal if it's open
        end
      end,
    })
  end,
}
