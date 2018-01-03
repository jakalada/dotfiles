function! s:config()
  if has('win32') || has('win64')
    let g:ref_pydoc_cmd = 'pydoc.bat'
    let g:ref_refe_encoding = 'cp932'
  else
    let g:ref_pydoc_cmd = 'python3 -m pydoc'
  endif

  let g:ref_detect_filetype = {
        \ 'c': 'man', 'clojure': 'clojure', 'perl': 'perldoc', 'php': 'phpmanual', 'ruby': 'refe', 'erlang': 'erlang', 'python': 'pydoc'
        \}

  MyAutocmd FileType ref call s:initialize_ref_viewer()
  function! s:initialize_ref_viewer()
    nmap <buffer> <Backspace> <Plug>(ref-back)
    nmap <buffer> <S-Backspace> <Plug>(ref-forward)
    setlocal nonumber
  endfunction
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
