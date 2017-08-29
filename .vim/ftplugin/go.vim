"go general
setlocal noexpandtab
setlocal tabstop=4
setlocal shiftwidth=4

"vim-go
let g:go_fmt_command="goimports"
let g:go_highlight_functions=1
let g:go_highlight_methods=1
let g:go_highlight_fields=1
let g:go_highlight_types=1
let g:go_highlight_operators=2
let g:go_highlight_build_constraints=2

"neomake
let g:neomake_go_enabled_makers=['golint', 'govet', 'gotypep', 'go']
