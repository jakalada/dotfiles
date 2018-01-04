function! s:init()
  call altr#define('spec/%_spec.rb', 'lib/%.rb')
  call altr#define('test/%_test.rb', 'lib/%.rb')
  call altr#define('src/lib/*/%.coffee', 'spec/*/%_spec.coffee')
  call altr#define('src/lib/%.coffee', 'spec/%_spec.coffee')
  call altr#define('src/%.c', 'include/%.h')
endfunction

function! s:config()
  nmap <Leader>n  <Plug>(altr-forward)
  nmap <Leader>p  <Plug>(altr-back)

  " s:loaded_on関数への記述では動作しない処理への対応
  if v:vim_did_enter
    call s:init()
  else
    autocmd VimEnter * call s:init()
  endif
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
