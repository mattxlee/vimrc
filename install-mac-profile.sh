#!/bin/sh
if [ -f "$HOME/.profile" ]; then;
    echo "Copying file .profile ..."
    cp .profile $HOME/.profile
fi
