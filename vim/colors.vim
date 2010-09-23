
"------ this clears out the old colors before we begin
highlight Constant    NONE
highlight Delimiter   NONE
highlight Directory   NONE
highlight Error       NONE
highlight ErrorMsg    NONE
highlight Identifier  NONE
highlight LineNr      NONE
highlight ModeMsg     NONE
highlight MoreMsg     NONE
highlight Normal      NONE
highlight NonText     NONE
highlight PreProc     NONE
highlight Question    NONE
highlight Search      NONE
highlight Special     NONE
highlight SpecialKey  NONE
highlight Statement   NONE
highlight StatusLine  NONE
highlight Title       NONE
highlight Todo        NONE
highlight Type        NONE
highlight Visual      NONE
highlight WarningMsg  NONE



if has("gui_running")
  "colorscheme railscasts
  "colorscheme custang
  colorscheme darkerdesert
else
  " Or use vividchalk
  "colorscheme topfunky-light
  "colorscheme darkerdesert
  "colorscheme custang
  colorscheme darkerdesert
endif 


set background=dark               " Background.

highlight Todo        NONE

highlight Comment     term=bold gui=bold ctermfg=red ctermbg=0 guifg=#DA230E

hi Cursor           guifg=#d4d0c8   guibg=#cd0000   
hi lCursor          guifg=#000000   guibg=#ffffff  

highlight CursorLine  term=standout  ctermbg=4 cterm=bold guibg=#1F1E1E
"highlight LineNr      term=standout  guifg=#9E9999     guibg=black    gui=bold ctermfg=white  ctermbg=NONE        cterm=NONE
highlight LineNr        guifg=#DDEEFF ctermfg=White

highlight Search   term=standout  ctermbg=4 cterm=bold guibg=#e8f79f gui=bold  guifg=black
highlight IncSearch   term=standout  ctermbg=4 cterm=bold guibg=#e8f79f gui=bold guifg=black

