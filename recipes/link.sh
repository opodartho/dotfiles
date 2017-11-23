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

echo -e "\n\ninstalling to ~/.config"
echo "=============================="
if [ ! -d $HOME/.config ]; then
  echo "Creating ~/.config"
  mkdir -p $HOME/.config
fi

for config in $DOTFILES/config/*; do
  target=$HOME/.config/$( basename $config )
  if [ -e $target ]; then
    echo "~{$target#$HOME} already exists... Skipping."
  else
    ln -s $config $target
  fi
done

echo -e "\n\ninstalling to ~/.ssh"
echo "=============================="
for file in $DOTFILES/ssh/*; do
  target=$HOME/.ssh/$( basename $file )
  if [ -e $target ]; then
    echo "~{$target#HOME} already exists... Skipping."
  else
    ln -s $file $target
  fi
done
echo -e "\n"
