set encoding=utf-8
scriptencoding utf-8

" Pathogen --- {{{
call pathogen#infect() " installs plugins found in ~/.vim/bundle

" Generate documentation from files in each directory in runtimepath.
" To see a list of these directories, enter :set runtimepath
call pathogen#helptags()
" }}}

" Miscellaneous options {{{
" Enable syntax highlighting.
" background must be set before "syntax on"!
"set background=light
set background=dark
syntax on

set antialias
set clipboard=unnamed " yank (copy) and delete (cut) also go to system clipboard
set cursorline " underlines current line so it is easy to see

" To get word completion using dictionary while in insert mode,
" type some letters and press c-x c-k.
set dictionary=/usr/share/dict/words
set dictionary+=~/.vim/computer-words

"set guifont=Monaco:h14
"set guifont=Inconsolata:h18 " font used in GUI-version of Vim
set guifont=Inconsolata\ for\ Powerline:h15
set hlsearch " highlight all search matches, not just the first
set incsearch " use incremental searching
set mouse=a " enable use of mouse in all modes

" Prevent files from being modified twice on save which is a problem for gulp watch.
" See http://stackoverflow.com/questions/21608480/gulp-js-watch-task-runs-twice-when-saving-files.
set nobackup

set nocompatible " running vim, not vi, so don't force vi compatibility
set noshowmode " since it is already being displayed in the status bar by airline
set number
set relativenumber
set term=screen-256color
set updatetime=750
set wildmode=list:longest,full " gives tab completion lists in ex command area

" Don't need this since it is specified in status line config.
"set ruler " show line and column number of cursor position

" Highlight column 81 in lines that exceed 80.
" 100 is a priority.
highlight ColorColumn ctermbg=red
call matchadd('ColorColumn', '\%81v', 100)

