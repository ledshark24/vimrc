"windows stupid stuff---------------------------------------------------------------
if has("win32")
	source $VIMRUNTIME/vimrc_example.vim
	source $VIMRUNTIME/mswin.vim
	set shellslash
	behave mswin
endif
	
"Vundle : gestion des plug-ins-------------------------------------------------------

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
if has("win32")
	" cas de windows
	set rtp+=~/vimfiles/bundle/Vundle.vim/
	let path='~/vimfiles/bundle'
elseif has("unix")
	" cas linux
	set rtp+=~/.vim/bundle/Vundle.vim
endif
call vundle#begin(path)

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'Raimondi/delimitMate.git'
Plugin 'ervandew/supertab.git'
Plugin 'majutsushi/tagbar.git'
Plugin 'tpope/vim-fugitive.git'
Plugin 'tpope/vim-sensible.git'
Bundle "pangloss/vim-javascript"
Plugin 'TaskList.vim'
"Plugin 'bsl/obviousmode' " show which mode you are in with colors
Plugin 'kien/rainbow_parentheses.vim' " color-match ()[]{}<> and friends
Plugin 'mattn/emmet-vim' " implementation (expand tags shortcuts) html 'zen'

call vundle#end()            " required
filetype plugin indent on    " required

" Plugins  -------------------------------------------------------------------------
"  Tagbar
nmap <F8> :TagbarToggle<CR>



"Couleurs & polices ----------------------------------------------------------------
" syntaxe toujours à on
syntax on
set background=dark
colorscheme desert

if has("win32")
	" cas windows
	set guifont=Consolas:h11:cANSI
elseif has("unix")
	" cas linux
	" TODO
endif

set encoding=utf-8

" spellchek  -----------------------------------------------------------------------


let mapleader = ","

set spell spelllang=fr
set spellsuggest=double,10

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=
"-----------------------------------------------------------------------------------

" statusline
set statusline=%<\ %n:%f\ %m%r%y%{fugitive#statusline()}%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)

" auto complétion
set omnifunc=syntaxcomplete#Complete

set modelines=0

" gestion des tabulations
set tabstop=4
set shiftwidth=4
set softtabstop=4


set backup " backup on
if has("win32")
	" cas windows
	set backupdir=.,c:\tmp,c:\temp
	set directory=.,c:\tmp,c:\temp
elseif has("unix")
	"cas linux
	"TODO
endif

set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2

set number
set undofile


nnoremap / /\v
vnoremap / /\v

set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch

nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85

" affichage des caractères invisibles
set list
set listchars=tab:>\ ,eol:¬

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

nnoremap ; :

nnoremap <leader>ft Vatzf

nnoremap <leader>w <C-w>v<C-w>l

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
