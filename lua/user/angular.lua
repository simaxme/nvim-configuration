-- Create Angular Components through nerdtree menu
local x = {}

function x.createComponent(componentType)
    local selected = vim.api.nvim_eval("g:NERDTreeDirNode.GetSelected().path.str()")
    local componentName = vim.fn.input(componentType .. " name: ", "", "file")

    io.popen("cd " .. selected .. " && ng generate " .. componentType .. " " .. componentName):read()

    vim.cmd [[NERDTreeRefreshRoot]]
    vim.cmd [[
    wincmd p
    NERDTreeFocus
    wincmd p
    ]]
    vim.cmd ([[ene|e ]] .. selected .. "/" .. componentName .. "." .. componentType .. ".ts")
    vim.cmd [[echo 'Created Schematic']]
end

function addAngularHotkey(hotkey, componentName)
    vim.cmd (
        [[autocmd FileType nerdtree nmap <buffer> ]] .. hotkey .. [[ :lua require'user.angular'.createComponent(']] ..componentName .. [[')<CR>]]
    )
end

local loaded = false
function x.init()
    if loaded then
        return
    end
    loaded = true

    addAngularHotkey("gc", "component")
    addAngularHotkey("gs", "service")
    addAngularHotkey("gd", "directive")
    addAngularHotkey("gm", "module")
end

vim.cmd [[autocmd VimEnter * lua require'user.angular'.init()]]

return x
