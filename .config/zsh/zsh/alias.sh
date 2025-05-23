alias src="source ~/.zshrc"
alias srcenv="source ~/.env"

alias upgrade="flatpak update && sudo pacman -Syu"
alias keychain:upgrade="sudo pacman -S archlinux-keyring"
alias keychain:reset="sudo rm -rf /etc/pacman.d/gnupg && sudo pacman-key --init && sudo pacman-key --populate"
alias pacin="sudo pacman -S"
alias v="nvim"
alias localrb="asdf local ruby \$(cat .ruby-version)"

# alias db:asdf="/home/david/.asdf/installs/postgres/13.0/bin/pg_ctl -D /home/david/.asdf/installs/postgres/13.0/data -l logfile start"
alias mapp:start="\
  cd $HOME/mafe && npm run dev & \ 
  cd $HOME/mapp && rails s & \
  cd $HOME/mapp && bundle exec sidekiq"
alias mapp:stop="\
  sudo kill -9 \$(pgrep node) ; \
  sudo kill \$(pgrep ruby) ; \
  sudo kill -9 \$(pgrep sidekiq)"
# alias clf:start="\
#   cd $HOME/cooleaf-v2 && bundle exec rails s &\
#   cd $HOME/cooleaf-v2 && bundle exec sidekiq &\
#   cd $HOME/project-atlanta && npm run start:web &"

alias bex="bundle exec"
alias db:reset="rails db:drop db:create db:migrate db:seed"

# Docker containers
alias db:pgadmin="podman run -p 8080:80 -e 'PGADMIN_DEFAULT_EMAIL=user@domain.com' -e 'PGADMIN_LISTEN_PORT=8000' -e 'PGADMIN_DEFAULT_PASSWORD=SuperSecret' -d --network='host' docker.io/dpage/pgadmin4:latest && firefox-developer-edition --new-tab http://localhost:8000"
alias db:jal="podman run -p 5432:5432 -e POSTGRES_PASSWORD=postgres -v jal-db:/var/lib/postgresql/data -d docker.io/postgres:latest"
alias db:raw="podman run -p 5432:5432 -e POSTGRES_PASSWORD=postgres -d docker.io/postgres:latest"

alias db:mon="podman run --name mongodb -d -p 27017:27017 \
  -e MONGO_INITDB_ROOT_USERNAME=mongodb \
  -e MONGO_INITDB_ROOT_PASSWORD=mongodb \
  -v mongodb:/data/db\
  mongodb/mongodb-community-server:6.0.7-ubuntu2204"

# System resources
alias hdd:status="sudo hdparm -C /dev/sda"
alias hdd:standby="sudo hdparm -Y /dev/sda"
alias wifi:on="nmcli radio wifi on"
alias wifi:off="nmcli radio wifi off"
alias wifi:connect="nmcli --ask dev wifi connect"
alias wifi:scan="nmcli dev wifi list"

alias bt:on="bluetoothctl power on"
alias bt:off="bluetoothctl power off"
alias btctl="bluetoothctl"
alias con_cw="bluetoothctl connect 60:C5:E6:12:C7:9B"
alias con_rb="bluetoothctl connect 33:70:B0:A0:D1:FD"
alias con_jbl="bluetoothctl connect F8:5C:7E:A5:59:0A"
alias discon_cw="bluetoothctl disconnect 60:C5:E6:12:C7:9B"
alias discon_rb="bluetoothctl disconnect 33:70:B0:A0:D1:FD"
alias discon_jbl="bluetoothctl disconnect F8:5C:7E:A5:59:0A"

alias scr:rec="wf-recorder -f ~/screenshots/\$(date +%Y-%B-%d_%Hh%Mm%Ss).mp4"
alias scr:cap="wf-recorder -g \"\$(slurp)\" -f ~/screenshots/\$(date +%Y-%B-%d_%Hh%Mm%Ss).mp4"

alias nameserver:add="sudo sed -i '1s/^/# Custom Entry\nnameserver 127.0.0.1\n/' /etc/resolv.conf"
alias dns:restart="sudo systemctl restart dnsmasq"

# Terminal quality of life
alias ls="ls --color"
alias la="eza -la"
alias tree="eza --tree"
alias co="git checkout"
alias lg="lazygit"

# alias clf:beef="cd cooleaf-v2 && nvm use 8 && npm install && npm run watch"
# alias clf:fe="cd project-atlanta && nvm use 14 && npm install && npm run start:web"
# alias clf="\
#   sudo systemctl start redis nginx && \
#   podman run -p 5432:5432 -e POSTGRES_PASSWORD=postgres -v clf-db:/var/lib/postgresql/data -d postgres:13 && \
#   sudo sed -i '1s/^/# Custom Entry\nnameserver 127.0.0.1\n/' /etc/resolv.conf && \
#   sudo systemctl restart dnsmasq && \
#   cd $HOME/cooleaf-v2 && bundle exec rails s & \
#   cd $HOME/cooleaf-v2 && bundle exec sidekiq & \
#   cd $HOME/project-atlanta && npm run start:web & "
alias sys:logout="swaymsg exit"
alias run="alacritty --working-directory . -t run -e "
alias ram:clean="su -c sync; echo 1 | sudo tee /proc/sys/vm/drop_caches"
# about
alias about="fastfetch"
alias about:battery="upower -i /org/freedesktop/UPower/devices/battery_BAT0"
alias about:storage="df -H"

alias kernel:unsigned="~/bin/kernel-unsigned"
alias config="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
alias open="xdg-open"

alias orphans="pacman -Qdt"
alias fuckctl="kubectl --insecure-skip-tls-verify"

# Editing files
alias vedit="nvim $HOME/.config/nvim/init.vim"
alias swayedit="nvim $HOME/.config/sway/config"
alias funcedit="nvim $HOME/.config/zsh/functions.sh"
alias aliasedit="nvim $HOME/.config/zsh/alias.sh"

# Services
alias services="sudo systemctl --type=service --state=running"
alias start="sudo systemctl start"
alias restart="sudo systemctl restart"
alias stop="sudo systemctl stop"
alias status="sudo systemctl status"
alias enable="sudo systemctl enable"
alias disable="sudo systemctl disable"

# Python
alias pysrc="source ./bin/activate"

# Ethereum
ETHEREUM_DATA_DIR=/home/david/.eth
alias geth='podman run -w /src --rm -it -v `realpath .`:/src -v ${ETHEREUM_DATA_DIR}:/root/.ethereum ethereum/client-go:stable'
