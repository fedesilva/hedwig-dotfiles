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

-- ============================================================================
-- LSP Commands
-- ============================================================================

local function get_mml_client()
  local clients = vim.lsp.get_clients({ name = 'mml' })
  if #clients == 0 then
    vim.notify('MML LSP server not attached', vim.log.levels.WARN)
    return nil
  end
  return clients[1]
end

local function mml_execute_command(server_cmd, label)
  local client = get_mml_client()
  if not client then return end

  local uri = vim.uri_from_bufnr(0)
  client.request('workspace/executeCommand', {
    command = server_cmd,
    arguments = { uri },
  }, function(err, result)
    if err then
      vim.notify(label .. ' failed: ' .. tostring(err), vim.log.levels.ERROR)
    elseif result and result.success == false then
      vim.notify(label .. ' failed' .. (result.message and (': ' .. result.message) or ''), vim.log.levels.ERROR)
    else
      vim.notify(label .. ' done', vim.log.levels.INFO)
    end
  end)
end

local function mml_restart()
  local client = get_mml_client()
  if not client then return end

  client.request('workspace/executeCommand', {
    command = 'mml.server.restart',
    arguments = {},
  }, function() end)

  vim.lsp.stop_client(client.id)
  vim.defer_fn(function()
    vim.cmd('LspStart mml')
  end, 500)
  vim.notify('MML LSP server restarting...', vim.log.levels.INFO)
end

-- ============================================================================
-- User Commands
-- ============================================================================

vim.api.nvim_create_user_command('MmlRestart', mml_restart, { desc = 'Restart MML LSP server' })
vim.api.nvim_create_user_command('MmlCompile', function() mml_execute_command('mml.server.compileBin', 'Compile') end, { desc = 'Compile MML to binary' })
vim.api.nvim_create_user_command('MmlCompileLib', function() mml_execute_command('mml.server.compileLib', 'Compile lib') end, { desc = 'Compile MML as library' })
vim.api.nvim_create_user_command('MmlClean', function() mml_execute_command('mml.server.clean', 'Clean') end, { desc = 'Clean MML build directory' })
vim.api.nvim_create_user_command('MmlAst', function() mml_execute_command('mml.server.ast', 'AST') end, { desc = 'Show MML AST' })
vim.api.nvim_create_user_command('MmlIr', function() mml_execute_command('mml.server.ir', 'IR') end, { desc = 'Show MML IR' })

-- ============================================================================
-- Keybindings (buffer-local, set on LspAttach for mml filetype)
-- ============================================================================

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('MmlLspKeybindings', { clear = true }),
  callback = function(args)
    if vim.bo[args.buf].filetype ~= 'mml' then return end

    local opts = function(desc) return { buffer = args.buf, desc = desc } end

    vim.keymap.set('n', '<leader>mr',   mml_restart,                                                              opts('MML: Restart LSP'))
    vim.keymap.set('n', '<leader>mce',  function() mml_execute_command('mml.server.compileBin', 'Compile') end,   opts('MML: Compile binary'))
    vim.keymap.set('n', '<leader>mcl',  function() mml_execute_command('mml.server.compileLib', 'Compile lib') end, opts('MML: Compile library'))
    vim.keymap.set('n', '<leader>mK',   function() mml_execute_command('mml.server.clean', 'Clean') end,          opts('MML: Clean'))
    vim.keymap.set('n', '<leader>ma',   function() mml_execute_command('mml.server.ast', 'AST') end,              opts('MML: Show AST'))
    vim.keymap.set('n', '<leader>mi',   function() mml_execute_command('mml.server.ir', 'IR') end,                opts('MML: Show IR'))
  end,
})
