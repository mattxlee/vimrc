#!/bin/sh
PLUGVIMPATH=$HOME/.vim/autoload/plug.vim

if [ ! -f $PLUGVIMPATH ]; then
    if [ "command -v curl > /dev/null 2>&1" ]; then
        curl -fLo $PLUGVIMPATH --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    else
        echo "Please install CURL before installing plugins."
        exit 1
    fi
fi

[ ! -d $HOME/.config/nvim ] && mkdir -p $HOME/.config/nvim
echo "Copying NeoVim config file..."
cp init.vim $HOME/.config/nvim/init.vim

cp .vimrc $HOME/.vimrc
cp .ctags $HOME/.ctags
cp .gitconfig $HOME/.gitconfig
cp .clang-format $HOME/.clang-format
cp .editorconfig $HOME/.editorconfig

if [ "command -v vim > /dev/null 2>&1" ]; then
    vim +PlugUpdate
fi
