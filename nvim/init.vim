call plug#begin('~/.config/nvim/plugged')
Plug 'ycm-core/YouCompleteMe'
Plug 'lervag/vimtex'
Plug 'bfrg/vim-cpp-modern'
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-fugitive'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-pandoc/vim-rmarkdown'
Plug 'vimwiki/vimwiki'
Plug 'psf/black'
Plug 'rust-lang/rust.vim'
Plug 'dense-analysis/ale'
Plug 'rhysd/vim-clang-format'
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
" Plug 'GCBallesteros/vim-autocite'
" Plug 'xolox/vim-misc'
" Plug 'xolox/vim-easytags'
call plug#end()

set number
" set exrc
" set secure

"The stuff below is from http://stackoverflow.com/questions/65076/how-to-setup-vim-autoindentation-properly-for-editing-python-files-py
"" configure expanding of tabs for various file types
au BufRead,BufNewFile *.py set expandtab
au BufRead,BufNewFile *.c set expandtab
au BufRead,BufNewFile *.h set expandtab
au BufRead,BufNewFile Makefile* set noexpandtab

" --------------------------------------------------------------------------------
" configure editor with tabs and nice stuff...
" --------------------------------------------------------------------------------
set expandtab           " enter spaces when tab is pressed
set textwidth=120       " break lines when line length increases
set tabstop=4           " use 4 spaces to represent tab
set softtabstop=4
set shiftwidth=4        " number of spaces to use for auto indent
set autoindent          " copy indent from current line when starting a new line

" -| Terminal settings |-
" Allow for escape to go to normal mode in terminal
tnoremap <Esc> <C-\><C-n>
" allow A-h,j,k,l for movement
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
tnoremap <M-b> <Esc>b
tnoremap <M-f> <Esc>f

" clang-rename
au FileType c,cpp nmap <buffer><silent>,lr <Plug>(clang_rename-current)


" -| latex |-
let $GDK_SCALE=1
let g:tex_flavor='latex'
let g:vimtex_fold_envs = 0
let g:vimtex_view_method = 'zathura'
let g:vimtex_latexmk_progname = 'nvr'
let g:vimtex_view_general_viewer = 'zathura'
let g:vimtex_view_general_options = '--unique @pdf\#src:@tex:@line:@col'
let g:vimtex_view_general_options_latexmk = '--unique'
let g:vimtex_complete_recursive_bib = 1

let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_class_member_highlight = 1

" YCM
" let g:ycm_python_binary_path = 'python3'

" The first line only exables ALE features that I ask for
let g:ale_linters_explicit = 1
let g:ale_linters = {'python': ['flake8', 'mypy'],
            \        'tex': ['lacheck', 'chktex']}
let g:ale_fixers = {'python': ['black', 'isort'],
            \       'tex': ['latexindent']}

"
" Code auto-formatting
autocmd FileType cpp nnoremap <F6> :ClangFormat<CR>
autocmd FileType python nnoremap <F6> :ALEFix<CR>

" make backspaces more powerfull
set backspace=indent,eol,start

set ruler               " show line and column number
syntax on   			" syntax highlighting
set showcmd 			" show (partial) command in status line
let g:solarized_termcolors=256
set background=dark
colorscheme solarized

"" vimwiki uses markdown
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
