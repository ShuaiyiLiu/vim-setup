syntax on
set nocompatible
set guifont=PowerlineSymbols:h14
set background=dark
colorscheme solarized


""""""""""""""""""""""""
" common configuration "
""""""""""""""""""""""""

set ai
set bs=2
set showmatch
set laststatus=2
set ruler

set expandtab
set shiftwidth=4
set tabstop=4

set cursorline
set number
set autoread

set ignorecase
set fileencodings=utf-8,gbk
set hls

""""""""""""""""""""""""
" bundle configuration "
""""""""""""""""""""""""

" Pathogen
execute pathogen#infect()

" Powerline
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

" vim-latex
" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'
let g:Tex_ViewRule_ps = 'Preview'
let g:Tex_ViewRule_pdf = 'Skim'
let g:Tex_ViewRule_dvi = 'TeXniscope'
