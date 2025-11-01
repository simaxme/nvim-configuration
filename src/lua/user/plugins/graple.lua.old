local function setup()
    vim.keymap.set("n", "<leader>gs", function()
        require("grapple").toggle()

        vim.notify("File saved")
    end)
    vim.keymap.set("n", "<leader>gl", require("grapple").toggle_tags)
end

return {
    "cbochs/grapple.nvim",
    dependencies = {
        { "nvim-tree/nvim-web-devicons", lazy = true }
    },
    config = setup
}
