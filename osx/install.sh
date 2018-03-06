#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

home=$1
if [ -z "$home"]; then
    echo "Must supply home path"
    exit 1
fi
dir=$home/dotfiles                    # dotfiles directory
olddir=$home/dotfiles_old             # old dotfiles backup directory
files=".bashrc .vimrc .zshrc .condarc .slate"    # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in $home"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    echo "Moving any existing dotfiles from $home to $olddir"
    mv $home/.$file $home/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file $home/$file
done
