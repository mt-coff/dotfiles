"emmet
let g:user_emmet_leader_key='<C-t>'

"ale
let g:ale_linters = {
	\ 'javascript': ['eslint'],
	\ 'vue': ['eslint']
	\}
let g:ale_linter_aliases = {'vue': 'css'}
