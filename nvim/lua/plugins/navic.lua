-- provides a view of the context.
-- I can't see it working.
return {
  "SmiteshP/nvim-navic",
  dependencies = { "neovim/nvim-lspconfig" },
  config = function()
    local navic = require("nvim-navic")

    -- Attach navic to LSP
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client and client.server_capabilities.documentSymbolProvider then
          navic.attach(client, args.buf)
        end
      end,
    })
  end,
}

