"windows stupid stuff---------------------------------------------------------------
if has("win32")
	source $VIMRUNTIME/vimrc_example.vim
	source $VIMRUNTIME/mswin.vim
	set shellslash
	behave mswin
elseif("unix")
	runtime! debian.vim
endif
	
"Vundle : gestion des plug-ins-------------------------------------------------------

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
if has("win32")
	" cas de windows
	set rtp+=~/vimfiles/bundle/Vundle.vim/
	let path='~/vimfiles/bundle'
call vundle#begin(path)
elseif has("unix")
	" cas linux
	echo "OK linux"
	set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
endif

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
Plugin 'scrooloose/nerdtree'
Plugin 'roblillack/vim-bufferlist'
Plugin 'scrooloose/syntastic'
call vundle#end()            " required
filetype plugin indent on    " required

" Plugins  -------------------------------------------------------------------------
"  Tagbar
nmap <F8> :TagbarToggle<CR>
if has("win32")
	let g:tagbar_ctags_bin = 'C:\Program Files (x86)\ctags58\ctags.exe'
endif


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

"Backup ------------------------------------------------------------------------------------------
set backup " backup on

set history=100	" un historique raisonnable
set undolevels=150

" Suffixes à cacher
set suffixes=.jpg,.png,.jpeg,.gif,.bak,~,.swp,.swo,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,.pyc,.pyo,*~

if filewritable(expand("~/.vim/backup")) == 2
    " comme le répertoire est accessible en écriture,
    " on va l'utiliser.
	set backupdir=$HOME/.vim/backup
elseif has("unix") || has("win32unix")
	" C'est c'est un système compatible UNIX, on
	" va créer le répertoire et l'utiliser.
	call system("mkdir $HOME/.vim/backup -p")
	set backupdir=$HOME/.vim/backup
elseif has("win32")
	" cas windows sans la structure qvb
	set backupdir=c:\tmp,c:\temp,~\AppData\Local\Temp
	set directory=c:\tmp,c:\temp,~\AppData\Local\Temp
endif

set autoread	"relecture automatique quand un fichier est changé par ailleurs

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
set list!	"afficher les caractères invisibles
set listchars=tab:▸\ ,eol:¬	" quels caractères afficher

nnoremap ; :

nnoremap <leader>w <C-w>v<C-w>l
