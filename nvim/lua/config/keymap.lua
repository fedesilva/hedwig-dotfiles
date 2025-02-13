-- Set leader key to ','
vim.g.mapleader = ','

-- Save one key stroke by remapping semicolon to colon
vim.api.nvim_set_keymap('n', ';', ':', { noremap = true })

-- When wrapping, do not jump to next line
vim.api.nvim_set_keymap('n', 'j', 'gj', { noremap = true })
vim.api.nvim_set_keymap('n', 'k', 'gk', { noremap = true })

-- Tree Mappings
vim.api.nvim_set_keymap('n', '<leader>n', ':Neotree toggle<CR>', { noremap = true })
-- vim.api.nvim_set_keymap('n', '<leader>f', 'NvimTreeFocus<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>m', ':Neotree close<CR>', { noremap = true })

-- vim.api.nvim_set_keymap('n', '<leader>n', ':NvimTreeToggle<CR>', { noremap = true })
-- vim.api.nvim_set_keymap('n', '<leader>f', 'NvimTreeFocus<CR>', { noremap = true })
-- vim.api.nvim_set_keymap('n', '<leader>m', ':NvimTreeClose<CR>', { noremap = true })

-- No highlight search mapping
-- vim.api.nvim_set_keymap('n', '<Leader>/', ':nohlsearch<CR>', { noremap = true })

-- Toggle wrapping
vim.api.nvim_set_keymap('n', '<Leader>w', ':set wrap! wrap?<CR>', { noremap = true })


-- Buffer management mappings
vim.api.nvim_set_keymap('n', '<leader>x', ':bd<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>b', ':b ', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>q', ':qall', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>Q', ':qall<CR>', { noremap = true })

-- Navigation between buffers
vim.api.nvim_set_keymap('n', '<c-j>', ':bprev!<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<c-k>', ':bnext!<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<c-a>', ':b# <CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>a', ':b# <CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>x', ':bd <CR>', { noremap = true })


-- Mappings to reload configuration files
vim.api.nvim_set_keymap('n', ',uv', ':source ~/.config/nvim/init.lua<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', ',uk', ':source ~/.config/nvim/lua/config/keymap.lua<CR>', { noremap = true })

-- Toggle number settings
vim.api.nvim_set_keymap('n', '<leader>l0', ':set relativenumber!<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>l1', ':set number!<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>l-', ':set nonumber<CR>', { noremap = true })


-- FzF mappings
vim.api.nvim_set_keymap('n', '<leader>lb', ':FzfLua buffers<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>lf', ':FzfLua files<CR>', { noremap = true })


