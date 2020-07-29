" sonictemplate
if empty(globpath(&rtp, 'autoload/sonictemplate.vim'))
  finish
endif

let g:sonictemplate_vim_template_dir = '~/.vim/template'
