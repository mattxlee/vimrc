#!/bin/sh
if [ ! -x "$(command -v curl)" ]; then
    echo "Install curl first!"
    exit 1
fi

if [ ! -x "$(command -v git)" ]; then
    echo "Install git first!"
    exit 1
fi

if [ ! -x "$(command -v ctags)" ]; then
    echo "Please install universal-ctags!"
fi

if [ ! -x "$(command -v ag)" ]; then
    echo "Please install silversearcher-ag!"
fi

if [ ! -x "$(command -v python3)" ]; then
    echo "Please install python3-dev!"
fi

VIMRC_PATH=$HOME/.config/nvim
if [ ! -d $VIMRC_PATH ]; then
    git clone --depth 1 https://github.com/mattxlee/vimrc $VIMRC_PATH
fi
if [ ! -d $VIMRC_PATH ]; then
    echo "Cannot clone repo: https://github.com/mattxlee/vimrc, exit!"
    return 1
fi
cd $VIMRC_PATH

cpfile() {
    if [ ! -f ~/$1 ]; then
        cp $1 ~/$1
        echo "copied $1"
    fi
}

cpfile .clang-format
cpfile .editorconfig
cpfile .gitconfig
cpfile .gitignore_global

instplugins() {
    $($1 +PlugInstall! +qa > /dev/null 2>&1)
}

echo "Installing plugins..."
if [ -x "$(command -v vim)" ]; then
    echo " vim - generate .vimrc"
    echo 'source ~/.config/nvim/init.vim' > $HOME/.vimrc
    echo " vim - plugin manager"
    $(curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim > /dev/null 2>&1)
    echo " vim - plugins"
    instplugins vim
    echo " vim - done"
fi
if [ -x "$(command -v nvim)" ]; then
    echo " neovim - plugin manager"
    $(curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim > /dev/null 2>&1)
    echo " neovim - plugins"
    instplugins nvim
    echo " neovim - done"
fi

echo "Run :LeaderfInstallCExtension to speed up LeaderF"
echo "You might need to install tree-sitter-cli, see more info: http://tree-sitter.github.io/tree-sitter/creating-parsers#installation"
