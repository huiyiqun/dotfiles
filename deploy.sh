#!/bin/bash

CWD=$(cd `dirname "$0"` && pwd)

# install tmux plugin manager
test -d ~/.tmux/plugins/tpm || git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# install oh_my_zsh
test -d ~/.oh-my-zsh || git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

# install ccls
test -d ~/.ccls || git clone --depth=1 --recursive https://github.com/MaskRay/ccls ~/.ccls && cmake ~/.ccls -B~/.ccls/Release -DLLVM_ENABLE_RTTI="$([[ "$(llvm-config --has-rtti)" = "YES" ]] && echo -n "on" || echo -n "off")" -DCMAKE_PREFIX_PATH="$(llvm-config --prefix)" && cmake --build ~/.ccls/Release

# install vundle
#test -d ~/.vim/bundle/Vundle.vim || git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# install vim-plug
PLUG_VIM="$HOME/.vim/autoload/plug.vim"
test -f $PLUG_VIM || curl -fLo $PLUG_VIM --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# link configurations
ln -sf $CWD/tmux.conf ~/.tmux.conf && touch ~/.tmux.local.conf
ln -sf $CWD/gitconfig ~/.gitconfig
ln -sf $CWD/zshrc ~/.zshrc && touch ~/.zshrc.local
#ln -sf $CWD/ycm_extra_conf.py ~/.ycm_extra_conf.py
ln -sf $CWD/vimrc ~/.vimrc && touch ~/.vimrc.local
ln -sf $CWD/npmrc ~/.npmrc
ln -sf $CWD/ssh_config ~/.ssh/config && mkdir -p ~/.ssh/cp && touch ~/.ssh/local
mkdir -p ~/.pip && ln -sf $CWD/pip.conf ~/.pip/pip.conf
#mkdir -p ~/.ipython/profile_default && ln -sf $CWD/ipython_config.py ~/.ipython/profile_default/ipython_config.py
