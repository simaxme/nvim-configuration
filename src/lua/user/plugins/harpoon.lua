return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  commit = "87b1a3506211538f460786c23f98ec63ad9af4e5",
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup()

    vim.keymap.set("n", "<Leader>hl", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
    vim.keymap.set("n", "<Leader>hs", function() harpoon:list():add() end)

    for i = 1, 10 do
      local key_number = i
      if i == 10 then key_number = 0 end
      vim.keymap.set("n", "<Leader>" .. key_number, function() harpoon:list():select(i) end, {
        noremap = true,
        desc = "Open harpoon entry " .. i
      })
    end

    require("user.harpoon_utils")
  end
}
