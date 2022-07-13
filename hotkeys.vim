" mappings

" also start nerdtree at startup
autocmd VimEnter * :silent! Gcd " | NERDTree | wincmd p
nnoremap <S-t> :Vifm<CR>
" open small terminal window at bottom
nnoremap <C-t> :belowright split<CR>:term<CR>:resize 8<CR>i
" (BACKUP for opening in new tab) nnoremap <C-s> :call CocAction('jumpDefinition', 'tab drop')<CR>

" map leader key to space
map <Space> <Leader>

" Comment
let g:NERDSpaceDelims = 1
nnoremap <Leader><Tab> :call nerdcommenter#Comment('n', 'Toggle')<CR>
vnoremap <Leader><Tab> :call nerdcommenter#Comment('x', 'Toggle')<CR>

" tab selection
vmap <Tab> >gv
vmap <S-Tab> <gv

nnoremap z zz
" don't yank newline symbol
nnoremap yy ^vg_y

" exit in terminal mode
tnoremap <Esc> <C-\><C-n>

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<CR>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

inoremap <silent><expr> <c-space> coc#refresh()
