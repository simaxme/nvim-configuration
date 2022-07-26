local x = {}

vim.g.NERDTreeWinSize=40
vim.g.NERDTreeMinimalUI = 1
vim.g.NERDTreeShowHidden = 1


function isNERDTreeOpen()
    return vim.fn.exists("t:NERDTreeBufName") == 1 and vim.fn.bufwinnr(vim.t.NERDTreeBufName) ~= -1
end
function isCurrentWindowNERDTree()
    return vim.fn.exists("t:NERDTreeBufName") == 1 and vim.fn.bufwinnr(vim.t.NERDTreeBufName) == vim.fn.winnr()
end

function findNERDFileIfPossible()
    if vim.fn.bufname("%") == "" then
        vim.cmd [[NERDTreeToggle]]
    else
        vim.cmd [[silent! Gcd]]
        vim.cmd [[NERDTreeFind]]
    end
end

function x.syncTree()
    if isNERDTreeOpen() then
        if isCurrentWindowNERDTree() then
            vim.cmd [[wincmd p]]
        else
            vim.cmd [[NERDTreeFocus]]
        end
    else
        findNERDFileIfPossible()
    end
end

function x.toggleNERDTree()
    if isNERDTreeOpen() then
        vim.cmd [[NERDTreeToggle]]
    else
        findNERDFileIfPossible()
    end
end

function x.closeTreeIfOpen()
    if isNERDTreeOpen() then
        vim.cmd [[
        NERDTreeToggle
        bd
        if bufname("%") == ""
            NERDTreeToggle
        else
            NERDTreeFind
        endif
        wincmd p
        ]]
    else
        vim.cmd [[bd]]
    end
end

vim.api.nvim_set_keymap("n", "<S-e>", ":lua require'user.nerdtree'.syncTree()<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<C-e>", ":lua require'user.nerdtree'.toggleNERDTree()<CR>", {noremap = true})
vim.api.nvim_set_keymap("c", "x<CR>", ":lua require'user.nerdtree'.closeTreeIfOpen()<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<C-q>", ":lua require'user.nerdtree'.closeTreeIfOpen()<CR>", {noremap = true})

return x
