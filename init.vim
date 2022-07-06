" Plugins
call plug#begin()
    " Theme
    Plug 'joshdick/onedark.vim'
    Plug 'sheerun/vim-polyglot'

    " Status line
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    " File explorer
    Plug 'preservim/nerdtree'
    Plug 'vifm/vifm.vim'

    " Git tools
    Plug 'airblade/vim-gitgutter'
  
    Plug 'tpope/vim-commentary'

    " AutoSave
    Plug 'Pocco81/AutoSave.nvim'

    " Async
    Plug 'Shougo/vimproc.vim', {'do' : 'make'}

    " Markdown support
    Plug 'godlygeek/tabular'
    Plug 'preservim/vim-markdown'

    " Auto Completion
    Plug 'nvim-treesitter/nvim-treesitter'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'Shougo/echodoc.vim'

    " extra icons
    Plug 'ryanoasis/vim-devicons'

    " For customizing theme
    Plug 'vim-scripts/SyntaxAttr.vim'

    " Highlight css colors
    Plug 'ap/vim-css-color'

    " Discord RPC
    Plug 'andweeb/presence.nvim'
call plug#end()

" Coc Dependencies
" CocInstall coc-tsserver
" CocInstall java
" CocInstall coc-snippets

" not especially needed
set encoding=UTF-8

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" syntax highlighting
set showmatch

" java
let java_highlight_all = 1
" set filetype=java

" autostart

" basic configuration

set clipboard=unnamedplus " always copy yanked data to clipboard

set syntax
colorscheme onedark

let g:airline_theme='deus' " use airline theme from onedark
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tabs_label = '-'

set relativenumber number

set tabstop=4
set shiftwidth=4
set expandtab

set cursorline " show current line highlighted

set noshowmode

set autoindent
set smartindent

set mouse=a

set whichwrap=<,>,h,l " jump to next line when reaching end 

set breakindent " allow keeping indent on auto break

set showtabline=2 " show tabs even if only one is open

set title " show terminal title
set titlestring=%t%(\ %M%)\ %y\ %(\ \(%F\)%)%a\ -\ NVIM

" auto completion
" always show echo
let g:echodoc_enable_at_startup = 1
let g:echodoc#type = 'floating'
" make floatbg more seeable
highlight EchoDocFloat guibg=#000000
" mappings

nnoremap <S-e> :NERDTree<CR>
nnoremap <C-e> :Vifm<CR>
" open small terminal window at bottom
nnoremap <C-t> :belowright split<CR>:term<CR>:resize 15<CR>i
" jump to definition
nnoremap <C-s> :call CocAction('jumpDefinition')<CR>

nnoremap <C-q> :bd<CR>

nnoremap z zz

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

" auto close brackets
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O
