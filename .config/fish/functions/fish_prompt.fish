# This function is run every time Fish displays a new prompt.
function fish_prompt
  # No fancy prompt if window is too narrow.
  #if test $COLUMNS -lt 20 #TODO: HOw to test this?
  #   echo '🐠  '
  #   return
  # end

  set vimModeLen 2 # appears at beginning of prompt
  #TODO: When the terminal width is less than 20, why is COLUMNS is always 80!
  set remaining (math "$COLUMNS - $vimModeLen")

  # Display present working directory.
  set_color --bold brblue # pwd color
  set pwdLen (string length $PWD)
  if test $pwdLen -le $remaining
    echo -n $PWD # -n suppresses newline at end
    set remaining (math "$remaining - $pwdLen")
  else
    echo -n (prompt_pwd)
    set remaining 0
  end

  # Get the current Git branch.
  # This will be an empty string if not in a Git repo.
  set branch (git rev-parse --abbrev-ref HEAD ^/dev/null)
  set branchLen (string length $branch)

  # If in a Git repo ...
  if test $branchLen -gt 0
    # If branch name won't fit on current line ...
    if test $branchLen -gt $remaining
      echo # newline
      echo -n '  ' # indents past Vim mode on previous line
      set remaining $COLUMNS
    else
      echo -n ' '
    end

    # If branch name will fit on current line ...
    if test $branchLen -le $remaining
      # Display current Git branch.
      set_color --bold yellow # git branch color
      echo -n $branch
    end
  end

  # Display "fish" prompt on new line.
  set_color normal
  printf '\\n🐠  '
end
