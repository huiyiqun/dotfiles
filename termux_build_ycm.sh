#!/bin/bash
#NOTE: there is an problem in CMakeList.txt of ycmd which wrongly link librt under Android
CC=clang CXX=clang++ python2 $HOME/.vim/bundle/YouCompleteMe/install.py --clang-completer --gocode-completer --tern-completer --system-libclang
