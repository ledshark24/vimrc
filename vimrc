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
Plugin 'scrooloose/nerdcommenter'
Plugin 'roblillack/vim-bufferlist'
Plugin 'scrooloose/syntastic'
Plugin 'chrisbra/csv.vim'
Plugin 'bling/vim-airline'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'honza/vim-snippets'
Plugin 'SirVer/ultisnips'
Plugin 'dpelle/vim-Grammalecte'
Plugin 'lervag/vimtex'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'Valloric/YouCompleteMe'
"Plugin 'dbeniamine/cheat.sh-vim'
" Plugin 'posva/vim-vue'
Plugin 'leafOfTree/vim-vue-plugin'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'mfukar/robotframework-vim'
Plugin 'aklt/plantuml-syntax'
Plugin 'ragon000/vim-latex-live-preview'
Plugin 'psf/black'
Plugin 'tmhedberg/simpylfold'
Plugin 'ryanoasis/vim-devicons'				" -- à conserver à la fin

call vundle#end()							" requis
filetype plugin indent on					" requis

" Mpas  Plugins  ---------------------------------------------------------------
"  Tagbar
nmap <F8> :TagbarToggle<CR>
if has("win32")
	let g:tagbar_ctags_bin = 'C:\Program Files (x86)\ctags58\ctags.exe'
endif

" Mappings utiles --------------------------------------------------------------

" leader est la virgule  -------------------------------------------------------

let mapleader = ","

nmap U <C-r>
imap kj <Esc> 
nnoremap ; :
nnoremap <leader>w <C-w>v<C-w>l

" Unification du presse-papier
"set clipboard=unnamedplus

"Couleurs & polices ------------------------------------------------------------
" syntaxe toujours à on
" TODO : uniformiser les polices
syntax on
set background=dark
colorscheme desert

if has("win32")
	" cas windows
	set guifont=UbuntuMonoDerivativePowerline_N:h14:cANSI
elseif has("unix")
	" cas linux
	set guifont=UbuntuMono\ 16
endif

set encoding=utf-8


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
"-------------------------------------------------------------------------------

" statusline
set statusline=%<\ %n:%f\ %m%r%y%{fugitive#statusline()}%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)

" auto complétion
" set omnifunc=syntaxcomplete#Complete

set modelines=0

" gestion des tabulations
set tabstop=4
set shiftwidth=4
set softtabstop=4

"Backup ------------------------------------------------------------------------
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
let g:grammalecte_disable_rules ='apostrophe_typographique apostrophe_typographique_après_t '
			\ . 'espaces_début_ligne espaces_milieu_ligne espaces_fin_de_ligne '
			\ . 'esp_début_ligne esp_milieu_ligne esp_fin_ligne esp_mélangés2 '
			\ . 'typo_points_suspension1 typo_tiret_incise '
			\ . 'nbsp_avant_double_ponctuation nbsp_avant_deux_points '
			\ . 'nbsp_après_chevrons_ouvrants nbsp_avant_chevrons_fermants1 '
			\ . 'unit_nbsp_avant_unités1 unit_nbsp_avant_unités2 '
			\. 'typo_tiret_début_ligne typo_guillemets_typographiques_doubles_ouvrants typo_guillemets_typographiques_doubles_fermants '
if has("win32")
	" cas de windows
	let g:grammalecte_cli_py='C:/Users/amirault/scripts/gramalecte/grammalecte-cli.py'
	let g:grammalecte_py_bin='python'
elseif has("unix")
	" cas linux
	let g:grammalecte_cli_py='~/gramalecte/grammalecte-cli.py'
endif

" meilleure intégration cli pour windows...

if has("win32")
	set noshellslash
endif

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsExpandTrigger="<tab>"
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" if has("win32")
" 	let g:UltiSnipsSnippetDirectories=["C:/Users/amirault/UltiSnips"]
" elseif has("unix")
" ""	let g:UltiSnipsSnippetDirectories=["~/UltiSnips"]
" endif

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:snips_author = "Mathieu AMIRAULT"
let g:snips_email = "mathieu@lagilb.fr"
let g:snips_github = "https://github.com/ledshark24"

"syntastic

let g:syntactic_debug = 3
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"vimtex

let g:tex_flavor='latex'
"let g:vimtex_view_method='SumatraPDF'
if has("win32")
	let g:vimtex_view_general_viewer = "C:/Users/amirault/portables/SumatraPDF.exe"
elseif has("unix")
	let g:vimtex_view_general_viewer = "zathura"
endif
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

" pandoc
let g:pandoc#biblio#sources="b"
let g:pandoc#modules#disabled = ["folding"]
let g:pandoc#formating#mode = "A"
if has("win32")
	let g:pandoc#metadata = "C:/Users/amirault/vimfiles/pandoc.yaml"
else
	let g:pandoc#metadata = "~/.vim/pandoc.yaml"
endif
if filereadable(g:pandoc#metadata)
	let g:pandoc#compiler#arguments = "--toc --metadata-file=".g:pandoc#metadata
else
	let g:pandoc#compiler#arguments = "--toc -V toc-title=Sommaire"
endif
if has("win32")
	let g:pandoc#command#pdf_engine = "SumatraPDF"
	let g:pandoc#command#latex_engine= "pdflatex"
endif

"" plantuml
if has("win32")
	let g:plantuml_executable_script="C:/Users/amirault/bin/plantuml.sh"
endif

" YouCompleteMe
if !exists('g:ycm_semantic_triggers')
	let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers.pandoc = ['@']

let g:ycm_filetype_blacklist = {}

" autosave des fichers
autocmd CursorHold,CursorHoldI * update
