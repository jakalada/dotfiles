function! s:config()
  " neocomplete.vim {{{2
  let g:neocomplete#enable_at_startup = 1
  let g:neocomplete#enable_smart_case = 1
  let g:neocomplete#min_keyword_length = 3

  MyAutocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  MyAutocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  MyAutocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  MyAutocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
  MyAutocmd FileType cs setlocal omnifunc=OmniSharp#Complete

  if !exists('g:neocomplete#keyword_patterns')
      let g:neocomplete#keyword_patterns = {}
  endif
  let g:neocomplete#keyword_patterns._ = '\h\w*'

  inoremap <C-O> <C-X><C-O>
  inoremap <expr><CR> pumvisible() ? '<C-Y><CR>' : '<CR>'
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
