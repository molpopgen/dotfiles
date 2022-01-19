call plug#begin('~/.config/nvim/plugged')
"
" The relevant tools to install manually are:
" coc-clangd
" coc-rust-analyzer
" coc-pyright
" All are done via :CocInstall foo
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'lervag/vimtex'
Plug 'bfrg/vim-cpp-modern'
Plug 'altercation/vim-colors-solarized'
Plug 'cocopon/iceberg.vim/'
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
Plug 'rykka/riv.vim'
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

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


" -| latex |-
let $GDK_SCALE=1
let g:tex_flavor='latex'
let g:vimtex_fold_types = {}
let g:vimtex_view_method = 'zathura'
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_view_general_viewer = 'zathura'
let g:vimtex_view_general_options = '--unique @pdf\#src:@tex:@line:@col'
let g:vimtex_view_general_options_latexmk = '--unique'
let g:vimtex_complete_recursive_bib = 1

let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_class_member_highlight = 1

" The first line only enables ALE features that I ask for
let g:ale_linters_explicit = 1
let g:ale_linters = {'python': ['flake8', 'mypy'],
            \        'tex': ['lacheck', 'chktex'],
            \        'rust': ['rust-analyzer']}
let g:ale_fixers = {'python': ['black', 'isort'],
            \       'tex': ['latexindent'],
            \       'rust': ['rustfmt']}

"
" Code auto-formatting
autocmd FileType cpp nnoremap <F6> :ClangFormat<CR>
autocmd FileType python nnoremap <F6> :ALEFix<CR>
autocmd FileType rust nnoremap <F6> :ALEFix<CR>

" make backspaces more powerfull
set backspace=indent,eol,start

set ruler               " show line and column number
syntax on   			" syntax highlighting
set showcmd 			" show (partial) command in status line
" let g:solarized_termcolors=256
set termguicolors
set background=dark
let g:lightline = { 'colorscheme': 'iceberg' }
colorscheme iceberg

"" vimwiki uses markdown
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
" Prevent vimwiki from mucking about with md 
" files not in your wiki
let g:vimwiki_global_ext = 0

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
