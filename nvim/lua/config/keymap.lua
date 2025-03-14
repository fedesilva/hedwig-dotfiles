-- Save one key stroke by remapping semicolon to colon
vim.api.nvim_set_keymap('n', ';', ':', { noremap = true })

-- When wrapping, do not jump to next line
vim.api.nvim_set_keymap('n', 'j', 'gj', { noremap = true })
vim.api.nvim_set_keymap('n', 'k', 'gk', { noremap = true })

-- Tree Mappings
vim.api.nvim_set_keymap('n', '<leader>nn', ':Neotree toggle<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>nb', ':Neotree buffers<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>m', ':Neotree close<CR>', { noremap = true })


-- Turns off search highlighting
vim.api.nvim_set_keymap('n', '<Leader>/', ':nohlsearch<CR>', { noremap = true })

-- Toggle wrapping
vim.api.nvim_set_keymap('n', '<Leader>w', ':set wrap! wrap?<CR>', { noremap = true })

-- Copilot
-- accept GitHub Copilot suggestion
vim.api.nvim_set_keymap("i", "<C-j>", 'copilot#Accept("<C-K>")', { silent = true, expr = true })
-- accept next workd from Copilot Suggestion
vim.api.nvim_set_keymap("i", "<C-k>", 'copilot#AcceptWord()', { silent = true, expr = true })
-- accept line from Copilot Suggestion
vim.api.nvim_set_keymap("i", "<C-l>", 'copilot#AcceptLine()', { silent = true, expr = true })

vim.g.copilot_no_tab_map = true -- Prevent Copilot from hijacking <Tab>

-- Lazy
vim.api.nvim_set_keymap("n", "<leader>L", ":Lazy<CR>", { noremap = true, silent = true })

-- Noice: dismiss annoying notifications
vim.keymap.set("n", "<Esc>", function()
  require("notify").dismiss()
end, { noremap = true, silent = true })


-- Snacks.scratch
vim.keymap.set('n', '<leader>s', function()
  Snacks.scratch()
end, { noremap = true })

vim.keymap.set('n', '<leader>S', function()
  Snacks.scratch.select()
end, { noremap = true })


-- Buffer management mappings
vim.keymap.set('n', '<leader>bd', function()
  Snacks.bufdelete()
end, { noremap = true, silent = true, desc = "Close buffer" })

vim.api.nvim_set_keymap('n', '<leader>q', ':qall', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>Q', ':qall<CR>', { noremap = true })

-- Navigation between buffers
vim.api.nvim_set_keymap('n', '<c-j>', ':bprev!<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<c-k>', ':bnext!<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<c-a>', ':b# <CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>a', ':b# <CR>', { noremap = true })


-- Mappings to reload configuration files
vim.api.nvim_set_keymap('n', ',vk', ':vi ~/.config/nvim/lua/config/keymap.lua<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', ',uk', ':source ~/.config/nvim/lua/config/keymap.lua<CR>', { noremap = true })

-- Toggle number settings
vim.api.nvim_set_keymap('n', '<leader>l0', ':set relativenumber!<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>l1', ':set number!<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>l-', ':set nonumber<CR>', { noremap = true })

vim.keymap.set("n", "]e", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })
vim.keymap.set("n", "[e", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })

local telescope = require("telescope.builtin")

-- Open buffers list
vim.keymap.set("n", "<leader>lb", telescope.buffers, { noremap = true, silent = true, desc = "List open buffers" })

-- Find files in the current project
vim.keymap.set("n", "<leader>lf", telescope.find_files, { noremap = true, silent = true, desc = "Find files" })

vim.keymap.set("n", "<leader>ld", telescope.diagnostics, { noremap = true, silent = true, desc = "Find files" })


-- Grep inside project
vim.keymap.set("n", "<leader>lg", telescope.live_grep, { noremap = true, silent = true, desc = "Live grep in project" })

