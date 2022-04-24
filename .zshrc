# EXPORTS (ruby rust node flatpak)
export ZSH="/home/david/.oh-my-zsh"
export EDITOR='nvim'
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="/var/lib/flatpak/exports/bin:$PATH"
export PATH="/home/david/.cargo/bin:$PATH"
export PATH="/usr/sbin/:$PATH"
export PATH="/home/david/.local/bin:$PATH"
export MOZ_ENABLE_WAYLAND=1

export FZF_BASE=/usr/sbin//fzf
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# ZSH SPECIFIC
ZSH_THEME="robbyrussell"
# HYPHEN_INSENSITIVE="true"
# ENABLE_CORRECTION="true"
# DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="dd/mm/yyyy"
plugins=( fzf git zsh-autosuggestions sudo copyfile vi-mode fzf-zsh-plugin)
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
  vals=$(echo .)
  vared -p "which files and directories to add: " vals
  git add $vals 
  msg=$(echo wip)
  vared -p "commit message: " msg
  git commit -m "$msg"
  branch=$(git branch --show-current)
  git push origin $branch
}
  

# ALIASI
alias src="source ~/.zshrc"
alias upgrade="sudo pacman -Syu"
alias ran="ranger"
alias v="nvim"
alias install="sudo pacman -Syu"

alias bex="bundle exec "
alias db:reset="rails db:drop db:create db:migrate db:seed"

alias hdd:status="sudo hdparm -C /dev/sda"
alias hdd:standby="sudo hdparm -Y /dev/sda"

alias wifi:on="nmcli radio wifi on"
alias wifi:off="nmcli radio wifi off"
alias wifi:connect="nmcli --ask dev wifi connect"
alias wifi:scan="nmcli dev wifi list"
alias nameserver:add="sudo sed -i '1s/^/# Custom Entry\nnameserver 127.0.0.1\n/' /etc/resolv.conf"
alias dns:restart="sudo systemctl restart dnsmasq"

alias bt:on="bluetoothctl power on"
alias bt:off="bluetoothctl power off"
alias bt="bluetoothctl"

alias clf:beef="cd cooleaf-v2 && nvm use 8 && npm install && npm run watch"
alias clf:fe="cd project-atlanta && nvm use 14 && npm install && npm run start:web"
alias clf="sudo systemctl start postgresql &&
sudo systemctl start redis &&
sudo sed -i '1s/^/# Custom Entry\nnameserver 127.0.0.1\n/' /etc/resolv.conf &&
sudo systemctl restart dnsmasq &&
alacritty --working-directory ~/cooleaf-v2 -t rails_server -e rails s -b 0.0.0.0 &
alacritty --working-directory ~/cooleaf-v2 -t sidekiq -e bundle exec sidekiq &
alacritty --working-directory ~/cooleaf-v2 -t rails_console -e rails c &"
alias pod="sudo podman"

# INITIALIZE
eval "$(rbenv init -)"

