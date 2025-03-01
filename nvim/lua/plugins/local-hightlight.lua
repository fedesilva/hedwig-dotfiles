return {
  'tzachar/local-highlight.nvim',
  dependencies = { "folke/snacks.nvim" },
  config = function()
    require('local-highlight').setup()
  end
}
