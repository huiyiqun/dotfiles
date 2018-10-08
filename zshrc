zmodload zsh/curses

# Editor
export EDITOR='vim'

# Path
export PATH=$HOME/bin:$HOME/.local/bin:$HOME/miniconda3/bin:$PATH:/usr/local/sbin

# Hotfix for MacOS
export PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"

# Language environment
export LANG=en_US.UTF-8

# Path to Powerline
export POWERLINE_PATH=$(python -m inspect -d powerline | grep -Po "Submodule search path: \['\K[^']*")

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Theme
ZSH_THEME="afowler"

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
#COMPLETION_WAITING_DOTS=false

plugins=(git tmux systemd scd zsh-navigation-tools)

# User configuration

# current directory
DOTFILES=${${(%):-%N}:A:h}

source $HOME/.zshrc.local || true

source $ZSH/oh-my-zsh.sh

# Aliases
alias pac="sudo pacman"
function up {
    # Archlinux only
    (( $+commands[yay] )) && yay -Syu --noconfirm --devel

    # Macbook only
    (( $+commands[brew] )) && brew upgrade && brew cask upgrade

    # Ubuntu only
    (( $+commands[apt-get] )) && sudo apt-get update && sudo apt-get -y upgrade

    # Gentoo only
    (( $+commands[emerge] )) && emerge --sync && emerge -uDU --keep-going --with-bdeps=y @world

    # dotfiles
    git -C $DOTFILES pull && $DOTFILES/deploy.sh

    # oh-my-zsh
    upgrade_oh_my_zsh

    # tmux
    ~/.tmux/plugins/tpm/bin/update_plugins all

    # vim plugins
    (( $+commands[vim] )) && vim +PlugUpgrade +PlugUpdate +qa
}

# Workaround the issue that emulator must be executed at $ANDROID_HOME/tools
function emulator { (cd $ANDROID_HOME/tools && ./emulator "$@") }

# Configuration for golang
export GOPATH=~/go
export PATH=$GOPATH/bin:$PATH

# Homebrew
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles

# LSCOLORS
for cmd in dircolors gdircolors; do
    (( $+commands[$cmd] )) && eval $($cmd $DOTFILES/dircolors/dircolors.256dark)
done

words=$( (( $+commands[fortune] )) && fortune || echo '苟利国家生死以，岂因祸福避趋之。')
(( $+commands[tunasay] )) && (( $+commands[lolcat] )) && tunasay -o 30 -f tuna -W 8 "$words" | lolcat

POWERLINE_ZSH=$POWERLINE_PATH/bindings/zsh/powerline.zsh
[[ -a $POWERLINE_ZSH ]] && . $POWERLINE_ZSH
