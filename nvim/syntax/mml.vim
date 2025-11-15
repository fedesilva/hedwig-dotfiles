" Vim syntax file
" Language: MinnieML (MML)
" Maintainer: MML Project
" Latest Revision: 2025-10-30

if exists("b:current_syntax")
  finish
endif

" Case sensitive
syn case match

" ============================================================================
" Comments
" ============================================================================

" Line comments: # comment (but not #- which starts doc comments)
syn match mmlComment "#\%(-\)\@!.*$" contains=mmlTodo

" Documentation comments: #- ... -# (can be nested)
syn region mmlDocComment start="#-" end="-#" contains=mmlDocComment,mmlTodo

" TODO/FIXME/NOTE highlighting within comments
syn keyword mmlTodo contained TODO FIXME NOTE XXX

" ============================================================================
" Keywords
" ============================================================================

" Control flow keywords
syn keyword mmlConditional if then else

" Declaration keywords
syn keyword mmlKeyword module fn let op type end

" Visibility keywords
syn keyword mmlKeyword pub protected lexical

" Associativity keywords
syn keyword mmlKeyword left right

" Boolean constants
syn keyword mmlBoolean true false

" Special constants
syn match mmlConstant "\<???\>"
syn match mmlConstant "\<_\>"

" Unit literal
syn match mmlConstant "()"

" ============================================================================
" Operators
" ============================================================================

" Assignment operator
syn match mmlOperator "="

" Type annotation
syn match mmlOperator ":"

" Terminator
syn match mmlOperator ";"

" Comma separator
syn match mmlOperator ","

" Symbolic operators (but not single = or : which are handled above)
" This matches sequences like +, -, *, ==, !=, <=, >=, |>, etc.
syn match mmlOperator "[!$%^&*+<>?/\\|~-]\+"

" Parentheses and brackets
syn match mmlDelimiter "[(){}\[\]]"

" ============================================================================
" Literals
" ============================================================================

" String literals (double-quoted)
syn region mmlString start=+"+ skip=+\\.+ end=+"+ contains=mmlEscape

" Escape sequences in strings
syn match mmlEscape contained "\\."

" Numeric literals
" Float: digits with decimal point
syn match mmlFloat "\<[0-9]\+\.[0-9]\+\>"
syn match mmlFloat "\<\.[0-9]\+\>"

" Integer: just digits (must come after float to avoid conflicts)
syn match mmlNumber "\<[0-9]\+\>"

" ============================================================================
" Types
" ============================================================================

" Type identifiers: start with uppercase letter
" Pattern: [A-Z][a-zA-Z0-9]*
syn match mmlType "\<[A-Z][a-zA-Z0-9]*\>"

" ============================================================================
" Native Annotations
" ============================================================================

" @native keyword
syn match mmlNative "@native\>"

" ============================================================================
" Identifiers
" ============================================================================

" Regular identifiers (variables, functions, parameters)
" Pattern: [a-z][a-zA-Z0-9_]*
" We define this with lower priority so keywords take precedence
syn match mmlIdentifier "\<[a-z][a-zA-Z0-9_]*\>"

" ============================================================================
" Special Regions
" ============================================================================

" Function definitions - highlight function names specially
" fn name(...) = ...
syn match mmlFunction "\<fn\s\+\zs[a-z][a-zA-Z0-9_]*\>" contained
syn region mmlFunctionDef start="\<fn\>" end="=" contains=mmlKeyword,mmlFunction,mmlType,mmlOperator,mmlIdentifier,mmlComment,mmlDocComment transparent keepend

" Type definitions - highlight type names specially
" type Name = ...
syn match mmlTypeDecl "\<type\s\+\zs[A-Z][a-zA-Z0-9]*\>" contained
syn region mmlTypeDef start="\<type\>" end="=" contains=mmlKeyword,mmlTypeDecl,mmlNative,mmlType,mmlOperator,mmlComment,mmlDocComment transparent keepend

" Operator definitions - highlight operator names
" op + (a: T, b: T): T = ...
syn match mmlOperatorDecl "\<op\s\+\zs[=!#$%^&*+<>?/\\|~-]\+" contained
syn match mmlOperatorDecl "\<op\s\+\zs[a-z][a-zA-Z0-9_]*\>" contained
syn region mmlOperatorDef start="\<op\>" end="=" contains=mmlKeyword,mmlOperatorDecl,mmlType,mmlOperator,mmlNumber,mmlIdentifier,mmlComment,mmlDocComment transparent keepend

" ============================================================================
" Highlight Linking
" ============================================================================

" Link MML syntax groups to standard Vim highlight groups

" Comments
hi def link mmlComment Comment
hi def link mmlDocComment SpecialComment
hi def link mmlTodo Todo

" Keywords
hi def link mmlKeyword Keyword
hi def link mmlConditional Conditional

" Constants
hi def link mmlBoolean Boolean
hi def link mmlConstant Constant

" Operators and delimiters
hi def link mmlOperator Operator
hi def link mmlDelimiter Delimiter

" Literals
hi def link mmlString String
hi def link mmlEscape SpecialChar
hi def link mmlNumber Number
hi def link mmlFloat Float

" Types
hi def link mmlType Type
hi def link mmlTypeDecl Type

" Native annotations
hi def link mmlNative Special

" Identifiers
hi def link mmlIdentifier Identifier
hi def link mmlFunction Function
hi def link mmlOperatorDecl Function

" ============================================================================
" Finalize
" ============================================================================

let b:current_syntax = "mml"
