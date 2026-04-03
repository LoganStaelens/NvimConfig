if exists("b:current_syntax")
  finish
endif

" -------------------------
" Keywords
" -------------------------
syntax keyword mylangKeyword fn class module import return if else for while in new constructor finalizer public private protected final

highlight def link mylangKeyword Keyword

" -------------------------
" Types (capitalized identifiers + builtins)
" -------------------------
syntax keyword mylangType void int String bool float double char

syntax match mylangType /\<[A-Z][a-zA-Z0-9_]*\>/

highlight def link mylangType Type

" -------------------------
" Numbers
" -------------------------
syntax match mylangNumber /\v\d+/

highlight def link mylangNumber Number

" -------------------------
" Strings (with escapes)
" -------------------------
syntax region mylangString start=/"/ skip=/\\./ end=/"/

highlight def link mylangString String

" -------------------------
" Comments (optional if you add later)
" -------------------------
" syntax match mylangComment /\/\/.*$/
" highlight def link mylangComment Comment

" -------------------------
" Operators
" -------------------------
syntax match mylangOperator /\v(\+=|-=|\*=|/=|\+\+|--|:=|=|<|>)/

highlight def link mylangOperator Operator

" -------------------------
" Identifiers (variables, functions, etc.)
" -------------------------
syntax match mylangIdentifier /\<[a-zA-Z_][a-zA-Z0-9_]*\>/

highlight def link mylangIdentifier Identifier

" -------------------------
" Function calls (heuristic: name(...))
" -------------------------
syntax match mylangFunction /\<[a-zA-Z_][a-zA-Z0-9_]*\ze\s*(/

highlight def link mylangFunction Function

" -------------------------
" Class names after 'class'
" -------------------------
syntax match mylangClassName /\vclass\s+\zs[A-Z][a-zA-Z0-9_]*/

highlight def link mylangClassName Type

" -------------------------
" Module / import paths
" -------------------------
syntax match mylangModule /\vmodule\s+\zs[a-zA-Z0-9_:]+/
syntax match mylangImport /\vimport\s+\zs[a-zA-Z0-9_:]+/

highlight def link mylangModule Include
highlight def link mylangImport Include

" -------------------------
" Booleans
" -------------------------
syntax keyword mylangBoolean true false

highlight def link mylangBoolean Boolean

" -------------------------
" Condition / loop punctuation emphasis
" -------------------------
syntax match mylangParen /[(){}]/
highlight def link mylangParen Delimiter

" -------------------------
" Define filetype done
" -------------------------
let b:current_syntax = "mylang"
