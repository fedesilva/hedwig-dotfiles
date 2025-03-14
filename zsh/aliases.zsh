#vim: set filetype=sh
#echo "Custom aliases"

#
# ls aliases enable color support of ls and also add handy aliases
#
alias ls='ls -G'
alias ll="ls -lh"
alias la="ls -lah"
alias l="ls"


#  Homebrew
#

alias br=brew
alias brs="br search"
alias bri="br info"
alias brh="br home"

#
#  Make Neovim the default vim
#
alias vi=nvim 
alias vim=nvim
alias mvim=vimr


#
#  GIT aliases
#
alias gpom="git push origin master:refs/heads/master"
alias gs="git status"
alias gadd="git add"
alias gd="git diff"
alias gci="git commit -v"
alias gca="git commit -av"
alias gcl="git log --graph"
alias gl="git lola"
alias gla="git lola"
alias grs="git remote show"

alias gw="git whatchanged"
alias gwp="git whatchanged -p"



