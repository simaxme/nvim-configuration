" need to be changed
source /home/simon/.config/nvim/typescript_syntax.vim

hi typescriptAccessibilityModifier guifg=#C678DD

" classes
hi typescriptClassName guifg=#56B6C2
hi typescriptClassHeritage guifg=#56B6C2
hi typescriptTypeReference guifg=#56B6C2

" method calls
hi typescriptFunctionMethod guifg=lightgreen
hi typescriptCacheMethod guifg=lightgreen
hi typescriptConsoleMethod guifg=lightgreen
hi typescriptDOMDocMethod guifg=lightgreen

" other calls
syn match dFunction "\zs\(\k\w*\)*\s*\ze("  "contains=typescriptBlock
hi dFunction guifg=lightgreen
