" Pathogen --- {{{
call pathogen#infect() " installs plugins found in ~/.vim/bundle

" Generate documentation from files in each directory in runtimepath.
" To see a list of these directories, enter :set runtimepath
call pathogen#helptags()
" }}}

" Miscellaneous options {{{
" Enable syntax highlighting.
" background must be set before "syntax on"!
set background=light
"set background=dark
syntax on

set antialias
set clipboard=unnamed " yank (copy) and delete (cut) also go to system clipboard
set cursorline " underlines current line so it is easy to see

" To get word completion using dictionary while in insert mode,
" type some letters and press c-x c-k.
set dictionary=/usr/share/dict/words
set dictionary+=~/.vim/computer-words

"set guifont=Monaco:h14
set guifont=Inconsolata:h18 " font used in GUI-version of Vim
set hlsearch " highlight all search matches, not just the first
set incsearch " use incremental searching
set mouse=a " enable use of mouse in all modes
set nocompatible " running vim, not vi, so don't force vi compatibility
set updatetime=750

" Don't need this since it is specified in status line config.
"set ruler " show line and column number of cursor position

" Highlight column 81 in lines that exceed 80.
" 100 is a priority.
highlight ColorColumn ctermbg=red
call matchadd('ColorColumn', '\%81v', 100)

set encoding=utf-8
set foldlevelstart=0
"set lazyredraw
set list
" Render tab characters with a right-pointing double angle
" followed by middle dots to show where the tab stop ends.
" Render trailing spaces with middle dots.
set listchars=tab:»·,trail:·
" }}}

" Abbreviations --- {{{
iabbrev @@ r.mark.volkmann@gmail.com
iabbrev rmv R. Mark Volkmann
" }}}

" Indentation and Tabs --- {{{
filetype plugin indent on " enable language-dependent indentation

