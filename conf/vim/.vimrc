execute pathogen#infect()

set expandtab
set number
set shiftwidth=4
set softtabstop=4
set autoindent
set pastetoggle=<f12>

set encoding=utf-8
set fileencodings=utf-8
set termencoding=utf-8

set background=dark
set termguicolors
" colorscheme miromiro
" Gruvbox: https://github.com/morhetz/gruvbox/wiki/Installation 
autocmd vimenter * ++nested colorscheme gruvbox
let g:gruvbox_contrast_dark="medium"  "options: soft, medium, hard

set synmaxcol=2048
syntax on
filetype on
filetype plugin on
filetype plugin indent on

set colorcolumn=80

set wildmenu
set wcm=<Tab>
menu Formating.Off         :set nonumber<CR>:set listchars=<CR>
menu Formating.On          :set number<CR>:set listchars=eol:·,tab:\¯\¯<CR>
menu Formating.Number      :set number<CR>
menu Formating.NoNumber    :set nonumber<CR>
menu Formating.EOLchar     :set listchars=eol:·,tab:\¯\¯<CR>
menu Formating.noEOLchar   :set listchars=tab:\¯\¯<CR>
map <F3> :emenu Formating.<TAB>

set timeoutlen=450
set nocompatible
set list
set listchars=eol:·,tab:\¯\¯
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

map <f4> :w <cr>:!/usr/bin/python3 -m pudb % <cr>
imap <f4> <c-o>:w<cr><c-o>:!/usr/bin/python3 -m pudb %<cr>
map <f5> :w <cr>:!/usr/bin/python3 % <cr>
imap <f5> <c-o>:w<cr><c-o>:!/usr/bin/python3 %<cr>
map <f6> :w <cr>:!/bin/bash % <cr>
imap <f6> <c-o>:w<cr><c-o>:!/bin/bash %<cr>
map <f7> :w <cr>:!./% <cr>
imap <f7> <c-o>:w<cr><c-o>:!./%<cr>
map <f8> :make<cr>
imap <f8> <c-o>:make<cr><c-o>
map <f2> :w<cr>
imap <f2> <c-o>:w<cr>
map <f9> :!cat %<cr>
imap <f9> <c-o>:! %<cr>
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
nnoremap <c-l> :set number<cr>
inoremap <c-l> <c-o>:set number<cr>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

