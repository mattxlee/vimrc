#!/bin/sh

cpfile() {
    if [ ! -f ~/$1 ]; then
        cp $1 ~/$1
        echo "copied $1"
    fi
}

cpfile .clang-format
cpfile .clang-tidy
cpfile .editorconfig
cpfile .gitconfig
cpfile .gitignore_global
cpfile .profile
cpfile .tmux.conf
cpfile .zshrc
