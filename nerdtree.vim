" Check if Nerdtree is open
function! IsNERDTreeOpen()
    return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Close nerd tree if open, else open nerd tree with current file selected
function! SyncTree()
    if IsNERDTreeOpen()
        NERDTreeToggle
    else
        NERDTreeFind
    endif
endfunction

nnoremap <S-e> :call SyncTree()<CR>

" close nerdtree if open, close buffer, and then reopen nerdtree
function! CloseTreeIfOpen()
    if IsNERDTreeOpen()
        NERDTreeToggle
        bd
        NERDTreeFind
        wincmd p
    endif
endfunction

nnoremap <C-q> :call CloseTreeIfOpen()<CR>
