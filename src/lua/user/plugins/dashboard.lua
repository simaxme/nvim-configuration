local function setup()
    local db = require('dashboard')

    local custom_center = {}

    table.insert(custom_center, {icon='', desc=' Load Session',
        action = function ()
            require('telescope').extensions.possession.list()
        end
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
            footer = {"Config by simaxme"},
            center = custom_center
        }
    }
end

return {
    'glepnir/dashboard-nvim',
    config = setup
}
