function! s:config()
  let g:quickrun_config = get(g:, 'quickrun_config', {})
  let g:quickrun_config._ = {
        \'runner' : 'vimproc',
        \"runner/vimproc/updatetime" : 10
        \}

  " Python
  if has('macunix')
    let g:quickrun_config.python = {
          \'command': 'python3',
          \'hook/eval/template': 'print(%s)'
          \}
  elseif has('win32') || has('win64')
    let g:quickrun_config.python = {
          \'command': 'python',
          \'hook/eval/template': 'print(%s)'
          \}
  else
    let g:quickrun_config.python = {
          \'command': 'python3',
          \'hook/eval/template': 'print(%s)'
          \}
  endif

  "RSpec
  let g:quickrun_config['ruby.rspec'] = {
        \'command': 'bundle exec rspec',
        \'exec': '%c %s'
        \}

  " Markdown
  let g:quickrun_config['markdown'] = {
        \'command':  'redcarpet',
        \'cmdopt':   '--parse-fenced-code-blocks --parse-tables',
        \'exec':     '%c %o %s',
        \'outputter/buffer/filetype': 'html'
        \}
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
