#!/bin/bash -e

stow --verbose=2 -d configs -t ~ zsh

if [ "$SHELL" != '/bin/zsh' ]; then
    echo "ZSH is not the default shell! Add this line to the existing .profile:"
    echo ""
    echo "source ~/.zprofile"
fi
