# It seems that in order to invoke these functions from a command-line,
# the function name must match the filename.
# So it isn't possible to define more than one function in a file
# that can be called from the command-line.
# Perhaps additional functions can be defined
# that can be called from that function.
function foo -d 'outputs a given person name and color'
  if test (count $argv) -ne 2
    set_color red; echo -n usage: foo
    set_color --italic; echo ' name color'
    return 1
  end

  set name $argv[1]
  set color $argv[2]
  echo "Hello $name, do you like the color $color?"

  switch $color
  case yellow orange
    echo good color
  case red
    echo hot
  case '*'
    echo unsupported color $color
  end
end
