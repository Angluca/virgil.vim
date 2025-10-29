if exists("b:current_syntax")
    finish
endif

syn keyword virgilKeyword class component layout
syn keyword virgilKeyword def
syn keyword virgilKeyword enum extends
syn keyword virgilKeyword in
"syn keyword virgilKeyword new
syn keyword virgilSuper   private super
syn keyword virgilKeyword type
syn keyword virgilKeyword var

syn keyword virgilInclude import export

syn keyword virgilLabel case match
syn keyword virgilRepeat for while
syn keyword virgilStatement break continue return
syn keyword virgilConditional if else

syn keyword virgilType Array
syn keyword virgilType bool byte void
syn keyword virgilType Range
syn keyword virgilType string
syn keyword virgilCharacter true null false
syn keyword virgilThis this
syn keyword virgilType short int long float double

"syn match virgilOperator "\v\-\>"
"syn match virgilOperator "\v\=\>"
"syn match virgilOperator "\v\:"

"" adapted from neovim runtime/syntax
"syn keyword virgilTodo contained TODO FIXME XXX NOTE
"syn region  virgilComment start="/\*" end="\*/" contains=virgilTodo,@Spell
"syn match   virgilComment "//.*$" contains=virgilTodo,@Spell

syn match PreProc        '[@]'
syn match virgilSymbol   '[,;:\.]'
syn match Operator       '[\+\-\%=\/\^\&\*!?><\$|]'
syn match SpecialComment '[`#]'
syn match Constant       '[{}\[\]()]'
hi def virgilSymbol ctermfg=DarkGray guifg=DarkGray

hi def link virgilFunc Function
hi def link virgilTypedef Changed
"hi def virgilType ctermfg=DarkCyan guifg=DarkCyan
hi def link virgilType MoreMsg
"hi def virgilThis ctermfg=DarkMagenta guifg=DarkMagenta
hi def link virgilThis Label

syn match virgilTypedef '\<\w\+\(\(<.*>\)\?\s*\.\w\+.*(.*).*{\s*\(.*}\)\?$\)\@='
syn match virgilType    '\<\w\+_\l\>'
syn match virgilType    '\<[_]*\u[A-Z0-9_]*[a-z0-9_]\+\w*\>'
syn match Macro         '\<[_]*\u[A-Z0-9_]*\>'
syn match Exception     '\(\W\@<=[@&*]\+\ze\w\)\|\(\w\@<=[*]\+\ze\W\)'
syn match virgilType    '\v(\.@1<!|\.\.)\zs<([iu][0-9]{1,3})?>'
syn match Repeat        '\([^\.]\.\)\@<=\w\w*\(\(\[.*\]\)*\s*(\)\@!'

syn match virgilType    '\(:\s*\)\@<=\w\w*\(\(\(\(\[.*\]\)\|\({.*}\)\|\(\w\+\)\|\(\*\|?\|!\)\)\s*\)*\)\@='

syn match virgilType    '\v\w+\ze\<.*\>' "foo<T>();
syn match virgilType    '\(->\s*\)\@<=\w\(\w\)*'
syn match Function      '\v\w+\ze((\[.*\])|(\<.*\>))*\s*\('

syn match  virgilSpecialCharError display contained +\\\([^0-7nrt\\'"]\|[xX]\x\{2}\)+
syn match  virgilSpecialChar      contained "\\\([\"\\'ntr]\|[xX]\x\{2}\)"
syn region virgilString           start=+"+ end=+"+ end=+$+ contains=virgilSpecialChar,virgilSpecialCharError,@Spell
syn match  virgilCharacter        "'[^']*'" contains=virgilSpecialChar,virgilSpecialCharError
syn match  virgilCharacter        "'\\''" contains=virgilSpecialChar
syn match  virgilCharacter        "'[^\\]'"

syn match virgilNumber "\v<0[xX][0-9a-fA-F_]+([iuIU]?[lL]?[0-9]{-,3})?>"
syn match virgilNumber "\v<0[bB][01_]+([iuIU]?[lL]?[0-9]{-,3})?>"

syn match virgilFloat '\v<\.?\d+([eE][+-]?\d+)?[fFdD]?>' display
syn match virgilFloat '\v<(0|[1-9]\d*)([eE][+-]?\d+)?[fFdD]?>' display
syn match virgilFloat '\v<0x\x+(\.\x+)?[pP][+-]?\d+[fFdD]?>' display
" Integer literals
syn match virgilInteger '\v(\.@1<!|\.\.)\zs<(0|[1-9]\d*)([eE][+-]?\d+)?([iuIU]?[lL]?[0-9]{-,3})?>' display
syn match virgilInteger '\v(\.@1<!|\.\.)\zs<0b[01]+([iuIU]?[lL]?[0-9]{-,3})?>' display
syn match virgilInteger '\v(\.@1<!|\.\.)\zs<0o\o+([iuIU]?[lL]?[0-9]{-,3})?>' display
syn match virgilInteger '\v(\.@1<!|\.\.)\zs<0x\x+([iuIU]?[lL]?[0-9]{-,3})?>' display
" Escape sequences
syn match virgilEscape '\\[\\'"0abfnrtv]' contained display
syn match virgilEscape '\v\\(x\x{2}|u\x{4}|U\x{8})' contained display
" Format sequences
syn match virgilFormat '\v\{\d*(\%\d*|:([- +=befgoxX]|F[.2sESU]|\.?\d+|_(.|\\([\\'"0abfnrtv]|x\x{2}|u\x{4}|\x{8})))*)?}' contained contains=virgilEscape display
syn match virgilFormat '{{\|}}' contained display


hi def link virgilSuper                 Title
hi def link virgilFloat                 Number
hi def link virgilInteger               Number
hi def link virgilEscape                SpecialComment
hi def link virgilFormat                SpecialChar

hi def link virgilKeyword               Keyword
hi def link virgilInclude               Include
hi def link virgilLabel                 Label
hi def link virgilConditional           Conditional
hi def link virgilRepeat                Repeat
hi def link virgilStatement             Statement
"hi def link virgilType                  Type
hi def link virgilNumber                Number
hi def link virgilComment               Comment
hi def link virgilOperator              Operator
hi def link virgilCharacter             Character
hi def link virgilString                String
hi def link virgilTodo                  Todo
hi def link virgilSpecial               Special
hi def link virgilSpecialError          Error
hi def link virgilSpecialCharError      Error
hi def link virgilString                String
hi def link virgilCharacter             Character
hi def link virgilSpecialChar           SpecialChar
hi def link virgilException             Exception

syn match virgilTypedef  contains=virgilTypedef "\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*" display contained
syn match virgilFunc    "\%(r#\)\=\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*" display contained
"syn keyword Keyword   def nextgroup=Function skipwhite skipempty
syn keyword virgilKeyword union class extends struct enum namespace component type nextgroup=virgilTypedef skipwhite skipempty
syn keyword virgilKeyword union nextgroup=virgilType skipwhite skipempty contained
" adapted from neovim runtime/syntax
syn keyword virgilTodo contained TODO FIXME XXX NOTE
syn region  virgilComment start="/\*" end="\*/" contains=virgilTodo,@Spell
syn match   virgilComment "//.*$" contains=virgilTodo,@Spell

let b:current_syntax = "virgil"
