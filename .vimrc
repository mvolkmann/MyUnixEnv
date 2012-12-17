set t_Co=256

call pathogen#infect()
call pathogen#helptags()
syntax on
filetype plugin indent on

set nocompatible " running vim, not vi, so don't force vi compatibility

set cindent " enable source code indentation
set cinoptions=(0s " indent continuations lines by one extra indent - working?

set shiftwidth=2 " indent code with two spaces
set tabstop=2 " tabs take two spaces
set softtabstop=2 " tabs take two spaces
set expandtab " replace tabs with spaces
set smarttab
set shiftround

set incsearch " use incremental searching
set hlsearch " highlight all search matches, not just the first

set mouse=a

set ruler

" Automatically fold javadoc-style comments in .java, .h and .cpp files.
"autocmd FileType cpp :set fmr=/**,*/ fdm=marker fdc=1
"autocmd FileType h :set fmr=/**,*/ fdm=marker fdc=1
"autocmd FileType java :set fmr=/**,*/ fdm=marker fdc=1

" Automatically fold C-style comments in .java files.
"autocmd FileType java :set fmr=/*,*/ fdm=marker fdc=1

"map <F5> :CoffeeRun<CR>

" Allow insert mode completion with tab key in addition to ctrl-n.
imap <TAB> <C-n>

"set t_AB=^[[48;5;%dm
"set t_AF=^[[38;5;%dm

"colorscheme torte
"colorscheme desert
"colorscheme volkmann
"colorscheme Tomorrow
colorscheme solarized

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

"set guifont=Monaco:h14
set guifont=Inconsolata:h18
set antialias

"Slimux setup - http://github.com/epeli/slimux
map <Leader>s :SlimuxREPLSendLine<CR> " sends current line to another pane
vmap <Leader>s :SlimuxREPLSendSelection<CR> " sends selected text to another pane
map <Leader>a :SlimuxShellLast<CR> " reruns last shell command
