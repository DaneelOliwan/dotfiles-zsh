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
