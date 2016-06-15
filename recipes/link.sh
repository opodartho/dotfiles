#!/usr/bin/env bash

DOTFILES=$HOME/.dotfiles

echo -e "\nCreating symlinks"
echo "=============================="

linkables=$( find "$DOTFILES" -name "*.symlink" )
for file in $linkables; do
    target="$HOME/.$( basename $file '.symlink')"
    if [ -e $target ]; then
        echo "~{$target#$HOME} already exists... Skipping."
    else
        echo "Creating symlink fo $file"
        ln -s $file $target
    fi
done
