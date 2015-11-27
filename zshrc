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

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Format of command execution timestamp shown in the history command output.
# HIST_STAMPS="yyyy-mm-dd"

plugins=(git)

# User configuration

source $HOME/.path.local || true

source $ZSH/oh-my-zsh.sh

# Language environment
export LANG=en_US.UTF-8

# Editor
export EDITOR='nvim'

# Aliases
alias pac="sudo pacman"
alias yat="yaourt"
alias up="yaourt -Syua --noconfirm"
alias vim=nvim
