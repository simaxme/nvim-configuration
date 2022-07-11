set shortmess+=I

function! GetCWDTail()
    return fnamemodify(getcwd(), ':t')
endfunction

function! GetSessPath()
    return '~/.local/nvim/sessions/' . GetCWDTail() . '.session'
endfunction

function! SaveSess()
    if NERDTreeIsOpen()
        NERDTreeToggle()
    endif
    execute 'mksession! ' . GetSessPath()
endfunction

function RestoreSess()
    if filereadable(GetSessPath())
        execute 'so ' . GetSessPath()
        if (bufexists(1))
            for l in range(1, bufnr('$'))
                if bufwinnr(l) == -1
                    exec 'sbuffer ' . l
                endif
            endfor
        endif
    endif
endfunction

function! SearchSessionIfNoFile()
    if argc() == 0
        Telescope session-lens search_session
    endif
endfunction

set sessionoptions=buffers
autocmd SessionLoadPost * :silent! Gcd
autocmd VimEnter * call SearchSessionIfNoFile()
autocmd VimLeave * SaveSession
