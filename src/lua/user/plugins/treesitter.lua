return {
  'nvim-treesitter/nvim-treesitter',
  commit = "2979e048b356cfd32dc419d5803dc356b9832adf",

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
