" easymotion
if empty(globpath(&rtp, 'autoload/EasyMotion.vim'))
  finish
endif

map s <Plug>(easymotion-bd-f2)
nmap s <Plug>(easymotion-overwin-f2)
map <space>j <Plug>(easymotion-j)
map <space>k <Plug>(easymotion-k)
