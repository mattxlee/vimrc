#!/bin/sh
if [ ! -f $HOME/.gitconfig ]; then
    cp .gitconfig $HOME/.gitconfig
fi
