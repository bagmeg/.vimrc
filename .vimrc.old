call plug#begin()

Plug 'preservim/nerdtree'

Plug 'ryanoasis/vim-devicons'

Plug 'vim-airline/vim-airline-themes'

Plug 'sonph/onehalf', { 'rtp': 'vim' }

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

Plug 'dense-analysis/ale'

call plug#end()

set nu
set nocompatible
set cursorline
set cursorcolumn

set mouse=a

set t_Co=256

set encoding=UTF-8
set shiftwidth=4
set tabstop=4
set expandtab
set nobackup
set scrolloff=10
set nowrap
set incsearch
set ignorecase
set smartcase
set showcmd
set showmode
set showmatch
set hlsearch
set history=1000
set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

filetype on
filetype plugin on
filetype indent on

syntax on

autocmd Filetype yaml setlocal tabstop=2 shiftwidth=2 expandtab
autocmd Filetype yml setlocal tabstop=2 shiftwidth=2 expandtab

colorscheme onehalfdark
let g:airline_theme='onehalfdark'

" STATUS LINE ------------------------------------------------------------ {{{

" Clear status line when vimrc is reloaded.
set statusline=

" Status line left side.
set statusline+=\ %F\ %M\ %Y\ %R

" Use a divider to separate the left side from the right side.
set statusline+=%=

" Status line right side.
set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%

" Show the status on the second to last line.
set laststatus=2

" }}}

" KEY BINDING ------------------------------------------------------------ {{{

" NERDTREE
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" }}}

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" airline
let g:airline#extensions#ale#enabled = 1

" ale
let g:ale_linters = {}
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠'

" ale
:call extend(g:ale_linters, {
    \"go": ['gopls', 'golint', 'go vet'], })

" vim-go
let g:go_auto_type_info = 1
let g:go_info_mode = 'gopls'
let g:go_auto_sameids = 1
let g:go_fmt_command = 'gopls'

let g:go_fold_enable = ['block', 'import', 'varconst', 'package_comment']
let g:go_highlight_diagnostic_errors = 1
let g:go_highlight_diagnostic_warnings = 1

let g:go_highlight_functions = 1
let g:go_highlight_types = 1

let g:ale_go_gopls_executable = 'gopls'
