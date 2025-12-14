return {
  {
    'lewis6991/gitsigns.nvim',
    commit = '5813e4878748805f1518cee7abb50fd7205a3a48',

    config = function()
      require('gitsigns').setup({
        current_line_blame = true,
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = 'right_align',
          delay = 3000
        }
      })
    end
  }
}
