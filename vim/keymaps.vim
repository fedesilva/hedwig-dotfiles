
let mapleader=","

"saves one key stroke 
nnoremap ; :

"When wrapping do not jump to next line
nnoremap j gj
nnoremap k gk

nmap <leader>n :NERDTreeClose<CR>:NERDTreeToggle<CR>
nmap <leader>f :NERDTreeClose<CR>:NERDTreeFind<CR>
nmap <leader>m :NERDTreeClose<CR>

nmap <leader>fx :CommandTFlush<cr>
nmap <leader>t :CommandT<cr>


map v. :vi .<cr>
map v<space> :vi 
map vh :vi %:h <cr>

" Easy window navigation
"map <C-h> <C-w>h
"map <C-j> <C-w>j
"map <C-k> <C-w>k
"map <C-l> <C-w>l

map ,lt :TagbarToggle<cr>

map <Leader>/ :nohlsearch<cr>
map <Leader>w :set wrap! wrap?<cr>

map <leader>'f :FufFile<cr>
map <leader>'t :FufTag<cr>
map <leader>'j :FufJumpList<cr>
map <leader>'q :FufQuickfix<cr>
map <leader>'r :FufMruFile<cr>
map <D-r> :FufMruFile<cr>
map <leader>'d :FufDir<cr>
map <leader>'b :FufBuffer<cr>
map <leader>'x :FufRenewCache<cr>

"
" TODO Activate/deactivate this in a filetype plugin
"
map <leader>rR :Rake 
map <leader>rm :Rmodel <cr>
map <leader>rM :Rmodel 
map <leader>rc :Rcontroller <cr>
map <leader>rC :Rcontroller 
map <leader>rv :Rview <cr>
map <leader>rV :Rview 
map <leader>rh :Rhelper <cr>
map <leader>rH :Rhelper 
map <leader>ri :Rmigration <cr>
map <leader>rI :Rmigration 
map <leader>ru :Runittest <cr>
map <leader>rU :Runittest 
map <leader>rf :Rfunctionaltest<cr>
map <leader>rF :Rfunctionaltest 

map <leader>rs :Rstylesheet<cr>
map <leader>rS :Rstylesheet 

map <leader>rj :Rjavascript<cr>
map <leader>rJ :Rjavascript 

":map ,e :cnext<cr>
":map ,cn :cnext<cr>
":map ,e :cnext<cr>
":map ,cp :cprevious<cr>
"

map <leader>X :bd
map <leader>x :bd<cr>
"map <leader>l :ls<cr>
map <leader>b :b 
map <leader><space> :b 
map <leader>q :qall
map <leader>Q :qall<cr> 
map <leader>be :BufExplorer<cr>

map <c-j> :bprev!<CR>
map <c-k> :bnext!<CR>
map <c-a> :b# <cr>
map <leader>a :b# <cr>

"edit my .dotfiles 
nmap <silent> <leader>dd  :call Goto_dotfiles_and_edit() <cr>
fun! Goto_dotfiles_and_edit ()
  cd ~/.dotfiles
  silent! vi .
endfunction



"edit my .vimrc file
nmap <silent> <leader>dv  :call Goto_vim_and_edit() <cr>
fun! Goto_vim_and_edit ()
  cd ~/.vim
  silent! vi .
endfunction

"update the system settings from my vimrc file
map ,uv :source ~/.vimrc <cr>
map ,ug :source ~/.gvimrc <cr>
map ,uk :source ~/.vim/keymaps.vim <cr>


"map <leader>0 :set relativenumber! relativenumber?<cr>
"map <leader>1 :set number! number?<cr>
map <leader>l0 :set relativenumber<cr>
map <leader>l1 :set number<cr>
map <leader>l- :set nonumber<cr>

"View  sizes
map <leader>vn :set lines=30 columns=115 <cr>         
map <leader>vv :set lines=43 <cr>         
map <leader>vV :set lines=30 <cr>         


inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

noremap <leader>lb :CtrlPBuffer<cr>
noremap <leader>lf :CtrlPCurWD<cr>
noremap <leader>lt :CtrlPTag<cr>
noremap <leader>lm :CtrlPMixed<cr>
noremap <leader>lr :CtrlPMRU<cr>
noremap <leader>lp :CtrlP

