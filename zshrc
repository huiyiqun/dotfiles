# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Theme
ZSH_THEME="ys"

# No update
DISABLE_AUTO_UPDATE="true"

# Enable command auto-correction.
ENABLE_CORRECTION="true"

# Display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Format of command execution timestamp shown in the history command output.
HIST_STAMPS="yyyy-mm-dd"

# Autostart and autoreconnect tmux
ZSH_TMUX_AUTOSTART=true
TERM=screen-256color

# https://github.com/robbyrussell/oh-my-zsh/issues/5765
COMPLETION_WAITING_DOTS=false

plugins=(git tmux systemd scd)

# User configuration

# current directory
DOTFILES=${${(%):-%N}:A:h}

source $HOME/.path.local || true

source $ZSH/oh-my-zsh.sh

# Language environment
export LANG=en_US.UTF-8

# Editor
export EDITOR='nvim'

export PATH=$HOME/bin:$HOME/miniconda3/bin:$PATH

# Aliases
alias pac="sudo pacman"
alias yat="yaourt"
function up {
    # Archlinux only
    (( $+commands[yaourt] )) && yaourt -Syua --noconfirm --devel

    # Macbook only
    (( $+commands[brew] )) && brew upgrade

    # oh-my-zsh
    upgrade_oh_my_zsh

    # tmux
    ~/.tmux/plugins/tpm/bindings/install_plugins

    # dotfiles
    git -C $DOTFILES pull
}
alias vim=nvim

# Configuration for golang
export GOPATH=~/go
export PATH=$GOPATH/bin:$PATH

# Homebrew
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles

# LSCOLORS
for cmd in dircolors gdircolors; do
    (( $+commands[$cmd] )) && eval $($cmd $DOTFILES/dircolors/dircolors.256dark)
done
