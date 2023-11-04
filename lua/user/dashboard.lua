local db = require('dashboard')
local session_lens = require("auto-session.session-lens")
local utils = require('user.utils')

local custom_center = {}

table.insert(custom_center, {icon='', desc=' Load Session',
    action = session_lens.search_session
})

table.insert(custom_center, {icon='', desc=' Delete Session',
    action = function()
        vim.cmd [[ Autosession delete ]]
    end
})

db.hide_tabline = false
db.custom_center = custom_center

local header = {
    "",
    "",
    "",
    "",
    [[.__   __.  _______   ______   ____    ____  __  .___  ___.]],
    [[|  \ |  | |   ____| /  __  \  \   \  /   / |  | |   \/   |]],
    [[|   \|  | |  |__   |  |  |  |  \   \/   /  |  | |  \  /  |]],
    [[|  . `  | |   __|  |  |  |  |   \      /   |  | |  |\/|  |]],
    [[|  |\   | |  |____ |  `--'  |    \    /    |  | |  |  |  |]],
    [[|__| \__| |_______| \______/      \__/     |__| |__|  |__|]],
    [[                                                          ]],
    "",
    "",
    ""
}

db.setup {
    theme = "doom",
    config = {
        header = header,
        footer = {"Config by SimaxDev"},
        center = custom_center
    }
}
