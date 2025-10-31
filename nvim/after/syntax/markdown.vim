" Vim after-syntax file for markdown
" Language: Markdown with MML code blocks
" Purpose: Inject MML syntax highlighting into markdown fenced code blocks

" Unlet b:current_syntax so we can include MML syntax
unlet! b:current_syntax

" Include MML syntax into a syntax cluster
syn include @MML syntax/mml.vim

" Define region for ```mml code blocks
syn region markdownCodeMML
      \ matchgroup=markdownCodeDelimiter
      \ start="^\s*````\=\s*mml\>"
      \ end="^\s*````\=\s*$"
      \ keepend
      \ contains=@MML
      \ containedin=ALL

let b:current_syntax = "markdown"
