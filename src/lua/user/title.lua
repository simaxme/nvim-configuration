vim.cmd [[
    set title " show terminal title

    function! GetCWDTail()
        return fnamemodify(getcwd(), ":t")
    endfunction

    set titlestring=%{GetCWDTail()}\ %(\ \(%f\)%)%a\ -\ NVIM
]]
