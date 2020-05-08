" colorscheme
if empty(globpath(&rtp, 'autoload/iceberg'))
  finish
endif

set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum""]]
syntax on
colorscheme iceberg

