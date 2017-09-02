# Appends a given path to fish_user_paths
# which is automatically prepended to PATH.
function addpath -a path
  set -U fish_user_paths $fish_user_paths $path
end
