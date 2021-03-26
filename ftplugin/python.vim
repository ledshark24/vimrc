" fix syntastic config pour l'interpréteur python :

let g:syntastic_python_python_exec = 'python3'
let g:syntastic_python_checkers = ['python']


" Black avant toute écriture de fichier

autocmd BufWritePre *.py execute ':Black'