-- Search workspace symbols
vim.keymap.set("n", "<leader>fs", telescope.lsp_dynamic_workspace_symbols,
  { noremap = true, silent = true, desc = "Search workspace symbols" })

vim.keymap.set('n', '<leader>fr', telescope.lsp_references, { noremap = true, silent = true, desc = "Find References" })

-- Go to LSP definition
vim.keymap.set("n", "<leader>fd", telescope.lsp_definitions, { noremap = true, silent = true, desc = "Go to definition" })


vim.keymap.set("n", "<leader>lq", telescope.quickfix, { noremap = true, silent = true, desc = "Quickfix list" })

vim.keymap.set("n", "<leader>lr", telescope.lsp_references, { noremap = true, silent = true, desc = "LSP references" })

vim.keymap.set("n", "<leader>lw", telescope.lsp_dynamic_workspace_symbols,
  { noremap = true, silent = true, desc = "LSP code actions" })

vim.keymap.set("n", "<leader>lt", ":TodoTelescope<cr>", { noremap = true, silent = true, desc = "LSP code actions" })

vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic in a floating window' })


-- LSP mappings


-- format
vim.keymap.set("n", "<leader>f", function()
  if vim.bo.filetype == "scala" then
    local metals = require("metals")
    metals.organize_imports()
  end
  vim.lsp.buf.format({ async = true })
end, { noremap = true, silent = true, desc = "Format code using LSP" })

-- Refactor: Rename
vim.keymap.set("n", "<leader>rn", function()
  vim.lsp.buf.rename()
end, { noremap = true, silent = true })


-- Trigger LSP signature help in Insert Mode with <C-s>
vim.keymap.set("i", "<C-S>", function()
  vim.lsp.buf.signature_help()
end, { noremap = true, silent = true, desc = "Show function signature help" })

vim.keymap.set("n", "<C-S>", function()
  vim.lsp.buf.signature_help()
end, { noremap = true, silent = true, desc = "Show function signature help" })

vim.keymap.set("n", "<leader>la", function()
  vim.lsp.buf.code_action()
end, { noremap = true, silent = true, desc = "Show code actions" })



-- Save file with Cmd+S in Normal and Insert Mode
-- saves me from pressing cmd+s unconfigured that breaks the code
vim.keymap.set("n", "<D-s>", ":w<CR>", { noremap = true, silent = true, desc = "Save file (Cmd+S)" })
vim.keymap.set("i", "<D-s>", "<C-O>:w<CR>", { noremap = true, silent = true, desc = "Save file (Cmd+S)" })

--
-- Fugitive mappings (Git)
--
vim.keymap.set("n", "<leader>gs", ":Git<CR>", { noremap = true, silent = true, desc = "Open Git status" })
vim.keymap.set("n", "<leader>gc", ":Git commit<CR>", { noremap = true, silent = true, desc = "Git commit" })
vim.keymap.set("n", "<leader>gp", ":Git push<CR>", { noremap = true, silent = true, desc = "Git push" })
vim.keymap.set("n", "<leader>gl", ":Glog<CR>", { noremap = true, silent = true, desc = "View Git log" })
vim.keymap.set("n", "<leader>gb", ":Gblame<CR>", { noremap = true, silent = true, desc = "Git blame" })
vim.keymap.set("n", "<leader>gd", ":Gdiffsplit<CR>", { noremap = true, silent = true, desc = "Git diff" })
vim.keymap.set("n", "<leader>gr", ":Gread<CR>", { noremap = true, silent = true, desc = "Reset file to last commit" })
vim.keymap.set("n", "<leader>gw", ":Gwrite<CR>", { noremap = true, silent = true, desc = "Stage current file" })


-- Gitlink
vim.api.nvim_set_keymap(
  "n",
  "<leader>gy",
  ":lua require('gitlinker').get_buf_range_url('n')<CR>",
  { silent = true, noremap = true }
)
