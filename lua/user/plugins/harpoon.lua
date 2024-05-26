local function keybindings()
    local harpoon = require("harpoon")

    vim.keymap.set("n", "<Leader>hs", function()
        harpoon:list():append()
        print("Saved file to harpoon")
    end)
    vim.keymap.set("n", "<Leader>hf", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

end

local function setup()
    local harpoon = require("harpoon")

    harpoon:setup()

    keybindings()
end

return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    config = setup
}
