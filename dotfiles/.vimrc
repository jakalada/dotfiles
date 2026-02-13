" jakalada's vimrc

" ==================================================
" Memo {{{1

" --------------------------------------------------
" 見出しのルール
"
" - 見出し1: '=' を50個
" - 見出し2: '-' を50個
" - 見出し3: '-' を30個

" ==================================================
" Initialize {{{1

" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

filetype plugin indent off

if has('vim_starting')
  if has('win32') || has('win64')
    set encoding=utf-8
  else
    set encoding=utf-8
  endif
  scriptencoding utf-8
endif

let s:iswin32 = has('win32')
let s:iswin64 = has('win64')
let s:iswin = has('win32') || has('win64')
let s:isgui = has('gui_running')
let s:ismacunix = has('macunix')

filetype plugin indent on
syntax enable
syntax sync fromstart

" ==================================================
" Commands {{{1
" .vimrcの再読み込み時に.vimrc内で設定されたautocmdを初期化する {{{
" MyAutocmdを使用することで漏れなく初期化できる
augroup vimrc
  autocmd!
augroup END

command!
      \   -bang -nargs=*
      \   MyAutocmd
      \   autocmd<bang> vimrc <args>
" }}}

" 定義されているマッピングを調べるコマンドを定義する {{{
command!
      \   -nargs=* -complete=mapping
      \   AllMaps
      \   map <args> | map! <args> | lmap <args>
" }}}

" ==================================================
" Functions {{{1


" ==================================================
" Encoding {{{1
" fileencodingの設定 {{{
set fileencodings=iso-2022-jp-3,iso-2022-jp,euc-jisx0213,euc-jp,utf-8,ucs-bom,euc-jp,eucjp-ms,cp932

" マルチバイト文字が含まれていない場合はencodingの値を使用する
MyAutocmd BufReadPost *
      \   if &modifiable && !search('[^\x00-\x7F]', 'cnw')
      \ |   setlocal fileencoding=
      \ | endif
" }}}

" fileformatの設定 {{{
if s:iswin
  set fileformat=dos
else
  set fileformat=unix
endif

set fileformats=unix,dos,mac
" }}}

"East Asian Width Class Ambiguous な文字をASCII文字の2倍の幅で扱う
set ambiwidth=double

set emoji

" ==================================================
" Options {{{1

MyAutocmd ColorScheme * set nocursorline
if s:isgui
  " ref. https://blog.ikejima.org/vim/macosx/2017/01/04/macvim-color.html
  if has('gui_macvim')
    let g:macvim_skip_colorscheme=1
    let g:no_gvimrc_example=1
  endif

  set background=dark
  colorscheme desert

  if s:ismacunix
    set guifont=Cica-Regular:h15
  elseif s:iswin
    set renderoptions=type:directx,renmode:5
    set guifont=Ricty_Diminished:h11:cANSI:qDRAFT:qANTIALIASED
  else
    set guifont=Ricty\ Diminished\ 13.5
  endif

  set guioptions=ciM
  set mouse=a
  set mousehide
  set mousefocus
  set novisualbell
  set guicursor+=a:blinkon0
else
  set termguicolors
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

  colorscheme desert
endif

set noimcmdline
set iminsert=0
set imsearch=0

set pumheight=10

set nocursorline
set cmdheight=1

set signcolumn=yes

set breakindent

set smartindent autoindent
set smarttab expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set shiftround

set backspace=indent,eol,start

set nojoinspaces

setlocal matchpairs+=<:>

setlocal iskeyword+=-

set hidden

set foldlevelstart=99

set backupdir=~/tmp
set directory-=.
if v:version >= 703
  set undofile
  set undodir=~/tmp
endif

if has('virtualedit')
  set virtualedit=block
endif

" マルチバイト文字の扱いを自然にする
set formatoptions+=m
set formatoptions+=M

set scrolloff=10

set helplang=ja

" REF: http://vim-jp.org/vim-users-jp/2011/03/12/Hack-206.html
MyAutocmd WinEnter * checktime
set autoread

set clipboard=unnamed

set showfulltag
set tagbsearch

if has('unix')
  set nofsync
  set swapsync=
endif

" search {{{
set incsearch
set ignorecase
set smartcase
set wrapscan
set hlsearch

nnoremap <silent> <SID>[nohlsearch] :<C-U>nohlsearch<CR>
nnoremap <script> v <SID>[nohlsearch]v
nnoremap <script> V <SID>[nohlsearch]V
nnoremap <script> i <SID>[nohlsearch]i
nnoremap <script> I <SID>[nohlsearch]I
nnoremap <script> a <SID>[nohlsearch]a
nnoremap <script> A <SID>[nohlsearch]A
nnoremap <script> o <SID>[nohlsearch]o
nnoremap <script> O <SID>[nohlsearch]O
" }}}

