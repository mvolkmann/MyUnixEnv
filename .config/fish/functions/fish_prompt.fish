# This function is run every time Fish displays a new prompt.
function fish_prompt
  # Get the current Git branch.
  # This will be an empty string if not in a Git repo.
  set git_branch (git rev-parse --abbrev-ref HEAD ^/dev/null)

  # If in a Git repo ...
  if string length -q $git_branch
    set -g branch " ($git_branch)"
  else
    set -g branch ''
  end

  set_color --bold brblue
  # -n suppresses newline at end
  echo -n $PWD
  set_color --bold yellow
  echo $branch
  set_color normal
  echo -n '🐠  '
end
