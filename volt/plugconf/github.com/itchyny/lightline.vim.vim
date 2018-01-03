function! s:config()
  if has('gui_running')
    let g:lightline = {
          \ 'colorscheme': 'PaperColor',
          \ }
  else
    let g:lightline = {
          \ 'colorscheme': 'PaperColor',
          \ }
  endif

  let g:lightline.component_expand = {
        \  'linter_warnings': 'lightline#ale#warnings',
        \  'linter_errors': 'lightline#ale#errors',
        \  'linter_ok': 'lightline#ale#ok',
        \ }
  let g:lightline.component_type = {
        \     'linter_warnings': 'warning',
        \     'linter_errors': 'error',
        \ }
  let g:lightline.active = { 'right': [[ 'lineinfo' ], [ 'percent' ], [ 'fileformat', 'fileencoding', 'filetype' ],  ['linter_errors', 'linter_warnings', 'linter_ok' ] ] }
endfunction

function! s:loaded_on()
  " This function determines when a plugin is loaded.
  "
  " Possible values are:
  " * 'start' (a plugin will be loaded at VimEnter event)
  " * 'filetype=<filetypes>' (a plugin will be loaded at FileType event)
  " * 'excmd=<excmds>' (a plugin will be loaded at CmdUndefined event)
  " <filetypes> and <excmds> can be multiple values separated by comma.
  "
  " This function must contain 'return "<str>"' code.
  " (the argument of :return must be string literal)

  return 'start'
endfunction

function! s:depends()
  " Dependencies of this plugin.
  " The specified dependencies are loaded after this plugin is loaded.
  "
  " This function must contain 'return [<repos>, ...]' code.
  " (the argument of :return must be list literal, and the elements are string)
  " e.g. return ['github.com/tyru/open-browser.vim']

  return []
endfunction
