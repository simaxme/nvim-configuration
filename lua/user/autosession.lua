
require("auto-session").setup {
    auto_restore_enabled = false,
    auto_save_enabled = false,

    post_restore_cmds = {
        function ()
            vim.cmd("NvimTreeToggle")
        end
    }
}

local session_lens = require("session-lens")


vim.api.nvim_create_autocmd("VimLeave", {
    callback = function ()
        vim.cmd("SessionSave")
    end
})


vim.keymap.set("n", "fs", session_lens.search_session, {noremap = true})