" netrw list style (toggle by pressing i)
let g:netrw_liststyle=3 " use tree mode as default view

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
" (1s means indent lines after an open paren by 1 shiftwidth. Default is " (2s.
set cinoptions=(1s

set shiftwidth=2 " indent code with two spaces
set tabstop=2 " tabs take two spaces
set softtabstop=2 " tabs take two spaces
set expandtab " replace tabs with spaces
set smarttab " pressing tab key in insert mode insert spaces
set shiftround " round indent to multiples of shiftwidth
" }}}

" Colors --- {{{
set t_Co=256 " number of colors " number of colors
" See color codes in MyUnixEnv/notes/vim-cterm-colors.png.
hi! DiffAdd    ctermbg=22 " green for lines added
hi! DiffChange ctermbg=54 " purple for lines that were changed
hi! DiffDelete ctermbg=88 " red for lines removed
hi! DiffText   ctermbg=18 " blue for parts of lines that were changed

"set t_AB=^[[48;5;%dm " set background color
"set t_AF=^[[38;5;%dm " set foreground color

"colorscheme torte
"colorscheme desert
"colorscheme volkmann
"colorscheme Tomorrow
"let g:solarized_termcolors=256
"let g:solarized_termtrans=1
"colorscheme solarized

" These work with .vim/syntax/javascript.vim.
" To enable italics, see
" https://alexpearce.me/2014/05/italics-in-iterm2-vim-tmux/
hi Boolean ctermfg=172 " orange
hi Class ctermfg=12 " blue
hi Comment ctermfg=42 " green cterm=italic
hi Function ctermfg=9 " red
hi Keyword ctermfg=191 " yellow
hi Normal ctermfg=7 " light gray
hi Number ctermfg=172 " orange
hi Operator ctermfg=163 " purple
hi Reserved ctermfg=1 ctermbg=8 " red on gray
hi Search cterm=underline ctermfg=15 ctermbg=0 " white on black
hi Semicolon ctermfg=8 " gray
hi String ctermfg=172 " orange
hi Tag ctermfg=90 " purple
hi This ctermfg=87 " light blue
hi Todo ctermbg=1 ctermfg=15 " white on red

hi cssAuralAttr ctermfg=15 " white
hi cssBoxAttr ctermfg=15 " white
hi cssBoxProp ctermfg=191 " yellow
hi cssClassName ctermfg=12 " blue
hi cssColor ctermfg=15 " white
hi cssColorProp ctermfg=191 " yellow
hi cssCommonAttr ctermfg=15 " white
hi cssBoxProp ctermfg=191 " yellow
hi cssDefinition ctermfg=191 " yellow
hi cssFontAttr ctermfg=15 " white
hi cssIdentifier ctermfg=172 " orange
hi cssPagingProp ctermfg=15 " white
hi cssRenderAttr ctermfg=15 " white
hi cssRenderProp ctermfg=191 " yellow
hi cssTableAttr ctermfg=15 " white
hi cssTableProp ctermfg=191 " yellow
hi cssTagName ctermfg=9 " red
hi cssTextAttr ctermfg=15 " white
hi cssTextProp ctermfg=191 " yellow
hi cssValueLength ctermfg=15 " white
hi cssValueNumber ctermfg=15 " white
hi cssUIAttr ctermfg=15 " white
hi cssUIProp ctermfg=191 " yellow

hi lessComment ctermfg=22 " green cterm=italic
hi lessVariable ctermfg=13 " magenta

hi htmlArg ctermfg=8 " dark gray; attribute names
hi htmlEndTag ctermfg=1 " red
hi htmlHead ctermfg=191 " yellow
hi htmlString ctermfg=15 " white
hi htmlTag ctermfg=2 " green; start tag
hi htmlTagName ctermfg=191 " yellow
hi htmlTitle ctermfg=15 " white

hi lineNr ctermfg=21 " blue
hi cursorLineNr ctermfg=12 " blue
" }}}

" Command-T plugin setup for fast file navigation {{{
let g:CommandTCancelMap=['<ESC>', '<c-c>']
let g:CommandTSelectNextMap=['<c-n>', 'j', '<DOWN>']
let g:CommandTSelectPrevMap=['<c-p>', 'k', '<UP>']
" }}}

" Key mappings --- {{{
" To see all normal mode mappings, :map
" To see all insert mode mappings, :imap
 " toggles
let mapleader = ','

" dictionary word completion
" Press ctrl-n and ctrl-p to traverse list of matching words.
inoremap <leader>d <c-x><c-k>

" Avoid using the esc key in preparation for new MacBooks.
inoremap jk <esc>
inoremap kj <esc>

" edit .vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" configure use of splits
set splitbelow
set splitright
nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-l> <c-w><c-l>
nnoremap <c-h> <c-w><c-h>

" source .vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>

" show syntax groups for token under cursor
nnoremap <leader>sg :echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')<cr>

" toggle search highlighting
nnoremap <leader>h :set hlsearch! hlsearch?<cr>

" toggle line numbering between relative, absolute, and none
function! NumberToggle()
  if (&relativenumber == 1) " turn number on and relative off
    set number
    set norelativenumber
  elseif (&number == 1) " turn both off
    set nonumber
    set norelativenumber
  else " turn both on
    set number
    set relativenumber
  endif
endfunc
"nnoremap <leader>n :setlocal number!<cr>
nnoremap <leader>n :call NumberToggle()<cr>

" replace all occurences of the complete word under the cursor
"nnoremap <leader>r :%s/\<<c-r><c-w>\>/

" Switching buffers
" Use C-^ to toggle to last buffer
nnoremap <left> :bprev<cr>
nnoremap <right> :bnext<cr>

" Move up or down by a screen line, not a physical line.
" These differ when text wraps.
nnoremap <down> gj
nnoremap <up> gk

" Quick pairs
inoremap <leader>' ''<esc>i
inoremap <leader>" ""<esc>i
inoremap <leader>( ()<esc>i
inoremap <leader>[ []<esc>i
inoremap <leader>{ {}<esc>i

" Add semicolon to end of line
nnoremap <leader>; A;<esc>
inoremap <leader>; <esc>A;

" save buffer (requires stty -ixon in .bashrc)
" In insert mode, <c-o> escapes to normal mode for one command
" and then switches back to insert mode.
inoremap <c-s> <c-o>:update<cr>
nnoremap <c-s> :update<cr>

" Source the current buffer
nnoremap <leader>sb :source %<cr>

" NERDTree plugin toggle
"nnoremap <leader>t :NERDTreeToggle<cr>

" Allow insert mode completion with tab key in addition to ctrl-n.
" Can't do this because it conflicts with Snipmate!
"imap <tab> <c-n>
"ino <c-j> <c-r>=TriggerSnippet()<cr>
"snor <c-j> <esc>i<right><c-r>=TriggerSnippet()<cr>

" CtrlP mappings - full path fuzzy file, buffer, mru, tag, ... finder
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP .'
"let g:ctrlp_working_path_mode='c'

" ctrlp-funky mappings
" To get a list of all functions in current file,
" select one in quickfix list using arrow keys,
" and press return to go to it ...
nnoremap <leader>fu :CtrlPFunky<cr>
" To go to the definition of the function name under the cursor ...
" (still have to press return in quickfix list)
nnoremap <leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<cr>

" EasyMotion mappings
" Search for beginning of a word in both directions.
map <leader>w <plug>(easymotion-bd-w)
" Search for beginning of a word in all windows.  Why doesn't this work?
"nmap <leader>w <plug>(easymotion-overwin-w)

" Printing using enscript (these aren't working yet)
noremap <leader>e1 execute "normal! '<,'>:w !enscript --borders --fancy-header --line-numbers=1 --mark-wrapped-lines=arrow --pretty-print=cpp -L63"
noremap <leader>e2 execute "normal! '<,'>:w !enscript --borders --columns-2 --fancy-header --line-numbers=1 --mark-wrapped-lines=arrow --pretty-print=cpp"
" }}}

" JavaScript and JSX syntax highlighting
" Enable syntax highlighting for Flow.
let g:javascript_plugin_flow = 1
" Enable syntax highlighting in jsdoc comments.
let g:javascript_plugin_jsdoc = 1
" Enable JSX syntax highlighting in files with a .jsx extension instead of .js.
let g:jsx_ext_required = 0

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
" This is also used for lines that ESLint marks as containing errors.
highlight SpellBad ctermfg=black ctermbg=red

set thesaurus=~/.vim/mthesaur.txt
" }}}

" Folding --- {{{
" See VimNotes.txt for fold-related key commands.

augroup javaScript
  autocmd!
  "autocmd FileType javascript set foldmethod=syntax
  " JavaScript folding is now configured in .vim/ftplugins/javascript.vim.
  "autocmd FileType javaScript :set fmr=/**,*/ fdm=marker fdc=1
  "set syntax=javaScript
  set foldmethod=syntax
  set foldlevel=1
  "let javaScript_fold=1
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
" When using grep on .js files, ESLint also runs and creates another
" quickfix list.  To get back to the one created by grep, run :colder.

" Toggle viewing quickfix list with ,q.
nnoremap <leader>q :call QuickfixToggle()<cr>
let g:quickfixOpen = 0
function! QuickfixToggle()
  if g:quickfixOpen
    cclose
    let g:quickfixOpen = 0
    execute g:quickfixReturnToWindow . 'wincmd w'
  else
    let g:quickfixReturnToWindow = winnr()
    copen
    let g:quickfixOpen = 1
  endif
endfunction
" }}}

" Asynchronous Lint Engine (ALE)
highlight clear ALEErrorSign " otherwise uses error bg color (typically red)
highlight clear ALEWarningSign " otherwise uses error bg color (typically red)
" Limit linters used for JavaScript.
let g:ale_linters = {
\  'javascript': ['eslint'],
\}
"let g:ale_sign_error = '💣'
let g:ale_sign_error = '👎'
"let g:ale_sign_warning = '🚩'
"let g:ale_sign_warning = '🚫'
"let g:ale_sign_warning = '💩'
let g:ale_sign_warning = '❓'
let g:ale_statusline_format = ['👎 %d', '❓ %d', '']
" %linter% is the name of the linter that provided the message
" $s is the error or warning message
let g:ale_echo_msg_format = '%linter% says %s'
" Map keys to navigate between lines with errors and warnings.
" <c-j> works, but <c-k> doesn't because that is mapped to
" clear the screen in iTerm!  How can you remove that mapping?
"TODO: Find non-conflicting keys for these!
nnoremap <leader>an :ALENextWrap<cr>
nnoremap <leader>ap :ALEPreviousWrap<cr>

" Asciidoc --- {{{
"autocmd BufRead,BufNewFile *.txt,*.asciidoc,README,TODO,CHANGELOG,NOTES,ABOUT
autocmd BufRead,BufNewFile *.asciidoc,README,TODO,CHANGELOG,NOTES,ABOUT
  \ setlocal noautoindent expandtab tabstop=8 softtabstop=2 shiftwidth=2 filetype=asciidoc
  \ textwidth=70 wrap formatoptions=tcqn
  \ formatlistpat=^\\s*\\d\\+\\.\\s\\+\\\\|^\\s*<\\d\\+>\\s\\+\\\\|^\\s*[a-zA-Z.]\\.\\s\\+\\\\|^\\s*[ivxIVX]\\+\\.\\s\\+
  \ comments=s1:/*,ex:*/,://,b:#,:%,:XCOMM,fb:-,fb:*,fb:+,fb:.,fb:>
" }}}

" airline --- {{{
" Display list of buffer names at top when only one is visible.
"let g:airline#extensions#tabline#enabled = 1
"let g:airline_powerline_fonts = 1
" Fix colors so status bar is readable in non-active windows.
" See https://github.com/bling/vim-airline/issues/506.
"let g:airline#extensions#branch#enabled = 1 " show git branch
" To hide vim-gutter stats on added, modified, and delete lines ...
"let g:airline#extensions#hunks#enabled=0

"let g:Powerline_symbols = 'fancy'
"set fillchars+=stl:\ ,stlnc:\
"set termencoding=utf-8

"let g:airline_theme_patch_func = 'AirlineThemePatch'
"function! AirlineThemePatch(palette)
  "for colors in values(a:palette.inactive)
    "let colors[3] = 245
  "endfor
"endfunction
" }}}

" git --- {{{
let g:gitgutter_max_signs=1200
" }}}

" Pane resize --- {{{
" Resize panes to be equal width when window is resized.
augroup resizeWindow
  if has('autocmd')
    autocmd!
    autocmd VimResized * exe "normal \<c-w>="
  endif
augroup end
" }}}

" Rainbow (), [], and {} --- {{{
" This doesn't always work correctly inside JSX code.
" Toggle rainbow plugin.
nnoremap <leader>rp :RainbowParentheses!!<cr>
let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]
" }}}

" fixmyjs --- {{{
" This runs "eslint --fix" on current buffer without saving it.
" It requires running "npm install -g fixmyjs eslint eslint-plugin-babel".
let g:fixmyjs_engine = 'eslint'
let g:fixmyjs_rc_path = '~/.eslintrc.json'
noremap <leader>fj :Fixmyjs<cr>
" }}}

" Status line --- {{{
" Always display status line.
set laststatus=2

" Comment out these customizations if using vim-airline
" to control the status line.
set statusline=%t " file name (omits path)
set statusline+=%M " modified flag
set statusline+=%R " read-only flag
set statusline+=\ %{ALEGetStatusLine()} " Asynchronous Lint Engine
set statusline+=%= " left/right separator
set statusline+=line\ %l " line number
set statusline+=\ of\ %L " total lines
set statusline+=,\ col\ %c, " cursor line number and column
set statusline+=\ %P " percent through file

" Change status line background color based on mode.
highlight StatusLine ctermfg=lightyellow ctermbg=black
autocmd InsertLeave * highlight StatusLine ctermfg=lightyellow ctermbg=black
autocmd InsertEnter * highlight StatusLine ctermfg=darkgreen ctermbg=white
" }}}

" Syntastic --- {{{
" Current this is not being used because ALE is being used instead.

" Stop Syntastic from taking over :E from netrw.
command! E :execute ":Explore"

" Run Syntastic error checking.
nnoremap <leader>sy :SyntasticCheck<cr>

" Don't check HTML files because it considers
" AngularJS directives to be " invalid.
"let g:syntastic_disabled_filetypes=['html']
let g:syntastic_html_checkers=['']
let g:syntastic_javascript_checkers=['eslint']

" }}}

" Tsuquyomi - plugin for TypeScript --- {{{
"autocmd FileType typescript setlocal completeopt+=menu,preview
"autocmd FileType typescript nmap <buffer> <leader>r <plug>(TsuquyomiRenameSymbol)
"autocmd FileType typescript nmap <buffer> <leader>t : <c-u>echo tsuquyomi#hint()<cr>
" }}}

" Ultisnips plugin {{{
let g:UltiSnipsExpandTrigger='<c-j>'
let g:UltiSnipsListSnippets='<leader>snips'
let g:UltiSnipsJumpForwardTrigger='<c-j>'
let g:UltiSnipsJumpBackwardTrigger='<c-k>'
nnoremap <leader>es :UltiSnipsEdit<cr>
" }}}

" vim-flow {{{
" Automatically close the quickfix window that
" is opened when Flow detects a type error
let g:flow#autoclose=1
" Don't automatically perform type checking when a file is saved with :w.
let g:flow#enable=0
" Jump to first line with a type error.
let g:flow#errjmp=1
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
