#!/bin/bash

mkdir ~/bin
touch ~/.bash_private

# Proper JS tags
git clone git@github.com:romainl/ctags-patterns-for-javascript.git ~/bin/ctags-patterns-for-javascript &&
echo '--options=/home/amin/bin/ctags-patterns-for-javascript/ctagsrc' > ~/.ctags

# Bash completion for git
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/bin/git-completion.bash

# Git prompt
git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1

# Install vimplug for neovim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# NVM for local node
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash

git config --global core.excludesfile ~/.gitignore

source ~/.bashrc

nvm install node
