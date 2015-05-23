#! /bin/bash

configpath="$HOME/.zshrc"
currentpath=$(pwd)

echo "zshell installation..."
if [ -e $configpath ]
then
    echo ".zshrc file already exists"
else
    echo "linking .zshrc file..."
    cd $HOME
    ln -s $currentpath/.zshrc .zshrc
fi

if [ -e $HOME/.dotfiles/z ]
then
    echo "z script repository already cloned"
else
    cd $HOME/.dotfiles/
    git clone https://github.com/rupa/z.git
fi