set number

set noshowcmd

set noshowmode

set confirm

set report=0

set noequalalways

if has('conceal')
  set conceallevel=0
endif

set list
let &listchars = 'tab:| ,trail:-'

let &fillchars = 'vert: ,fold: ,diff:-'

let &showbreak = '> '

set wrap

set textwidth=0

set laststatus=2

set nomodeline

set completeopt-=preview

" ==================================================
" Mappings {{{1

" --------------------------------------------------
" IBusで日本語入力に切り替えるたびにスペースが挿入されてしまうのを防ぐ {{{2
noremap <C-Space> <Nop>
noremap! <C-Space> <Nop>
xnoremap <C-Space> <Nop>
snoremap <C-Space> <Nop>
lnoremap <C-Space> <Nop>


" --------------------------------------------------
" <C-J>と<C-K>を各モードでエスケープにマッピング {{{2
nnoremap <silent> <C-J> <Esc>:<C-U>nohlsearch<CR>
vnoremap <C-J> <Esc>
onoremap <C-J> <Esc>
inoremap <C-J> <Esc>
cnoremap <C-J> <C-C>
xnoremap <C-J> <Esc>
snoremap <C-J> <Esc>
lnoremap <C-J> <Esc>

nnoremap <silent> <C-K> <Esc>:<C-U>nohlsearch<CR>
vnoremap <C-K> <Esc>
onoremap <C-K> <Esc>
inoremap <C-K> <Esc>
cnoremap <C-K> <C-C>
xnoremap <C-K> <Esc>
snoremap <C-K> <Esc>
lnoremap <C-K> <Esc>


" --------------------------------------------------
" Leader {{{2
let g:mapleader = ' '
let g:maplocalleader = '\'

" --------------------------------------------------
" mapmode-nvo {{{2
noremap j gj
noremap k gk

noremap L g_
noremap H ^

noremap <C-H> <C-U>
noremap <C-L> <C-D>


" --------------------------------------------------
" mapmode-n {{{2
nnoremap <Leader>k <C-^>

nnoremap <Backspace> <C-O>
nnoremap <S-Backspace> <C-I>

nnoremap <C-Up> <C-A>
nnoremap <C-Down> <C-X>

nnoremap Q q
nnoremap <silent> q :<C-U>close<CR>

nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

nnoremap n nzz
nnoremap N Nzz


" --------------------------------------------------
" mapmode-v {{{2
vnoremap > >gv
vnoremap < <gv

