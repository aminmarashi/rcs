alias ls='ls --color'
alias grep='grep --color'
alias tailf='tail -f'
alias gdiff='git diff --ignore-space-at-eol -b -w --ignore-blank-lines'
alias cd1='cd ..'
alias cd2='cd ../..'
alias cd3='cd ../../..'
alias cd4='cd ../../../..'
alias battery='upower -i /org/freedesktop/UPower/devices/battery_BAT0 |grep percentage'

# Enable shell options
shopt -s extglob

# To locally install things
export PATH=$PATH:~/.local/bin:~/bin:~/.meteor

# Git
source ~/.bash-git-prompt/gitprompt.sh
source ~/bin/git-completion.bash

# Private functionality
source ~/.bash_private

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
