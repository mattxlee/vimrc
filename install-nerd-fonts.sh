#!/bin/sh

if [ "command -v brew > /dev/null 2>&1" ]; then
  brew tap caskroom/fonts && brew cask install font-hack-nerd-font font-monoid-nerd-font
fi
