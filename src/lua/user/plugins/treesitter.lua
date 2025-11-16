return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  branch = "main",
  build = ":TSUpdate",

  config = function()
    require("nvim-treesitter").install({
      "typescript",
      "java",
      "bash",
      "html",
      "lua",
      "vim",
      "python",
      "css",
      "scss",
      "json",
      "tsx",
      "javascript",
      "nix",
      "kotlin", -- for kotlin scripts,
      "angular",
      "dockerfile",
      "php",
      "rust"
    })

    vim.api.nvim_create_autocmd('FileType', {
      callback = function()
        if not pcall(vim.treesitter.start) then return end
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end
}
