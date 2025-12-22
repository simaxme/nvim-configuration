return {
  {
    "nvim-telescope/telescope.nvim",
    version = "0.2.0",

    dependencies = {
      "nvim-lua/plenary.nvim"
    },

    config = function()
      -- Telescope
      vim.keymap.set("n", "ff", "<cmd>Telescope find_files<CR>",
        { noremap = true, desc = "Search for files based on their filenames in cwd" })
      vim.keymap.set("n", "fg", "<cmd>Telescope live_grep<CR>",
        { noremap = true, desc = "Search for files based on their contents in cwd" })
      vim.keymap.set("n", "fb", function()
        require("telescope.builtin").buffers(require("telescope.themes").get_dropdown({ previewer = false }))
      end, { noremap = true, desc = "Search in all loaded buffers" })
    end
  }
}