vnoremap ) t)
vnoremap ( t(

vnoremap q <Nop>
vnoremap qq <Nop>

" REF: http://labs.timedia.co.jp/2012/10/vim-more-useful-blockwise-insertion.html
vnoremap <expr> I  <SID>force_blockwise_visual('I')
vnoremap <expr> A  <SID>force_blockwise_visual('A')
function! s:force_blockwise_visual(next_key)
  if mode() ==# 'v'
    return "\<C-v>" . a:next_key
  elseif mode() ==# 'V'
    return "\<C-v>0o$" . a:next_key
  else  " mode() ==# "\<C-v>"
    return a:next_key
  endif
endfunction


" --------------------------------------------------
" mapmode-i {{{2
inoremap <silent> <C-L> <Right>
inoremap <silent> <C-H> <Left>

inoremap <silent> <F7> <Esc>gUiwea

inoremap <C-CR> <Esc>o


" --------------------------------------------------
" mapmode-o {{{2
onoremap / t
onoremap ? T

onoremap ) t)
onoremap ( t(

" ==================================================
" File Type Plugins {{{1

" --------------------------------------------------
" c.vim {{{2
let g:c_gnu = 1
let g:c_comment_strings = 1
let g:c_space_errors = 1
" let g:c_no_trail_space_error = 1
" let g:c_no_tab_space_error = 1
" let g:c_no_bracket_error = 1
" let g:c_no_curly_error = 1
let g:c_curly_error = 1
" let g:c_no_ansi = 1
let g:c_ansi_typedefs = 1
let g:c_ansi_constants  = 1
" let g:c_no_utf = 1
" let g:c_syntax_for_h = 1
let g:c_no_if0 = 1
" let g:c_no_cformat = 1
" let g:c_no_c99 = 1
" let g:c_no_c11
" let g:c_no_comment_fold = 1
" let g:c_no_if0_fold = 1
" let g:c_minlines = 100

" --------------------------------------------------
" coffee.vim {{{2
" REF: https://github.com/kchmck/vim-coffee-script
" helpファイルがないのでREADMEを参照する
" let g:coffee_indent_keep_current = 1
" let g:coffee_compiler = '/usr/bin/coffee'
" let g:coffee_make_options = '--bare'
" let g:coffee_cake = '/opt/bin/cake'
" let g:coffee_cake_options = 'build'
" let g:coffee_linter = '/opt/bin/coffeelint'
" let g:coffee_lint_options = '-f lint.json'
" let g:coffee_compile_vert = 1
" let g:coffee_watch_vert = 1
" let g:coffee_run_vert = 1

" --------------------------------------------------
" cpp.vim {{{2
" c.vimの変数も採用される
" let g:cpp_no_cpp11 = 1
" let g:cpp_no_cpp14 = 1

" --------------------------------------------------
" csh.vim {{{2
let g:filetype_csh = 'tcsh'

" --------------------------------------------------
" html.vim {{{2
" let g:html_no_rendering = 1
" let g:html_wrong_comments = 1

" --------------------------------------------------
" java.vim {{{2
" let g:java_mark_braces_in_parens_as_errors = 1
let g:java_highlight_java_lang_ids = 1
let g:java_highlight_functions = 'style'
let g:java_highlight_debug = 1
" let g:java_ignore_javadoc = 1
let g:java_javascript = 1
let g:java_css = 1
let g:java_vb = 1
" let g:java_minlines = 50

" --------------------------------------------------
" javascript.vim {{{2
" REF: https://github.com/pangloss/vim-javascript
" helpファイルがないのでREADMEを参照する
let g:javascript_enable_domhtmlcss = 1
" let g:javascript_ignore_javaScriptdoc = 1
" let g:javascript_conceal_function   = "ƒ"
" let g:javascript_conceal_null       = "ø"
" let g:javascript_conceal_this       = "@"
" let g:javascript_conceal_return     = "⇚"
" let g:javascript_conceal_undefined  = "¿"
" let g:javascript_conceal_NaN        = "ℕ"
" let g:javascript_conceal_prototype  = "¶"
" let g:javascript_conceal_static     = "•"
" let g:javascript_conceal_super      = "Ω"

" --------------------------------------------------
" json.vim {{{2
" REF: https://github.com/elzr/vim-json
" helpファイルがないのでREADMEを参照する
" let g:vim_json_syntax_conceal = 0
" let g:vim_json_syntax_concealcursor = 1

" --------------------------------------------------
" php.vim {{{2
let g:php_sql_query = 1
let g:php_baselib = 1
let g:php_htmlInStrings = 1
" let g:php_oldStyle = 1
let g:php_asp_tags = 1
" let g:php_noShortTags = 1
let g:php_parent_error_close = 1
let g:php_parent_error_open = 1
let g:php_folding = 1
" let g:php_sync_method = x

" --------------------------------------------------
" python.vim {{{2
let g:python_highlight_all = 1

" --------------------------------------------------
" ruby.vim {{{2
let g:ruby_operators = 1
let g:ruby_space_errors = 1
" let g:ruby_no_trail_space_error = 1
" let g:ruby_no_tab_space_error = 1
let g:ruby_fold = 1
" let g:ruby_no_expensive = 1
" let g:ruby_minlines = 100
" let g:ruby_spellcheck_strings = 1

" --------------------------------------------------
" sh.vim {{{2
let g:is_bash = 1
let g:sh_fold_enabled = 7
" let g:sh_minlines = 500
" let g:sh_maxlines = 100

" --------------------------------------------------
" vim.vim {{{2
" let g:vimsyn_minlines = 50
" let g:vimsyn_maxlines = 50
let g:vimsyn_embed = 0
let g:vimsyn_folding = 0
let g:vimsyntax_noerror = 1

" --------------------------------------------------
" xml.vim{{{2
" let g:xml_namespace_transparent=1
let g:xml_syntax_folding = 1

" ==================================================
" Misc {{{1

" --------------------------------------------------
" 折りたたみ {{{2
nnoremap <SID>[fold] <Nop>
xnoremap <SID>[fold] <Nop>
nmap z <SID>[fold]
xmap z <SID>[fold]

noremap <SID>[fold]g [z
noremap <SID>[fold]G ]z
noremap <SID>[fold]j zj
noremap <SID>[fold]k zk

noremap <SID>[fold]l zo
noremap <SID>[fold]L zO
noremap <SID>[fold]h zc
noremap <SID>[fold]H zC
noremap <SID>[fold]t za
noremap <SID>[fold]T zA

noremap <SID>[fold]M zM
noremap <SID>[fold]m zm
noremap <SID>[fold]R zR
noremap <SID>[fold]r zr

noremap <silent> <SID>[fold]0 :<C-U>setl foldlevel=0<CR>
noremap <silent> <SID>[fold]1 :<C-U>setl foldlevel=1<CR>
noremap <silent> <SID>[fold]2 :<C-U>setl foldlevel=2<CR>
noremap <silent> <SID>[fold]3 :<C-U>setl foldlevel=3<CR>
noremap <silent> <SID>[fold]4 :<C-U>setl foldlevel=4<CR>
noremap <silent> <SID>[fold]5 :<C-U>setl foldlevel=5<CR>
noremap <silent> <SID>[fold]6 :<C-U>setl foldlevel=6<CR>
noremap <silent> <SID>[fold]7 :<C-U>setl foldlevel=7<CR>
noremap <silent> <SID>[fold]8 :<C-U>setl foldlevel=8<CR>
noremap <silent> <SID>[fold]9 :<C-U>setl foldlevel=9<CR>

set foldtext=getline(v:foldstart)


" --------------------------------------------------
" タブページ {{{2
nnoremap <SID>[tab] <Nop>
nmap t <SID>[tab]

nnoremap <SID>[tabnew] <Nop>
nmap T <SID>[tabnew]

nnoremap <silent> <C-L> :<C-U>tabnext<CR>
nnoremap <silent> <C-H> :<C-U>tabprev<CR>
nnoremap <silent> <SID>[tab]q :<C-U>tabclose<CR>
nnoremap <silent> <SID>[tab]t :<C-U>tabnew<CR>

nnoremap <silent> <SID>[tabnew]v :<C-U>tabnew \| lcd $VIMCONFIGDIR<CR>

set showtabline=2

" --------------------------------------------------
" ウィンドウ {{{2
nnoremap <SID>[window] <Nop>
nmap <Leader>w <SID>[window]

nnoremap <Tab> <C-W>w
nnoremap <S-Tab> <C-W>W

nmap <SID>[window]j <SID>(split-to-j)
nmap <SID>[window]k <SID>(split-to-k)
nmap <SID>[window]h <SID>(split-to-h)
nmap <SID>[window]l <SID>(split-to-l)

nnoremap <silent> <SID>(split-to-j) :<C-U>execute 'belowright' (v:count == 0 ? '' : v:count) 'split'<CR>
nnoremap <silent> <SID>(split-to-k) :<C-U>execute 'aboveleft'  (v:count == 0 ? '' : v:count) 'split'<CR>
nnoremap <silent> <SID>(split-to-h) :<C-U>execute 'topleft'    (v:count == 0 ? '' : v:count) 'vsplit'<CR>
nnoremap <silent> <SID>(split-to-l) :<C-U>execute 'botright'   (v:count == 0 ? '' : v:count) 'vsplit'<CR>


" --------------------------------------------------
" コマンドラインウィンドウ {{{2
nnoremap <silent> ; q:
xnoremap <silent> ; q:
nnoremap <silent> / q/
nnoremap <silent> ? q?

MyAutocmd CmdwinEnter * call s:init_cmdwin()
function! s:init_cmdwin() " {{{
  nnoremap <buffer><silent> q :<C-U>quit<CR>
  inoremap <buffer><expr> <CR> pumvisible() ? '<C-Y><CR>' : '<CR>'
  nnoremap <buffer> ; <Nop>
  setlocal nonumber
  startinsert!
endfunction " }}}




" --------------------------------------------------
" 空行を追加と削除を容易にする {{{2
" REF: http://deris.hatenablog.jp/entry/20130404/1365086716
nnoremap <silent> <Leader>o   :<C-u>for i in range(1, v:count1) \| call append(line('.'),   '') \| endfor \| silent! call repeat#set("<Leader>o", v:count1)<CR>
nnoremap <silent> <Leader>O   :<C-u>for i in range(1, v:count1) \| call append(line('.')-1, '') \| endfor \| silent! call repeat#set("<Leader>O", v:count1)<CR>


" --------------------------------------------------
" 最後に編集した位置に移動する {{{2
MyAutocmd BufReadPost *
      \ if line("'\"") > 1 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif

" --------------------------------------------------
" カーソル位置を移動せずにファイル全体を整形する {{{2
" http://kannokanno.hatenablog.com/entry/2014/03/16/160109
function! s:format_file()
  let l:view = winsaveview()
  exe 'normal gg=G'
  silent call winrestview(l:view)
endfunction
nnoremap <C-F> :call <SID>format_file()<CR>

" }}}1

set secure  " must be written at the last.  see :help 'secure'.
