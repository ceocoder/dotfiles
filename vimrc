set runtimepath=~/.vim,$VIMRUNTIME,~/.vim/after,$GOROOT/misc/vim

" Use pathogen.vim to manage and load plugins
execute pathogen#infect()
" call pathogen#runtime_append_all_bundles()
" call pathogen#helptags()


" appearance options

set bg=dark
let g:zenburn_high_Contrast = 1
let g:liquidcarbon_high_contrast = 1
let g:molokai_original = 1
let g:Powerline_symbols = 'compatible'
let g:Powerline_cache_enabled = 1
let g:Powerline_cache_file = expand('$TMP/Powerline.cache')
let g:pyflakes_use_quickfix = 0
set t_Co=256
"colorscheme 
colorscheme marklar

" python mode
let g:pymode_folding = 0

if has("gui_running")
   " set default size: 90x35
   set columns=90
   set lines=35
   " No menus and no toolbar
   set guioptions-=m
   set guioptions-=T
endif

" puppet macro
let @p='gg:%s/\( =>.*[^,]\)$/\1,/g'

" notes saved in dropbox
let g:notes_directories = ['~/Dropbox/notes']

set modeline
set expandtab " expand tabs
set tabstop=4     " tab size = 2
set shiftwidth=4  " soft space = 2
set softtabstop=4
set smarttab
set wildchar=9 " tab as completion character
set pastetoggle=<F2>

set virtualedit=block
set clipboard+=unnamed
set showmatch " Show matching braces.
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.class,*.pyc

" Line wrapping on by default
set wrap
set linebreak

if has("win32") || has("win64")
   set guifont=Ubuntu\ Mono:h13.5
   let Tlist_Ctags_Cmd = 'e:\Tools\ctags.exe'
   set directory=$TMP
   if !has("gui_running")
      colorscheme slate
   end
elseif has("mac")
   set directory=/tmp
   set guifont=Envy\ Code\ R:h14
else
   set directory=/tmp
   set guifont=Envy\ Code\ R\ 14
endif

set history=100 " keep track of last commands
set number ruler " show line numbers
set incsearch " incremental searching on
set hlsearch " highlight all matches
set smartcase
set cursorline
" set colorcolumn=80
highlight OverLength ctermbg=darkred ctermfg=white guibg=#FFD9D9
match OverLength /\%>80v.\+/
set selectmode=key
set showtabline=2 " show always for console version
set laststatus=2 " Always show the statusline
set tabline=%!MyTabLine()
set wildmode=longest,list,full
set wildmenu " menu on statusbar for command autocomplete
" default to UTF-8 encoding
set encoding=utf8
set fileencoding=utf8
" enable visible whitespace
set listchars=tab:»·,trail:·,precedes:<,extends:>

set list

"set mouse=nicr

" no beep
autocmd VimEnter * set vb t_vb= 

"page up page down
map <PageUp> <C-F>
map <PageDown> <C-B>

" tab navigation like firefox
nmap <C-S-tab> :tabprevious<cr>
nmap <C-tab> :tabnext<cr>
map <C-S-tab> :tabprevious<cr>
map <C-tab> :tabnext<cr>
imap <C-S-tab> <ESC>:tabprevious<cr>i
imap <C-tab> <ESC>:tabnext<cr>i
nmap <C-t> :tabnew<cr>
imap <C-t> <ESC>:tabnew<cr> 
" map \tx for the console version as well
if !has("gui_running")
   nmap <Leader>tn :tabnext<cr>
   nmap <Leader>tp :tabprevious<cr>
   nmap <Leader><F4> :tabclose<cr>
end

" Map Ctrl-E Ctrl-W to toggle linewrap option like in VS
noremap <C-E><C-W> :set wrap!<CR>
" Map Ctrl-M Ctrl-L to expand all folds like in VS
noremap <C-M><C-L> :%foldopen!<CR>
" Remap omni-complete to avoid having to type so fast
" iunmap <C-Space>
" Mapping to C-@ for mac because iTerm2 and Terminal interprete C-Space as C-@
" thank you - http://stackoverflow.com/questions/7722177/how-do-i-map-ctrl-x-ctrl-o-to-ctrl-space-in-terminal-vim
inoremap <C-@> <C-x><C-o>
" SuperTab will use C-@ as well, works like a charm
let g:SuperTabDefaultCompletionType = "\<c-x>\<c-o>"
let g:EclimCompletionMethod = 'omnifunc'
" inoremap <C-@> <C-Space>
"

