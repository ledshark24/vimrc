" Gestion du cas (pénible) de windows
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
	set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
endif


" Vundle gère ses petits tout seul
Plugin 'VundleVim/Vundle.vim'

Plugin 'Raimondi/delimitMate.git'
Plugin 'ervandew/supertab.git'
Plugin 'majutsushi/tagbar.git'
Plugin 'tpope/vim-fugitive.git'
Plugin 'tpope/vim-sensible.git'
Bundle "pangloss/vim-javascript"
Plugin 'TaskList.vim'
Plugin 'kien/rainbow_parentheses.vim' " color-match ()[]{}<> and friends
Plugin 'mattn/emmet-vim' " implementation (expand tags shortcuts) html 'zen'
Plugin 'scrooloose/nerdtree'
Plugin 'roblillack/vim-bufferlist'
Plugin 'scrooloose/syntastic'
Plugin 'chrisbra/csv.vim'
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'ryanoasis/vim-devicons' " -- à conserver à la fin

call vundle#end()            " requis
filetype plugin indent on    " requis

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
	set guifont=Ubuntu_Mono_PNFT_Mono_Plus_Font:h10:cANSI
elseif has("unix")
	" cas linux
	set guifont=Ubuntu\ Mono\ Plus\ Nerd\ File\ Types\ Mono\ Plus\ Font\ Awesome\ Plus\ Octicons\ Plus\ Pomicons\ 14
endif

set encoding=utf-8

" spellchek  -----------------------------------------------------------------------

let mapleader = ","

set spell spelllang=fr
set spellsuggest=double,10

" Appuyer sur ss lancera la correction orthographique
map <leader>ss :setlocal spell!<cr>

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
	" cas windows sans la structure qui va bien
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

"supprimer l'highlighting quand la recherche est finie
nnoremap <leader><space> :noh<cr>

nnoremap <tab> %
vnoremap <tab> %

set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=80
highlight ColorColumn ctermbg=9

" affichage des caractères invisibles
set list!	"afficher les caractères invisibles
set listchars=tab:›\ ,eol:¬,trail:∙	" quels caractères afficher

nnoremap ; :

nnoremap <leader>w <C-w>v<C-w>l

" emmet settings:
let g:user_emmet_settings = {
 \  'php' : {
  \    'extends' : 'html',
  \    'filters' : 'c',
  \  },
  \  'xml' : {
  \    'extends' : 'html',
  \  },
  \  'haml' : {
  \    'extends' : 'html',
  \  },
  \}

" gestion de la souris
set mouse=a

" Airline
let g:airline_powerline_fonts = 1
let g:webdevicons_enable = 1
let g:airline#extensions#tabline#enabled = 1

" gestion du dossier
nnoremap <leader>cd :cd%:p:h<CR>
map <C-n> :NERDTreeToggle<CR>
