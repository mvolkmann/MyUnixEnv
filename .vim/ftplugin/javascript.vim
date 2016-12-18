" Code Folding
"syntax region foldComment start=/\/\*/ end=/\*\// fdm=marker fdc=1
"set fmr=/**,*/ fdm=marker fdc=1
syntax region foldBraces start=/{/ end=/}/ transparent fold keepend extend
"setlocal foldmethod=syntax
"setlocal foldlevel=1