set cindent " enable source code indentation
set cinoptions=(0

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
"let g:solarized_termcolors=256
"let g:solarized_termtrans=1
"colorscheme solarized

" To enable italics, see
" https://alexpearce.me/2014/05/italics-in-iterm2-vim-tmux/
""hi Comment ctermfg=green cterm=italic
"hi Comment ctermfg=darkgray cterm=italic
"hi Conditional ctermfg=brown
""hi Constant ctermfg=darkmagenta
""hi CursorLine cterm=underline
"hi Error ctermfg=red ctermbg=yellow
""hi Folded ctermfg=black ctermbg=blue
"hi Function ctermfg=brown
""hi Identifier ctermfg=green
""hi IncSearch ctermfg=white ctermbg=gray
"hi LineNr ctermfg=gray
"hi Function ctermfg=red
"hi Keyword ctermfg=brown
""hi Number ctermfg=blue
"hi Operator ctermfg=brown
""hi Search ctermfg=red ctermbg=white
"hi Statement ctermfg=brown
"hi String ctermfg=lightgreen
""hi Todo ctermfg=yellow ctermbg=gray
"hi Type ctermfg=darkblue

" These work with .vim/syntax/javascript.vim.
""hi javaScriptAjaxMethods ctermfg=red
""hi javaScriptArrow ctermfg=red
"hi javaScriptBraces ctermfg=darkgray
""hi javaScriptComment ctermfg=lightgreen
""hi javaScriptCommentTodo ctermbg=red ctermfg=white
"hi javaScriptDeclaration ctermfg=brown
""hi javaScriptDocComment ctermfg=lightgreen
""hi javaScriptDomMethods ctermfg=red
""hi javaScriptEventListenerMethods ctermfg=red
"hi javaScriptFnName ctermfg=red
""hi javaScriptFuncDef ctermfg=red
""hi javaScriptFuncExp ctermfg=red
"hi javaScriptFunction ctermfg=brown
"hi javaScriptGlobal ctermfg=lightgray
""hi javaScriptLineComment ctermfg=lightgreen
"hi javaScriptMessage ctermfg=red
""hi javaScriptNumber ctermfg=blue
"hi javaScriptParens ctermfg=darkgray
""hi javaScriptProprietaryMethods ctermfg=red
"hi javaScriptSemicolon ctermfg=darkgray
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

" Allow using ; in place of : in normal mode so shift key isn't needed.
" This means ; no longer finds next match of a character
" after using the f command.
noremap ; :

" dictionary word completion
" Press ctrl-n and ctrl-p to traverse list of matching words.
inoremap <leader>d <c-x><c-k>

" edit .vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" source .vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>

" toggle search highlighting
nnoremap <leader>h :set hlsearch! hlsearch?<cr>

" toggle line numbers
nnoremap <leader>n :setlocal number!<cr>

" replace all occurences of the complete word under the cursor
nnoremap <leader>r :%s/\<<C-r><C-w>\>/

" save buffer (requires stty -ixon in .bashrc)
" In insert mode, <c-o> escapes to normal mode for one command
" and then switches back to insert mode.
inoremap <c-s> <c-o>:update<cr>
nnoremap <c-s> :update<cr>

" JSHint - see https://github.com/wookiehangover/jshint.vim
"let JSHintUpdateWriteOnly = 1
nnoremap <leader>j :JSHintUpdate<cr>

" NERDTree plugin toggle
"nnoremap <leader>t :NERDTreeToggle<cr>

" Allow insert mode completion with tab key in addition to ctrl-n.
" Can't do this because it conflicts with Snipmate!
"imap <TAB> <C-n>
"ino <c-j> <c-r>=TriggerSnippet()<cr>
"snor <c-j> <esc>i<right><c-r>=TriggerSnippet()<cr>

" Switching buffers
" Use C-^ to toggle to last buffer
nnoremap <left> :bprev<cr>
nnoremap <right> :bnext<cr>

" CtrlP mappings - full path fuzzy file, buffer, mru, tag, ... finder
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP .'
"let g:ctrlp_working_path_mode='c'
" }}}

" The Silver Searcher (ag) --- {{{
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
" }}}

" Spell checking --- {{{
"set nospell " start with spell checking off
"setlocal nospell " start with spell checking off
" Use dictionary of Vim's spell checker.
" It takes a couple of seconds for these to take effect.
" insert-mode toggle only for current buffer
inoremap <leader>s <c-o>:setlocal spell! spelllang=en_us<cr>
" normal-mode toggle only for current buffer
nnoremap <leader>s :setlocal spell! spelllang=en_us<cr>
nnoremap <leader>S i<c-x>s
"highlight SpellBad term=reverse ctermbg=7
highlight clear SpellBad
" This is also used for lines that JSHint marks as containing errors.
highlight SpellBad ctermfg=black ctermbg=red

set thesaurus=~/.vim/mthesaur.txt
" }}}

" Status line --- {{{
" Always display status line.
set laststatus=2

" The customizations below are commented out because I am
" using vim-airline to control the status line for now.
"set statusline=%t " file name (omits path)
"set statusline+=%M " modified flag
"set statusline+=%R " read-only flag
"set statusline+=%= " left/right separator
"set statusline+=line\ %l " line number
"set statusline+=\ of\ %L " total lines
"set statusline+=,\ col\ %c, " cursor line number and column
"set statusline+=\ %P " percent through file

" Change status line background color based on mode.
"highlight StatusLine ctermfg=lightyellow ctermbg=black
"autocmd InsertLeave * highlight StatusLine ctermfg=lightyellow ctermbg=black
"autocmd InsertEnter * highlight StatusLine ctermfg=darkgreen ctermbg=white

" Display list of buffer names at top when only one is visible.
"let g:airline#extensions#tabline#enabled = 1
"let g:airline_powerline_fonts = 1
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
"autocmd BufRead,BufNewFile *.txt,*.asciidoc,README,TODO,CHANGELOG,NOTES,ABOUT
autocmd BufRead,BufNewFile *.asciidoc,README,TODO,CHANGELOG,NOTES,ABOUT
  \ setlocal noautoindent expandtab tabstop=8 softtabstop=2 shiftwidth=2 filetype=asciidoc
  \ textwidth=70 wrap formatoptions=tcqn
  \ formatlistpat=^\\s*\\d\\+\\.\\s\\+\\\\|^\\s*<\\d\\+>\\s\\+\\\\|^\\s*[a-zA-Z.]\\.\\s\\+\\\\|^\\s*[ivxIVX]\\+\\.\\s\\+
  \ comments=s1:/*,ex:*/,://,b:#,:%,:XCOMM,fb:-,fb:*,fb:+,fb:.,fb:>
" }}}

" airline --- {{{
" Fix colors so status bar is readable in non-active windows.
" See https://github.com/bling/vim-airline/issues/506.
let g:airline_enable_branch = 0
" To hide vim-gutter stats on added, modified, and delete lines ...
"let g:airline#extensions#hunks#enabled=0
let g:airline_theme_patch_func = 'AirlineThemePatch'
function! AirlineThemePatch(palette)
  "if g:airline_theme == 'badwolf'
    for colors in values(a:palette.inactive)
      let colors[3] = 245
    endfor
  "endif
endfunction
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

" Syntastic --- {{{

" Stop Syntastic from taking over :E from netrw.
command! E :execute ":Explore"

" Run Syntastic error checking.
nnoremap <leader>sy :SyntasticCheck<cr>

" Don't check HTML files because it considers
" AngularJS directives to be " invalid.
"let g:syntastic_disabled_filetypes=['html']
let g:syntastic_html_checkers=['']

" }}}

" Ultisnips plugin {{{
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsListSnippets="<leader>snips"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
nnoremap <leader>es :UltiSnipsEdit<cr>
" }}}

" LESS files setup - does this do anything?
autocmd BufNewFile,BufRead *.less set filetype=less

" YouCompleteMe plugin --- {{{

" Allow use of YCM for all file types.
"let g:ycm_filetype_blacklist = {}

" Use identifiers in Exhuberant Ctags tags files.
" This makes Vim unusable slow and stops any completions from working.
" I get the error (see ycm-users mailing list post).
"let g:ycm_collect_identifiers_from_tags_files = 1

" Toggle g:ycm_auto_trigger option
"nnoremap <leader>y :call YcmToggle()<cr>
"function! YcmToggle()
"  if g:ycm_auto_trigger
"    let g:ycm_auto_trigger = 0
"  else
"    let g:ycm_auto_trigger = 1
"  endif
"endfunction
" }}}
