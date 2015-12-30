# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Theme
ZSH_THEME="bureau"

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

plugins=(git tmux systemd)

# User configuration

source $HOME/.path.local || true

source $ZSH/oh-my-zsh.sh

# Language environment
export LANG=en_US.UTF-8

# Editor
export EDITOR='nvim'

export PATH=$HOME/bin:$PATH

# Aliases
alias pac="sudo pacman"
alias yat="yaourt"
alias up="yaourt -Syua --noconfirm"
alias vim=nvim
