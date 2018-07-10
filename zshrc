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

plugins=(git tmux systemd scd)

# User configuration

# current directory
DOTFILES=${${(%):-%N}:A:h}

source $HOME/.zshrc.local || true

source $ZSH/oh-my-zsh.sh

# Language environment
export LANG=en_US.UTF-8

# Editor
export EDITOR='vim'

export PATH=$HOME/bin:$HOME/miniconda3/bin:$PATH:/usr/local/sbin

# Aliases
alias pac="sudo pacman"
alias yat="yaourt"
function up {
    # Archlinux only
    (( $+commands[yaourt] )) && yaourt -Syua --noconfirm --devel

    # Macbook only
    (( $+commands[brew] )) && brew upgrade

    # Ubuntu only
    (( $+commands[apt-get] )) && sudo apt-get update && sudo apt-get -y upgrade

    # Gentoo only
    (( $+commands[emerge] )) && emerge -uDU --keep-going --with-bdeps=y @world

    # dotfiles
    git -C $DOTFILES pull

    # oh-my-zsh
    upgrade_oh_my_zsh

    # tmux
    ~/.tmux/plugins/tpm/bin/update_plugins all

    # vundle plugins
    (( $+commands[vim] )) && vim +PluginInstall! +qa
}

# Workaround the issue that emulator must be executed at $ANDROID_HOME/tools
function emulator { cd $ANDROID_HOME/tools && ./emulator "$@" }

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
