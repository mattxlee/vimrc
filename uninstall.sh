#!/bin/sh
delpath() {
    if [ -f $1 ]; then
        rm $1
        echo "Remove file $1"
    fi
    if [ -d $1 ]; then
        rm -rf $1
        echo "Remove dir $1"
    fi
}

delpath ~/.vimrc
delpath ~/.vim

delpath ~/.clang-format
delpath ~/.editorconfig
delpath ~/.gitconfig
delpath ~/.gitignore_global
