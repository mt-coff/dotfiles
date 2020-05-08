" fzf
 if empty(globpath(&rtp, 'plugged/fzf.vim'))
  finish
endif

nmap <space>b :Buffers<CR>
nmap <space>p :Files<CR>

