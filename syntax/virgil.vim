if exists("b:current_syntax")
    finish
endif

syn keyword virgilKeyword class component
syn keyword virgilKeyword def
syn keyword virgilKeyword enum extends
syn keyword virgilKeyword in
syn keyword virgilKeyword new
syn keyword virgilKeyword private
syn keyword virgilKeyword super
syn keyword virgilKeyword type
syn keyword virgilKeyword var

syn keyword virgilInclude import export

syn keyword virgilLabel case match
syn keyword virgilRepeat for while
syn keyword virgilStatement break continue return
syn keyword virgilConditional if else

syn keyword virgilType Array
syn keyword virgilType bool byte void
syn keyword virgilType int
syn keyword virgilType long
syn keyword virgilType Range range
syn keyword virgilType string
syn keyword virgilCharacter true null false

"syn match virgilOperator "\v\-\>"
"syn match virgilOperator "\v\=\>"
"syn match virgilOperator "\v\:"

"" adapted from neovim runtime/syntax
"syn keyword virgilTodo contained TODO FIXME XXX NOTE
"syn region  virgilComment start="/\*" end="\*/" contains=virgilTodo,@Spell
"syn match   virgilComment "//.*$" contains=virgilTodo,@Spell

syn match PreProc        '[@]'
syn match virgilSymbol   '[,;]'
syn match Operator       '[\+\-\%=\/\^\&\*!?><\$|]'
syn match SpecialComment '[`:\.#]'
syn match Constant       '[{}\[\]()]'
hi def virgilSymbol ctermfg=DarkGray guifg=DarkGray

hi def link virgilFunc Function
hi def link virgilTypedef Identifier
hi def virgilType ctermfg=DarkCyan guifg=DarkCyan
"hi def virgilThis ctermfg=DarkMagenta guifg=DarkMagenta
hi def link virgilThis Exception
"syn match PreProc  '\(^\s*\[\s*\)\@<=\w\w*\ze\s*.*\]'
syn match Repeat   "\([^\.]\.\)\@<=\w\w*\(\(\[.*\]\)*\s*(\)\@!"
"syn match Float    "\([0-9]\+\.\)\@<=[0-9][0-9]*\(f32\|f64\)*"
syn match virgilThis '\(\w\)\@<!this\(\w\)\@!'
"syn match virgilType '\(\sas\s\+\W*\)\@<=\w\+'
"syn match virgilType '\(:\s*\(\(\(\[.*\]\)\|\({.*}\)\|\(\w\+\)\|\(\*\|?\|!\)\)\s*\)*\)\@<=\w\w*'
syn match virgilType '\(:\s*\)\@<=\w\w*\(\(\(\(\[.*\]\)\|\({.*}\)\|\(\w\+\)\|\(\*\|?\|!\)\)\s*\)*\)\@='
"syn match virgilType '\(\(\W\|^\)\(let\|const\|def\)\s\+[^=]*\w\s*)*\s*:\s*\W*\|^\W*\w\w*\s*:\w*\)\@<=\w\+'

"syn match virgilFunc    "\w\(\w\)*\ze\(\[.*\]\s*\)*\s*("
syn match virgilType    "\w\(\w\)*<"he=e-1,me=e-1 " foo<T>();
"syn match virgilType    "\w\(\w\)*\ze\(<.*>\s*\)*::[^<]"
syn match virgilType    "\(->\s*\)\@<=\w\(\w\)*"
syn match virgilFunc   "[0-9a-zA-Z_@]*\w\w*\(\(<.*>\s*\)*\(\[.*\]\)*\s*(\)\@="

syn match  virgilSpecialCharError display contained +\\\([^0-7nrt\\'"]\|[xX]\x\{2}\)+
syn match  virgilSpecialChar      contained "\\\([\"\\'ntr]\|[xX]\x\{2}\)"
syn region virgilString           start=+"+ end=+"+ end=+$+ contains=virgilSpecialChar,virgilSpecialCharError,@Spell
syn match  virgilCharacter        "'[^']*'" contains=virgilSpecialChar,virgilSpecialCharError
syn match  virgilCharacter        "'\\''" contains=virgilSpecialChar
syn match  virgilCharacter        "'[^\\]'"

syn match virgilNumber "\<\(0[bB][0-1]\+\|0[0-7]*\|0[xX]\x\+\|\d\(\d\|_\d\)*\)[lL]\=\>"
syn match virgilNumber "\(\<\d\(\d\|_\d\)*\.\(\d\(\d\|_\d\)*\)\=\|\.\d\(\d\|_\d\)*\)\([eE][-+]\=\d\(\d\|_\d\)*\)\=[fFdD]\="
syn match virgilNumber "\<\d\(\d\|_\d\)*[eE][-+]\=\d\(\d\|_\d\)*[fFdD]\=\>"
syn match virgilNumber "\<\d\(\d\|_\d\)*\([eE][-+]\=\d\(\d\|_\d\)*\)\=[fFdD]\>"

syn match virgilFloat '\v<\.?\d+([eE][+-]?\d+)?(f32|f64)?>' display
syn match virgilFloat '\v<(0|[1-9]\d*)([eE][+-]?\d+)?(f32|f64)>' display
syn match virgilFloat '\v<0x\x+(\.\x+)?[pP][+-]?\d+(f32|f64)?>' display
" Integer literals
syn match virgilInteger '\v(\.@1<!|\.\.)\zs<(0|[1-9]\d*)([eE][+-]?\d+)?([iu](8|16|32|64)?|z)?>' display
syn match virgilInteger '\v(\.@1<!|\.\.)\zs<0b[01]+([iu](8|16|32|64)?|z)?>' display
syn match virgilInteger '\v(\.@1<!|\.\.)\zs<0o\o+([iu](8|16|32|64)?|z)?>' display
syn match virgilInteger '\v(\.@1<!|\.\.)\zs<0x\x+([iu](8|16|32|64)?|z)?>' display
" Escape sequences
syn match virgilEscape '\\[\\'"0abfnrtv]' contained display
syn match virgilEscape '\v\\(x\x{2}|u\x{4}|U\x{8})' contained display
" Format sequences
syn match virgilFormat '\v\{\d*(\%\d*|:([- +=befgoxX]|F[.2sESU]|\.?\d+|_(.|\\([\\'"0abfnrtv]|x\x{2}|u\x{4}|\x{8})))*)?}' contained contains=virgilEscape display
syn match virgilFormat '{{\|}}' contained display


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
