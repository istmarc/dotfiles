set nocompatible              " be iMproved, required
filetype on                  " required

" Call the vimrc.plugins file
if filereadable(expand("~/.plugins.vimrc"))
	source ~/.plugins.vimrc
endif

syntax on
" Theme
colorscheme gruvbox
" Background color
set background=dark
" For plug-ins to load correctly
filetype plugin indent on
" Synatx highlighting
syntax on
" Turn off modelines
set modelines=0
" Auto wrap text
set wrap
" Tabs
" set formatoptions=tcqrn1
set tabstop=3
" set softtabstop=3
set shiftwidth=3
set expandtab
set autoindent
set smarttab
set noshiftround
" set ruler
" Fixes common backspace problems
set backspace=indent,eol,start
" Speed up scrolling
set ttyfast
" status bar
" set laststatus=2
"set statusline=%f\ [Format=%{&ff}]\ [Type=%Y]\ [POS=%l,%v]\ [BUFFER=%n]
" set ai
" Enable mouse
set mouse=a
" Show line numbers
set number
" Show command in status line
set showcmd
set showmode
" Show matching brakets
set showmatch
set matchpairs+=<:>
" Display different types of white spaces
set list
set listchars=nbsp:_,tab:>-,trail:~,extends:>
" set listchars=eol:$,nbsp:_,tab:>-,trail:~,extends:>

" Encoding
set encoding=utf-8
" Case insensitive matching
set ignorecase
" Do Smart case matching
set smartcase
" Incremental search
set incsearch
" Auto save befor commands like :next :make
set autowrite
" Hide buffers wen they are abandoned
set hidden
" highlight matching search patterns
set hlsearch
set paste
" Scroll using shift
map <S-Down> <C-F>
map <S-Up> <C-B>

" Pyhton
autocmd FileType python setlocal expandtab shiftwidth=2 softtabstop=2

" C++
autocmd BufNewFile,BufRead *.C set syntax=cpp
autocmd BufNewFile,BufRead *.cxx set syntax=cpp
autocmd BufNewFile,BufRead *.cpp set syntax=cpp
autocmd BufNewFile,BufRead *.cc set syntax=cpp
autocmd BufNewFile,BufRead *.ixx set syntax=cpp
autocmd BufNewFile,BufRead *.icc set syntax=cpp
autocmd BufNewFile,BufRead *.hxx set syntax=cpp
autocmd BufNewFile,BufRead *.hpp set syntax=cpp
autocmd FileType cpp setlocal expandtab shiftwidth=3 softtabstop=3

" Cuda
autocmd BufNewFile,BufRead *.cu set syntax=cuda ft=cuda
autocmd BufNewFile,BufRead *.cuh set syntax=cuda ft=cuda
autocmd FileType cuda setlocal expandtab shiftwidth=3 softtabstop=3

" Julia
autocmd BufNewFile,BufRead *.jl set syntax=julia
autocmd FileType julia setlocal expandtab shiftwidth=3 softtabstop=3

" LaTeX cls files
autocmd BufNewFile,BufRead *.cls set syntax=tex

