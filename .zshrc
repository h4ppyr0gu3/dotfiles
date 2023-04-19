# EXPORTS (ruby rust node flatpak)
export HOME="/home/david"
# export ZSH="$HOME/.oh-my-zsh"
export EDITOR='nvim'
# export ASDF_DIR="$HOME/.asdf/"
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
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

load_asdf() {
  if [ -f $HOME/.asdf/asdf.sh ]; then
    . $HOME/.asdf/asdf.sh
  fi
  if [ -f /opt/asdf-vm/asdf.sh ]; then
    . /opt/asdf-vm/asdf.sh
  fi
}

load_asdf

source ~/.config/zsh/functions.sh
source ~/.config/zsh/alias.sh
source ~/.config/zsh/sudo.sh
source ~/.config/zsh/git.sh
source ~/.config/zsh/color.sh
