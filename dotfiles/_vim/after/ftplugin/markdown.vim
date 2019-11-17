setlocal smartindent
setlocal autoindent

setlocal smarttab
setlocal expandtab

setlocal tabstop=2
setlocal shiftwidth=2
setlocal softtabstop=2

setlocal shiftround

setlocal formatoptions=
setlocal formatoptions+=r
setlocal formatoptions+=o
setlocal formatoptions+=2
setlocal formatoptions+=m
setlocal formatoptions+=M
setlocal formatoptions+=j

" ref. https://github.com/gabrielelana/vim-markdown/blob/master/ftplugin/markdown.vim
function! s:IsAnEmptyListItem()
  return getline('.') =~ '\v^\s*%([-*+]|\d\.)\s*$'
endfunction

function! s:IsAnEmptyQuote()
  return getline('.') =~ '\v^\s*(\s?\>)+\s*$'
endfunction

inoremap <silent> <buffer> <script> <expr> <CR> <SID>IsAnEmptyQuote() \|\| <SID>IsAnEmptyListItem() ? '<C-O>:normal 0D<CR><CR>' : '<CR>'

if !exists('b:undo_ftplugin')
  let b:undo_ftplugin = ''
endif

let b:undo_ftplugin .= '
\ | setlocal smartindent<
\ | setlocal autoindent<
\ | setlocal smarttab<
\ | setlocal expandtab<
\ | setlocal tabstop<
\ | setlocal shiftwidth<
\ | setlocal softtabstop<
\ | setlocal shiftround<
\ | setlocal conceallevel<
\ | iunmap <buffer> <CR>
\'
