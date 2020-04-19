#!/bin/sh
PLUGVIMPATH=$HOME/.vim/autoload/plug.vim

if [ ! -f $PLUGVIMPATH ]; then
    curl -fLo $PLUGVIMPATH --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

[ ! -d $HOME/.config/nvim ] && mkdir -p $HOME/.config/nvim
echo "Copying NeoVim config file..."
cp init.vim $HOME/.config/nvim/init.vim

echo "Copying file .vimrc ..."
cp .vimrc $HOME/.vimrc

echo "Copying $HOME/.ctags..."
cp .ctags $HOME/.ctags

if [ "command -v nvim > /dev/null 2>&1" ]; then
    nvim +PlugUpdate
fi
