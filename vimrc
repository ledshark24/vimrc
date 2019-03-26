" Gestion du cas (pénible) de windows
if has("win32")
	source $VIMRUNTIME/vimrc_example.vim	" vimrc par défaut
"	source $VIMRUNTIME/mswin.vim			" options pour ne pas égarer l'utilisateur
	set shellslash							" compatibilité mswin pour espace dans les noms de fichier
	behave mswin
elseif("unix")
	runtime! debian.vim						" vimrc par défaut
endif

"Vundle : gestion des plug-ins--------------------------------------------------

set nocompatible							" be iMproved, required
filetype off								 " required

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
Plugin 'kien/rainbow_parentheses.vim'		" color-match ()[]{}<> and friends
Plugin 'mattn/emmet-vim'					" implementation (expand tags shortcuts) html 'zen'
Plugin 'scrooloose/nerdtree'
Plugin 'roblillack/vim-bufferlist'
Plugin 'scrooloose/syntastic'
Plugin 'chrisbra/csv.vim'
Plugin 'bling/vim-airline'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'honza/vim-snippets'
Plugin 'SirVer/ultisnips'
Plugin 'dpelle/vim-Grammalecte'
Plugin 'ryanoasis/vim-devicons'				" -- à conserver à la fin

call vundle#end()							" requis
filetype plugin indent on					" requis

" Mpas  Plugins  ---------------------------------------------------------------
"  Tagbar
nmap <F8> :TagbarToggle<CR>
if has("win32")
	let g:tagbar_ctags_bin = 'C:\Program Files (x86)\ctags58\ctags.exe'
endif


"Couleurs & polices ------------------------------------------------------------
" syntaxe toujours à on
" TODO : uniformiser les polices
syntax on
set background=dark
colorscheme desert

if has("win32")
	" cas windows
	set guifont=UbuntuMonoDerivativePowerline_N:h12:cANSI
elseif has("unix")
	" cas linux
	set guifont=UbuntuMonoDerivativePowerline\ Nerd\ Font\ 12
endif

set encoding=utf-8

" leader est la virgule  -------------------------------------------------------

let mapleader = ","

" spellchek  -------------------------------------------------------------------

set spell spelllang=fr,en_gb
set spellsuggest=double,10
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

" Appuyer sur ,ss lancera la correction orthographique
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
	" cas windows sans la structure qui va bien		TODO
	set backupdir=c:\tmp,c:\temp,~\AppData\Local\Temp
	set directory=c:\tmp,c:\temp,~\AppData\Local\Temp
endif

set autoread								"relecture automatique quand un fichier est changé par ailleurs

set scrolloff=5								" Toujours au moins 5 ligne au dessus du curseur
set autoindent								" Auto indentation active
set showmode								" Afficher le mode en cours
set showcmd									" Afficher la dernière commande
set hidden									" Fermer les bufers abandonnés
set wildmenu								" Activer la complétion
set wildmode=list:longest					" Option de complétion
set visualbell								" DU SILENCE, alerte visuelle uniquement
set cursorline								" Afficher la ligne active
set ttyfast									" Terminal rapide (lagacy)
set ruler									" Afficher la position (lignes,colonne)
set backspace=indent,eol,start
set laststatus=2							" Toujours afficher la ligne de statut

set number
set undofile

" Options de recherche" --------------------------------------------------------

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

"-------------------------------------------------------------------------------

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

nnoremap <leader>cd :cd%:p:h<CR>
map <C-n> :NERDTreeToggle<CR>

" fix pour python sous windows :

if has("win32")
	let &pythonthreedll='C:\Users\amirault\AppData\Local\Programs\Python\Python36\python36.dll'
endif


" Grammalecte
if has("win32")
	let g:grammalecte_cli_py='C:/Users/amirault/scripts/gramalecte/grammalecte-cli.py'
	let g:grammalecte_py_bin='python'
	" cas de windows
elseif has("unix")
	" cas linux
endif

" meilleure intégration cli pour windows...

if has("win32")
""	set shell=c:\Program\ Files\Git\git-bash.exe
endif

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
if has("win32")
	let g:UltiSnipsSnippetDirectories=["C:/Users/amirault/UltiSnips"]
elseif has("unix")
	let g:UltiSnipsSnippetDirectories=["~/UltiSnips"]
endif

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:snips_author = "Mathieu Amirault"
let g:snips_email = "mathieu@lagilb.fr"
let g:snips_github = "https://github.com/ledshark24"

