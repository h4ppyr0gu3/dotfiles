# EXPORTS
export HOME="/home/david"
export ZSH="$HOME/.oh-my-zsh"
export EDITOR='nvim'
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="/var/lib/flatpak/exports/bin:$PATH"
export PATH="$HOME/.config/scripts:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/usr/sbin/:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.mix/escripts:$PATH"
export MOZ_ENABLE_WAYLAND=1
export FZF_BASE=/usr/sbin//fzf
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
export PATH="$HOME/.crenv/bin:$PATH"
eval "$(crenv init -)"
eval "$(rbenv init -)"
test -s "$HOME/.kiex/scripts/kiex" && source "$HOME/.kiex/scripts/kiex"
. /opt/asdf-vm/asdf.sh
# ZSH SPECIFIC
ZSH_THEME="robbyrussell"
# HYPHEN_INSENSITIVE="true"
# ENABLE_CORRECTION="true"
# DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="dd/mm/yyyy"
plugins=( fzf git zsh-autosuggestions sudo copyfile vi-mode fzf-zsh-plugin asdf )
DISABLE_FZF_KEY_BINDINGS="false"

zstyle ':omz:update' frequency 10
export ZSH="/home/david/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

# FUNCTIONS
# aur_install() {
#   git clone $1
#
# }

search() {
  grep -nr --exclude-dir=node_modules --exclude-dir=coverage --exclude-dir=log --exclude-dir=public --exclude=tags "$1" /home/david/cooleaf-v2
}

acp() {
  git status
  vals=$(echo )
  vared -p "files and directories to add: " vals
  git add $vals 
  msg=$(echo )
  vared -p "commit message: " msg
  git commit -m "$msg"
  branch=$(git branch --show-current)
  git push origin $branch
}
  
source ~/.config/alias.sh

# INITIALIZE
# # nnn
# export NNN_FCOLORS='0000e63100000000000000000'
# export NNN_FIFO='/tmp/nnn.fifo'
# export NNN_PLUG='o:fzopen;m:nmount;x:!chmod +x $nnn'

