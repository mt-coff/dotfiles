"ale
let g:ale_linters = {
\ 'javascript': ['eslint'],
\ 'vue': ['eslint']
\}
let g:ale_linter_aliases = {'vue': 'css'}

setlocal iskeyword+=$
setlocal iskeyword+=-
