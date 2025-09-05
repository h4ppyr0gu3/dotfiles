# EXPORTS (ruby rust node flatpak)
export HOME="/home/david"
export EDITOR=nvim
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
export GOPATH=$HOME/go

# ZSH SPECIFIC

ZSH_THEME="robbyrussell"
plugins=( fzf git zsh-autosuggestions sudo copyfile asdf )

zstyle ':omz:update' frequency 10
export ZSH="$HOME/.oh-my-zsh"

if [ -f $HOME/.asdf/asdf.sh ]; then
  . $HOME/.asdf/asdf.sh
fi
if [ -f /opt/asdf-vm/asdf.sh ]; then
  . /opt/asdf-vm/asdf.sh
fi

source $ZSH/oh-my-zsh.sh
source ~/.config/zsh/functions.sh
source ~/.config/zsh/alias.sh

export PATH="$HOME/go/bin:$PATH"
export ANDROID_SDK_ROOT="/home/david/Android/Sdk"
export ANDROID_HOME="/home/david/Android/Sdk"
export PATH="$HOME/.local/share/solana/install/active_release/bin:$PATH"

export XDG_CURRENT_DESKTOP=sway

if [ -f "$HOME/.env" ]; then
  source "$HOME/.env"
fi

# . "$HOME/.cargo/env"

# eval "$(direnv hook zsh)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/david/google-cloud-sdk/path.zsh.inc' ]; then . '/home/david/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/david/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/david/google-cloud-sdk/completion.zsh.inc'; fi
