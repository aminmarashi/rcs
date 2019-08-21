alias vim=nvim
alias vi=vim
alias ls='ls --color'
alias grep='grep --color'
alias tailf='tail -f'
alias gdiff='git diff --ignore-space-at-eol -b -w --ignore-blank-lines'

# Enable shell options
shopt -s extglob

# To locally install things
export PATH=$PATH:~/bin

# Git
source ~/.bash-git-prompt/gitprompt.sh
source ~/bin/git-completion.bash

# Private functionality
source ~/.bash_private

