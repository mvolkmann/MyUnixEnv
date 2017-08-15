# This function is run every time Fish displays a new prompt.
function fish_prompt
  # Get the current Git branch.
  # This will be an empty string if not in a Git repo.
  set git_branch (git rev-parse --abbrev-ref HEAD ^/dev/null)

  # If in a Git repo (-q for quiet) ...
  if string length -q $git_branch
    set branch " ($git_branch)"
  else
    set branch ''
  end

  set_color --bold brblue
  echo -n $PWD # -n suppresses newline at end
  set_color --bold yellow
  echo $branch
  set_color normal
  echo -n '🐠  '
end