" C-W moves faster
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Windows like movements for long lines with wrap enabled:
noremap j gj
noremap k gk

" disable warnings from NERDCommenter:
let g:NERDShutUp = 1

" Make sure taglist doesn't change the window size
let g:Tlist_Inc_Winwidth = 0
nnoremap <silent> <F8> :TlistToggle<CR>

" language specific customizations:
let g:python_highlight_numbers = 1

" set custom file types I've configured
au BufNewFile,BufRead *.ps1  setf ps1
au BufNewFile,BufRead *.boo  setf boo
au BufNewFile,BufRead *.config  setf xml
au BufNewFile,BufRead *.xaml  setf xml
au BufNewFile,BufRead *.xoml  setf xml
au BufNewFile,BufRead *.blogTemplate  setf xhtml
au BufNewFile,BufRead *.brail  setf xhtml
au BufNewFile,BufRead *.rst  setf xml
au BufNewFile,BufRead *.rsb  setf xml
au BufNewFile,BufRead *.io  setf io
au BufNewFile,BufRead *.notes setf notes
au BufNewFile,BufRead *.mg setf mg

syntax on " syntax hilight on
syntax sync fromstart 
filetype plugin indent on

runtime xmlpretty.vim
command! -range=% Xmlpretty :call XmlPretty(<line1>, <line2>)
map <C-K><C-F> :Xmlpretty<CR>

"
" Bind NERD_Tree plugin to a <Ctrl+E,Ctrl+E>
"
noremap <C-E><C-E> :NERDTree<CR>
noremap <C-E><C-C> :NERDTreeClose<CR>

"
" Configure TOhtml command
"
let html_number_lines = 0
let html_ignore_folding = 1
let html_use_css = 1
"let html_no_pre = 0
let use_xhtml = 1

"
" Configure Ku
"
let g:ku_component_separators='/\\'
"
" Configure syntax specific options
"
let python_highlight_all = 1

"
" Enable spellchecking conditionally
"
map <Leader>se :setlocal spell spelllang=en_us<CR>
map <Leader>ss :setlocal spell spelllang=es_es<CR>
map <Leader>sn :setlocal nospell<CR>

map <silent> <PageUp> 1000<C-U>
map <silent> <PageDown> 1000<C-D>
imap <silent> <PageUp> <C-O>1000<C-U>
imap <silent> <PageDown> <C-O>1000<C-D>

"
" Other stuff
"
"runtime 'macros/matchit.vim'
"au VimEnter * RainbowParenthesesToggle
"au Syntax * RainbowParenthesesLoadRound
"au Syntax * RainbowParenthesesLoadSquare
"au Syntax * RainbowParenthesesLoadBraces

" 
" Configure tabs for the console version
"
function! MyTabLine()
  let s = ''
  for i in range(tabpagenr('$'))
    " select the highlighting
    if i + 1 == tabpagenr()
      let s .= '%#TabLineSel#'
    else
      let s .= '%#TabLine#'
    endif

    " set the tab page number (for mouse clicks)
    let s .= '%' . (i + 1) . 'T'

    " the label is made by MyTabLabel()
    let s .= ' %{MyTabLabel(' . (i + 1) . ')} '
  endfor

  " after the last tab fill with TabLineFill and reset tab page nr
  let s .= '%#TabLineFill#%T'

  " right-align the label to close the current tab page
  if tabpagenr('$') > 1
    let s .= '%=%#TabLine#%999Xclose'
  endif

  return s
endfunction

function! MyTabLabel(n)
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  return bufname(buflist[winnr - 1])
endfunction

" Split/Vsplit multiple files
function! Sp(dir, ...)
  let split = 'sp'
  if a:dir == '1'
    let split = 'vsp'
  endif
  if(a:0 == 0)
    execute split
  else
    let i = a:0
    while(i > 0)
      execute 'let files = glob (a:' . i . ')'
      for f in split (files, "\n")
        execute split . ' ' . f
      endfor
      let i = i - 1
    endwhile
    windo if expand('%') == '' | q | endif
endif
endfunction

com! -nargs=* -complete=file Sp call Sp(0, <f-args>)                                     
com! -nargs=* -complete=file Vsp call Sp(1, <f-args>)) 


" close scratch/preview buffer after omnicomplete insert
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" detect nodtes
autocmd BufEnter ~/Dropbox/notes/* :set syntax=notes
