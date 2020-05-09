syntax on
set autoindent
filetype indent plugin on
set background=dark
set nu rnu
set tabstop=4 expandtab shiftwidth=4 softtabstop=4
set path+=**
set wildmenu
set tags=./tags;/
set autochdir
set clipboard=unnamedplus
set t_Co=256
set colorcolumn=80      " Draws a line after 80 chars
set laststatus=2        " For status line & 'itchyny/lightline.vim'
set noshowmode          " To remove duplicate of statusline below

" Syntax complete
set omnifunc=syntaxcomplete#Complete


call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'NLKNguyen/papercolor-theme'
" Plug 'dense-analysis/ale'
Plug 'mechatroner/rainbow_csv' " Rainbow csv
Plug 'luochen1990/rainbow'     " Rainbow parenthesis and htmls
Plug 'itchyny/lightline.vim'   " Powerline like status
Plug 'itchyny/vim-cursorword'  " Underlines the word under cursor
call plug#end()

colorscheme PaperColor


" Removes trailing whitespaces
autocmd BufWritePre *.py :%s/\s\+$//e
autocmd BufWritePre *.pl :%s/\s\+$//e

" Don't have sentences that are a mix of tabs and spaces
autocmd BufWritePre *.py :retab

" check perl code with :make
autocmd FileType perl set makeprg=perl\ -c\ %\ $*
autocmd FileType perl set errorformat=%f:%l:%m
autocmd FileType perl set autowrite

" check batch scripts and formats it as html
"autocmd BufReadPost *.batch set syntax=html

" my perl includes pod
let perl_include_pod = 1

" syntax color complex things like @{${"foo"}}
let perl_extended_vars = 1

" Autocomplete using 'dense-analysis/ale'
let g:ale_completion_enabled = 1

" let g:airline_theme='papercolor'

let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle

