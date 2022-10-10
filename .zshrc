# EXPORTS (ruby rust node flatpak)
export HOME="/home/david"
export ZSH="$HOME/.oh-my-zsh"
export EDITOR='nvim'
export PATH="$HOME/.config/scripts:$PATH"
export PATH="/usr/sbin/:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export MOZ_ENABLE_WAYLAND=1
export FZF_BASE=/usr/sbin//fzf
export NVM_DIR="$HOME/.nvm"
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# ZSH SPECIFIC
ZSH_THEME="robbyrussell"
plugins=( fzf git zsh-autosuggestions sudo copyfile fzf-zsh-plugin asdf )
DISABLE_FZF_KEY_BINDINGS="false"

zstyle ':omz:update' frequency 10
export ZSH="/home/david/.oh-my-zsh"

. /opt/asdf-vm/asdf.sh

source $ZSH/oh-my-zsh.sh
source ~/.config/zsh/functions.sh
source ~/.config/zsh/alias.sh
