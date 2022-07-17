local db = require('dashboard')
local session = require('user.session')
local utils = require('user.utils')

local custom_center = {}

local sessions = session.get_last_sessions()
for sessionIndex = 1, #sessions do
    local file = sessions[sessionIndex]
    local fileNameSplits = utils.split(file, '/')
    local fileName1 = fileNameSplits[#fileNameSplits]
    local fileName1Splits = utils.split(fileName1, '%%')
    local fileName2 = fileName1Splits[#fileName1Splits]
    local fileName2Splits = utils.split(fileName2, '%.')
    local fileName = fileName2Splits[#fileName2Splits - 1]
    local last_edited = session.get_file_last_edit_date(file)
    local last_edited_string = os.date("%d.%m", last_edited)

    table.insert(custom_center, {
        icon = '',
        desc = " Open " .. fileName .. ' (' .. last_edited_string .. ')',
        action = 'RestoreSession ' .. file
    })
end

table.insert(custom_center, {icon='', desc=' Load Session', action='Telescope session-lens search_session'})

db.hide_tabline = false
db.custom_center = custom_center
db.custom_header = {
	[[                               ]],
	[[                               ]],
	[[                               ]],
	[[                               ]],
	[[                               ]],
	[[   ▄████▄              ▒▒▒▒▒   ]],
	[[  ███▄█▀              ▒ ▄▒ ▄▒  ]],
	[[ ▐████     █  █  █   ▒▒▒▒▒▒▒▒▒ ]],
	[[  █████▄             ▒▒▒▒▒▒▒▒▒ ]],
	[[   ▀████▀            ▒ ▒ ▒ ▒ ▒ ]],
	[[                               ]],
	[[                               ]],
	[[                               ]],
	[[                               ]],
}
