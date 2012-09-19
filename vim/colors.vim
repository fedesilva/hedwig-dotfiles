
"------ this clears out the old colors before we begin
highlight clear

set background=dark               " Background.

if has("gui_running")
  colorscheme darkerdesert
else
  colorscheme darkerdesert
endif 


hi  Todo        NONE
hi  Comment     term=bold gui=bold ctermfg=red ctermbg=0 guifg=#DA230E

hi Cursor           guifg=#d4d0c8   guibg=#cd0000   
hi lCursor          guifg=#000000   guibg=#ffffff  

hi Pmenu            guifg=White guibg=#343434    
hi PmenuSel         guifg=White 


highlight CursorLine  term=standout  ctermbg=4 cterm=bold guibg=#252525


