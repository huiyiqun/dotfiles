#!/bin/bash

CWD=$(cd `dirname "$0"` && pwd)

# install tmux plugin manager
test -d ~/.tmux/plugins/tpm || git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# install oh_my_zsh
test -d ~/.oh-my-zsh || git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

# link configurations
ln -sf $CWD/tmux.conf ~/.tmux.conf
ln -sf $CWD/gitconfig ~/.gitconfig
ln -sf $CWD/zshrc ~/.zshrc && touch ~/.path.local
