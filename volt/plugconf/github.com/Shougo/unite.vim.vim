function! s:config()
  " unite-variables
  let g:unite_split_rule = 'botright'
  let g:unite_enable_split_vertically = 1
  let g:unite_winwidth = 60

  " unite-source-variables
  let g:unite_source_file_mru_time_format = '(%F %R)'
  let g:unite_source_grep_max_candidates = 1000
  let g:unite_source_file_mru_long_limit = 1000
  let g:unite_source_file_mru_limit = 200
  let g:unite_source_directory_mru_long_limit = 1000

  nnoremap <SID>[unite] <Nop>
  xnoremap <SID>[unite] <Nop>
  nmap f <SID>[unite]
  xmap f <SID>[unite]

  nnoremap <SID>[unite-no-quit] <Nop>
  xnoremap <SID>[unite-no-quit] <Nop>
  nmap F <SID>[unite-no-quit]
  xmap F <SID>[unite-no-quit]

  nnoremap <silent> <SID>[unite]<Space> :<C-U>UniteResume<CR>

  nnoremap <silent> <SID>[unite]f :<C-U>Unite -buffer-name=buffer_tab buffer_tab<CR>
  nnoremap <silent> <SID>[unite]F :<C-U>Unite -buffer-name=buffer buffer<CR>
  nnoremap <silent> <SID>[unite]r :<C-U>Unite -buffer-name=register register<CR>
  nnoremap <silent> <SID>[unite]t :<C-U>Unite -buffer-name=tab tab:no-current<CR>
  nnoremap <silent> <SID>[unite]o :<C-U>Unite -buffer-name=outline outline<CR>
  nnoremap <silent> <SID>[unite]m :<C-U>Unite -buffer-name=mark mark<CR>
  nnoremap <silent> <SID>[unite]S :<C-U>Unite -buffer-name=source source<CR>
  nnoremap <silent> <SID>[unite]l :<C-U>UniteWithCursorWord -buffer-name=line line<CR>
  nnoremap <silent> <SID>[unite-no-quit]l :<C-U>UniteWithCursorWord -no-quit -buffer-name=line line<CR>

  nnoremap <silent> <SID>[unite-no-quit]f :<C-U>Unite -no-quit -keep-focus -buffer-name=buffer_tab buffer_tab<CR>
  nnoremap <silent> <SID>[unite-no-quit]F :<C-U>Unite -no-quit -keep-focus -buffer-name=buffer buffer<CR>
  nnoremap <silent> <SID>[unite-no-quit]r :<C-U>Unite -no-quit -keep-focus -buffer-name=register register<CR>
  nnoremap <silent> <SID>[unite-no-quit]t :<C-U>Unite -no-quit -keep-focus -buffer-name=tab tab:no-current<CR>
  nnoremap <silent> <SID>[unite-no-quit]m :<C-U>Unite -no-quit -keep-focus -buffer-name=mark mark<CR>
  nnoremap <silent> <SID>[unite-no-quit]S :<C-U>Unite -no-quit -keep-focus -buffer-name=source source<CR>
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
