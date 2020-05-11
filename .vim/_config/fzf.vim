" fzf
 if empty(globpath(&rtp, 'autoload/fzf'))
  finish
endif

nmap <space>b :Buffers<CR>
nmap <space>p :Files<CR>

