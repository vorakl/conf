set expandtab
set shiftwidth=4
set softtabstop=4
set autoindent
set pastetoggle=<f12>

set encoding=utf-8
set fileencodings=utf-8
set termencoding=utf-8

colorscheme miromiro
set background=dark
set synmaxcol=2048
execute pathogen#infect()
syntax on
filetype on
filetype plugin on
filetype plugin indent on

set colorcolumn=80
highlight ColorColumn ctermbg=grey guibg=grey

set wildmenu
set wcm=<Tab>
menu Encoding.CP1251   :e ++enc=cp1251<CR>
menu Encoding.CP866    :e ++enc=cp866<CR>
menu Encoding.KOI8-U   :e ++enc=koi8-u<CR>
menu Encoding.UTF-8    :e ++enc=utf-8<CR>
map <F8> :emenu Encoding.<TAB>

set timeoutlen=450
set nocompatible
set nolist
set nobackup
set noswapfile
set laststatus=2
set statusline=%f\ %h%m%r%=[%{&encoding}\ %{&fileformat}\ %{strlen(&ft)?&ft:'none'}\ %{getfperm(@%)}]\ 0x%B\ %12.(%c:%l/%L%)
set numberwidth=5
set ruler
set showcmd
set showmode
set cursorline
set cursorcolumn

map <f3> :w <cr>:!/usr/bin/pep8 % <cr>
imap <f3> <c-o>:w<cr><c-o>:!/usr/bin/pep8 %<cr>
map <f4> :w <cr>:!/usr/bin/python -m doctest % <cr>
imap <f4> <c-o>:w<cr><c-o>:!/usr/bin/python -m doctest %<cr>
map <f5> :w <cr>:!/usr/bin/python % <cr>
imap <f5> <c-o>:w<cr><c-o>:!/usr/bin/python %<cr>
map <f6> :w <cr>:!/bin/bash % <cr>
imap <f6> <c-o>:w<cr><c-o>:!/bin/bash %<cr>
map <f9> :make<cr>
imap <f9> <c-o>:make<cr><c-o>
map <f2> :w<cr>
imap <f2> <c-o>:w<cr>
map <f10> :q!<CR>
imap <f10> <Esc>:q!<CR>
cmap Q q

nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk
inoremap <Down> <c-o>gj
inoremap <Up> <c-o>gk

nnoremap  gT :tabprevious<cr>
inoremap gT <c-o>:tabprevious<cr>
nnoremap  gt :tabnext<cr>
inoremap gt <c-o>:tabnext<cr>
nnoremap <c-t> :tabnew<cr>
inoremap <c-t> <c-o>:tabnew<cr>
nnoremap <c-n> :NERDTreeToggle<cr>
inoremap <c-n> <c-o>:NERDTreeToggle<cr>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
