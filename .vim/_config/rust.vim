" Rust
if empty(globpath(&rtp, 'autoload/rustfmt.vim'))
  finish
endif

let g:rustfmt_autosave = 1

