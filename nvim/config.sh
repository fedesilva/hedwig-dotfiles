#!/bin/bash

set -e  # Exit on error

NVIM_DIR="$HOME/.config/nvim"
LUA_DIR="$NVIM_DIR/lua"
PLUGINS_DIR="$LUA_DIR/plugins"
CONFIG_DIR="$LUA_DIR/config"

# Function to backup existing files
backup_file() {
  local file="$1"
  if [ -f "$file" ]; then
    mv "$file" "$file.bak"
  fi
}

echo "Setting up Neovim configuration..."

# Backup old init.lua
backup_file "$NVIM_DIR/init.lua"

# Create necessary directories
mkdir -p "$PLUGINS_DIR" "$CONFIG_DIR"

# Clean init.lua
cat <<EOF > "$NVIM_DIR/init.lua"
require("config.keymap")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")
require("config.options")
EOF

echo "Created clean init.lua"

# Create plugins/init.lua
cat <<EOF > "$PLUGINS_DIR/init.lua"
return {
  require("plugins.cmp"),
  require("plugins.treesitter"),
  require("plugins.lsp"),
  require("plugins.neo-tree"),
  require("plugins.lualine"),
  require("plugins.bufferline"),
  require("plugins.flash"),
  require("plugins.metals"),
  require("plugins.fugitive"),
  require("plugins.colorscheme"),
}
EOF

echo "Created plugins/init.lua"

# Create individual plugin files
cat <<EOF > "$PLUGINS_DIR/cmp.lua"
return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/vim-vsnip",
  },
  config = function()
    local cmp = require("cmp")
    cmp.setup({
      snippet = {
        expand = function(args)
          vim.fn["vsnip#anonymous"](args.body)
        end,
      },
      mapping = {
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function()
          if cmp.visible() then
            cmp.select_prev_item()
          end
        end, { "i", "s" }),
      },
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "vsnip" },
      }, {
        { name = "buffer" },
      }),
    })
  end,
}
EOF

cat <<EOF > "$PLUGINS_DIR/treesitter.lua"
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "python", "scala" },
      auto_install = true,
      highlight = { enable = true },
    })
  end,
}
EOF

cat <<EOF > "$PLUGINS_DIR/lsp.lua"
return {
  "neovim/nvim-lspconfig",
  config = function()
    require("lspconfig").tsserver.setup({})
    require("lspconfig").lua_ls.setup({})
  end,
}
EOF

cat <<EOF > "$PLUGINS_DIR/neo-tree.lua"
return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({})
  end,
}
EOF

cat <<EOF > "$PLUGINS_DIR/lualine.lua"
return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require("lualine").setup()
  end,
}
EOF

cat <<EOF > "$PLUGINS_DIR/bufferline.lua"
return {
  "akinsho/bufferline.nvim",
  config = function()
    require("bufferline").setup()
  end,
}
EOF

cat <<EOF > "$PLUGINS_DIR/flash.lua"
return {
  "folke/flash.nvim",
  event = "VeryLazy",
  opts = {},
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
}
EOF

cat <<EOF > "$PLUGINS_DIR/metals.lua"
return {
  "scalameta/nvim-metals",
  dependencies = { "nvim-lua/plenary.nvim" },
  ft = { "scala", "sbt", "java" },
  opts = function()
    local metals_config = require("metals").bare_config()
    return metals_config
  end,
  config = function(self, metals_config)
    local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
    vim.api.nvim_create_autocmd("FileType", {
      pattern = self.ft,
      callback = function()
        require("metals").initialize_or_attach(metals_config)
      end,
      group = nvim_metals_group,
    })
  end
}
EOF

cat <<EOF > "$PLUGINS_DIR/fugitive.lua"
return {
  "tpope/vim-fugitive"
}
EOF

cat <<EOF > "$PLUGINS_DIR/colorscheme.lua"
return {
  "Mofiqul/dracula.nvim",
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  "rebelot/kanagawa.nvim"
}
EOF

echo "Plugin files created."

echo "Neovim configuration setup complete. You can now start Neovim!"

