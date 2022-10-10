alias src="source ~/.zshrc"

alias upgrade="sudo pacman -Syu"
alias pacin="sudo pacman -S"
alias v="nvim"

alias bex="bundle exec"
alias db:reset="rails db:drop db:create db:migrate db:seed"
alias db:clf="docker run -p 5432:5432 -e POSTGRES_PASSWORD=postgres -v clf-db:/var/lib/postgresql/data -d postgres:13"

alias hdd:status="sudo hdparm -C /dev/sda"
alias hdd:standby="sudo hdparm -Y /dev/sda"

alias wifi:on="nmcli radio wifi on"
alias wifi:off="nmcli radio wifi off"
alias wifi:connect="nmcli --ask dev wifi connect"
alias wifi:scan="nmcli dev wifi list"
alias bt:on="bluetoothctl power on"
alias bt:off="bluetoothctl power off"
alias btctl="bluetoothctl"

alias nameserver:add="sudo sed -i '1s/^/# Custom Entry\nnameserver 127.0.0.1\n/' /etc/resolv.conf"
alias dns:restart="sudo systemctl restart dnsmasq"

alias ls="ls --color"
alias la="exa -la"
alias tree="exa --tree"
alias co="git checkout"

alias clf:beef="cd cooleaf-v2 && nvm use 8 && npm install && npm run watch"
alias clf:fe="cd project-atlanta && nvm use 14 && npm install && npm run start:web"
alias clf="sudo systemctl start redis docker &&
docker run -p 5432:5432 -e POSTGRES_PASSWORD=postgres -v clf-db:/var/lib/postgresql/data -d postgres:13 &&
sudo sed -i '1s/^/# Custom Entry\nnameserver 127.0.0.1\n/' /etc/resolv.conf &&
sudo systemctl restart dnsmasq &&
alacritty --working-directory ~/cooleaf-v2 -t rails_server -e bundle exec rails s -b 0.0.0.0 &
alacritty --working-directory ~/cooleaf-v2 -t sidekiq -e bundle exec sidekiq &
alacritty --working-directory ~/cooleaf-v2 -t rails_console -e bundle exec rails c &"
alias sys:logout="swaymsg exit"
alias ram:clean="su -c sync; echo 1 | sudo tee /proc/sys/vm/drop_caches"

alias kernel:unsigned="~/bin/kernel-unsigned"
alias config="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
alias open="xdg-open"

alias minictl="minikube kubectl"

alias vedit="nvim $HOME/.config/nvim/init.vim"
alias swayedit="nvim $HOME/.config/sway/config"
alias funcedit="nvim $HOME/.config/zsh/functions.sh"
alias aliasedit="nvim $HOME/.config/zsh/alias.sh"

alias orphans="pacman -Qdt"

alias start="sudo systemctl start"
alias restart="sudo systemctl restart"
alias stop="sudo systemctl stop"
alias status="sudo systemctl status"
alias enable="sudo systemctl enable"
alias disable="sudo systemctl disable"

alias fuckctl="kubectl --insecure-skip-tls-verify"
