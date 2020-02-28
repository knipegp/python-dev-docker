" Syntastic python setup
let g:syntastic_python_checkers = ['pylint', 'mypy']
let g:syntastic_python_mypy_args = '--config-file=' . $HOME . '/.mypy.ini'
" Only use in Docker container
let g:syntastic_python_python_exec = 'python3'
