#!/bin/bash

CWD=$(cd `dirname "$0"` && pwd)

# install tmux plugin manager
rm -rf ~/.tmux/plugins/ && git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# link configurations
ln -sf $CWD/tmux.conf ~/.tmux.conf
