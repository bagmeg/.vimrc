call plug#begin()

Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }

Plug 'preservim/nerdtree'

Plug 'majutsushi/tagbar'

" Plug 'ryanoasis/vim-devicons'

Plug 'scrooloose/syntastic'

Plug 'altercation/solarized'

call plug#end()

syntax on
syntax enable
filetype plugin indent on

" set
" General
set number              " Show line numbers
set linebreak           " Break lines at word (requires Wrap lines)
set textwidth=80        " Line wrap (number of cols)
set showmatch           " Highlight matching brace

set noic                        " Case sensitive search use \c for one time ignorecase search
set hlsearch            " Highlight all search results
set smartcase           " Enable smart-case search
set incsearch           " Searches for strings incrementally

set autoindent          " Auto-indent new lines
set shiftwidth=4        " Number of auto-indent spaces
set smartindent         " Enable smart-indent
set smarttab            " Enable smart-tabs
set softtabstop=4       " Number of spaces per Tab

set encoding=UTF-8
set ai
set si
set ci
set ts=4 sts=4 sw=4
set fileencodings=utf-8,euc-kr
set ruler
set mouse=
set cc=80
set nowrap

nmap <F5> :TagbarToggle<CR>

let kernel_src_home=$PWD
if filereadable(kernel_src_home . "/cscope.out")
    set sw=8 ts=8 sts=8
    exe "set tags+=" . kernel_src_home . "/tags"
    exe "cscope add " . kernel_src_home . "/cscope.out"
endif

" syntastics setting
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" enable omnicompletion
set omnifunc=syntaxcomplete#Complete

" Configure menu behavior
" http://vim.wikia.com/wiki/VimTip1386
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" Use Ctrl+Space for omni-completion
" https://stackoverflow.com/questions/510503/ctrlspace-for-omni-and-keyword-completion-in-vim
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
  \ "\<lt>C-n>" :
  \ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
  \ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
  \ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>

" Popup menu hightLight Group
highlight Pmenu ctermbg=13 guibg=LightGray
highlight PmenuSel ctermbg=7 guibg=DarkBlue guifg=White
highlight PmenuSbar ctermbg=7 guibg=DarkGray
highlight PmenuThumb guibg=Black

" Enable global scope search
let OmniCpp_GlobalScopeSearch = 1
" Show function parameters
let OmniCpp_ShowPrototypeInAbbr = 1
" Show access information in pop-up menu
let OmniCpp_ShowAccess = 1
" Auto complete after '.'
let OmniCpp_MayCompleteDot = 1
" Auto complete after '->'
let OmniCpp_MayCompleteArrow = 1
" Auto complete after '::'
let OmniCpp_MayCompleteScope = 0
" Don't select first item in pop-up menu
let OmniCpp_SelectFirstItem = 0
