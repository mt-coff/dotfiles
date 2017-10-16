augroup filetypedetect
	au BufRead,BufNewFile *.go setfiletype go
	au BufRead,BufNewFile *.html setfiletype html
	au BufRead,BufNewFile *.py setfiletype python
	au BufRead,BufNewFile *.js setfiletype javascript
	au BufRead,BufNewFile *.vue setfiletype vuejs
augroup END
