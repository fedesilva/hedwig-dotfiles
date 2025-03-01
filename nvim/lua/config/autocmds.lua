-- Automatically format code on save
vim.api.nvim_create_autocmd("BufWritePre", {
  --pattern = "*", -- Run for all files (you can specify filetypes)
  pattern = { "*.lua", "*.py", "*.proto", "*.scala" }, -- Add more extensions if needed
  callback = function()
    if vim.bo.filetype == "scala" then
      local metals = require("metals")
      metals.organize_imports()
      metals.run_scalafix()
    end
    vim.lsp.buf.format({ async = false })
    -- Explicitly write (save) the buffer after formatting
    vim.cmd("write")
  end,
})


-- Automatically create directories before writing the file
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",                                 -- Apply to all files
  callback = function()
    local file = vim.fn.expand("<afile>")        -- Get the full file path
    local dir = vim.fn.fnamemodify(file, ":p:h") -- Extract directory

    -- If the directory does not exist, create it
    if vim.fn.isdirectory(dir) == 0 then
      vim.fn.mkdir(dir, "p") -- "p" flag creates parent directories if needed
    end
  end,
})
