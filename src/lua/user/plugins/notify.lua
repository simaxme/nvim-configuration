return {
  {
    "rcarriga/nvim-notify",
    commit = "397c7c1184745fca649e5104de659e6392ef5a4d",
    config = function()
      vim.notify = require("notify")
    end
  }
}
