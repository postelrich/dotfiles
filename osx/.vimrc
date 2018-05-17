set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
let g:python_host_prog = '/Users/cpp974/miniconda2/bin/python'
let g:python3_host_prog = '/Users/cpp974/miniconda2/bin/python'
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
"Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Bundle 'gmarik/vundle'
Bundle 'klen/python-mode'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'ctrlpvim/ctrlp.vim'
" Bundle 'ap/vim-buftabline'
Bundle 'tpope/vim-surround'
Bundle 'flazz/vim-colorschemes'
Bundle 'vim-airline/vim-airline'
Bundle 'vim-airline/vim-airline-themes'
Bundle 'haya14busa/incsearch.vim'
<<<<<<< HEAD:.vimrc
Bundle 'majutsushi/tagbar'
Bundle 'blueshirts/darcula'
" Bundle 'vim-scripts/indentpython.vim'
" Bundle 'sheerun/vim-polyglot'
=======
>>>>>>> 01aaee69e87554ebec3b386f92baf160f5d97e47:osx/.vimrc

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

" Make backspace work
set backspace=indent,eol,start

" Required for Powerline
set guifont=Meslo\ LG\ S\ Regular\ for\ Powerline
let g:airline_powerline_fonts=1
let g:airline_theme='bubblegum'
set laststatus=2

" Toggle NerdTree
map <F2> :NERDTreeToggle<CR>

" Set tab width
set visualbell
set autoindent
set shiftwidth=4
set tabstop=4
set expandtab
set showcmd
set encoding=utf-8

au BufNewFile,BufRead *.py
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set tabstop=4 |
    \ set textwidth=90 |
<<<<<<< HEAD:.vimrc
    "\ set encoding=utf-8 |
=======
>>>>>>> 01aaee69e87554ebec3b386f92baf160f5d97e47:osx/.vimrc

au BufNewFile,BufRead *.{js,jsx,html,css,yml,yaml}
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ set tabstop=2 |

" Syntax highlighting
syntax on
<<<<<<< HEAD:.vimrc
colorscheme darcula
=======
colorscheme candypaper
>>>>>>> 01aaee69e87554ebec3b386f92baf160f5d97e47:osx/.vimrc
set number
nmap <C-l> :set number!<CR>
set hlsearch
map ; :
noremap ;; ;
nnoremap <S-tab> :tabprevious<CR>
nnoremap <tab> :tabnext<CR>
nnoremap <C-t> :tabnew<CR>
nnoremap <leader>tl ^c0<bs> <Esc>
set cursorline
highlight CursorColumn ctermbg=black
highlight CursorLineNr ctermfg=white ctermbg=darkred
highlight Search ctermfg=lightgreen

" http://vim.wikia.com/wiki/Move_cursor_by_display_lines_when_wrapping
nnoremap <silent> j gj
nnoremap <silent> k gk
vnoremap <silent> j gj
vnoremap <silent> k gk

" Ignore case while searching
set ignorecase

" Split new window below current one
set splitbelow

" Say a message
function! Say(msg)
	 echohl IncSearch
	 echo a:msg
	 echohl None
endfunction

" Copy full buffer to OS clipboard.
function! CopyAll()
    normal mzggVG"+y'z
    call Say("Copied.")
endfunction
command A call CopyAll()

" Delete buffer contents and Paste from OS clipboard.
function! PasteFromClipboard()
    normal ggVGd"+p1G
    call Say("Pasted.")
endfunction
command B call PasteFromClipboard()

" Mouse toggle
function! ToggleMouse()
    "check if mouse is enabled
    if &mouse == 'a'
        set mouse=
    else
        set mouse=a
    endif
endfunc
nnoremap m :call ToggleMouse()<CR>
set mouse=a


" Python-mode
" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrencee
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
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
let g:pymode_lint_write = 1
let g:pymode_options_max_line_length = 120

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 0
let g:pymode_breakpoint_bind = '<leader>b'

let g:pymode_rope_completion = 1
let g:pymode_rope_complete_on_dot = 1

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
let g:ctrlp_custom_ignore = {
  \ 'dir': '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(pyc|so|swp)$'
  \ }

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
<<<<<<< HEAD:.vimrc
nmap <F3> :TagbarToggle<CR>
=======
let @e='ofrom IPython import embed; embed()'
set completeopt=menu
>>>>>>> 01aaee69e87554ebec3b386f92baf160f5d97e47:osx/.vimrc
