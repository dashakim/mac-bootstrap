#!/bin/bash
xcode-select -p 1>/dev/null

case $? in
    0) echo "➕xcode cli tools";;
    2) xcode-select --install;;
    *) echo "❌xcode cli tools";;
esac
