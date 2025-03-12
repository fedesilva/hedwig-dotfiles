local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

if vim.g.gui_vimr ~= nil then
  -- Here goes some VimR specific settings
  vim.o.guifont = "MonaspiceAr Nerd Font:h16"
end

-- --------------------------------------------
-- Set leader key to ','
--
-- Needs to be set before loading plugins :shrug:
-- --------------------------------------------
vim.g.mapleader = ','

require("lazy").setup("plugins")
require("config.keymap")
require("config.options")
require("config.autocmds")
