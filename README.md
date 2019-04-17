Vimrc
=====

En cours d'élaboration, ceci a pour ambition d'être un .vim ou un vimfiles
générique pour tous mes postes. Et oui vous y trouverez mon virmc.

Prérequis:
----------
* installation des plugins : [Git](http://git-scm.com/)
* Police utilisée : [UbuntuMono for powerline](https://github.com/ryanoasis/nerd-fonts/releases)
* [Exuberant ctags 5.5](http://ctags.sourceforge.net/)
* covnersion de format à format [pandoc](http://pandoc.corg) pandoc

Installation
------------
`git clone --recursive https://git.framasoft.org/ledshark24/vimrc.git .vim`

Plugins :
---------

* [Vundle](https://github.com/VundleVim/Vundle.vim), ajouté en sous module
  du dépôt, n'oubliez pas de faire un :PluginInstall au premier lancement de
  vim.
* [delimitMate](https://github.com/Raimondi/delimitMate.git) fermeture
  automatique des parenthèses, guillemets et autres crochets
* [supertab](https://github.com/ervandew/supertab.git) toute la complétion par
  la touche <tab>
* [tagbar](https://github.com/majutsushi/tagbar.git) tags du fichier par la
  touche <F8>
* [vim-fugitive](https://github.com/tpope/vim-fugitive.git) le fameux enrobage
  de Git
* [vim-sensible](https://github.com/tpope/vim-sensible.git) quelques settings
  de plus
* [vim-javascript](https://github.com/pangloss/vim-javascript) fonctions
  & replis pour javascrit
* [TaskList](https://github.com/vim-scripts/TaskList.vim) gestion des TODO
* [rainbow\_parentheses](https://github.com/kien/rainbow_parentheses.vim)
  coloration des parenthèses
* [emmet-vim](https://github.com/mattn/emmet-vim) implémentation vim de
  [emmet](http://emmet.io/)
* [nerdtree](https://github.com/scrooloose/nerdtree) naviguer dans vos fichiers
* [vim-bufferlist](https://github.com/roblillack/vim-bufferlist) liste de vos
  buffers
* [syntastic](https://github.com/scrooloose/syntastic) aide à la syntaxe de vos
  fichiers
* [airline](https://github.com/bling/vim-airline) powerline en mieux & plus
  simple
* [csv.vim](https://github.com/chrisbra/csv.vim) fonction pour travailler sur
  des tableurs csv
* [vim-devicons](https://github.com/ryanoasis/vim-devicons) plus de symboles !
* [ctrlp](https://github.com/kien/ctrlp.vim) recherche par <C-p>
* [vim-gitgutter](https://github.com/airblade/vim-gitgutter) signalétique du diff de git
  dans la colonne des lignes
* [vim-snippets](https://github.com/honza/vim-snippets) vim-snippets
* [UltiSnips](https://github.com/SirVer/ultisnips) UltiSnips
* [Grammalecte](https://dpelle/vim-Grammalecte) Grammalecte : correction
* [Vimtex](https://github.com/lervag/vimtex) Vimtex : outils pour le travail en LaTeX
* [vim-pandoc](https://github.com/vim-pandoc/vim-pandoc) et [vim-pandoc-syntax](https://github.com/vim-pandoc/vim-pandoc-syntax) intégration de [Pandoc](pandoc.org) et prise en charge de sa syntaxe
  grammaticale en français

Usage
-----

### Gestion des fichiers

* `,cd` se rendre dans le dossier du fichier actif
* `<Ctrl>-N` Nerd Tree

### Recherche

* `,<space>` pour neutraliser le signalement de la recherche

### Correction orthographique

* `,s?` suggestions
* `<C-l>` appliquer la première suggestion à la dernière faute d'orthographe.
* `,ss` Activation / désactivation de la Correction orthographique
* `,sn`/`,sp` Suivant / Précédent
* `,zg` Ajout au dictionnaire

### gestion des fenêtres

* `,w` : nouveau partage vertical

### Gestion des snippets :

* `<Tab>` pour activer un snippet
* `<c-Tab>` pour suggérer un snippet
* `<c-j>` pour le composant suivant du snippet
* `<c-k>` pour le composant prétendent du snippet

par default les snippets sont stockés dans `~/UltiSnips/`
