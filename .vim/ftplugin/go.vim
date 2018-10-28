"go general
setlocal noexpandtab
setlocal tabstop=4
setlocal shiftwidth=4

" vim-go
let g:go_fmt_command = "goimports"
let g:go_fmt_autosave = 1
let g:go_fmt_fail_silently = 1
"" highlight
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

"ale
let g:ale_linters = {
\ 'go':['gometalinter']
\}
