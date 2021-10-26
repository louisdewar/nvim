colorscheme gruvbox
" make background transparent
hi Normal guibg=NONE ctermbg=NONE

function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

" Hide read only for certain plugins where it's obvious
function! LightlineReadonly()
  return &readonly && &filetype !~# '\v(help|nerdtree)' ? 'Read-only' : ''
endfunction

" Hide file name in certain situations
function! LightlineFilename()
  let filename =  &filetype ==# 'nerdtree' ? '':
        \ expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
  let modified = &modified ? ' *' : ''

  return filename . modified
endfunction

let g:lightline = {
      \ 'active': {
      \   'left': [
      \      ['mode', 'paste'],
      \      ['readonly', 'filename', 'currentfunction', 'cocstatus']
      \    ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status',
      \   'currentfunction': 'CocCurrentFunction',
      \   'readonly': 'LightlineReadonly',
      \   'filename': 'LightlineFilename'
      \ }
      \ }

autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

" nnoremap <silent> <C-m> :MinimapToggle<Cr>
