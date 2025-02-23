return {
  "github/copilot.vim",
  event = "InsertEnter",
  config = function()
    vim.g.copilot_no_tab_map = true  -- Disable default <Tab> mappin
    vim.g.copilot_assume_mapped = true  -- Assume manual key mapping
    vim.g.copilot_filetypes = {         -- Enable Copilot for specific filetypes
      ["*"] = true,
      ["markdown"] = true,
      ["lua"] = true,
      ["python"] = true,
      ["javascript"] = true,
      ["typescript"] = true,
      ["go"] = true,
      ["scala"] = true,
    }
  end,
}

