function! s:config()
  let g:vimfiler_ignore_pattern = '\(^\.\|\~$\|\.pyc$\|\.[oad]$\|^__pycache__$\|\.meta$\)'
  let g:vimfiler_time_format        = '%Y/%m/%d %H:%M'  " 例: 2013/01/01 00:00
  let g:vimfiler_force_overwrite_statusline = 0

  nnoremap <silent> <Leader>e :<C-U>VimFilerExplorer -toggle<CR>
  nnoremap <silent> <Leader>E :<C-U>VimFilerCurrentDir -toggle<CR>

  function! s:init_vimfiler()
    setlocal nonumber
  endfunction
  autocmd Filetype vimfiler call s:init_vimfiler()
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
