#!/bin/sh
if [ ! -x "$(command -v curl)" ]; then
    echo "Install curl first!"
    exit 1
fi

if [ ! -x "$(command -v git)" ]; then
    echo "Install git first!"
    exit 1
fi

VIMRC_PATH=$HOME/vimrc
if [ ! -d $VIMRC_PATH ]; then
    git clone --depth 1 https://github.com/mattxlee/vimrc $VIMRC_PATH
fi
if [ ! -d $VIMRC_PATH ]; then
    echo "Cannot clone repo: https://github.com/mattxlee/vimrc, exit!"
    return 1
fi
cd $VIMRC_PATH

instplugins() {
    $($1 +PlugInstall! +qa > /dev/null 2>&1)
}

echo "Installing plugins..."
if [ -x "$(command -v vim)" ]; then
    echo " vim - generate .vimrc"
    echo 'source ~/vimrc/init.vim' > $HOME/.vimrc
    echo " vim - plugin manager"
    $(curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim > /dev/null 2>&1)
    echo " vim - plugins"
    instplugins vim
    echo " vim - done"
fi
