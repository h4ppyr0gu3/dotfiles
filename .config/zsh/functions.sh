acp() {
  git status
  string=""
  vared -p "files and directories to add: " string
  array=("${(@s/ /)string}")
  for el in ${array[*]};
  do
    git add $el
  done
  msg=""
  vared -p "commit message: " msg
  git commit -m "$msg"
  branch=$(git branch --show-current)
  git push origin $branch
}

branchdiff() {
  base_branch="develop"
  current_branch="HEAD"

  git diff $base_branch..$current_branch | nvim -R
}

cfgacp() {
  /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME add $HOME/.zshrc \
    $HOME/.config/scripts $HOME/.config/alacritty $HOME/.config/cronjobs \
    $HOME/.config/nvim $HOME/.config/qutebrowser $HOME/.config/scripts \
    $HOME/.config/sounds $HOME/.config/sway $HOME/.config/wallpapers \
    $HOME/.config/libinput-gestures.conf $HOME/.config/waybar $HOME/.config/zathura \
    $HOME/.config/zsh
  /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME commit -m 'cfgacp'
  /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME push origin master
}
