#!/bin/bash -eu
THIS_DIR=$(pwd)

ln -s $THIS_DIR/.bashrc ~/.bashrc
ln -s $THIS_DIR/.bash_profile ~/.bashrc/bash_profile
ln -s $THIS_DIR/.gitconfig ~/.gitconfig
ln -s $THIS_DIR/.config/* ~/.config/
