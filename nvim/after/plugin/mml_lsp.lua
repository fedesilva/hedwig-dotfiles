-- MinnieML LSP configuration
-- Automatically configures the MML language server if nvim-lspconfig is available

local ok, lspconfig = pcall(require, 'lspconfig')
if not ok then
  -- nvim-lspconfig not installed, skip LSP setup
  return
end

local configs = require('lspconfig.configs')

-- Only register if not already registered
if not configs.mml then
  configs.mml = {
    default_config = {
      cmd = { 'mmlc', 'lsp' },
      filetypes = { 'mml' },
      root_dir = lspconfig.util.find_git_ancestor,
      single_file_support = true,
      settings = {},
    },
  }
end

-- Setup with default config
-- Users can override by calling lspconfig.mml.setup({...}) in their own config
lspconfig.mml.setup({})
