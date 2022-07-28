x = {}

require('telescope').setup {
    defaults = {
        path_display = {"smart"}
    }
}
require('telescope').load_extension('session-lens')
require('auto-session').setup {
    auto_save_enabled = false,
    auto_restore_enabled = false
}
require('session-lens').setup {
    path_display={'shorten'},
}

vim.cmd [[
    set sessionoptions=buffers
]]

vim.cmd [[
    autocmd SessionLoadPost * :silent! Gcd
    autocmd VimLeave * SaveSess
]]

local SESSION_FOLDER = os.getenv('HOME') .. '/.local/share/nvim/sessions'
local MAX_SESSION_OPTIONS = 5 -- only show last 5 sessions

function x.get_file_last_edit_date(path)
    return io.popen("stat -c %Y " .. path):read()
end

local scan = require'plenary.scandir'
function x.get_last_sessions()
    local arr = scan.scan_dir(SESSION_FOLDER, { hidden = true, depth = 0 });
    table.sort(arr, function(a, b)
        return x.get_file_last_edit_date(a) > x.get_file_last_edit_date(b)
    end)
    if #arr > MAX_SESSION_OPTIONS then
        return { arr[1], arr[2], arr[3], arr[4], arr[5] }
    else
        return arr
    end
end


return x
