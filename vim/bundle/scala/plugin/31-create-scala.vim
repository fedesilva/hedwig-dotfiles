" Vim plugin that generates new Scala source file when you type
"    vim nonexistent.scala.
" Scripts tries to detect package name from the directory path, e. g.
" .../src/main/scala/com/mycompany/myapp/app.scala gets header
" package com.mycompany.myapp
"
" Author     :   Stepan Koltsov <yozh@mx1.ru>

function! MakeScalaFile()
    if exists("b:template_used") && b:template_used
        return
    endif
    
    let b:template_used = 1
    
    let l:filename = expand("<afile>:p")
    let l:cwd = getcwd()

    let l:x = substitute(l:filename, "\.scala$", "", "")
    let l:x = substitute(l:x, l:cwd ,"","")

    let l:x = substitute(l:x, '/src/main/scala',"","") " Maven like paths
    let l:x = substitute(l:x, '/src/test/scala',"","") " Maven like paths

    "call append(".", '// ' . l:x)

    let l:x = substitute(l:x, '\/',".","g")         "change slashes into dots
    "call append(".", '// ' . l:x)
    let l:x = substitute(l:x, '^\.',"","")          "remove first dot
    "call append(".", '// ' . l:x)
    let l:x = substitute(l:x, '\.[^.]*$',"","")     "remove trailing name

    call append("0", 'package ' . l:x)

    
endfunction

au BufNewFile *.scala call MakeScalaFile()

" vim: set ts=4 sw=4 et:
