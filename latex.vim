let g:tex_flavor='latex'
let g:vimtex_view_method = 'zathura'

let g:vimtex_compiler_latexmk = {
	\ 'build_dir' : 'build',
        \ 'options' : [
        \   '-pdf',
        \   '-shell-escape',
        \   '-verbose',
        \   '-file-line-error',
        \   '-synctex=1',
        \   '-interaction=nonstopmode',
        \ ],
        \ }
