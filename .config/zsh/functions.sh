stag() {
  branch=$(git branch --show-current)
  git tag "staging/$branch" -f
  git push origin "staging/$branch" -f
}

po() {
  branch=$(git branch --show-current)
  git pull origin $branch
}

acp() {
  git status
  array=()
  if [ $# -eq 0 ]; then
    string=""
    vared -p "files and directories to add: " string
    array=("${(@s/ /)string}")
  else
    array=("$@")
  fi
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
    $HOME/.config/waybar $HOME/.config/zathura \
    $HOME/.config/zsh $HOME/.config/mako
  /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME commit -m 'cfgacp'
  /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME push origin master
}

function _add_bundle_aliases {
    bundle check 2> /dev/null 1> /dev/null;
    local check_status=$?;

    if [ $check_status -eq 0 ]; then
        alias rails="bundle exec rails";
        alias rspec="bundle exec rspec";
        alias rubocop="bundle exec rubocop";
        alias sidekiq="bundle exec sidekiq";
    else
        alias rails="rails";
        alias rspec="rspec";
        alias rubocop="rubocop";
        alias sidekiq="sidekiq";
    fi
}

_add_bundle_aliases

if [[ -n "$chpwd_functions" ]]; then
    if [[ ${chpwd_functions[(ie)_add_bundle_aliases]} -gt ${#chpwd_functions} ]]; then
        chpwd_functions+=_add_bundle_aliases
    fi
else
    chpwd_functions=( _add_bundle_aliases )
fi
