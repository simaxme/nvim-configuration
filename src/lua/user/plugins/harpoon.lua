local function keybindings()
    local harpoon = require("harpoon")

    vim.keymap.set("n", "<Leader>hs", function()
        harpoon:list():append()
        print("Saved file to harpoon")
    end)
    vim.keymap.set("n", "<Leader>hl", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
end

local function setup()
    local harpoon = require("harpoon")

    harpoon:setup({
        settings = {
            sync_on_ui_close = true,
            -- key = function()
            --     return vim.loop.cwd()
            -- end,
        }
    })

    keybindings()
end

return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    config = setup
}
