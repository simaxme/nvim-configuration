return {
  {
    "folke/snacks.nvim",
    version = "2.30.0",
    priority = 1000,
    opts = {
      input = {
        enabled = true,
      },
      picker = {
        enabled = true,
        ui_select = true
      },

      styles = {
        input = {
          relative = "cursor",
          row = 1,
          col = 0
        }
      }
    }
  }
}
