#!/bin/sh
if [ ! -x $(command -v fzf) ]; then
    echo "command `fzf` cannot be found, you need to install it."
fi

clone_plugin() {
    SOURCE_URL=$1
    DEST_DIR=$2
    if [ ! -d $DEST_DIR ]; then
        git clone $SOURCE_URL $DEST_DIR
    fi
}

clone_plugin https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
clone_plugin https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

if [ ! -f $HOME/.zshrc ]; then
    cp .zshrc $HOME/.zshrc
fi

