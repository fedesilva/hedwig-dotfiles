return {
  "akinsho/git-conflict.nvim",
  version = "*",                          -- Use the latest stable version
  event = { "BufReadPre", "BufNewFile" }, -- Load when opening a file
  config = function()
    require("git-conflict").setup({
      -- Default configuration (you can customize these options)
      default_mappings = true,     -- Disable this if you want to set your own mappings
      default_commands = true,     -- Disable to remove built-in commands
      disable_diagnostics = false, -- This will disable diagnostics being shown in the status line
      highlights = {               -- Customize highlights if desired
        incoming = "DiffAdd",
        current = "DiffText",
      },
    })
  end,
}
