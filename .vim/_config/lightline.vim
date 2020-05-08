" lightline
if empty(globpath(&rtp, 'autoload/lightline'))
  finish
endif

let g:lightline = {
      \ 'colorscheme': 'iceberg',
      \ }
