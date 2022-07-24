acp() {
  git status
  string=""
  vared -p "files and directories to add: " string
  array=("${(@s/ /)string}")
  for el in ${array[*]};
  do 
    echo $el
    git add $el
  done
  msg=""
  vared -p "commit message: " msg
  git commit -m "$msg"
  branch=$(git branch --show-current)
  git push origin $branch
}
