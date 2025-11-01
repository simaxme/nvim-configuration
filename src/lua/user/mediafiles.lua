local utils = require("user.utils")

vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function(ev)
    local name = vim.fn.expand("%")


    if utils.stringEndsWithWith(name, ".jpg") or utils.stringEndsWithWith(name, ".png") then
      io.popen("qlmanage -p " .. name)

      vim.cmd("bp|bd#")

      vim.cmd("NvimTreeFocus")
    end
  end
})
