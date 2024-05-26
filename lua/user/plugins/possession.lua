local function setup()
    local possession = require("nvim-possession")

    possession.setup({
        post_hook = function ()
            vim.cmd("silent bufdo NvimTreeRefresh")
            vim.cmd("NvimTreeToggle")
        end
    })

    vim.keymap.set("n", "sl", function()
        possession.list()
    end)
    vim.keymap.set("n", "sn", function()
        possession.new()
    end)
    vim.keymap.set("n", "su", function()
        possession.update()
    end)
    vim.keymap.set("n", "sd", function()
        possession.delete()
    end)
end

return {
    'gennaro-tedesco/nvim-possession',
    dependencies = {
        "ibhagwan/fzf-lua"
    },
    config = setup
}
