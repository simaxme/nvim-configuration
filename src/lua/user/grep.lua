local grep = {}

function grep.grep()
    vim.ui.input({
        prompt = "Suchen"
    }, function (input)
        if input then
            vim.cmd("vimgrep /" .. input .. "/g ")

            vim.cmd("echo '" .. input .. "'")
        end
    end)
end

return grep
