return {
  "scalameta/nvim-metals",
  dependencies = { "nvim-lua/plenary.nvim" },
  ft = { "scala", "sbt", "java" },
  config = function()
    local metals_config = require("metals").bare_config()

    metals_config.settings = {
      showImplicitArguments = true,
      showImplicitConversionsAndClasses = true,
      showInferredType = true,
      enableSemanticHighlighting = true,
      inlayHints = {
        typeParameters = { enable = true },
        inferredTypes = { enable = true },
        implicitArguments = { enable = true },
      },
      startMcpServer = true,
    }

    metals_config.init_options.statusBarProvider = "on"

    local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })

    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "scala", "sbt", "java" },
      callback = function()
        require("metals").initialize_or_attach(metals_config)
      end,
      group = nvim_metals_group,
    })
  end,
}
