syntax on
set nocompatible
set guifont=PowerlineSymbols:h15
if has('gui_running') 
    set background=dark
    colorscheme Tomorrow-Night-Eighties
endif

""""""""""""""""""""""""
" common configuration "
""""""""""""""""""""""""

filetype on
set textwidth=80
set ai
set bs=2
set showmatch
set laststatus=2
if has('gui_running')
    set ruler
    set hls
    set cursorline
endif

set expandtab
set shiftwidth=4
set tabstop=4

set number
set autoread

set ignorecase
set fileencodings=utf-8,gbk

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

" Use \lx to compile with XeLatex
function CompileXeTex()
    let oldCompileRule=g:Tex_CompileRule_pdf
    let g:Tex_CompileRule_pdf = 'xelatex -aux-directory=F:/Vim/my_latex_doc/temp --synctex=-1 -src-specials -interaction=nonstopmode $*'
    call Tex_RunLaTeX()
    let g:Tex_CompileRule_pdf=oldCompileRule
endfunction
map <Leader>lx :<C-U>call CompileXeTex()<CR>

" ycm
" let g:ycm_server_keep_logfiles = 1
" let g:ycm_server_log_level = 'debug'
" let g:ycm_confirm_extra_conf = 0
let $PATH = '/usr/local/bin:'.$PATH
nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_autoclose_preview_window_after_completion=1
