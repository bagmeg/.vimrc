call plug#begin()

Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }

Plug 'majutsushi/tagbar'

" Plug 'ryanoasis/vim-devicons'

Plug 'scrooloose/syntastic'

Plug 'altercation/solarized'

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

Plug 'itchyny/lightline.vim'

Plug 'sonph/onehalf', { 'rtp': 'vim' }

Plug 'sainnhe/everforest'

Plug 'ctrlpvim/ctrlp.vim'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

call plug#end()

syntax on
syntax enable
filetype plugin indent on

" ============================================
" =============   colorscheme  ===============
" ============================================

" * everforest *
if has('termguicolors')
        set termguicolors
endif

set background=dark

let g:everforest_background = 'hard'
colorscheme everforest

" ============================================
" ==============   lightline  ================
" ============================================
set cursorline
set laststatus=2
set noshowmode

" * onehalf *
"colorscheme onehalflight
"let g:lightline = { 'colorscheme': 'onehalflight' }
"
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

set autowrite

set encoding=UTF-8
set ai
set si
set ci
set ts=4 sts=4 sw=4
set fileencodings=utf-8,euc-kr
set ruler
set mouse=a
" set cc=80
set nowrap

nmap <F5> :TagbarToggle<CR>
nmap <F6> :NERDTreeToggle<CR>

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
let g:syntastic_check_on_wq = 1

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

" ============================================
" ================   vim-go   ================
" ============================================
" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
        let l:file = expand('%')
        if l:file =~# '^\f\+_test\.go$'
                call go#test#Test(0, 1)
        elseif l:file =~# '^\f\+\.go$'
                call go#cmd#Build(0)
        endif
endfunction

let mapleader=","

map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>
" autocmd FileType go nmap <leader>b <Plug>(go-build)
autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>r <Plug>(go-run)
autocmd FileType go nmap <leader>t <Plug>(go-test)
autocmd FileType go nmap <leader>T <Plug>(go-test-func)
autocmd FileType go nmap <leader>c <Plug>(go-coverage-toggle)
" autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

let g:go_list_type = "quickfix"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
"let g:go_def_mode = 'godef'
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_decls_includes = "func,type"

" ============================================
" ===============   yaml set   ===============
" ============================================

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
let g:indentLine_char = '|'

" ============================================
" ===============   nerdtree   ===============
" ============================================
let g:NERDTreeQuitOnOpen=1
