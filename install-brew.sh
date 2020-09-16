#!/bin/bash
which -s brew

case $? in
    0) echo "➕brew";;
    *) /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";;
esac
