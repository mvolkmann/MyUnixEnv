# This function is run every time Fish displays a new prompt.
# TODO: This isn't being called when $COLUMNS is 52!
function fish_prompt
  # No fancy prompt if window is too narrow.
  #if test $COLUMNS -lt 20 #TODO: How to test this?
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
    echo -n (prompt_pwd) # abbreviated working directory
    set remaining 0 # so nothing else is output on this line
  end

  # Get the current Git branch.
  # This will be an empty string if not in a Git repo.
  set branch (git rev-parse --abbrev-ref HEAD ^/dev/null)

  # If in a Git repo ...
  if test -n "$branch"
    set branchLen (string length $branch)
    # If branch name will fit on current line ...
    if test $branchLen -le $remaining
      echo -n ' ' # space between PWD and branch name
    else
      echo # newline
      # Indent past Vim mode on previous line.
      echo -n (string repeat -n$vimModeLen ' ')
      set remaining $COLUMNS # resets to full width
    end

    # If branch name will fit on current line ...
    if test $branchLen -le $remaining
      # Display current Git branch.
      set_color --bold yellow # git branch color
      echo -n $branch
    end
    # If branch name doesn't fit, it is not output.
  end

  # Always display "fish" prompt on new line.
  set_color normal
  # This uses printf instead of echo to output a leading newline.
  printf '\\n🐠  ' # uses unicode for fish emoji
end
