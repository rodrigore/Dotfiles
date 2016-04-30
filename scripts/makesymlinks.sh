#!/bin/bash

# base -> http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/

dir=~/dotfiles

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in *; do
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done
