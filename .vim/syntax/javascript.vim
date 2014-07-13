" Language:  JavaScript
" Maintainer:  Mark Volkmann <r.mark.volkmann@gmail.com>
" URL: https://www.github.com/mvolkmann/vim/syntax/javascript.vim

if !exists("main_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
    finish
  endif
  let main_syntax = 'javascript'
elseif exists("b:current_syntax") && b:current_syntax == "javascript"
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

" Drop fold if it set but vim doesn't support it.
if version < 600 && exists("javaScript_fold")
  unlet javaScript_fold
endif

syntax case match

syntax keyword javaScriptBoolean true false
syntax keyword javaScriptBranch break continue
syntax keyword javaScriptCommentTodo TODO FIXME XXX TBD contained
syntax keyword javaScriptConditional if else switch
" Adding contained at the end means the keywords
" are ONLY valid when contained by another syntax element.
syntax keyword javaScriptDeclaration let var
syntax keyword javaScriptDeprecated  escape unescape
syntax keyword javaScriptException try catch finally throw
"syntax keyword javaScriptFunction function
syntax keyword javaScriptGlobal self window top parent
syntax keyword javaScriptIdentifier arguments this
syntax keyword javaScriptLabel case default
"syntax keyword javaScriptMember document event location 
syntax keyword javaScriptMessage alert confirm prompt status
syntax keyword javaScriptNull null undefined
syntax keyword javaScriptOperator new delete instanceof typeof
syntax keyword javaScriptRepeat while for do in
syntax keyword javaScriptReserved abstract boolean byte char class const debugger double enum export extends final float goto implements import int interface long native package private protected public short static super synchronized throws transient volatile 
syntax keyword javaScriptStatement return with
syntax keyword javaScriptType Array Boolean Date Function JSON Number Object Promise String RegExp
syntax match   javaScriptCommentSkip "^[ \t]*\*\($\|[ \t]\+\)"
syntax match   javaScriptLineComment "\/\/.*" contains=@Spell,javaScriptCommentTodo
syntax match   javaScriptNumber "-\=\<\d\+L\=\>\|0[xX][0-9a-fA-F]\+\>"
syntax match   javaScriptSemicolon ";"
syntax match   javaScriptSpecial "\\\d\d\d\|\\."
syntax match   javaScriptSpecialCharacter "'\\.'"
syntax region  javaScriptComment start="/\*"  end="\*/" contains=@Spell,javaScriptCommentTodo
syntax region  javaScriptRegexpString start=+/[^/*]+me=e-1 skip=+\\\\\|\\/+ end=+/[gim]\{0,2\}\s*$+ end=+/[gim]\{0,2\}\s*[;.,)\]}]+me=e-1 contains=@htmlPreproc oneline
syntax region  javaScriptStringD start=+"+  skip=+\\\\\|\\"+  end=+"\|$+  contains=javaScriptSpecial,@htmlPreproc
syntax region  javaScriptStringS start=+'+  skip=+\\\\\|\\'+  end=+'\|$+  contains=javaScriptSpecial,@htmlPreproc

" When multiple rules match, the last one takes precedence.
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

if exists("javaScript_fold")
  syntax match javaScriptFunction "\<function\>"
  syntax region javaScriptFunctionFold start="\<function\>.*[^};]$" end="^\z1}.*$" transparent fold keepend

  syntax sync match javaScriptSync grouphere javaScriptFunctionFold "\<function\>"
  syntax sync match javaScriptSync grouphere NONE "^}"

  setlocal foldmethod=syntax
  setlocal foldtext=getline(v:foldstart)
else
  "syntax keyword javaScriptFunction function
  " WHAT DOES THE REGEX SYNTAX ON THE NEXT LINE MEAN?
  syntax match javaScriptFunction /\<function\>/
  syntax match javaScriptBraces "[{}\[\]]"
  syntax match javaScriptParens "[()]"
endif

syntax sync fromstart
syntax sync maxlines=100

if main_syntax == "javascript"
  syntax sync ccomment javaScriptComment
endif

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_javascript_syn_inits")
  if version < 508
    let did_javascript_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink javaScrParenError javaScriptError
  HiLink javaScriptBoolean Boolean
  "HiLink javaScriptBraces Function
  HiLink javaScriptBranch Conditional
  HiLink javaScriptCharacter Character
  HiLink javaScriptComment Comment
  HiLink javaScriptCommentTodo Todo
  HiLink javaScriptConditional Conditional
  HiLink javaScriptConstant Label
  HiLink javaScriptDebug Debug
  HiLink javaScriptDeclaration Keyword
  HiLink javaScriptDeprecated Exception 
  HiLink javaScriptError Error
  HiLink javaScriptException Exception
  HiLink javaScriptFunction Keyword
  HiLink javaScriptGlobal Keyword
  HiLink javaScriptIdentifier Identifier
  HiLink javaScriptLabel Label
  HiLink javaScriptLineComment Comment
  "HiLink javaScriptMember Keyword
  HiLink javaScriptMessage Keyword
  HiLink javaScriptNull Keyword
  HiLink javaScriptNumber javaScriptValue
  HiLink javaScriptOperator Operator
  HiLink javaScriptRegexpString String
  HiLink javaScriptRepeat Repeat
  HiLink javaScriptReserved Keyword
  HiLink javaScriptSpecial Special
  HiLink javaScriptSpecialCharacter javaScriptSpecial
  HiLink javaScriptStatement Statement
  HiLink javaScriptStringD String
  HiLink javaScriptStringS String
  HiLink javaScriptType Type

  delcommand HiLink
endif

let b:current_syntax = "javascript"
if main_syntax == 'javascript'
  unlet main_syntax
endif
let &cpo = s:cpo_save
unlet s:cpo_save

" vim: ts=8
