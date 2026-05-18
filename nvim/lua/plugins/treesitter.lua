return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  build = ":TSUpdate",
  lazy = false,
  config = function()
    local parsers = {
      "c", "cpp", "lua", "vim", "vimdoc", "query",
      "markdown", "markdown_inline",
      "python", "scala",
      "json", "jsonc", "yaml",
      "html", "css",
      "javascript", "typescript", "tsx",
      "php", "proto", "regex", "rust", "bash", "zig",
    }

    require("nvim-treesitter").setup()
    require("nvim-treesitter").install(parsers)

    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        local ft = vim.bo[args.buf].filetype
        local lang = vim.treesitter.language.get_lang(ft) or ft
        if vim.treesitter.language.add(lang) then
          pcall(vim.treesitter.start, args.buf, lang)
          vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
      end,
    })
  end,
}
