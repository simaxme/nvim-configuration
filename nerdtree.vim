let g:NERDTreeWinSize=35

" Check if Nerdtree is open
function! IsNERDTreeOpen()
    return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

function! IsCurrentWindowNERDTree()
    return exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) == winnr()
endfunction

" Close nerd tree if open, else open nerd tree with current file selected
function! FindNERDFileIfPossible() 
    if bufname("%") == ""
        NERDTreeToggle
    else
        NERDTreeFind
    endif
endfunction
function! SyncTree()
    if IsNERDTreeOpen()
        if IsCurrentWindowNERDTree()
            wincmd p
        else
            NERDTreeFocus
        endif
    else
         call FindNERDFileIfPossible()
    endif
endfunction

nnoremap <S-e> :call SyncTree()<CR>

function! ToggleNERDTree()
    if IsNERDTreeOpen()
        NERDTreeToggle
    else
        call FindNERDFileIfPossible()
    endif
endfunction
nnoremap <C-e> :call ToggleNERDTree()<CR>

" close nerdtree if open, close buffer, and then reopen nerdtree
function! CloseTreeIfOpen()
    if IsNERDTreeOpen()
        NERDTreeToggle
        bd
        if bufname("%") == ""
            NERDTreeToggle
        else
            NERDTreeFind
        endif
        wincmd p
    else
        bd
    endif
endfunction
function! CloseForceTreeIfOpen()
    if IsNERDTreeOpen()
        NERDTreeToggle
        bd!
        if bufname("%") == ""
            NERDTreeToggle
        else
            NERDTreeFind
        endif
        wincmd p
    else
        bd!
    endif
endfunction

cnoremap x!<CR> call CloseForceTreeIfOpen()<CR>
cnoremap x<CR> call CloseTreeIfOpen()<CR>
nnoremap <C-q> :call CloseTreeIfOpen()<CR>
