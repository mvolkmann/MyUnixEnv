" Language:  JavaScript
" Maintainer:  Mark Volkmann <r.mark.volkmann@gmail.com>
" URL: https://www.github.com/mvolkmann/vim/syntax/javascript.vim

if !exists("main_syntax")
  if exists("b:current_syntax")
    finish
  endif
  let main_syntax = 'javascript'
elseif exists("b:current_syntax") && b:current_syntax == "javascript"
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

syntax case match

syntax keyword javaScriptBoolean true false
syntax keyword javaScriptClass Array ArrayBuffer Boolean Date Error Function JSON Map Math Number Object Promise Proxy RangeError ReferenceError Reflect RegExp Set String Symbol SyntaxError TypeError WeakMap WeakSet
" Adding contained at the end means the keywords
" are ONLY valid when contained by another syntax element.
syntax keyword javaScriptCommentTodo TODO FIXME TBD contained
syntax keyword javaScriptGlobal alert confirm document location parseFloat parseInt prompt window
syntax keyword javaScriptThis this
"TODO: Temporarily removed "class" and "extends" from javaScriptKeyword list because
"TODO: that interferes with the javaScriptClassName and "javaScriptExtendsName regions.
syntax keyword javaScriptKeyword break case catch const continue default delete do else export finally for function if import in let module null of return static super switch throw try undefined var while with yield

"syntax keyword javaScriptOperator instanceof typeof == === != !== = + - * / % ++ -- += -= *= /= %= < <= > >= && || ! new delete in of ?
syntax keyword javaScriptOperator delete instanceof typeof void new in of
syntax match   javaScriptOperator /[\!\|\&\+\-\<\>\=\%\/\*\~\^]\{1}/

syntax keyword javaScriptReserved abstract arguments boolean byte char debugger double enum final float goto implements int interface long native package private protected public short synchronized throws transient volatile
syntax match javaScriptSemicolon ";"
syntax match javaScriptCommentSkip "^[ \t]*\*\($\|[ \t]\+\)"
syntax match javaScriptLineComment "\/\/.*" contains=@Spell,javaScriptCommentTodo
syntax match javaScriptNumber "-\=\<\d\+L\=\>\|0[xX][0-9a-fA-F]\+\>"
syntax region javaScriptComment start="/\*"  end="\*/" contains=@Spell,javaScriptCommentTodo

syntax match javaScriptSpecial "\\\d\d\d\|\\."
syntax match javaScriptSpecialCharacter "'\\.'"
syntax region javaScriptRegexpString start=+/[^/*]+me=e-1 skip=+\\\\\|\\/+ end=+/[gim]\{0,2\}\s*$+ end=+/[gim]\{0,2\}\s*[;.,)\]}]+me=e-1 contains=@htmlPreproc oneline
syntax region javaScriptStringD start=+"+  skip=+\\\\\|\\"+  end=+"\|$+  contains=javaScriptSpecial,@htmlPreproc
syntax region javaScriptStringS start=+'+  skip=+\\\\\|\\'+  end=+'\|$+  contains=javaScriptSpecial,@htmlPreproc

" When multiple rules match, the last one takes precedence.

syntax match javaScriptFnName /\v[$_A-Za-z]\w*\(/he=e-1 oneline contains=javaScriptParens
" Assignment of anonymous function
" Why does text after "function" turn red if I use "contains" below?
" I want to use that so "function" will look like other keywords!
"syntax region javaScriptFnName start=/\v[$_A-Za-z]\w*/ end=" = function"he=s-1 contains=javaScriptFunction oneline
syntax region javaScriptFnName start=/\v[$_A-Za-z]\w*/ end=" = function"he=s-1 oneline
" JavaScript name before a left paren
syntax match javaScriptFnName /\v[$_A-Za-z]\w*\(/he=e-1 oneline contains=javaScriptParens
" JavaScript name after "new "
syntax region javaScriptType start=/^new \| new /hs=s+4 end=/[$_A-Za-z]\w*/ oneline contains=javaScriptParens
" ES6 arrow function name
syntax region javaScriptFnName start=/[$_A-Za-z]\w*/ end=/ = [^=]\+ =>/me=s-1,re=s-1 oneline

syntax keyword jsClassKeywords class extends contained
syntax region javaScriptClassName start=/^class \| class /hs=e+1 end=/ /he=s-1 "contains=jsClassKeywords
" Can't start the start pattern with a space because javaScriptClassName already consumed it.
syntax region javaScriptExtendsName start=/extends /hs=e+1 end=/ /he=s-1 "contains=jsClassKeywords

if exists("javaScript_fold")
  syntax match javaScriptFunction "\<function\>"
  syntax region javaScriptFunctionFold start="\<function\>.*[^};]$" end="^\z1}.*$" transparent fold keepend

  syntax sync match javaScriptSync grouphere javaScriptFunctionFold "\<function\>"
  syntax sync match javaScriptSync grouphere NONE "^}"

  setlocal foldmethod=syntax
  setlocal foldtext=getline(v:foldstart)
else
  syntax match javaScriptBraces "[{}\[\]]"
  syntax match javaScriptParens "[()]"
endif

syntax sync fromstart
syntax sync maxlines=100

if main_syntax == "javascript"
  syntax sync ccomment javaScriptComment
endif

" Define the default highlighting.
if !exists("did_javascript_syn_inits")
  hi def link javaScriptBoolean Boolean
  hi def link javaScriptClass Class
  hi def link javaScriptClassName Class
  hi def link javaScriptComment Comment
  hi def link javaScriptCommentTodo Todo
  hi def link javaScriptExtendsName Class
  hi def link javaScriptFnName Function
  hi def link javaScriptGlobal Keyword
  hi def link javaScriptKeyword Keyword
  hi def link javaScriptLineComment Comment
  hi def link javaScriptNumber Number
  hi def link javaScriptOperator Operator
  hi def link javaScriptRegexpString String
  hi def link javaScriptReserved Reserved
  hi def link javaScriptSemicolon Semicolon
  hi def link javaScriptStringD String
  hi def link javaScriptStringS String
  hi def link javaScriptThis This
  hi def link javaScriptType Class
endif

let b:current_syntax = "javascript"
if main_syntax == 'javascript'
  unlet main_syntax
endif
let &cpo = s:cpo_save
unlet s:cpo_save
