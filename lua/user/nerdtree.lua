vim.g.NERDTreeWinSize=40

vim.cmd [[
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
        Gcd
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

function! ToggleNERDTree()
    if IsNERDTreeOpen()
        NERDTreeToggle
    else
        call FindNERDFileIfPossible()
    endif
endfunction

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
]]

vim.api.nvim_set_keymap("n", "<S-e>", ":call SyncTree()<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<C-e>", ":call ToggleNERDTree()<CR>", {noremap = true})
vim.api.nvim_set_keymap("c", "x!<CR>", "call CloseForceTreeIfOpen()<CR>", {noremap = true})
vim.api.nvim_set_keymap("c", "x<CR>", "call CloseTreeIfOpen()<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<C-q>", ":call CloseTreeIfOpen()<CR>", {noremap = true})
