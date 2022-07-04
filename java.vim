highlight link javaScopeDecl Statement
" highlight link javaType Type
highlight link javaDocTags PreProc

" Highlight Class and Function names
syn match    cCustomParen    "(" contains=cParen,cCppParen
syn match    cCustomFunc     "\w\+\s*(\@=" contains=cCustomParen
syn match    cCustomScope    "::"
syn match    cCustomClass    "\w\+\s*::" contains=cCustomScope
sy match  cCustomType          '\v<\$*\u%(\w|\$)*>'

hi def cCustomFunc guifg=lightgreen
hi def link cCustomClass Function
hi def cCustomParen guifg=#E06C75

hi def cCustomType guifg=#56B6C2

