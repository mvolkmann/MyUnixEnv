call pathogen#infect() " installs plugins found in ~/.vim/bundle

" Generate documentation from files in each directory in runtimepath.
" To see a list of these directories, enter :set runtimepath
call pathogen#helptags()

" Miscellaneous options {{{
" Enable syntax highlighting and overrule color settings made before this.
syntax on

set nocompatible " running vim, not vi, so don't force vi compatibility

set incsearch " use incremental searching
set hlsearch " highlight all search matches, not just the first

set mouse=a " enable use of mouse in all modes

set clipboard=unnamed " yank (copy) and delete (cut) also go to system clipboard

"set guifont=Monaco:h14
set guifont=Inconsolata:h18 " font used in GUI-version of Vim
set antialias

" To get word completion using dictionary while in insert mode,
" type some letters and press c-x c-k.
set dictionary=/usr/share/dict/words
set dictionary+=~/.vim/computer-words

" Don't need this since it is specified in status line config.
"set ruler " show line and column number of cursor position
" }}}

" Indentation and Tabs --- {{{
filetype plugin indent on " enable language-dependent indentation

set cindent " enable source code indentation
set cinoptions=(0s " indent continuations lines by one extra indent - working?

set shiftwidth=2 " indent code with two spaces
set tabstop=2 " tabs take two spaces
set softtabstop=2 " tabs take two spaces
set expandtab " replace tabs with spaces
set smarttab " pressing tab key in insert mode insert spaces
set shiftround " round indent to multiples of shiftwidth
" }}}

" Colors --- {{{
set t_Co=256 " number of colors " number of colors
"set t_AB=^[[48;5;%dm " set background color
"set t_AF=^[[38;5;%dm " set foreground color

"colorscheme torte
"colorscheme desert
"colorscheme volkmann
"colorscheme Tomorrow
"set background=light
"let g:solarized_termcolors=256
"set background=dark
"colorscheme solarized

"call togglebg#map("<F5>")

"hi Comment ctermbg=white ctermfg=green cterm=italic " Why doesn't this work?
"hi Constant ctermfg=purple 
"hi Folded ctermfg=black ctermbg=blue
"hi Identifier ctermfg=green 
"hi IncSearch ctermfg=white ctermbg=gray
"hi LineNr ctermfg=gray
"hi Function ctermfg=red 
"hi Keyword ctermfg=green 
"hi Operator ctermfg=green 
"hi Search ctermfg=red ctermbg=white
"hi Todo ctermfg=yellow ctermbg=gray
"hi Type ctermfg=blue 
" }}}

" Command-T plugin setup for fast file navigation {{{
let g:CommandTCancelMap=['<ESC>', '<C-c>']
let g:CommandTSelectNextMap=['<C-n>', 'j', '<DOWN>']
let g:CommandTSelectPrevMap=['<C-p>', 'k', '<UP>']
" }}}

" Key mappings --- {{{
" To see all normal mode mappings, :map
" To see all insert mode mappings, :imap

let mapleader = ","

" dictionary word completion
inoremap <leader>d foo<cr>

" edit .vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" source .vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>

" toggle line numbers
nnoremap <leader>n :setlocal number!<cr>

" replace all occurences of the complete word under the cursor
nnoremap <leader>r :%s/\<<C-r><C-w>\>/

" save buffer (requires stty -ixon in .bashrc)
inoremap <c-s> <c-o>:update<cr>
nnoremap <c-s> :update<cr>

" JSHint - see https://github.com/wookiehangover/jshint.vim
"let JSHintUpdateWriteOnly = 1
nnoremap <leader>j :JSHintUpdate<cr>

" NERDTree toggle
"nnoremap <leader>t :NERDTreeToggle<cr>

" Allow insert mode completion with tab key in addition to ctrl-n.
" Can't do this because it conflicts with Snipmate!
"imap <TAB> <C-n>
ino <c-j> <c-r>=TriggerSnippet()<cr>
snor <c-j> <esc>i<right><c-r>=TriggerSnippet()<cr>

" Switching buffers
" Use C-^ to toggle to last buffer
nnoremap <left> :bprev<cr>
nnoremap <right> :bnext<cr>

" CtrlP mappings - full path fuzzy file, buffer, mru, tag, ... finder
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP .'
"let g:ctrlp_working_path_mode='c'
" }}}

" The Silver Searcher
if executable('ag')
  " Use ag instead of grep.
  set grepprg=ag\ --nogroup\ --nocolor\ --column
  set grepformat=%f:%l:%c:\ %m

  " Use ag in CtrlP for listing files.
  " It is lightning fast and respects .gitignore.
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache.
  let g:ctrlp_use_caching = 0
endif

" Spell checking
"set nospell " start with spell checking off
"setlocal nospell " start with spell checking off
" Use dictionary of Vim's spell checker.
" It takes a couple of seconds for these to take effect.
" insert-mode toggle only for current buffer
inoremap <leader>s <c-o>:setlocal spell! spelllang=en_us<cr>
" normal-mode toggle only for current buffer
nnoremap <leader>s :setlocal spell! spelllang=en_us<cr>
nnoremap <leader>S i<c-x>s

set thesaurus=~/.vim/mthesaur.txt

" Status line --- {{{
set statusline=%t " file name (omits path)
set statusline+=%M " modified flag
set statusline+=%R " read-only flag
set statusline+=%= " left/right separator
set statusline+=line\ %l\ of\ %L " total lines
set statusline+=,\ col\ %c, " cursor line number and column
set statusline+=\ %P " percent through file

" Always display status line.
set laststatus=2

" Change status line background color based on mode.
" Note that green and yellow appear as gray.
highlight StatusLine ctermfg=lightyellow ctermbg=black
autocmd InsertLeave * highlight StatusLine ctermfg=lightyellow ctermbg=black
autocmd InsertEnter * highlight StatusLine ctermfg=darkgreen ctermbg=white
" }}}

" Folding --- {{{
" za - toggles folding on section containing cursor
" zr - reduce/open all folds one level deep
" zR - recursive version of zr (all levels)
" zm - fold more; close all folds
" zM - recursive version of zm (all levels)

augroup javascript
  autocmd!
  "let javaScript_fold=1 " fold on open
  "autocmd FileType javascript set foldmethod=syntax
  " jshint plugin runs jshint on JavaScript files
augroup END

augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END

nnoremap <leader>f :call FoldColumnToggle()<cr>
function! FoldColumnToggle()
  if &foldcolumn
    setlocal foldcolumn=0
  else
    setlocal foldcolumn=2
  endif
endfunction

" Automatically fold javadoc-style comments in .java, .h and .cpp files.
"autocmd FileType cpp :set fmr=/**,*/ fdm=marker fdc=1
"autocmd FileType h :set fmr=/**,*/ fdm=marker fdc=1
"autocmd FileType java :set fmr=/**,*/ fdm=marker fdc=1

" Automatically fold C-style comments in .java files.
"autocmd FileType java :set fmr=/*,*/ fdm=marker fdc=1
" }}}

" Quickfix window --- {{{
" You have the vim-impaired plugin installed, so you can use
" ]q and [q to navigate the current quickfix list.
" To search all JavaScript files in and below the starting directory,
" :grep pattern **/*.js
" To exclude a directory from being searched,
" :grep --exclude build pattern **/*.js
" When using grep on .js files, jshint also runs and creates another
" quickfix list.  To get back to the one created by grep, run :colder.

" Toggle viewing quickfix list with ,q.
nnoremap <leader>q :call QuickfixToggle()<cr>
let g:quickfixOpen = 0
function! QuickfixToggle()
  if g:quickfixOpen
    cclose
    let g:quickfixOpen = 0
    execute g:quickfixReturnToWindow . "wincmd w"
  else
    let g:quickfixReturnToWindow = winnr()
    copen
    let g:quickfixOpen = 1
  endif
endfunction
" }}}

" Asciidoc --- {{{
autocmd BufRead,BufNewFile *.txt,*.asciidoc,README,TODO,CHANGELOG,NOTES,ABOUT
  \ setlocal noautoindent expandtab tabstop=8 softtabstop=2 shiftwidth=2 filetype=asciidoc
  \ textwidth=70 wrap formatoptions=tcqn
  \ formatlistpat=^\\s*\\d\\+\\.\\s\\+\\\\|^\\s*<\\d\\+>\\s\\+\\\\|^\\s*[a-zA-Z.]\\.\\s\\+\\\\|^\\s*[ivxIVX]\\+\\.\\s\\+
  \ comments=s1:/*,ex:*/,://,b:#,:%,:XCOMM,fb:-,fb:*,fb:+,fb:.,fb:>
" }}}

" Pane resize --- {{{
" Resize panes to be equal width when window is resized.
augroup resizeWindow
  if has("autocmd")
    autocmd!
    autocmd VimResized * exe "normal \<C-W>="
  endif
augroup end
" }}}

" LESS files setup - does this do anything?
autocmd BufNewFile,BufRead *.less set filetype=less
