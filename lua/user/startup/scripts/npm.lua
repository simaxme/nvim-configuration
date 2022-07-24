local npm = {}

local PACKAGE_JSON = "./package.json"

local json = require('dependencies.jsonlua.json')

npm.prefix = "[NPM] "

function npm.getOptions()
    local file = io.open(PACKAGE_JSON, "r")
    if not file then return {} end
    local content = file:read "*a"
    file.close()

    local jsonContent = json.decode(content)
    local scripts = jsonContent["scripts"]
    if not scripts then return {} end

    local options = {}

    for k, v in pairs(scripts) do
        table.insert(options, k)
    end

    return options
end
function npm.runOption(option)
    return "npm run " .. option
end

return npm
