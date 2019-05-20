#!/bin/sh
PLUGVIMPATH=$HOME/.vim/autoload/plug.vim

if [ ! -f $PLUGVIMPATH ]; then
    curl -fLo $PLUGVIMPATH --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

if [ ! -f $HOME/.vimrc ]; then
    echo "Copying .vimrc file..."
    cp .vimrc $HOME/.vimrc
fi

if [ ! -f $HOME/.ctags ]; then
    echo "Copying $HOME/.ctags..."
    cp .ctags $HOME/.ctags
fi

if [ "command -v vim > /dev/null 2>&1" ]; then
    vim +PlugUpdate
fi
