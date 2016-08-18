set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
"Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Bundle 'gmarik/vundle'
"Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Bundle 'itchyny/lightline.vim'
Bundle 'klen/python-mode'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'kchmck/vim-coffee-script'
Bundle 'ctrlpvim/ctrlp.vim'
Bundle 'ap/vim-buftabline'
Bundle 'tpope/vim-surround'
"Bundle 'terryma/vim-multiple-cursors'
Bundle 'haya14busa/incsearch.vim'
" Bundle 'vim-scripts/indentpython.vim'
" Bundle 'sheerun/vim-polyglot'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Highlight character past column
"augroup vimrc_autocmds
"    autocmd!
"    " highlight characters past column 120
"    autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
"    autocmd FileType python match Excess /\%120v.*/
"    autocmd FileType python set nowrap
"    augroup END

" Make backspace work
set backspace=indent,eol,start

" Required for Powerline
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 9
set laststatus=2

" Toggle NerdTree
map <F2> :NERDTreeToggle<CR>

" Set tab width
set visualbell
set autoindent

au BufNewFile,BufRead *.py
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set tabstop=4 |
    \ set textwidth=90 |
    \ set expandtab |
    \ set encoding=utf-8 |

au BufNewFile,BufRead *.{js,jsx,html,css}
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ set tabstop=2 |
    \ set expandtab |

" Syntax highlighting
syntax on
set number
set hlsearch
map ; :
noremap ;; ;
nnoremap <S-tab> :tabprevious<CR>
nnoremap <tab> :tabnext<CR>
nnoremap <C-t> :tabnew<CR>
set cursorline
highlight CursorColumn ctermbg=black
highlight CursorLineNr ctermfg=white ctermbg=darkred
highlight Search ctermfg=lightgreen

" Mouse toggle
set mouse=a
function! ToggleMouse()
    "check if mouse is enabled
    if &mouse == 'a'
        set mouse=
    else
        set mouse=a
    endif
endfunc
nnoremap m :call ToggleMouse()<CR>


" Python-mode
" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)
let g:pymode_rope = 1

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 0 
let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 0
let g:pymode_breakpoint_bind = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 0
let g:pymode_syntax_all = 0
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0

let NERDTreeIgnore = ['\.pyc$']

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
