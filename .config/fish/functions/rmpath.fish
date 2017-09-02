# Removes a given path from fish_user_paths
# which is automatically prepended to PATH.
function rmpath
  set path $argv[1]
  if set -l index (contains -i $path $fish_user_paths)
    set -e fish_user_paths[$index]
  else
    echo $path was not found in PATH
  end
end
