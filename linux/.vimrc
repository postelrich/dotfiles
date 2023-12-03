set nocompatible

filetype off

call plug#begin('~/.vim/plugged')


" File tree browser
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'

" completion and snippets
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'rafamadriz/friendly-snippets'

" misc
Plug 'kylechui/nvim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive' " git
Plug 'nvim-lualine/lualine.nvim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'github/copilot.vim'
Plug 'ggandor/lightspeed.nvim' " Motion
Plug 'ckipp01/nvim-jenkinsfile-linter'
Plug 'ruifm/gitlinker.nvim'
Plug 'gcmt/taboo.vim' " used for renaming ssh tabs

" pop up fuzzy finder
Plug 'nvim-lua/plenary.nvim' " lua functions
Plug 'nvim-telescope/telescope.nvim' " fuzzy finder over lists
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

" language highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} 

" notes
"Plug 'renerocksai/calendar-vim'
"Plug 'renerocksai/telekasten.nvim' 

" theme
Plug 'sainnhe/everforest'

call plug#end()

filetype plugin indent on

let g:python3_host_prog = "/PATH/TO/Python-3.10/bin/python3.10"

"set t_Co=256
if has('termguicolors')
    set termguicolors
endif
set background=dark
let g:everforest_background = 'hard'
colorscheme everforest

set clipboard+=unnamedplus

lua << END
require("nvim-tree").setup()
END
map <F2> :NvimTreeToggle<CR>

" Set tab width
set shiftwidth=4
set tabstop=4
set expandtab
set showcmd

au BufNewFile,BufRead *.py
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set tabstop=4 |
    \ set textwidth=180

au BufNewFile,BufRead *.{js,jsx,html,css,yml,yaml,C,H}
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ set tabstop=2

syntax on
set number
set hlsearch
map ; :
noremap ;; ;
nnoremap <S-tab> :tabprevious<CR>
nnoremap <tab> :tabnext<CR>
nnoremap <C-t> :tabnew<CR>
nnoremap <M-o> <C-i>
nnoremap <leader>tl ^c0<bs> <Esc>
nnoremap <leader>h ^| " go to first non-blank character
nnoremap <leader>l $| " go to last character
map <C-c> :Commands<CR>
nmap <C-/> <Plug>NERDCommenterToggle<CR>
vmap <C-/> <Plug>NERDCommenterToggle<CR>gv
set mouse=a
"set cursorline
"highlight Search ctermfg=lightgreen

" http://vim.wikia.com/wiki/Move_cursor_by_display_lines_when_wrapping
nnoremap <silent> j gj
nnoremap <silent> k gk
vnoremap <silent> j gj
vnoremap <silent> k gk

set ignorecase

" window splitting/movement
set splitbelow
set splitright
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k

" disable line number on terminal
autocmd TermOpen * setlocal nonumber norelativenumber

" highlight log files
au BufNewFile,BufRead *.log,*.out,*.err set filetype=hlog
autocmd FileType hlog syn keyword log_error FATAL ERROR ERRORS FAIL FAILED FAILURE
autocmd FileType hlog syn keyword log_warning WARNING
autocmd FileType hlog hi def log_error guifg='red'
autocmd FileType hlog hi def log_warning guifg='yellow'

" configure treesitter language highlighting 
function! InitTreeSitter()
lua << EOF
require'nvim-treesitter.configs'.setup {
    ensure_installed = {"c", "cpp", "python"},
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false
    },
    indent = {
        enable = true
    },
}
EOF
endfunction
call InitTreeSitter()

" configure nvim-cmp for completion and snippets
let g:completion_enable_snippet = 'vim-vsnip'
lua <<EOF
  -- Set up nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
 cmp.setup.cmdline({ '/', '?' }, {
   mapping = cmp.mapping.preset.cmdline(),
   sources = {
     { name = 'buffer' }
   }
 })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Set up lspconfig.
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['pyright'].setup {
    capabilities = capabilities
  }
  require('lspconfig')['clangd'].setup {
    capabilities = capabilities,
--    cmd = {
--      "clangd",
--      "--offset-encoding=utf-16",
--    }
  }
  -- Use LspAttach autocommand to only map the following keys
  -- after the language server attaches to the current buffer
  vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
      -- Enable completion triggered by <c-x><c-o>
      vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
  
      -- Buffer local mappings.
      -- See `:help vim.lsp.*` for documentation on any of the below functions
      local opts = { buffer = ev.buf }
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    end,
  })
EOF

" vsnip
imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'

