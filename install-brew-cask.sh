#!/bin/bash
brew cask 1>/dev/null

case $? in
    0) echo "➕brew cask";;
    *) brew cask;;
esac