nnoremap <c-p> <cmd>Telescope find_files<cr>
"nnoremap <c-g> :lua require('telescope.builtin').live_grep({ additional_args = function(opts) return { "-g !stratcfg/*" } end })<cr>
nnoremap <c-g> :lua require('telescope.builtin').live_grep({})<cr>

" configure gitlinker for getting url to current line
lua << END
require('gitlinker').setup({
  callbacks = {
    ["git.com"] = require"gitlinker.hosts".get_github_type_url,  
  }
})
vim.api.nvim_set_keymap('n', '<leader>gl', '<cmd>lua require"gitlinker".get_buf_range_url({action_callback = require"gitlinker.actions".open_in_browser})<cr>', {silent = true})
vim.api.nvim_set_keymap('v', '<leader>gl', '<cmd>lua require"gitlinker".get_buf_range_url({action_callback = require"gitlinker.actions".open_in_browser})<cr>', {silent = true})
END

" configure zettelkasten for note taking
"lua << END
"local home = vim.fn.expand("~/zettelkasten")
"require('telekasten').setup({
    "home         = home,
    "take_over_my_home = true,
    "auto_set_filetype = true,
    "dailies      = home .. '/' .. 'daily',
    "weeklies     = home .. '/' .. 'weekly',
    "templates    = home .. '/' .. 'templates',
    "image_subdir = "img",
    "extension    = ".md",
    "prefix_title_by_uuid = false,
    "uuid_type = "%Y%m%d%H%M",
    "uuid_sep = "-",
    "follow_creates_nonexisting = true,
    "dailies_create_nonexisting = true,
    "weeklies_create_nonexisting = true,
    "journal_auto_open = false,
    "template_new_note = home .. '/' .. 'templates/new_note.md',
    "template_new_daily = home .. '/' .. 'templates/daily.md',
    "template_new_weekly= home .. '/' .. 'templates/weekly.md',
    "image_link_style = "markdown",
    "sort = "filename",
    "plug_into_calendar = true,
    "calendar_opts = {
        "weeknm = 4,
        "calendar_monday = 0,
        "calendar_mark = 'left-fit',
    "},
    "close_after_yanking = false,
    "insert_after_inserting = true,
    "tag_notation = "#tag",
    "command_palette_theme = "ivy",
    "show_tags_theme = "ivy",
    "subdirs_in_links = true,
    "template_handling = "smart",
    "new_note_location = "smart",
    "-- should all links be updated when a file is renamed
    "rename_update_links = true,
"})
"END
"nnoremap <leader>z :lua require('telekasten').panel()<CR>
"nnoremap <leader>zn :lua require('telekasten').new_note()<CR>
"nnoremap <leader>zd :lua require('telekasten').goto_today({journal_auto_open=true})<CR>
"nnoremap <leader>zg :lua require('telekasten').search_notes()<CR>
"nnoremap <leader>zgn :lua require('telekasten').search_notes({default_text='^\\s*- \\[ \\] .*$'})<CR>
"nnoremap <leader>zt :lua require('telekasten').toggle_todo()<CR>

" alias for python trace
iab trace import pdb; pdb.set_trace()

nnoremap <leader>jv :lua require("jenkinsfile_linter").validate()<CR>

" open terminal in split
nnoremap <leader>st :split term://zsh<CR>
nnoremap <leader>vt :vsplit term://zsh<CR>

" ???
autocmd FileType python setlocal indentkeys-=<:>
autocmd FileType python setlocal indentkeys-=:

" exit terminal mode with ctrl-s
tnoremap <C-s> <C-\><C-n>

"""""""
" ssh "
"""""""
" create named tab and ssh to host
function TabAndSsh(host)
    tabnew
    exe "TabooRename " . a:host
    exe "term ssh  " . a:host
endfunction

command -nargs=1 Ssh call TabAndSsh(<q-args>)

" telescope ssh host picker
lua << END
local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"
local conf = require("telescope.config").values
local ssh_host_picker = function(opts)
    opts = opts or require("telescope.themes").get_dropdown()
    pickers.new(opts, {
        prompt_title = "hosts",
        theme = "dropdown",
        finder = finders.new_table {
            results = { "host1", "host2" }
        },
        sorter = conf.generic_sorter(opts),
        attach_mappings = function(prompt_bufnr, map)
          actions.select_default:replace(function()
            actions.close(prompt_bufnr)
            local selection = action_state.get_selected_entry()
            print(vim.inspect(selection[1]))
            vim.api.nvim_call_function('TabAndSsh', { selection[1] })
          end)
          return true
        end,
    }):find()
end
vim.keymap.set("n", "<leader>sh", ssh_host_picker)

END
"""""""
" /ssh "
"""""""

" statusline config
lua << END
require('lualine').setup{
    sections = { lualine_c = {'%f%m'}},
    inactive_sections = { lualine_c = {'%f%m'}}
}
END

" delete inactive buffers
function! DeleteInactiveBufs()
    "From tabpagebuflist() help, get a list of all buffers in all tabs
    let tablist = []
    for i in range(tabpagenr('$'))
        call extend(tablist, tabpagebuflist(i + 1))
    endfor

    "Below originally inspired by Hara Krishna Dara and Keith Roberts
    "http://tech.groups.yahoo.com/group/vim/message/56425
    let nWipeouts = 0
    for i in range(1, bufnr('$'))
        if bufexists(i) && !getbufvar(i,"&mod") && index(tablist, i) == -1
        "bufno exists AND isn't modified AND isn't in the list of buffers open in windows and tabs
            silent exec 'bwipeout' i
            let nWipeouts = nWipeouts + 1
        endif
    endfor
    echomsg nWipeouts . ' buffer(s) wiped out'
endfunction
nnoremap <leader>qi :call DeleteInactiveBufs()<CR>
